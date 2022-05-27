require "test_helper"

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get doctors_create_url
    assert_response :success
  end

  test "should get update" do
    get doctors_update_url
    assert_response :success
  end

  test "should get list" do
    get doctors_list_url
    assert_response :success
  end

  test "should get delete" do
    get doctors_delete_url
    assert_response :success
  end
end
