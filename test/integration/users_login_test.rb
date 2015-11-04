require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "flash message persistence over page's render" do
    get login_path
    assert_template 'sessions/new'

    post login_path, session: { email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?

    get root_path
    assert flash.empty?
  end
end
