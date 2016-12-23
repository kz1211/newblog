require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new
  end
  def test_title_is_required
  @post.valid?
  assert_includes(@post.errors[:title], "can’t be blank")
  end
  should validate_presence_of(:title)
  should validate_presence_of(:content)
end
