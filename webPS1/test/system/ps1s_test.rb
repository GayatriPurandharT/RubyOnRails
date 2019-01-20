require "application_system_test_case"

class Ps1sTest < ApplicationSystemTestCase
  setup do
    @ps1 = ps1s(:one)
  end

  test "visiting the index" do
    visit ps1s_url
    assert_selector "h1", text: "Ps1s"
  end

  test "creating a Ps1" do
    visit ps1s_url
    click_on "New Ps1"

    fill_in "Name", with: @ps1.name
    fill_in "Url", with: @ps1.url
    click_on "Create Ps1"

    assert_text "Ps1 was successfully created"
    click_on "Back"
  end

  test "updating a Ps1" do
    visit ps1s_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ps1.name
    fill_in "Url", with: @ps1.url
    click_on "Update Ps1"

    assert_text "Ps1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Ps1" do
    visit ps1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ps1 was successfully destroyed"
  end
end
