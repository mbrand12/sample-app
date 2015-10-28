require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "gets sign up page" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end

end
