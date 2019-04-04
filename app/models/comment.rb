class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  has_many :likes
end
