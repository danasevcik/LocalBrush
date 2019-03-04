class Painter < ApplicationRecord
  has_many :reviews
  has_many :projects
  has_many :users, through: :projects
end
