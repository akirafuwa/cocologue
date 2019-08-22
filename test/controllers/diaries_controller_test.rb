require 'test_helper'

class DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get diaries_create_url
    assert_response :success
  end

  test "should get destroy" do
    get diaries_destroy_url
    assert_response :success
  end

end
