# frozen_string_literal: true

require "rspec"

RSpec.describe PokerHand do
  let(:hand1) { described_class.new(%w[TH JH QH KH AH]) }   # Royal Flush
  let(:hand2) { described_class.new(%w[2H 3H 4H 5H 6H]) }   # Straight Flush
  let(:hand3) { described_class.new(%w[2H 2D 2C 2S 5H]) }   # Four of a Kind
  let(:hand4) { described_class.new(%w[2H 2D 3C 3S 3H]) }   # Full House
  let(:hand5) { described_class.new(%w[2H 4H 6H 8H TH]) }   # Flush
  let(:hand6) { described_class.new(%w[2H 3D 4C 5S 6H]) }   # Straight
  let(:hand7) { described_class.new(%w[2H 2D 2C 3S 4H]) }   # Three of a Kind
  let(:hand8) { described_class.new(%w[2H 2D 3C 3S 4H]) }   # Two Pairs
  let(:hand9) { described_class.new(%w[2H 2D 3C 4S 5H]) }   # One Pair
  let(:hand10) { described_class.new(%w[2H 3D 4C 5S 7H]) }  # High Card

  let(:four_of_a_kind_hand) { described_class.new(%w[2D 2H 2S 2C 5H]) }
  let(:straight_flush_hand) { described_class.new(%w[6H 5H 4H 3H 2H]) }
  let(:royal_flush_hand) { described_class.new(%w[AD KD QD JD TD]) }

  describe "#score_hand" do
    it "scores Royal Flush correctly" do
      expect(hand1.score_hand).to eq(600)
    end

    it "scores Straight Flush correctly" do
      expect(hand2.score_hand).to eq(500)
    end

    it "scores Four of a Kind correctly" do
      expect(hand3.score_hand).to eq(408)
    end

    it "scores Full House correctly" do
      expect(hand4.score_hand).to eq(313)
    end

    it "scores Flush correctly" do
      expect(hand5.score_hand).to eq(200)
    end

    it "scores Straight correctly" do
      expect(hand6.score_hand).to eq(106)
    end

    it "scores Three of a Kind correctly" do
      expect(hand7.score_hand).to eq(56)
    end

    it "scores Two Pairs correctly" do
      expect(hand8.score_hand).to eq(35)
    end

    it "scores One Pair correctly" do
      expect(hand9.score_hand).to eq(19)
    end

    it "scores High Card correctly" do
      expect(hand10.score_hand).to eq(7)
    end
  end

  describe "#initialize" do
    it "initializes a poker hand with the given cards" do
      expect(royal_flush_hand.to_s).to eq("AD,KD,QD,JD,TD")
    end
  end

  describe "#royal_flush?" do
    it "returns true if the hand is a royal flush" do
      expect(royal_flush_hand.royal_flush?).to be(true)
    end
  end

  describe "#straight_flush?" do
    it "returns true if the hand is a straight flush" do
      expect(straight_flush_hand.straight_flush?).to be(true)
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true if the hand is a four of a kind" do
      expect(four_of_a_kind_hand.four_of_a_kind?).to be(true)
    end
  end
end
