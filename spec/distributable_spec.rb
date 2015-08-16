require 'spec_helper'
require 'bigdecimal'

describe Distributable do
  it 'has a version number' do
    expect(Distributable::VERSION).not_to be nil
  end

  describe '#distribute_across' do
    before { distributable.distribute_across(recipients) }

    context "default behavior" do
      let(:recipients) { [0] * 10 }

      context "when the distributable divides evenly into the recipients" do
        let(:distributable) { 100 }

        it "is to divide the distributable evenly across the recipients" do
          expect(recipients).to eq([10] * 10)
        end
      end

      context "when the distributable does not divide unevenly into the recipients" do
        let(:distributable) { 101 }

        it "is to divide the distributable as evenly as possible across the recipients" do
          expect(recipients).to eq([11] + ([10] * 9))
        end
      end
    end
  end
end
