require "application_system_test_case"

class MovieTicketsTest < ApplicationSystemTestCase
  setup do
    @movie_ticket = movie_tickets(:one)
  end

  test "visiting the index" do
    visit movie_tickets_url
    assert_selector "h1", text: "Movie Tickets"
  end

  test "creating a Movie ticket" do
    visit movie_tickets_url
    click_on "New Movie Ticket"

    fill_in "Column", with: @movie_ticket.column
    fill_in "Row", with: @movie_ticket.row
    fill_in "Show time", with: @movie_ticket.show_time_id
    click_on "Create Movie ticket"

    assert_text "Movie ticket was successfully created"
    click_on "Back"
  end

  test "updating a Movie ticket" do
    visit movie_tickets_url
    click_on "Edit", match: :first

    fill_in "Column", with: @movie_ticket.column
    fill_in "Row", with: @movie_ticket.row
    fill_in "Show time", with: @movie_ticket.show_time_id
    click_on "Update Movie ticket"

    assert_text "Movie ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie ticket" do
    visit movie_tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie ticket was successfully destroyed"
  end
end
