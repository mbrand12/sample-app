require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end

  test "relationship validity" do
    assert @relationship.valid?
  end

  test "follower_id presence" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "followed_id presence" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
