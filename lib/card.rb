# frozen_string_literal: true

# Card class represents a playing card. A card contains a face value and a suit
# Initializer with either a string such as "2D" or 2 strings "2" and "D"
# Or from another card to replicate a card.
class Card
  include Comparable

  SUITS = %w[S H D C].freeze
  FACES = %w[L 2 3 4 5 6 7 8 9 T J Q K A].freeze
  FACE_VALUES = FACES.each_with_index.to_h
  SUIT_VALUES = SUITS.each_with_index.to_h

  attr_reader :suit, :face

  def self.face_value(face)
    FACE_VALUES[face.upcase] + 1
  end

  def initialize(*args)
    case args.size
    when 1
      arg = args.first
      build_from_card(arg) if arg.respond_to?(:to_card)
      build_from_string(arg) if arg.respond_to?(:to_str)
    when 2
      arg1, arg2 = args
      build_from_face_suit(arg1, arg2) if arg1.respond_to?(:to_str) && arg2.respond_to?(:to_str)
    end
  end

  def to_s
    face_to_s + suit_to_s
  end

  # If to_card is called on a `Card` it should return itself
  def to_card
    self
  end

  def precedence
    Card::FACE_VALUES[face_to_s]
  end

  # Compare the face value of this card with another card and return:
  # -1 if this card is less than the other card
  # 0 if this card has the same face value as the other card
  # 1 if this card is greater than the other card
  def <=>(other)
    precedence <=> other.precedence
  end

  # Returns true if the cards are the same card. Meaning they
  # have the same suit and the same face value.
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

  def value
    @face
  end

  private

  def build_from_face_suit(face, suit)
    suit.upcase!
    @face  = Card.face_value(face)
    @suit  = Card::SUIT_VALUES[suit]
    raise ArgumentError, "Invalid card: \"#{face}#{suit}\"" unless @face && @suit
  end

  # takes a card argument and calls build_from_face_suit
  # with the first and second characters of card as arguments.
  def build_from_string(card)
    build_from_face_suit(card[0, 1], card[1, 1])
  end

  def face_to_s
    FACES[@face - 1]
  end

  def suit_to_s
    SUITS[@suit]
  end
end
