require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "micropost validity" do
    assert @micropost.valid?
  end

  test "user_id presence" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content presence" do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end

  test "content character limit" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "microposts display in reverse chronological order" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
