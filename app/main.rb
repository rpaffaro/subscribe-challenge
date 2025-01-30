require './config/initializers/autoload.rb'

class Main
  attr_reader :orders, :file_path
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

Main.new.execute
