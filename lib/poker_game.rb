# frozen_string_literal: true

require_relative "./hash_inverse"

# PokerGame class is the driver class for playing any number of rounds of Poker.
# It is initialized with an array of card hands, sets up the initial scores for two players
# and plays each round of Poker and outputs the results to the screen.
class PokerGame
  attr_reader :player1_wins, :player2_wins

  def initialize(games)
    unless games.is_a?(Array) && games.all? { |game| game.is_a?(Array) }
      raise ArgumentError, "The 'games' parameter must be an array of two card hands"
    end

    @games = games
    @player1_wins = 0
    @player2_wins = 0
  end

  def play_game
    @games.each_with_index do |hand, index|
      puts "\n Round: #{index + 1} "
      @player1_hand = PokerHand.new(hand[0])
      @player2_hand = PokerHand.new(hand[1])

      determine_winner(@player1_hand, @player2_hand)
    end
  end

  private

  def determine_winner(player1_hand, player2_hand)
    show_player_hands(player1_hand, player2_hand)

    update_score(show_game_results(player1_hand <=> player2_hand))
  end

  def show_player_hands(player1_hand, player2_hand)
    puts "Player 1 [#{player1_hand}] #{player1_hand.ranking}"
    puts "Player 2 [#{player2_hand}] #{player2_hand.ranking}"
  end

  def show_game_results(results)
    case results
    when 1
      puts "Player 1 wins!"
      1
    when -1
      puts "Player 2 wins!"
      2
    else
      # if it's a tie, the winner is the one with the highest card
      show_game_results(@player1_hand.highest_card.face <=> @player2_hand.highest_card.face)
    end
  end

  def update_score(winner)
    case winner
    when 1
      @player1_wins += 1
    when 2
      @player2_wins += 1
    end
  end
end
