require_relative "../lib/board"

describe Board do 
        describe "#board" do 
        subject(:board) {described_class.new}
        context "creates a new board" do 
            it "creates a new board"do
            expect(board.board.all?(Numberic)).to eql(true)
        end
        end

        describe "#update_board" do 
        subject(:board) {described_class.new}
        context "it updates the board with the chip" do 
            it "places the piece on the bottom slot" do
                player = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 0 } 
                subject.update_board(player.position, player.chip)
                expect(board[6][0]).to eql("[blue]")
            end

            it "places the chip on top of another chip" do 
                player = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 0 } 
                subject.update_board(player.position,player.chip)
                subject.update_board(player.position,player.chip)
                expect(board[6][0]).to eql("[blue]")
                expect(board[5][0]).to eql("[blue]")
            end

            it "returns an error message if a spot isn't available" do 
                player = double("player")
                display = double("display", :error => "Not a valid position enter a number between 0-7")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 99 } 
                subject.update_board(player.position,player.chip)
                expect(:board).to receive(:error)
            end
        end
    end
end
end