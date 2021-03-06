class Painter < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :projects
  has_many :users, through: :projects

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :password, presence: true

  validates :name, presence: true
  # validates :name, uniqueness: true

  validates :zip_code, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :y_of_exp, presence: true

  def rating_average
    counter = self.reviews.count
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    avg = total.to_f / counter.to_f
    avg
  end

end
