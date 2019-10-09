class StatisticsController < ApplicationController
  before_action do
   require_user_logged_in,
   set_current_user,
   set_params(statistics_params)
  end

  def report
    @chart  = Report::GenerateReport.new(current_user, @column, @period, @date_begin, @date_end).call
  end

  def select_period
  end

  def select_date
  end

private

  def set_params(params)
    @column = params[:column].nil? ? :activity : params[:column].to_sym
    @period = params[:week_or_month].nil? ? :thisWeek : params[:week_or_month].to_sym
    @date_begin = params[:date_begin].nil? ? Date.today.begininng_of_week : parse_date(params[:date_begin])
    @date_end = params[:date_end].nil? ? Date.today.end_of_week : parse_date(params[:date_end])
  end

  def statistics_params
    params.permit(:column, :date_begin, :date_end, :week_or_month).to_h
  end
end
