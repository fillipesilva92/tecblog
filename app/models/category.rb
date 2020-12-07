class Category < ApplicationRecord
  validates :name, length: { maximum: 20}
  validates :status, inclusion: {in: ['ativo', 'inativo']}
  has_many :posts
end