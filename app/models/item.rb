class Item
  attr_accessor :quantity, :name, :price, :categories, :total_tax

  def initialize(quantity:, name:, price:, categories:)
    @quantity = quantity
    @name = name
    @price = price
    @categories = categories
    @total_tax = Tax.new.calculate_duty_fee(categories, price)
  end
end
