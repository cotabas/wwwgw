require "application_system_test_case"

class StreamersTest < ApplicationSystemTestCase
  setup do
    @streamer = streamers(:one)
  end

  test "visiting the index" do
    visit streamers_url
    assert_selector "h1", text: "Streamers"
  end

  test "should create streamer" do
    visit streamers_url
    click_on "New streamer"

    click_on "Create Streamer"

    assert_text "Streamer was successfully created"
    click_on "Back"
  end

  test "should update Streamer" do
    visit streamer_url(@streamer)
    click_on "Edit this streamer", match: :first

    click_on "Update Streamer"

    assert_text "Streamer was successfully updated"
    click_on "Back"
  end

  test "should destroy Streamer" do
    visit streamer_url(@streamer)
    click_on "Destroy this streamer", match: :first

    assert_text "Streamer was successfully destroyed"
  end
end
