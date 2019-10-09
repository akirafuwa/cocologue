module Constraint
  class SelectDateConstraint
    def matches?(request)
      date_regex = /\d{4}\-\d{1,2}\-\d{1,2}/
      date_regex.match(request.query_parameters['date_begin']) && date_regex.match(request.query_parameters['date_end'])
    end
  end
end
