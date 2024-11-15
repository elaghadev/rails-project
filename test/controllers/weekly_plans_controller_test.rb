require "test_helper"

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weekly_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get weekly_plans_show_url
    assert_response :success
  end

  test "should get new" do
    get weekly_plans_new_url
    assert_response :success
  end

  test "should get edit" do
    get weekly_plans_edit_url
    assert_response :success
  end
end
