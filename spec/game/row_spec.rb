require 'game/row' 
require 'game/cell' 

RSpec.describe Game::Row do

  subject { described_class.new(y: y) }

  let(:y) { 0 }


  describe "#to_line" do
    let(:cell_1) { Game::Cell.with(x: 0, y: subject.y, value: 'X') }
    let(:cell_2) { Game::Cell.with(x: 1, y: subject.y, value: 'O') }
    let(:cell_3) { Game::Cell.with(x: 2, y: subject.y, value: 'X') }
    let(:cells) { [cell_1, cell_2, cell_3] }
    before(:each) {subject.cells = cells}
    it "returns a formatted line of cell values" do
      result = subject.to_line
      expected_result = " #{cell_1.value} | #{cell_2.value} | #{cell_3.value} "
      expect(result).to eq(expected_result)
    end
  end


  describe "#build_cells" do
    it "builds a sequential array of cells with the rows y coordinate" do
      result = subject.build_cells

      expect(result.length).to eq(3)
      expect(result.first.y).to eq(subject.y)
      expect(result[1].y).to eq(subject.y)
      expect(result.last.y).to eq(subject.y)
    end
  end

  describe "#find_cell_by_x" do
    context "if cells contain the cell with matching coords" do
      let(:searched_x) { 1 }
      it "returns the cell" do
        result = subject.find_cell_by_x(x: searched_x)
        
        expect(result).to_not be_nil
        
        expect(result.x).to eq(searched_x)
      end
      context "if no matches are found" do
        let(:searched_x) { 5 }
        it "returns nil" do
          result = subject.find_cell_by_x(x: searched_x)

          expect(result).to be_nil
        end
      end
    end
  end

end