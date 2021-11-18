#6 by 7 Board class that updates itself in response to player input
class Board
    attr_accessor :board 

    def initialize
        @board = Array.new(6) {Array.new(7,"[]")}
    end
end