class StatisticsController < ApplicationController
  before_action :require_user_logged_in, :set_current_user

  Report = Struct.new(
    :column,
    :date_begin,
    :date_end,
    :period,
    :x_axis,
    :y_axis
  )

  def report
    hash = parse_date_params(statistics_params)
    @report = Report.new.tap do |r|
      r.column = hash[:column].nil? ? :activity : hash[:column].to_sym
      r.date_begin = hash[:date_begin].nil? ? begininng_of_this_week : hash[:date_begin]
      r.date_end = hash[:date_end].nil? ? end_of_this_week : hash[:date_end]
      r.period = hash[:period].nil? ? :weeks : hash[:period].to_sym
      r.x_axis = ((r.date_begin)..(r.date_end)).to_a
      r.y_axis = data_generator(r.x_axis, r.column)
    end
    @ex_begin = to_ex_or_next_period(@report.date_begin, @report.period)
    @next_end = to_ex_or_next_period(@report.date_end, @report.period)
  end

private
  def to_ex_or_next_period(date, period)
    if (date.cwday == 7) || (date == date.beginning_of_month )
      date.advance(period => -1)
    elsif (date.cwday == 1) || (date == date.end_of_month )
      date.advance(period => 1)
    else
      raise "pass valid argument"
    end
  end

  def data_generator(x_axis, column)
    x_axis.map do |date|
      current_user.diaries.where(diary_date: date).pluck(column)[0]
    end
  end

  def statistics_params
    params.permit(:column, :date_begin, :date_end, :period).to_h
  end

  def begininng_of_this_week
    Date.today.beginning_of_week
  end

  def end_of_this_week
    Date.today.end_of_week
  end
end
