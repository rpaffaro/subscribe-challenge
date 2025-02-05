# frozen_string_literal: true

# This class is responsible for containing the business rules related to an
# Order and calculating the total order value.
class Order
  attr_accessor :items, :total_amount, :total_tax

  def initialize(items:, total_amount: 0.0, total_tax: 0.0)
    @items = build_items(items)
    @total_tax = total_tax
    @total_amount = total_amount
    calculate
  end

  private

  def calculate
    items.each do |item|
      self.total_tax += item.quantity * item.total_tax
      self.total_amount += (
        item.quantity * (item.price + item.total_tax)
      ).round(2)
    end
  end

  def build_items(items)
    items.map do |item|
      Item.new(**item)
    end
  end
end
