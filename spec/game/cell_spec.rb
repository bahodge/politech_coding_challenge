require 'game/cell'
require 'game/row'

RSpec.describe Game::Cell do
  subject { described_class.with(row: row, x: x, y: y, value: value) }

  let(:row) { Game::Row.new }
  let(:x) { 0 }
  let(:y) { 0 }
  let(:value) { '' }

  describe "#coords_to_input" do
    context "if x is 0" do
      it { expect(subject.x).to eq(0) }
      it { expect(subject.coords_to_input).to eq("A#{y + 1}") }
    end
    context "if x is 1" do
      let(:x) { 1 }
      it { expect(subject.x).to eq(1) }
      it { expect(subject.coords_to_input).to eq("B#{y + 1}") }
    end
    context "if x is 2" do
      let(:x) { 2 }
      it { expect(subject.x).to eq(2) }
      it { expect(subject.coords_to_input).to eq("C#{y + 1}") }
    end
  end

  describe "#set_value" do
    let(:new_value) { 'X' }
    it "returns a cell with a new value" do
      new_cell = subject.set_value(new_value: new_value)
      expect(subject.x).to eq(new_cell.x)
      expect(subject.y).to eq(new_cell.y)
      expect(subject.row).to eq(new_cell.row)
      expect(subject.value).to_not eq(new_cell.value)
      expect(new_cell.value).to eq(new_value)
    end
  end
end
