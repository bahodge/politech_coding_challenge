require 'game/turn'

RSpec.describe Game::Turn do
  subject { described_class.with(player: player) }

  let(:player) { 'X' }

  describe "#players" do
    it "returns a list of players" do
      expect(subject.players.include?("X")).to be true
      expect(subject.players.include?("O")).to be true
    end
  end

  describe "#next_turn" do
    it "toggles player" do
      expect(subject.x_turn?).to be true
      expect(subject.o_turn?).to be false

      result_1 = subject.next_turn

      expect(result_1.x_turn?).to be false
      expect(result_1.o_turn?).to be true

      result_2 = result_1.next_turn

      expect(result_2.x_turn?).to be true
      expect(result_2.o_turn?).to be false
    end
  end

  describe "#x_turn?" do
    context "if x" do
      it { expect(subject.x_turn?).to be true }
    end
    context "if x" do
      let(:player) { "O" }
      it { expect(subject.x_turn?).to be false }
    end
  end

  describe "#o_turn?" do
    context "if not o" do
      it { expect(subject.o_turn?).to be false }
    end
    context "if o" do
      let(:player) { "O" }
      it { expect(subject.o_turn?).to be true }
    end
  end
end
