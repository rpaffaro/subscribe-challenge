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

      it 'serializes the order with success' do
        expect(described_class.new(order).as_json).to eq(
          {
            order: {
              items: [
                {
                  quantity: 2,
                  name: 'imported chocolate',
                  total_price: '21.90',
                  categories: ['imported', 'food']
                }
              ],
              total: '21.90',
              sales_taxes: '1.10'
            }
          }
        )
      end
    end
  end
end
