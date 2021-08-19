require "test_helper"

class MyappsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myapp = myapps(:one)
  end

  test "should get index" do
    get myapps_url
    assert_response :success
  end

  test "should get new" do
    get new_myapp_url
    assert_response :success
  end

  test "should create myapp" do
    assert_difference('Myapp.count') do
      post myapps_url, params: { myapp: { email: @myapp.email, first_name: @myapp.first_name, last_name: @myapp.last_name, phone: @myapp.phone, twitter: @myapp.twitter } }
    end

    assert_redirected_to myapp_url(Myapp.last)
  end

  test "should show myapp" do
    get myapp_url(@myapp)
    assert_response :success
  end

  test "should get edit" do
    get edit_myapp_url(@myapp)
    assert_response :success
  end

  test "should update myapp" do
    patch myapp_url(@myapp), params: { myapp: { email: @myapp.email, first_name: @myapp.first_name, last_name: @myapp.last_name, phone: @myapp.phone, twitter: @myapp.twitter } }
    assert_redirected_to myapp_url(@myapp)
  end

  test "should destroy myapp" do
    assert_difference('Myapp.count', -1) do
      delete myapp_url(@myapp)
    end

    assert_redirected_to myapps_url
  end
end
