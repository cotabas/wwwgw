require "application_system_test_case"

class SavesTest < ApplicationSystemTestCase
  setup do
    @safe = saves(:one)
  end

  test "visiting the index" do
    visit saves_url
    assert_selector "h1", text: "Saves"
  end

  test "should create save" do
    visit saves_url
    click_on "New save"

    click_on "Create Save"

    assert_text "Save was successfully created"
    click_on "Back"
  end

  test "should update Save" do
    visit safe_url(@safe)
    click_on "Edit this save", match: :first

    click_on "Update Save"

    assert_text "Save was successfully updated"
    click_on "Back"
  end

  test "should destroy Save" do
    visit safe_url(@safe)
    click_on "Destroy this save", match: :first

    assert_text "Save was successfully destroyed"
  end
end
