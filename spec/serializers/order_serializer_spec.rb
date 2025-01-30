require 'spec_helper'

RSpec.describe OrderSerializer do
  describe '#as_json' do
    context 'when the method is called' do
      let(:order) do
        Order.new(
          **{
            items: [
              {
                quantity: 2,
                name: 'imported chocolate',
                price: 10.40,
                categories: ['imported', 'food']
              },
            ]
          }
        )
      end
      let(:serialized_order) do
        {
          order: {
            items: [
              {
                quantity: 2,
                name: 'imported chocolate',
                price: '10.40',
                categories: ['imported', 'food']
              }
            ],
            total: '21.90',
            sales_taxes: '1.10'
          }
        }
      end

      it 'serializes the order with success' do
        expect(described_class.new(order).as_json).to eq(serialized_order)
      end
    end
  end
end
