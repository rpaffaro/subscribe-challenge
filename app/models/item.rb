# frozen_string_literal: true

# This class is responsible for containing the information of the items
# in an order.
class Item
  attr_accessor :quantity, :name, :price, :categories, :total_tax, :updated_price

  def initialize(quantity:, name:, price:, categories:)
    @quantity = quantity
    @name = name
    @price = price
    @categories = categories
    @total_tax = quantity * calculate_tax_per_unit
    @updated_price = quantity * (price + calculate_tax_per_unit)
  end

  private

  def calculate_tax_per_unit
    @calculate_tax_per_unit ||= Tax.new.calculate_duty_fee(categories, price)
  end
end
