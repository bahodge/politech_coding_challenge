require 'game/computer'
require 'game/board'

RSpec.describe Game::Computer do
  
  subject {Game::Computer.with(board: board, symbol: symbol)}

  let(:symbol) { 'O' }
  let(:board) { Game::Board.new }

  describe "#make_move!" do
    # context "if there is an open spot" do
    #   context "if the computer can win" do
    #     let(:value) { 'O' }
    #     before(:each) do
    #       board.set_cell_value(input: 'A1', value: value)
    #       board.set_cell_value(input: 'A2', value: value)
    #     end
    #     it "puts the next move in that slot" do
    #       expect(subject.board.rows.first.cells.first.value).to eq(value)
    #       expect(subject.board.rows.first.cells[0].value).to eq(value)
    #       expect(subject.board.rows.first.cells.last.value).to eq(' ')
    #       result = subject.make_move!
    #       expect(subject.board.rows.first).to eq(result)
    #     end
    #   end
    # end
    context "if there is no open spot" do
      let(:value) { 'X' }
      before(:each) do
        subject.board.set_cell_value(input: 'A1', value: value)
        subject.board.set_cell_value(input: 'A2', value: value)
        subject.board.set_cell_value(input: 'A3', value: value)
        subject.board.set_cell_value(input: 'B1', value: value)
        subject.board.set_cell_value(input: 'B2', value: value)
        subject.board.set_cell_value(input: 'B3', value: value)
        subject.board.set_cell_value(input: 'C1', value: value)
        subject.board.set_cell_value(input: 'C2', value: value)
        subject.board.set_cell_value(input: 'C3', value: value)
      end
      it "raises an error" do
        expect{subject.make_move!}.to raise_error(ArgumentError, "Computer Player Cannot Move")
      end
    end
  end

end