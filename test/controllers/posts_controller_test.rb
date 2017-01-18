require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # штука которая помогает пробросить нужного
                                           # current_user тебе в контроллер
  def create_test_post!
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    sign_in users(:david)

    assert_difference('Post.count') do
      post posts_url, params: { post: { content: 'Тело поста', title: 'Новый пост' } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    create_test_post!

    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    create_test_post!

    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    new_content = 'Новое тело поста'
    create_test_post!
    sign_in @post.user

    patch post_url(@post), params: { post: { content: new_content } }
    assert_equal(@post.reload.content, new_content)
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    create_test_post!
    sign_in @post.user

    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
