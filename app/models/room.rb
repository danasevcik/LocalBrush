class Room < ApplicationRecord
  belongs_to :user

  validates :area, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def price
    self.area * 2
  end

end
