class Product < ApplicationRecord
  # what validations should a product have?
  # max price of 100
  # minimum price of 1
  # validates :price, numericality: {less_than_or_equal_to: 100, greater_than_or_equal_to: 1}
  # # name unique
  # validates :name, uniqueness: true
  # # description minimum 10 characters
  # validates :description, length: {minimum: 10}

  def is_discounted?
    !(price >= 10)
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
