module GenerateReport
  class WeeklyReport < GenerateReport::Report

    attr_reader :date_begin, :date_end

    def initialize(user:, period: nil, date_begin: nil, date_end: nil)
      super
      @date_begin = date_begin ? date_begin.to_date : generate_date_begin(period)
      @date_end = date_end ? date_end.to_date : @date_begin.end_of_week
    end

    def chart
      chart_data(@user, @date_begin, date_range)
    end

    def next_period
      next_date_begin = (date_end + 1).strftime('%Y-%m-%d')
      next_date_end = (date_end + 7).strftime('%Y-%m-%d')
      "/statistics/from/#{next_date_begin}/to/#{next_date_end}"
    end

    def prev_period
      prev_date_begin = (date_begin- 7).strftime('%Y-%m-%d')
      prev_date_end = (date_begin - 1).strftime('%Y-%m-%d')
      "/statistics/from/#{prev_date_begin}/to/#{prev_date_end}"
    end

    def to_column(column)
      "/statistics/from/#{@date_begin.to_s}/to/#{@date_end.to_s}"
    end

    def to_monthly
      from = @date_begin.beginning_of_month.strftime('%Y-%m-%d')
      to = @date_begin.end_of_month.strftime('%Y-%m-%d')
      "/statistics/from/#{from}/to/#{to}"
    end

    private

    def data_generator(user, date_begin)
      records = user.diaries.group_by_week(week_start: :mon) { |n| n.diary_date }
      y_axis_value = {}
      [:activity, :mood, :appetite].each do |column|
        if records[date_begin]
          records[date_begin].map do |record|
            (y_axis_value[column] ||= []).push(record.send(column))
          end
        else
          (y_axis_value[column] ||= []).push( 7.times.map { |n| nil })
        end
      end
      y_axis_value
    end

    def generate_date_begin(period)
      if period.underscore.split('_').first == 'this'
        Date.today.beginning_of_week
      elsif period.underscore.split('_').first == 'prev'
        Date.today.prev_week.beginning_of_week
      else
        raise "Invalid URI. Periods should be one of those terms (thisWeek, thisMonth, prevWeek, prevMonth) "
      end
    end
  end
end
