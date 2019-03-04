class Painter < ApplicationRecord
  has_many :reviews
  has_many :projects
  has_many :users, through: :projects

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :zip_code, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :y_of_exp, presence: true
end
