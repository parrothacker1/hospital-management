require "test_helper"

class HospitalControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get hospital_create_url
    assert_response :success
  end

  test "should get update" do
    get hospital_update_url
    assert_response :success
  end

  test "should get list" do
    get hospital_list_url
    assert_response :success
  end

  test "should get delete" do
    get hospital_delete_url
    assert_response :success
  end
end
