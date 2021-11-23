# frozen_string_literal: true

# checks for winning conditions or a tie
require 'pry-byebug'
class EndGame
  def any_win?(board, player_chip, second_player_chip)
    # p vertical_win?(board,player_chip,second_player_chip)
    # p horizontal_win?(board,player_chip,second_player_chip)
    # p diagonal_win?(board,player_chip,second_player_chip)
    if vertical_win?(board, player_chip, second_player_chip)
      true
    elsif horizontal_win?(board, player_chip, second_player_chip)
      p horizontal_win?(board, player_chip, second_player_chip)
      true
    elsif diagonal_win?(board, player_chip, second_player_chip)
      true
    else
      false
    end
  end

  def vertical_win?(board, player_chip, second_player_chip = nil)
    board.each_with_index do |current_row_item, current_row|
      return false if board[current_row + 3].nil?

      current_row_item.each_with_index do |_current_column_item, current_column|
        current_values = [board[current_row][current_column], board[current_row + 1][current_column],
                          board[current_row + 2][current_column], board[current_row + 3][current_column]]

        if current_values.all?(player_chip) || current_values.all?(second_player_chip)
          return true
          end
      end
    end
  end

  def horizontal_win?(board, player_chip, second_player_chip = nil)
    board.each_with_index do |current_row_item, current_row|
      current_row_item.each_with_index do |_current_column_item, current_column|
        current_values = [board[current_row][current_column], board[current_row][current_column + 1],
                          board[current_row][current_column + 2], board[current_row][current_column + 3]]
        if current_values.all?(player_chip) || current_values.all?(second_player_chip)
          return true
        elsif board[current_row][current_column + 3].nil?
          break
          end
      end
    end
    false
  end

  def diagonal_win?(board, player_chip, second_player_chip = nil)
    board.each_with_index do |current_row_item, current_row|
      return false if board[current_row + 3].nil?

      current_row_item.each_with_index do |_current_column_item, current_column|
        current_values = [board[current_row][current_column], board[current_row + 1][current_column + 1],
                          board[current_row + 2][current_column + 2], board[current_row + 3][current_column + 3]]
        right_diagonal_values = [board[current_row][current_column + 3], board[current_row + 1][current_column + 2],
                                 board[current_row + 2][current_column + 1], board[current_row + 3][current_column]]
        if current_values.all?(player_chip) || current_values.all?(second_player_chip) || right_diagonal_values.all?(player_chip) || right_diagonal_values.all?(second_player_chip)
          return true
        elsif board[current_row + 3][current_column + 3].nil?
          break
        end
      end
    end
  end

  def tie?(board)
    flattened_board = board.flatten
    if flattened_board.any?('[]')
      false
    elsif flattened_board.none?('[]')
      true
    end
  end
end
