#checks for winning conditions or a tie
require "pry-byebug"
class EndGame

    def vertical_win?(board,player_chip)
        board.each_with_index do  |current_row_item, current_row|
            current_row_item.each_with_index do  |current_column_item,current_column|
                current_values = [board[current_row][current_column],board[current_row + 1][current_column],
                                board[current_row + 2][current_column],board[current_row + 3][current_column]]
                                if(current_values.all?(player_chip))
                                    return true
                                end
                            end
                            if(board[current_row + 3 ].nil?)
                                return false
                            end
                        end
                
    end

    def horizontal_win?(board,player_chip)
        board.each_with_index do |current_row_item, current_row |
            current_row_item.each_with_index do |current_column_item, current_column|
                current_values = [board[current_row][current_column],board[current_row][current_column],
                                  board[current_row][current_column],board[current_row][current_column]]
                                  if(current_values.all?(player_chip))
                                    return true
                                  elsif(board[current_row][current_column + 3].nil?)
                                    break
                                  end
                                end
        end
    end

    def diagonal_win?(board,player_chip)
        board.each_with_index do |current_row_item, current_row |
            current_row_item.each_with_index do |current_column_item, current_column|
                current_values = [board[current_row][current_column],board[current_row + 1][current_column + 1],
                board[current_row + 2][current_column + 2],board[current_row + 3][current_column + 3]]
                if (current_values.all?(player_chip))
                    return true
                elsif(board[current_row + 3][current_column + 3].nil?)
                    break
                end
            end
            if (board[current_row + 3].nil?)
                return false
            end
        end
    end

    def tie?(board)
        flattened_board = board.flatten
        if(flattened_board.any?("[]"))
            return false
        elsif(flattened_board.none?("[]"))
            return true
        end
    end
end