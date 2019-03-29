class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  belongs_to :conversation
end
