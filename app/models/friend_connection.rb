class FriendConnection < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :request
end
