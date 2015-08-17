require 'spec_helper'
require 'bigdecimal'

describe Distributable do
  it 'has a version number' do
    expect(Distributable::VERSION).not_to be nil
  end

  describe '#distribute_across' do
    subject(:distribution) { distributable.distribute_across(recipients) }

    let(:recipients) { [0] * 10 }

    context "when the distributable divides evenly into the recipients" do
      let(:distributable) { 100 }

      it "is to divide the distributable evenly across the recipients" do
        expect(distribution).to eq([10] * 10)
      end
    end

    context "when the distributable does not divide unevenly into the recipients" do
      let(:distributable) { 101 }

      it "is to divide the distributable as evenly as possible across the recipients" do
        expect(distribution).to eq([11] + ([10] * 9))
      end
    end
  end

  describe '#distribute_evenly_across' do
    subject(:distribution) { distributable.distribute_evenly_across(recipients) }

    let(:recipients) { [0] * 10 }

    context "when the distributable divides evenly into the recipients" do
      let(:distributable) { 100 }

      it "is to divide the distributable evenly across the recipients" do
        expect(distribution).to eq([10] * 10)
      end
    end

    context "when the distributable does not divide unevenly into the recipients" do
      let(:distributable) { 101 }

      it "is to divide the distributable as evenly as possible across the recipients" do
        expect(distribution).to eq([11] + ([10] * 9))
      end
    end
  end

  describe '#distribute_proportionally_across' do
    subject(:distribution) { distributable.distribute_proportionally_across(recipients) }

    context "when the distributable divides evenly into the recipients" do
      let(:recipients)    { [1, 2, 3, 4] }
      let(:distributable) { 10 }

      it "is to divide the distributable evenly across the recipients" do
        expect(distribution).to eq [2, 4, 6, 8]
      end
    end

    context "when the distributable does not divide unevenly into the recipients" do
      let(:recipients)    { [1, 2, 3, 4] }
      let(:distributable) { 11 }

      it "is to divide the distributable as evenly as possible across the recipients" do
        expect(distribution).to eq [2, 4, 6, 9]
      end
    end
  end
end
