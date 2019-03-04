class User < ApplicationRecord
  has_many :rooms
  has_many :projects
  has_many :painters, through: :projects

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :zip_code, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
end
