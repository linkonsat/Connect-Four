# frozen_string_literal: true

# contains the messages for the respective
module GameMessages
  def not_on_position
    puts 'Outside of range. Put a position between 0 - 7'
  end

  def column_occupied
    puts "Column is full! select another column\n"
  end

  def you_win(player)
    puts "You won player #{player}.\n"
  end

  def tie
    puts "No one won! try again next time.\n"
  end

  def return
    puts "To rerun the game enter Y. Otherwise enter any other input\n"
  end

  def save
    puts "Enter save at any point to save the current status of your game\n"
  end

  def chip_select_options
    puts "Enter 0 for the black chip, 1 for the blue chip, 2 for the white chip\n"
  end

  def position_options
    puts "Enter 0-7 to drop a chip. Remember if a column is occupied fully\n
        you can't drop any!"
  end

  def enter_a_name
    puts "Go ahead and put in a name! You can always Bob one out of the player if you wish\n"
  end

  def introduction
    puts "Welcome to connect four! Enter New to start a new game, Load to enter previous or anything else to exit :) \n"
  end

  def display_board(board)
    puts "#{board[0]}\n#{board[1]}\n#{board[2]}\n#{board[3]}\n#{board[4]}\n#{board[5]}\n"
  end
end
