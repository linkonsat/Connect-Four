# frozen_string_literal: true

require_relative './symbols'
require_relative './game_messages'
require 'pry-byebug'
# gives the ability of the player to select a vertical column to place chips
class Player
  attr_accessor :player_chip, :player_name, :selected_chip_position
  include Pieces
  include GameMessages
  def initialize
    @player_chip = nil
    @player_name = nil
    @selected_chip_position = nil
  end

  def new_player_name
    @player_name = gets.chomp
  end

  def assign_chip
    until verify_chip(input = gets.chomp)
    end
    if input == '0'
      @player_chip = black_chip
    elsif input == '1'
      @player_chip = blue_chip
    elsif input == '2'
      @player_chip = white_chip
    end
  end

  def new_position
    position_options
    until verify_position(input = gets.chomp)

    end
    @selected_chip_position = input.to_i
  end

  private

  def verify_position(input)
    true if ('0'..'7').include?(input)
  end

  def verify_chip(input)
    true if ('0'..'2').include?(input)
  end
end
