module GenerateReport
  class Report
    @COLUMNS = [:activity, :mood, :appetite]

    attr_reader :column, :period, :date_begin, :date_end

    def initialize(user:, period: nil, date_begin: nil, date_end: nil)
      @user = user
      @period = period ? period : nil
    end

    def chart_options
      options = {
                  responsive: true,
                  layout: {
                      padding: {
                        right: 30
                      }
                  },
                  legend: {
                    labels: {
                      fontSize: 12
                    }
                  },
                  scales: {
                    yAxes: [{
                      ticks: {
                        max: 2,
                        min: -2,
                        stepSize: 1.0
                      }
                    }]
                  }
                }
    end

    private

    def chart_data(user, date_begin, date_range)
      labels = date_range.map { |date| date.strftime("%-m月%-d日") }
      y_axis_data = data_generator(user, date_begin)
      chart_data = { labels: labels, datasets: y_axis_data }
    end

    def date_range
      (date_begin..date_end).to_a
    end
  end
end
