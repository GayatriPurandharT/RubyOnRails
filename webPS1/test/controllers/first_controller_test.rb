require 'test_helper'

class FirstControllerTest < ActionDispatch::IntegrationTest
  test "should get ps" do
    get first_ps_url
    assert_response :success
  end

end
