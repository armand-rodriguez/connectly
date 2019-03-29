class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :requests
  validate :image_type
  has_many :messages
  has_many :friend_connections

  private

  def image_type
    if !image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:images, 'needs to be a jpeg or png')
    end
  end
end
