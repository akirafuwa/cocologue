require 'active_support/concern'

module DateCalculator
  extend ActiveSupport::Concern

  def get_date
    which_day = ["日", "月", "火", "水", "木", "金", "土"]
    observed_date =  self.created_at.strftime("%m月%d日(#{which_day[self.created_at.wday]})").slice(1..-1)
    return observed_date
  end

end
