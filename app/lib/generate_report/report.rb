module GenerateReport
  class Report
    attr_reader :column, :period, :date_begin, :date_end

    def initialize(user:, column:, period: nil, date_begin: nil, date_end: nil)
      @user = user
      @column = column
      @period = period ? period : nil
    end

    private

    def chart_data(user, column, date_begin, date_range)
      labels = date_range
      y_axis_data = data_generator(user, column, date_begin)
      chart_data = { labels: labels, datasets: y_axis_data }
    end

    def date_range
      (date_begin..date_end).to_a
    end
  end
end
