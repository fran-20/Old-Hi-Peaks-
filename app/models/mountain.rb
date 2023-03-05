class Mountain < ApplicationRecord
  has_many :reviews, dependent: :destroy
  attr_accessor :average

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def avg_level
    unless self.reviews.empty?
      reviews.average(:level).round(1).to_f
    else
      0.0
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    ["area", "created_at", "height", "id", "kana", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["reviews"]
  end

end