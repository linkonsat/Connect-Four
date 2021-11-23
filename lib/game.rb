require_relative "./board"
require_relative "./player"
require_relative "./game_messages"
require_relative "./end_game"
require "pry-byebug"
#contains the game functions such as turns 
class Game 
    attr_accessor :player_list, :board
    include GameMessages
    def setup
        @board = Board.new
        player_one = create_players
        player_two = create_players
        @player_list = [player_one,player_two]
    end

    def player_turn
        player_one_move_count = @board.board.flatten.count(@player_list[0].player_chip)
        player_two_move_count = @board.board.flatten.count(@player_list[1].player_chip)
        return player_two_move_count >= player_one_move_count ? 0 : 1
    end

    def select_position(player)
        player.new_position 
    end

    def round
        winning_conditions = EndGame.new
        until winning_conditions.any_win?(@board.board,player_list[0].player_chip,player_list[1].player_chip) 
        current_player = player_turn 
        new_position = select_position(@player_list[current_player])
        board.update_board(@player_list[current_player],@player_list[current_player].selected_chip_position)
        self.display_board(@board.board)
        end
        play_again(@player_list[current_player])
    end

    def play_again(player)
        winning_conditions = EndGame.new
        if(winning_conditions.tie?(@board.board))
        self.tie 
        play
        else
            self.you_win(player.player_name)
            play
        end
    end

    def play
        self.introduction
        if (verify_new_game == "New")
        self.clear
        self.setup
        self.round
        elsif(verify_new_game == "Load")
        else 
            return
        end
    end

    def clear
        @board = Board.new
        @player_list = nil
    end

    private
    def create_players
            new_player = Player.new
            self.enter_a_name
            new_player.new_player_name
            self.chip_select_options
            new_player.assign_chip

        return new_player
    end
       
    def verify_new_game
        choice = gets.chomp
        return choice 
    end


end