class Rating < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  scope :liked, -> {where(positive: true)}
  scope :disliked, -> {where(positive: false)}
end
