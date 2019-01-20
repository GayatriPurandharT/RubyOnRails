require "application_system_test_case"

class QuoteDbsTest < ApplicationSystemTestCase
  setup do
    @quote_db = quote_dbs(:one)
  end

  test "visiting the index" do
    visit quote_dbs_url
    assert_selector "h1", text: "Quote Dbs"
  end

  test "creating a Quote db" do
    visit quote_dbs_url
    click_on "New Quote Db"

    fill_in "Author", with: @quote_db.author
    fill_in "Category", with: @quote_db.category
    fill_in "Quote", with: @quote_db.quote
    click_on "Create Quote db"

    assert_text "Quote db was successfully created"
    click_on "Back"
  end

  test "updating a Quote db" do
    visit quote_dbs_url
    click_on "Edit", match: :first

    fill_in "Author", with: @quote_db.author
    fill_in "Category", with: @quote_db.category
    fill_in "Quote", with: @quote_db.quote
    click_on "Update Quote db"

    assert_text "Quote db was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote db" do
    visit quote_dbs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote db was successfully destroyed"
  end
end
