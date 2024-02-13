# frozen_string_literal: true

require "rspec"

RSpec.describe CardHand::Hand do
  let(:card1) { Card.new("AH") }
  let(:card2) { Card.new("2D") }
  let(:card3) { Card.new("3S") }

  describe "#initialize" do
    it "initializes a hand with an array of cards" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.cards).to eq([card1, card2, card3])
    end

    it "initializes a hand with a string of cards" do
      hand = described_class.new("AH 2D 3S")
      expect(hand.cards).to eq([card1, card2, card3])
    end
  end

  describe "#to_s" do
    it "returns a string representation of the hand" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.to_s).to eq("AH,2D,3S")
    end
  end

  describe "#faces" do
    it "returns an array of the faces of the cards in the hand" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.faces).to eq([14, 2, 3])
    end
  end

  describe "#suits" do
    it "returns an array of the suits of the cards in the hand" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.suits).to eq(%w[H D S])
    end
  end

  describe "#highest_card" do
    it "returns the highest card in the hand" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.highest_card).to eq(card1)
    end
  end

  describe "#lowest_card" do
    it "returns the lowest card in the hand" do
      hand = described_class.new([card1, card2, card3])
      expect(hand.lowest_card).to eq(card2)
    end
  end
end
