require 'game/winner_helper'
require 'game/board'
require 'game/row'
require 'game/cell'

RSpec.describe Game::WinnerHelper do
  subject { described_class.with(board: board) }

  let(:board) { Game::Board.new }
  let(:row) { Game::Row.new }

  describe "#check!" do
    context "if a winning row is found" do
      let(:cell_1) { Game::Cell.with(row: row, x: 0, y: 0, value: value) }
      let(:cell_2) { Game::Cell.with(row: row, x: 1, y: 0, value: value) }
      let(:cell_3) { Game::Cell.with(row: row, x: 2, y: 0, value: value) }
      let(:value) { 'X' }

      before(:each) do
        row.cells[0] = cell_1
        row.cells[1] = cell_2
        row.cells[2] = cell_3
        board.rows[0] = row
      end

      it "returns the cell set" do
        expect(subject.board.rows.first).to eq(row)
        expect(row.cells).to eq([cell_1, cell_2, cell_3])
        expect(cell_1.value).to eq(value)
        expect(cell_2.value).to eq(value)
        expect(cell_3.value).to eq(value)

        expect(subject.check!).to_not be_nil

        expect(subject.check!).to eq([cell_1, cell_2, cell_3])
      end
    end
    context "if no winning cell set is found" do
      it "returns nil" do
        expect(subject.check!).to be_nil
      end
    end
  end

  describe "#filter_cell_values" do
    let(:cell_set) { [cell_1, cell_2, cell_3] }

    let(:cell_1) { Game::Cell.with(row: row, x: 0, y: 0, value: value_1) }
    let(:cell_2) { Game::Cell.with(row: row, x: 1, y: 0, value: value_2) }
    let(:cell_3) { Game::Cell.with(row: row, x: 2, y: 0, value: value_3) }
    let(:value_1) { 'X' }
    let(:value_2) { ' ' }
    let(:value_3) { 'O' }

    it "returns an array of valid values" do
      expect(subject.filter_cell_values(cell_set: [cell_1, cell_2, cell_3])).to eq([value_1, value_3])
    end
  end

  describe "#all_match?" do
    context 'if values are valid' do
      let(:values) { ['X', 'O', 'X'] }
      context 'if all values match' do
        let(:values_1) { ['X', 'X', 'X'] }
        let(:values_2) { ['O', 'O', 'O'] }
        it { expect(subject.all_match?(values: values_1)).to be true }
        it { expect(subject.all_match?(values: values_2)).to be true }
      end
      context "if not all values match" do
        it { expect(subject.all_match?(values: values)).to be false }
      end
    end
    context 'if not enough values' do
      let(:values) { ['X', 'X'] }
      it { expect(subject.all_match?(values: values)).to be false }
    end
  end
end
