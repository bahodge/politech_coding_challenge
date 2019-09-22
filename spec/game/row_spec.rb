require 'game/row' 

RSpec.describe Game::Row do

  subject { described_class.new(y: y) }

  let(:y) { 0 }

  describe "#build_cells" do
    it "builds a sequential array of cells with the rows y coordinate" do
      result = subject.build_cells

      expect(result.length).to eq(3)
      expect(result.first.y).to eq(subject.y)
      expect(result[1].y).to eq(subject.y)
      expect(result.last.y).to eq(subject.y)
    end
  end

  describe "#find_cell_by_coords" do
    let(:searched_coords) { [searched_x, searched_y] }
    context "if y matches row y" do
      let(:searched_y) { 0 }
      it{expect(subject.y).to eq(searched_y)}

      context "if cells contain the cell with matching coords" do
        let(:searched_x) { 1 }
        it "returns the cell" do
          result = subject.find_cell_by_coords(coords: searched_coords)
          
          expect(result).to_not be_nil
          
          expect(result.x).to eq(searched_x)
          expect(result.y).to eq(searched_y)
        end
      end
      context "if no matches are found" do
        let(:searched_x) { 5 }
        it "returns nil" do
          result = subject.find_cell_by_coords(coords: searched_coords)

          expect(result).to be_nil
        end
      end
    end

    context "if y is not the same as row y" do
      let(:searched_y) { 2 }
      let(:searched_x) { 1 }
      it "returns nil" do
        expect(subject.y).to_not eq(searched_y)
        
        result = subject.find_cell_by_coords(coords: searched_coords)

        expect(result).to be_nil
      end
    end

  end

  

end