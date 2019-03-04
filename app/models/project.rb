class Project < ApplicationRecord
  belongs_to :user
  belongs_to :painter
end
