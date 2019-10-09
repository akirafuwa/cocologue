require 'active_support/concern'

module ValidateDateParams
  extend ActiveSupport::Concern

  def valid_date?(str, format="%Y-%m-%d")
    Date.strptime(str,format) rescue false
  end
end

module ParseParams
  extend ActiveSupport::Concern
  include ValidateDateParams

  def parse_date(date_string)
    if valid_date?(date_string)
      params = Date.strptime(date_string, '%Y-%m-%d')
    end
  end
end
