require 'spec_helper'

RSpec.describe ItemSerializer do
  describe '#as_json' do
    context 'when the method is called' do
      let(:item) do
        Item.new(
          **{
            quantity: 2,
            name: 'book',
            price: 10.40,
            categories: ['book']
          }
        )
      end

      it 'serializes the item with success' do
        expect(described_class.new(item).as_json).to eq(
          {
            quantity: 2,
            name: 'book',
            total_price: '20.80',
            categories: ['book']
          }
        )
      end
    end
  end
end
