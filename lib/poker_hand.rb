# frozen_string_literal: true

require_relative "poker_scoring"

# The PokerHand class extends the CardHand::Hand class and represents a hand of poker cards.
class PokerHand < CardHand::Hand
  require "set"
  include PokerScoring

  def initialize(cards = [])
    super
    @flush_suit = suits.to_set
    @of_a_kind = faces.tally.inverse
    score_hand
  end

  attr_reader :ranking, :score

  def royal_flush?
    straight? && flush? && highest_card.face == 14
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    of_a_kind(4)
  end

  def full_house?
    of_a_kind(3) && of_a_kind(2)
  end

  def flush?
    @flush_suit.count == 1
  end

  def straight?
    faces.sort.each_cons(2).all? { |a, b| b - a == 1 }
  end

  def three_of_a_kind?
    of_a_kind(3)
  end

  def two_pairs?
    of_a_kind(2) && @of_a_kind[2].length == 2
  end

  def one_pair?
    of_a_kind(2)
  end

  def get_score_pairs(num)
    score_of_a_kind(num)
  end

  # comparable interface for poker hand
  def <=>(other)
    score <=> other.score
  end

  def ==(other)
    (self <=> other).zero?
  end

  def >(other)
    (self <=> other) == 1
  end

  def <(other)
    (self <=> other) == -1
  end

  alias eql? ==

  private

  def of_a_kind(num)
    @of_a_kind.keys.any? { |a| a == num }
  end

  def score_of_a_kind(num)
    @of_a_kind[num].inject(:+) * num
  end
end
