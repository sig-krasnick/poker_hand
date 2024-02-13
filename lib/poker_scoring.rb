# frozen_string_literal: true

# lib/poker_scoring.rb

# contains the scoring logic for a poker hand
module PokerScoring
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
  OPS = [
    ["Royal Flush", :royal_flush?],
    ["Straight Flush",  :straight_flush?],
    ["Four of a kind",  :four_of_a_kind?],
    ["Full house",      :full_house?],
    ["Flush",           :flush?],
    ["Straight",        :straight?],
    ["Three of a kind", :three_of_a_kind?],
    ["Two pairs",       :two_pairs?],
    ["One pair",        :one_pair?],
    ["High card",       :highest_card]
  ].freeze

  def score_hand
    # if royal_flush?
    #   rank_and_score("Royal flush")
    # elsif straight_flush?
    #   rank_and_score("Straight flush")
    # elsif four_of_a_kind?
    #   rank_and_score("Four of a kind")
    # elsif full_house?
    #   rank_and_score("Full House")
    # elsif flush?
    #   rank_and_score("Flush")
    # elsif straight?
    #   rank_and_score("Straight")
    # elsif three_of_a_kind?
    #   rank_and_score("Three of a kind")
    # elsif two_pairs?
    #   rank_and_score("Two pairs")
    # elsif one_pair?
    #   rank_and_score("One pair")
    # else
    #   rank_and_score("High card")
    # end

    OPS.each do |op|
      next unless send(op[1])

      rank_and_score(op[0])
      break
    end

    #   OPS.map { |op|
    #   method(op[1]).call()
    # }.find { |score| score }
  end

  def rank_and_score(result)
    case result
    when "Royal flush"
      @ranking = result
      @score = 600
    when "Straight flush"
      @ranking = result + cards.sort.to_s
      @score = 500
    when "Four of a kind"
      @ranking = result + (@of_a_kind[4]).to_s
      @score = 400 + get_score_pairs(4)
    when "Full House"
      @ranking = "Full House #{@of_a_kind[3]} #{@of_a_kind[2]}"
      @score = 300 + get_score_pairs(3) + get_score_pairs(2)
    when "Flush"
      @ranking = result
      @score = 200
    when "Straight"
      @ranking = result + cards.sort.to_s
      @score = 100 + highest_card.face
    when "Three of a kind"
      @ranking = result + (@of_a_kind[3]).to_s
      @score = 50 + get_score_pairs(3)
    when "Two pairs"
      @ranking = result + (@of_a_kind[2]).to_s
      @score = 25 + get_score_pairs(2)
    when "One pair"
      @ranking = result + (@of_a_kind[2]).to_s
      @score = 15 + get_score_pairs(2)
    else
      @ranking = "#{highest_card} High"
      @score = highest_card.face
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
end
