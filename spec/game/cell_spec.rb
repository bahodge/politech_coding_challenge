require 'game/cell'

RSpec.describe Game::Cell do

  subject { described_class.with(x: x, y: y, value: value) }

  let(:x) { 0 }
  let(:y) { 0 }
  let(:value) { '' }
  
  describe "#coords_to_input" do
    context "if x is 0" do
      it{expect(subject.x).to eq(0)}
      it{expect(subject.coords_to_input).to eq("A#{y}")}
    end
    context "if x is 1" do
      let(:x) { 1 }
      it{expect(subject.x).to eq(1)}
      it{expect(subject.coords_to_input).to eq("B#{y}")}
    end
    context "if x is 2" do
      let(:x) { 2 }
      it{expect(subject.x).to eq(2)}
      it{expect(subject.coords_to_input).to eq("C#{y}")}
    end
  end
end