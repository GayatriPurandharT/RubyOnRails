require 'test_helper'

class QuoteDbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_db = quote_dbs(:one)
  end

  test "should get index" do
    get quote_dbs_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_db_url
    assert_response :success
  end

  test "should create quote_db" do
    assert_difference('QuoteDb.count') do
      post quote_dbs_url, params: { quote_db: { author: @quote_db.author, category: @quote_db.category, quote: @quote_db.quote } }
    end

    assert_redirected_to quote_db_url(QuoteDb.last)
  end

  test "should show quote_db" do
    get quote_db_url(@quote_db)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_db_url(@quote_db)
    assert_response :success
  end

  test "should update quote_db" do
    patch quote_db_url(@quote_db), params: { quote_db: { author: @quote_db.author, category: @quote_db.category, quote: @quote_db.quote } }
    assert_redirected_to quote_db_url(@quote_db)
  end

  test "should destroy quote_db" do
    assert_difference('QuoteDb.count', -1) do
      delete quote_db_url(@quote_db)
    end

    assert_redirected_to quote_dbs_url
  end
end
