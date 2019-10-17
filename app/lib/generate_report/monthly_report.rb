module GenerateReport
  class MonthlyReport < GenerateReport::Report
    
    attr_reader :column, :date_begin, :date_end

    def initialize(user:, column:, period: nil, date_begin: nil, date_end: nil)
      super
      @date_begin = date_begin ? date_begin.to_date : generate_date_begin(period)
      @date_end = date_end ? date_end.to_date : @date_begin.end_of_month
    end

    def chart
      chart_data(@user, @column, @date_begin, date_range)
    end

    def next_period
      next_date_begin = (date_end + 1).strftime('%Y-%m-%d')
      next_date_end = date_begin.next_month.end_of_month.strftime('%Y-%m-%d')
      "/statistics/#{column.to_s}/from/#{next_date_begin}/to/#{next_date_end}"
    end

    def prev_period
      prev_date_end = (date_begin - 1).strftime('%Y-%m-%d')
      prev_date_begin = date_begin.prev_month.beginning_of_month.strftime('%Y-%m-%d')
      "/statistics/#{column.to_s}/from/#{prev_date_begin}/to/#{prev_date_end}"
    end

    def to_column(column)
      "/statistics/#{column.to_s}/from/#{@date_begin.to_s}/to/#{@date_end.to_s}"
    end

    def to_weekly
      reference_date = set_reference_date
      from = reference_date.beginning_of_week
      to = reference_date.end_of_week
      "/statistics/#{column.to_s}/from/#{from.to_s}/to/#{to.to_s}"
    end

    private

    def set_reference_date
      date = ((@date_end.day - @date_begin.day) / 2).to_i
      date_string = "#{@date_begin.year}-#{@date_begin.month}-#{date}"
      reference_date = Date.parse(date_string, '%Y-%m-%d')
      reference_date
    end

    def generate_date_begin(period)
      if period.underscore.split('_').first == 'this'
        Date.today.beginning_of_month
      elsif period.underscore.split('_').first == 'prev'
        Date.today.prev_month.beginning_of_month
      else
        raise "Invalid URI. Periods should be one of those terms (thisWeek, thisMonth, prevWeek, prevMonth)"
      end
    end

    def data_generator(user, column, date_begin)
      records = user.diaries.group_by_month(&:diary_date)
      if records[date_begin].present?
        records[date_begin].map do |diary|
          diary.send(column)
        end
      elsif records[date_begin].nil?
        date_range.length.times.map { |n| nil }
      else
        raise "Error"
      end
    end
  end
end
