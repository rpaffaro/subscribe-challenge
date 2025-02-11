require 'spec_helper'

RSpec.describe Item do
  describe '#initialize' do
    context 'when the method is called' do
      let(:tax) { Tax.new }
      let(:params) do
        {
          quantity: 2,
          name: 'imported perfume',
          price: 55.30,
          categories: ['imported', 'perfume']
        }
      end

      it 'calculate the tax for the item' do
        allow(Tax).to receive(:new).and_return(tax)
        allow(tax).to receive(:calculate_duty_fee).and_call_original

        klass = Item.new(**params)

        expect(Tax).to have_received(:new)
        expect(tax).to have_received(:calculate_duty_fee).with(['imported', 'perfume'], 55.30)
        expect(klass.total_tax).to eq(16.60)
      end
    end
  end
end
