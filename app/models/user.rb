class User < ApplicationRecord
  has_secure_password

  has_many :rooms
  has_many :projects
  has_many :painters, through: :projects

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :password, presence: true
  
  validates :name, presence: true
  # validates :name, uniqueness: true

  validates :zip_code, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
end
