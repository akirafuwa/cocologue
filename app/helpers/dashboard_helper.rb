module DashboardHelper
  def subtract_a_month(date_object)
    date = date_object << 1
    subtracted_url = date.strftime("%Y-%m")
    subtracted_body = date.month.to_s + '月'
    return subtracted_body, subtracted_url
  end

  def add_a_month(date_object)
    date = date_object << -1
    added_url = date.strftime("%Y-%m")
    added_body = date.month.to_s + '月'
    return added_body, added_url
  end
end
