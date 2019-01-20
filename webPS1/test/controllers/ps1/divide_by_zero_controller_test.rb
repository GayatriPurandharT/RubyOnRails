require 'test_helper'

class Ps1::DivideByZeroControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get ps1_divide_by_zero_page_url
    assert_response :success
  end

end
