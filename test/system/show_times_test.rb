require "application_system_test_case"

class ShowTimesTest < ApplicationSystemTestCase
  setup do
    @show_time = show_times(:one)
  end

  test "visiting the index" do
    visit show_times_url
    assert_selector "h1", text: "Show Times"
  end

  test "creating a Show time" do
    visit show_times_url
    click_on "New Show Time"

    fill_in "Movie", with: @show_time.movie_id
    fill_in "Room", with: @show_time.room_id
    fill_in "When", with: @show_time.when
    click_on "Create Show time"

    assert_text "Show time was successfully created"
    click_on "Back"
  end

  test "updating a Show time" do
    visit show_times_url
    click_on "Edit", match: :first

    fill_in "Movie", with: @show_time.movie_id
    fill_in "Room", with: @show_time.room_id
    fill_in "When", with: @show_time.when
    click_on "Update Show time"

    assert_text "Show time was successfully updated"
    click_on "Back"
  end

  test "destroying a Show time" do
    visit show_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Show time was successfully destroyed"
  end
end
