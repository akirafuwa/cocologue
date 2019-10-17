class StatisticsController < ApplicationController
  before_action :require_user_logged_in, :set_current_user

  def report_by_date
    @COLUMNS = { activity: "活動量", mood: "気分", appetite: "食欲" }
    set_params_when_report_by_date_action(statistics_params)
    if is_date_weekly?(@date_begin, @date_end)
      @report = GenerateReport::WeeklyReport.new(user: current_user, column: @column, date_begin: @date_begin, date_end: @date_end)
    else
      @report = GenerateReport::MonthlyReport.new(user: current_user, column: @column, date_begin: @date_begin, date_end: @date_end)
    end
  end

  def report_by_period
    @COLUMNS = { activity: "活動量", mood: "気分", appetite: "食欲" }
    set_params_when_report_by_period_action(statistics_params)
    if is_period_weekly?(@period)
      @report = GenerateReport::WeeklyReport.new(user: current_user, column: @column, period: @period)
    else
      @report = GenerateReport::MonthlyReport.new(user: current_user, column: @column, period: @period)
    end
  end

private

  def set_params_when_report_by_period_action(params)
    @column = params[:column] ? params[:column].to_sym : :activity
    @period = params[:period] ? params[:period] : 'thisWeek'
  end

  def set_params_when_report_by_date_action(params)
    @column = params[:column] ? params[:column].to_sym : :activity
    @date_begin = params[:date_begin] ? params[:date_begin].to_date : Date.today.beginning_of_week
    @date_end = params[:date_end] ? params[:date_end].to_date : Date.today.end_of_week
  end

  def is_period_weekly?(period)
    period.underscore.split('_').last == 'week' ? true : false
  end

  def is_date_weekly?(date_begin, date_end)
    (date_begin..date_end).to_a.length <= 7 ? true : false
  end

  def statistics_params
    params.permit(:column, :date_begin, :date_end, :period).to_h
  end
end
