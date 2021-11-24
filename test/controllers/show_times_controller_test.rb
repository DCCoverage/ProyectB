require 'test_helper'

class ShowTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_time = show_times(:one)
  end

  test "should get index" do
    get show_times_url
    assert_response :success
  end

  test "should get new" do
    get new_show_time_url
    assert_response :success
  end

  test "should create show_time" do
    assert_difference('ShowTime.count') do
      post show_times_url, params: { show_time: {  } }
    end

    assert_redirected_to show_time_url(ShowTime.last)
  end

  test "should show show_time" do
    get show_time_url(@show_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_show_time_url(@show_time)
    assert_response :success
  end

  test "should update show_time" do
    patch show_time_url(@show_time), params: { show_time: {  } }
    assert_redirected_to show_time_url(@show_time)
  end

  test "should destroy show_time" do
    assert_difference('ShowTime.count', -1) do
      delete show_time_url(@show_time)
    end

    assert_redirected_to show_times_url
  end
end
