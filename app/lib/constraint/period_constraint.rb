module Constraint
  class PeriodConstraint
    PERIODS = ['thisWeek', 'thisMonth', 'prevWeek', 'prevMonth']
    
    def matches?(request)
      selected_period = request.fullpath.split('/').last
      PERIODS.include?(selected_period)
    end
  end
end
