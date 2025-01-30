require 'spec_helper'
require './app/main.rb'
require 'json'

RSpec.describe Main do
  describe '#execute' do
    context 'when the method is called with success' do
      let(:expected_output) do
        JSON.parse(
          File.read('./spec/fixtures/output.json'),
          symbolize_names: true
        )
      end

      it 'returns the expected output' do
        expect(described_class.new.execute).to eq(expected_output)
      end
    end
  end
end
