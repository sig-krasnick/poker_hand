# frozen_string_literal: true

module CardHand
  # Class that represents a hand of cards.  This has the minimum number of methods
  # that would be used, such as showing the hand of cards and showing the highest and lowest card.
  # This is a base class for any other rule based card game classes such as the PokerHand class.
  #  The rules of any game will be incorporated into these higher level classes.
  class Hand
    attr_reader :cards

    def initialize(cards = [])
      @cards = case cards
               when Array
                 cards.map { |card| card.is_a?(Card) ? card : Card.new(card.to_s) }
               when String
                 cards.scan(/\S{2}/).map { |str| Card.new(str) }
               else
                 cards
               end
    end

    def to_s
      @cards.join(",")
    end

    def faces
      @cards.map(&:face)
    end

    def suits
      @cards.map { |c| c.to_s[1, 1] }
    end

    def highest_card
      @cards.sort_by(&:value).reverse.first
    end

    def lowest_card
      @cards.min_by(&:value)
    end
  end
end
