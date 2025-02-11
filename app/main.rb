# frozen_string_literal: true

require './config/initializers/autoload'

# The class is responsible for orchestrating the entire flow of instantiating
# the orders, calculating the taxes, and returning the result.
class Main
  attr_reader :orders

  def initialize
    @orders = build_orders
  end

  def execute
    orders.map do |order|
      OrderSerializer.new(order).as_json
    end
  end

  private

  def build_orders
    input = ImportFile.execute
    input.map do |object|
      Order.new(**object[:order])
    end
  end
end

puts Main.new.execute
