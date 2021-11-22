require_relative "../lib/end_game"
describe EndGame do
    describe "#vertical_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a vertical win" do 
        board = double("Board")
        player = double("Player")
        player.instance_variable_set(:@chip, "a")
        board.instance_variable_set(:@board, [["[]"],["[]"],["a"],["a"],["a"],["a"]])
        result = end_game.vertical_win(board,player)

        expect(result).to eql(true)
    end
end
    describe "#horizontal_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a horizontal win" do 
        board = double("Board")
        player = double("Player")
        player.instance_variable_set(:@chip, "a")
        board.instance_variable_set(:@board, [["[]","[]","a","a","a","a"]])
        result = end_game.vertical_win(board,player)
        expect(result).to eql(true)
    end
    describe "#diagonal_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a diagonal win" do 
        board = double("Board")
        player = double("Player")
        player.instance_variable_set(:@chip, "a")
        board.instance_variable_set(:@board, [["a"],["[]","a"],["[]","[]","a"],["[]","[]","[]","a"]])
        result = end_game.vertical_win(board,player)
        expect(result).to eql(true)
    end
end
    describe "#tie" do 
    subject(:end_game) { described_class.new }
end
    it "returns true on no winners" do 
        board = double("Board")
        player = double("Player")
        player.instance_variable_set(:@chip, "a")
        board.instance_variable_set(:@board,  Array.new(6) {Array.new(7,"[]")})
        result = end_game.vertical_win(board,player)
        expect(result).to eql(true)
    end
end
end