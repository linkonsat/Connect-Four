# frozen_string_literal: true

require_relative './game_messages'
require 'pry-byebug'
# 6 by 7 Board class that updates itself in response to player input
class Board
  attr_accessor :board
  include GameMessages
  def initialize
    @board = Array.new(6) { Array.new(7, '[]') }
  end

  def update_board(player_position, player_chip)
    horizontal = 0
    until @board[horizontal + 1].nil? || @board[horizontal + 1][player_position.selected_chip_position] != '[]'
      horizontal += 1
    end
    if verify_input(player_position.selected_chip_position)
      change_board(horizontal, player_position.selected_chip_position, player_chip)
    end
  end

  def change_board(horizontal, vertical, player_chip)
    @board[horizontal][vertical] = player_chip
  end

  private

  def verify_input(player_position)
    if (0..7).include?(player_position) && board[0][player_position] == '[]'
      true
    elsif !(0..7).include?(player_position)
      not_on_position
    elsif board[0][player_position] != '[]'
      column_occupied
    end
  end
end
