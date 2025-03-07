# frozen_string_literal: true

# This class is responsible for formatting the information of the items to
# be displayed.
class ItemSerializer
  def initialize(item)
    @item = item
  end

  def as_json
    {
      quantity: item.quantity,
      name: item.name,
      total_price: format('%.2f', item.updated_price),
      categories: item.categories
    }
  end

  private

  attr_reader :item
end
