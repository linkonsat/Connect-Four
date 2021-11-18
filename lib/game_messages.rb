#contains the messages for the respective 
module GameMessages

    def not_on_position
        puts "Outside of range. Put a position between 0 - 7"
    end 

    def column_occupied
        puts "Column is full! select another column"
    end

    def you_win(player)
        puts "You won player #{player}."
    end

    def tie
        puts "No one won! try again next time"
    end
    def return
        puts "To rerun the game enter Y. Otherwise enter any other input"
    end

    def save 
        puts "Enter save at any point to save the current status of your game"
    end

end