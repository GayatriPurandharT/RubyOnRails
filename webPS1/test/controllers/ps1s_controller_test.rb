require 'test_helper'

class Ps1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ps1 = ps1s(:one)
  end

  test "should get index" do
    get ps1s_url
    assert_response :success
  end

  test "should get new" do
    get new_ps1_url
    assert_response :success
  end

  test "should create ps1" do
    assert_difference('Ps1.count') do
      post ps1s_url, params: { ps1: { name: @ps1.name, url: @ps1.url } }
    end

    assert_redirected_to ps1_url(Ps1.last)
  end

  test "should show ps1" do
    get ps1_url(@ps1)
    assert_response :success
  end

  test "should get edit" do
    get edit_ps1_url(@ps1)
    assert_response :success
  end

  test "should update ps1" do
    patch ps1_url(@ps1), params: { ps1: { name: @ps1.name, url: @ps1.url } }
    assert_redirected_to ps1_url(@ps1)
  end

  test "should destroy ps1" do
    assert_difference('Ps1.count', -1) do
      delete ps1_url(@ps1)
    end

    assert_redirected_to ps1s_url
  end
end
