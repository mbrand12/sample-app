require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "bug: flash message persistence over page's render" do
    get login_path
    assert_template 'sessions/new'

    post login_path, session: { email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?

    get root_path
    assert flash.empty?
  end

  test "header nav links changing on successful login and logout" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user

    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "user logging out in the second window as well" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?

    delete logout_path
    assert_not is_logged_in?

    delete logout_path
    assert_redirected_to root_url
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: "1")
    assert_equal cookies["remember_token"], assigns(:user).remember_token
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: "0")
    assert_nil cookies["remember_token"]
  end
end
