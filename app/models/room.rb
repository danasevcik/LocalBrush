class Room < ApplicationRecord
  belongs_to :user

  validates :area, presence: true

  def price
    self.area * 2
  end

end
