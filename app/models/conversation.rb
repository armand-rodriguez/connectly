class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :second_user, :class_name => 'User', :foreign_key => 'second_user_id'
  belongs_to :profile
  has_many :messages, dependent: :destroy
end
