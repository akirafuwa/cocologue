require 'active_support/concern'

module ValidateDateParams
  extend ActiveSupport::Concern

  def valid_date?(str, format="%Y-%m-%d")
    Date.strptime(str,format) rescue false
  end
end

module ParseDateParams
  extend ActiveSupport::Concern
  include ValidateDateParams

  def parse_date_params(params_hash)
    params_hash.each do |key, value|
      if valid_date?(value)
        params_hash[key] = Date.strptime(value, '%Y-%m-%d')
      end
    end
  end
end
