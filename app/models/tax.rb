# frozen_string_literal: true

require 'yaml'

# This class is responsible for deciding which tax rule will be applied
# according to the product category and determining the tax amount.
class Tax
  def calculate_duty_fee(categories, price)
    tax = categories.map do |category|
      tax_by_categories[:categories].fetch(category.to_sym, regular_fee)[:tax]
    end.sum

    round(price * tax.round(2))
  end

  private

  def tax_by_categories
    @tax_by_categories ||= YAML.load_file(
      './config/tax_by_categories.yml', symbolize_names: true
    )
  end

  def regular_fee
    tax_by_categories[:categories][:regular]
  end

  # The code below will round to the nearest 0.05 number
  def round(value)
    (value / 0.05).ceil * 0.05
  end
end
