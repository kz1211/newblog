require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # штука которая помогает пробросить нужного
                                           # current_user тебе в контроллер
  # test "the truth" do
  #   assert true
  # end

  test "should update user" do
    sign_in users(:david)
    patch  users_url, params: { user: { name: 'dima', email: '15888@yandex.ru' } }
    assert(User.last.name, 'dima')
    assert_redirected_to user_url(User.last)
  end
end


