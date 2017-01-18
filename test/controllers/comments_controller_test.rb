require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @david = @post.user
  end

  test "should get new" do
    get new_post_comment_url(post_id: @post.id)
    assert_response :success
  end

  test "should create comment" do
    sign_in @david

    assert_difference('Comment.count') do
      post post_comments_url(post_id: @post.id), params: { comment: { text: 'Тело комментария'} }
    end

    assert Comment.last.user, @david
    assert_redirected_to post_url(@post)
  end

  test "should destroy comment" do
    comment = comments(:david_comment)
    sign_in comment.user
    assert_difference('Comment.count', -1) do
      delete post_comment_url(post_id: comment.post.id, id: comment.id)
    end
    assert_redirected_to post_url(@post)
  end

end
