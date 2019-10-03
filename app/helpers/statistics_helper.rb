module StatisticsHelper
  def previous_period_generator(report)
    date_begin_and_end = []
    if report.period == :month
      date_begin = report.date_begin << 1
      date_end = report.date_end << 1
    elsif report.period == :week
      date_begin = report.date_begin - 1.week
      date_end = report.date_end - 1.week
    else
      date_begin = report.date_begin - 1.week
      date_end = report.date_end - 1.week
    end
    date_begin_and_end << date_begin
    date_begin_and_end << date_end
    date_begin_and_end
  end

  def next_period_generator(report)
    date_begin_and_end = []
    if report.period == :month
      date_begin = report.date_begin << -1
      date_end = report.date_end << -1
    elsif report.period == :week
      date_begin = report.date_begin + 1.week
      date_end = report.date_end + 1.week
    else
      date_begin = report.date_begin + 1.week
      date_end = report.date_end + 1.week
    end
    date_begin_and_end << date_begin
    date_begin_and_end << date_end
    date_begin_and_end
  end
end
