#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "./lib/card"
require_relative "./lib/card_hand"
require_relative "./lib/poker_hand"
require_relative "./lib/poker_game"

poker_file = "./data/poker.txt"
games = File.readlines(poker_file).map { |line| line.split.each_slice(5).to_a }
game = PokerGame.new(games)
game.play_game
puts "\nFinal Score: Player 1: #{game.player1_wins}  Player 2: #{game.player2_wins}"
