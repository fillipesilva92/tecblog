class Post < ApplicationRecord
  validates :title, :content, :image, presence: true
  validates :title, length: { minimum: 3, maximum: 80}
  validates :content, length: { minimum: 120}
  validates :image, length: { maximum: 80}
  has_many :comments
  belongs_to :category
  belongs_to :user
end