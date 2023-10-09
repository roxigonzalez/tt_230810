class Product < ApplicationRecord
  validates :name, :price, :description, :stock, :sku, :vendor, :currency, presence: true
  # validating lenght of vendor limit 100 characters
  validates_length_of :vendor, maximum: 100
  # validating price and stock are greater than 0
  validates :price, :stock, numericality: {
    greater_than: 0,
    integer_only: true
  }
  # name only 40 characters max
  validates_length_of :name, maximum: 40
  # validate currency only USD or EUR
  validates :currency, inclusion: { in: %w(USD EUR) }
  
  # enum currency: [:USD, :EUR]
  enum currency: { USD: 'USD', EUR: 'EUR' }
end
