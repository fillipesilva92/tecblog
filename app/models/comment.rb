class Comment < ApplicationRecord
  validates :title, :content, :rating, presence: true
  validates :title, length: { minimum: 3}
  validates :content, length: { maximum: 120}
  validates :rating, numericality: { less_than: 5}
  belongs_to :post
end