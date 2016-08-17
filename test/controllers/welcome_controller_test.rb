require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
