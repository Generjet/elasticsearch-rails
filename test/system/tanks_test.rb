require "application_system_test_case"

class TanksTest < ApplicationSystemTestCase
  setup do
    @tank = tanks(:one)
  end

  test "visiting the index" do
    visit tanks_url
    assert_selector "h1", text: "Tanks"
  end

  test "creating a Tank" do
    visit tanks_url
    click_on "New Tank"

    fill_in "Detail", with: @tank.detail
    fill_in "Name", with: @tank.name
    click_on "Create Tank"

    assert_text "Tank was successfully created"
    click_on "Back"
  end

  test "updating a Tank" do
    visit tanks_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @tank.detail
    fill_in "Name", with: @tank.name
    click_on "Update Tank"

    assert_text "Tank was successfully updated"
    click_on "Back"
  end

  test "destroying a Tank" do
    visit tanks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tank was successfully destroyed"
  end
end
