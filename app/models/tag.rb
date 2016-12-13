class Tag < ApplicationRecord
   has_many :taggable
   has_many :post, through: :taggable
end
