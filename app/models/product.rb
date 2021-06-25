class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :weight, presence: true

  scope :active_products, -> { where(active: true)}
  scope :inactive_products, -> { where(active: true)}
end
