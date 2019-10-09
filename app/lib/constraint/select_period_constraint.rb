module Constraint
  class SelectPeriodConstraint
    PERIODS = ['thisWeek', 'thisMonth', 'prevWeek', 'prevMonth']
    
    def matches?(request)
      PERIODS.include?(request.query_parameters['week_or_month'])
    end
  end
end
