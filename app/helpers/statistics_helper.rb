module StatisticsHelper
  def to_ex_or_next_period(date, period)
    case period
    when :months
      if date == date.beginning_of_month
        date.prev_month.beginning_of_month
      else date == date.end_of_month
        date.next_month.end_of_month
      end
    when :weeks
      if date.cwday == 1
        date.ago(7.days)
      else date.cwday == 7
        date.since(7.days)
      end
    else
      raise "pass valid argument"
    end
  end
end
