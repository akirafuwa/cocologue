require 'active_support/concern'

module DateCalculator
  extend ActiveSupport::Concern

  def get_date
    which_day = ["日", "月", "火", "水", "木", "金", "土"]
    observed_date =  self.diary_date.strftime("%m月%d日(#{which_day[self.diary_date.wday]})").slice(1..-1)
    observed_date
  end

  def year
    self.diary_date.strftime('%Y')
  end 

  def week
    self.diary_date.strftime('%W')
  end
end
