require 'test_helper'

class MovieTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_ticket = movie_tickets(:one)
  end

  test "should get index" do
    get movie_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_ticket_url
    assert_response :success
  end

  test "should create movie_ticket" do
    assert_difference('MovieTicket.count') do
      post movie_tickets_url, params: { movie_ticket: { column: @movie_ticket.column, row: @movie_ticket.row, show_time_id: @movie_ticket.show_time_id } }
    end

    assert_redirected_to movie_ticket_url(MovieTicket.last)
  end

  test "should show movie_ticket" do
    get movie_ticket_url(@movie_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_ticket_url(@movie_ticket)
    assert_response :success
  end

  test "should update movie_ticket" do
    patch movie_ticket_url(@movie_ticket), params: { movie_ticket: { column: @movie_ticket.column, row: @movie_ticket.row, show_time_id: @movie_ticket.show_time_id } }
    assert_redirected_to movie_ticket_url(@movie_ticket)
  end

  test "should destroy movie_ticket" do
    assert_difference('MovieTicket.count', -1) do
      delete movie_ticket_url(@movie_ticket)
    end

    assert_redirected_to movie_tickets_url
  end
end
