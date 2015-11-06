require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "gets sign up page" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end

  test "redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect update when not logged in" do
    patch :update, id:@user, user: { name: @user.name,
                                     email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id:@user
    assert flash.empty?
    assert_redirected_to root_url
  end

 test "redirect update when logged in as wrong user" do
   log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name,
                                      email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
 end

end
