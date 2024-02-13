# PokerHand

Welcome to PokerHand App! This is a Ruby 2.7 program that plays rounds of Poker.  The program scores each player's Poker hand, displays the cards and the ranking of each Poker hand and determines which player won the round.  At the end, the program will let you know player had the most wins!  


## Installation

Clone this repository and cd into the main directory.
Run `bundle install` to install dependencies

## Usage


```ruby
type ./play_poker.rb
```

And then execute:

    The program will play 1000 rounds of poker and 
    return the result.  The demo rounds of poker are stored in `data/poker.txt` 
    There is a result file located in `results.txt` 



## Rules
In the card game poker, a hand consists of five cards and are ranked, from
lowest to highest, in the following way:
- High Card: Highest value card.
- One Pair: Two cards of the same value.
- Two Pairs: Two different pairs.
- Three of a Kind: Three cards of the same value.
- Straight: All cards are consecutive values.
- Flush: All cards of the same suit.
- Full House: Three of a kind and a pair.
- Four of a Kind: Four cards of the same value.
- Straight Flush: All cards are consecutive values of same suit.
- Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the
highest value wins; for example, a pair of eights beats a pair of fives (see
example 1 below). But if two ranks tie, for example, both players have a pair
of queens, then highest cards in each hand are compared

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
