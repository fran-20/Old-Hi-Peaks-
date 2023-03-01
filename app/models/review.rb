class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mountain
  validates :score, presence: true
end
