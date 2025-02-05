# frozen_string_literal: true

# This class is responsible for deciding which tax rule will be applied
# according to the product category and determining the tax amount.
class Tax
  DUTY_FREE_CATEGORIES = %w[food medical book].freeze
  DUTY_FEE = 0.05
  REGULAR_FEE = 0.1

  def calculate_duty_fee(categories, price)
    tax = 0
    return tax if (categories - DUTY_FREE_CATEGORIES).empty?

    tax += REGULAR_FEE unless categories.intersect?(DUTY_FREE_CATEGORIES)
    tax += DUTY_FEE if imported?(categories)

    round(price * tax.round(2))
  end

  private

  def imported?(categories)
    categories.include?('imported')
  end

  # The code below will round to the nearest 0.05 number
  def round(value)
    (value / 0.05).ceil * 0.05
  end
end
