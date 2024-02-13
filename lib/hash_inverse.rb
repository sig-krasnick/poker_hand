# frozen_string_literal: true

# like invert but not lossy
# {1=>2,3=>2,2=>4}.inverse => {2=>[1, 3], 4=>[2]}
# used for determining the number of pairs, full house, four of a kind etc in a Poker hand.
class Hash
  def inverse
    each_with_object({}) { |(key, value), out| (out[value] ||= []) << key }
  end
end
