require 'spec_helper'

RSpec.describe Tax do
  describe '#calculate_duty_fee' do
    subject { described_class.new.calculate_duty_fee(*params) }

    context 'when the product is exempt from tax' do
      let(:params) {  [['book'], 22.10]}

      it 'returns tax value equal to zero' do
        expect(subject).to eq(0)
      end
    end

    context 'when is a domestic product' do
      let(:params) { [['music CD'], 10.00] }

      it 'returns only the 10% fee based on the product\'s value' do
        expect(subject).to eq(1)
      end
    end

    context 'when is a imported product exempt from tax' do
      let(:params) { [['imported', 'food'], 10.00] }

      it 'applies only the 5% fee' do
        expect(subject).to eq(0.5)
      end
    end

    context 'when is a imported and not a exempt from tax product' do
      let(:params) { [['imported', 'perfume'], 10.00] }

      it 'applies the 10% fee plus the 5% fee' do
        expect(subject).to eq(1.5)
      end
    end
  end
end
