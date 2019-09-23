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

end
