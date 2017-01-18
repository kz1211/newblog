class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def commenter
    if user.present?
      user.name
    else
      'Anonymous'
    end
  end

end
