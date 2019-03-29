class Request < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :request_status
  #think about whether this is ideal and the implication of this or of has_one
  has_one :friend_connection
end
