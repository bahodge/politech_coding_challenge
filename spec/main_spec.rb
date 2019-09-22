require 'main'

RSpec.describe TicTackToe::Main do
  subject { described_class.new }

  describe "#sanitize_move_input" do
    context "when given fixable input" do
      let(:invalid_input) { ' a 3' }
      it "fixes the input" do
        result = subject.sanitize_move_input(input: invalid_input)
        expected_result = "A3"

        expect(result).to_not eq(-1)
        expect(result).to eq(expected_result)
      end
    end
    context "when given unfixable input" do
      let(:invalid_input) { ' a ba 3' }
      it "fixes the input" do
        expected_result = -1
        expect(invalid_input.gsub(' ', '').length).to_not eq(2)

        result = subject.sanitize_move_input(input: invalid_input)

        expect(result).to eq(expected_result)
      end
    end
  end

  describe "#get_player_symbol_choice" do
    context "if player selects valid choice" do
      let(:choice) { "X" }
      it "sets the player" do
        # allow(subject).to receive(:gets).and_return(choice)

        # subject.get_player_symbol_choice

        # expect(subject.player).to eq(choice)
      end
    end
  end

  describe "#set_computer_player" do
    subject { described_class.new(player: player) }
    context "if player is x" do
      let(:player) { 'X' }
      it "sets computer to O" do
        subject.set_computer_player
        expect(subject.computer).to eq('O')
      end
    end
    context "if player is o" do
      let(:player) { 'O' }
      it "sets computer to x" do
        subject.set_computer_player
        expect(subject.computer).to eq('X')
      end
    end
  end
end
