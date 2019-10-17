module Constraint
  class DateConstraint
    def matches?(request)
      from = parase_to_match_data_object(request.params[:date_begin])
      to = parase_to_match_data_object(request.params[:date_end])
      Date.valid_date?(from[:year].to_i, from[:month].to_i, from[:day].to_i) && Date.valid_date?(to[:year].to_i, to[:month].to_i, to[:day].to_i)
    end

    def parase_to_match_data_object(params)
      params.match(/(?<year>\d{4})-(?<month>\d{1,2})-(?<day>\d{1,2})/)
    end
  end
end
