require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new
  end

  def test_title_is_required
    @post.valid?
    assert_equal(@post.errors[:title], ["не может быть пустым", "минимум 5 символов"])
  end

  should validate_presence_of(:title)
  should validate_presence_of(:content)

  def test_tag_list
    assert @post.update(
      title: 'Мой тестовый пост',
      content: 'тестируем теги',
      user: users(:david),
      all_tags: 'раз, два'
    )
    assert_equal @post.tags.size, 2
    assert_equal @post.tags.first.name, 'раз'
    assert_equal @post.tags.last.name, 'два'
  end
end
