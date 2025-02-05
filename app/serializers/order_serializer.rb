# frozen_string_literal: true

# This class is responsible for formatting the information of an order to
# be displayed.
class OrderSerializer
  def initialize(order)
    @order = order
  end

  def as_json
    {
      order: {
        items: items(order.items),
        total: format('%.2f', order.total_amount),
        sales_taxes: format('%.2f', order.total_tax)
      }
    }
  end

  private

  attr_reader :order

  def items(items)
    items.map do |item|
      ItemSerializer.new(item).as_json
    end
  end
end
