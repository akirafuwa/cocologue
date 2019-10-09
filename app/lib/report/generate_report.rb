module Report
  class GenerateReport

    def initialize(user, column, period, date_begin, date_end)
      @user = user
      @column = column
      @period = period
      @date_begin = date_begin
      @date_end = date_end
    end

    def call
      chart_data(@user, @column, @date_begin, @date_end, @period)
    end

    private

    def chart_data(user, column, date_begin, date_end, period)
      x_axis_data = (date_begin..date_end).to_a
      y_axis_data = data_generator(user, x_axis_data, column)
      chart_data = { labels: x_axis_data, datasets: y_axis_data}
    end

    def data_generator(user, x_axis_data, column)
      x_axis_data.map do |date|
        user.diaries.where(diary_date: date).pluck(column)[0]
      end
    end
  end
end
