require 'main'

RSpec.describe TicTackToe::Main do

  subject { described_class.new }

  describe "#sanitize_move_input" do
    context "when given fixable input" do
      let(:invalid_input) { ' a 3'}
      it "fixes the input" do
        result = subject.sanitize_move_input(input: invalid_input)
        expected_result = "A3"

        expect(result).to_not eq(-1)
        expect(result).to eq(expected_result)
      end
    end
    context "when given unfixable input" do
      let(:invalid_input) { ' a ba 3'}
      it "fixes the input" do
        expected_result = -1
        expect(invalid_input.gsub(' ','').length).to_not eq(2)

        result = subject.sanitize_move_input(input: invalid_input)

        expect(result).to eq(expected_result)
      end
    end
  
  end

  


  # describe "#new_game" do
  #   it "initializes a new game state" do
      
  #   end
  # end

end