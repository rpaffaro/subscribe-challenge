require 'spec_helper'

RSpec.describe ImportFile do
  let(:file_path) { './data/input.json' }

  describe '.execute' do
    context 'when the method is called' do
      it 'instantiates the class successfully' do
        allow(described_class).to receive(:new).and_call_original

        described_class.execute

        expect(described_class).to have_received(:new).with(file_path)
      end

      it 'call the method instance method execute' do
        instance = described_class.new(file_path)

        allow(described_class).to receive(:new).and_return(instance)
        allow(instance).to receive(:execute).and_call_original

        described_class.execute

        expect(instance).to have_received(:execute)
      end
    end
  end

  describe '#execute' do
    context 'when the method is called' do
      let(:content) { File.read(file_path) }

      it 'read the file and parse the content' do
        allow(File).to receive(:read).and_call_original
        allow(JSON).to receive(:parse).and_call_original

        described_class.new(file_path).execute

        expect(File).to have_received(:read).with(file_path)
        expect(JSON).to have_received(:parse).with(content, symbolize_names: true)
      end
    end
  end
end
