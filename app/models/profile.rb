class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :requests
  validate :image_type
  has_many :messages
  has_many :friend_connections
  has_many :comments

  def self.search(search_term)
    Profile.where("user_name ilike ?", "%#{search_term}%")
  end

  def thumbnail
    return self.image.variant(resize: "300x300")
  end

  def thumbnail_sm
    return self.image.variant(resize: "150x150")
  end

  def thumbnail_cropped
    return self.image.variant(combine_options: {thumbnail: '200x200^', gravity: 'center', extent: '200x200'})
  end

  private

  def image_type
    if !image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:images, 'needs to be a jpeg or png')
    end
  end
end
