require "application_system_test_case"

class MyappsTest < ApplicationSystemTestCase
  setup do
    @myapp = myapps(:one)
  end

  test "visiting the index" do
    visit myapps_url
    assert_selector "h1", text: "Myapps"
  end

  test "creating a Myapp" do
    visit myapps_url
    click_on "New Myapp"

    fill_in "Email", with: @myapp.email
    fill_in "First name", with: @myapp.first_name
    fill_in "Last name", with: @myapp.last_name
    fill_in "Phone", with: @myapp.phone
    fill_in "Twitter", with: @myapp.twitter
    click_on "Create Myapp"

    assert_text "Myapp was successfully created"
    click_on "Back"
  end

  test "updating a Myapp" do
    visit myapps_url
    click_on "Edit", match: :first

    fill_in "Email", with: @myapp.email
    fill_in "First name", with: @myapp.first_name
    fill_in "Last name", with: @myapp.last_name
    fill_in "Phone", with: @myapp.phone
    fill_in "Twitter", with: @myapp.twitter
    click_on "Update Myapp"

    assert_text "Myapp was successfully updated"
    click_on "Back"
  end

  test "destroying a Myapp" do
    visit myapps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Myapp was successfully destroyed"
  end
end
