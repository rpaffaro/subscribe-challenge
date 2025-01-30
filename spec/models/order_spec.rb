require 'spec_helper'

RSpec.describe Order do
  describe '#initialize' do
    context 'when the method is called' do
      let(:params) do
        {
          items: [
            {
              quantity: 2,
              name: 'imported chocolate',
              price: 10.40,
              categories: ['imported', 'food']
            },
            {
              quantity: 1,
              name: 'music CD',
              price: 14.99,
              categories: ['entertainment']
            },
            {
              quantity: 1,
              name: 'chocolate bar',
              price: 0.85,
              categories: ['food']
            }
          ]
        }
      end

      it 'calculate the total_amount and total_tax successfully' do
        klass = Order.new(**params)

        expect(klass.total_tax).to eq(2.6)
        expect(klass.total_amount).to eq(39.24)
      end
    end
  end
end
