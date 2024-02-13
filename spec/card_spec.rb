# frozen_string_literal: true

require "rspec"

RSpec.describe Card do
  let(:card1) { described_class.new("AH") }
  let(:card2) { described_class.new("2D") }
  let(:card3) { described_class.new("3S") }
  let(:card4) { described_class.new("AH") }

  describe "#initialize" do
    it "initializes a card from a string" do
      expect(card1.to_s).to eq("AH")
    end

    it "initializes a card from two strings" do
      expect(card2.to_s).to eq("2D")
    end
  end

  describe "#to_s" do
    it "returns a string representation of the card" do
      expect(card3.to_s).to eq("3S")
    end
  end

  describe "#<=>" do
    it "compares the face value of this card with another card" do
      expect(card1 > card2).to be(true)
      expect(card2 < card3).to be(true)
      expect(card1 == card4).to be(true)
    end
  end

  describe "#value" do
    it "returns the face value of the card" do
      expect(card1.value).to eq(14)
      expect(card2.value).to eq(2)
      expect(card3.value).to eq(3)
    end
  end
end
