require 'game/board'

RSpec.describe Game::Board do
  subject { described_class.new }

  describe "#coords_from_input" do
    context "when given valid input" do
      let(:valid_input_1) { "A1" }
      let(:valid_input_2) { "B1" }
      let(:valid_input_3) { "C1" }

      let(:expected_result_1) { [0, 0] }
      let(:expected_result_2) { [1, 0] }
      let(:expected_result_3) { [2, 0] }

      it "returns coordinates tuple" do
        result_1 = subject.coords_from_input(input: valid_input_1)
        result_2 = subject.coords_from_input(input: valid_input_2)
        result_3 = subject.coords_from_input(input: valid_input_3)

        expect(result_1).to eq(expected_result_1)
        expect(result_2).to eq(expected_result_2)
        expect(result_3).to eq(expected_result_3)
      end
    end
  end

  describe "#valid_coords?" do
    context "when passed valid coordinates" do
      let(:valid_coords_1) { [0, 0] }
      let(:valid_coords_2) { [1, 1] }
      let(:valid_coords_3) { [2, 2] }
      it "returns true" do
        expect(subject.valid_coords?(coords: valid_coords_1)).to be true
        expect(subject.valid_coords?(coords: valid_coords_2)).to be true
        expect(subject.valid_coords?(coords: valid_coords_3)).to be true
      end
    end
    context "when passed valid coordinates" do
      let(:invalid_coords_1) { [0, 0, 0] }
      let(:invalid_coords_2) { [3, 1] }
      let(:invalid_coords_3) { [2, -1] }
      it "returns false" do
        expect(subject.valid_coords?(coords: invalid_coords_1)).to be false
        expect(subject.valid_coords?(coords: invalid_coords_2)).to be false
        expect(subject.valid_coords?(coords: invalid_coords_3)).to be false
      end
    end
  end

  describe "#find_cell_from_input" do
    context "with valid input" do
      let(:valid_input_1) { "A1" }
      let(:valid_input_2) { "B2" }
      let(:valid_input_3) { "C3" }
      let(:valid_input_4) { 'a     2 ' }
      it "finds the cell" do
        expect(subject.rows).to_not eq([])

        expect(subject.find_cell_from_input(input: valid_input_1)).to_not be_nil
        expect(subject.find_cell_from_input(input: valid_input_2)).to_not be_nil
        expect(subject.find_cell_from_input(input: valid_input_3)).to_not be_nil
        expect(subject.find_cell_from_input(input: valid_input_4)).to_not be_nil
      end
    end
    context "with invalid input" do
      let(:invalid_input_1) { "A0" }
      let(:invalid_input_2) { "2B" }
      let(:invalid_input_3) { "" }
      it "returns nil" do
        expect(subject.rows).to_not eq([])
        expect(subject.find_cell_from_input(input: invalid_input_1)).to be_nil
        expect(subject.find_cell_from_input(input: invalid_input_2)).to be_nil
        expect(subject.find_cell_from_input(input: invalid_input_3)).to be_nil
      end
    end
  end

  describe "#set_cell_value" do
    context "if it sets the value" do
      let(:valid_input) { 'A3' }
      let(:valid_value) { 'X' }
      it "updates the cell for a row" do
        cell = subject.find_cell_from_input(input: valid_input)
        
        expect(cell).to_not be_nil
        expect(cell.value).to_not eq(valid_value)

        subject.set_cell_value(input: valid_input, value: valid_value)

        new_cell = subject.find_cell_from_input(input: valid_input)
        expect(new_cell.value).to_not eq(cell.value)
        expect(new_cell.x).to eq(cell.x)
        expect(new_cell.y).to eq(cell.y)
        expect(new_cell.row).to eq(cell.row)
        expect(new_cell.row.cells.length).to eq(3)
      end
    end
    context "if it doesnt set the value" do
      let(:invalid_input) { '' }
      let(:valid_value) { 'X' }
      it "raises an exception" do
        expect{subject.set_cell_value(input: invalid_input, value: valid_value)}.to raise_error(ArgumentError, "Could not update cell: #{invalid_input}")
      end
    end
  end
end
