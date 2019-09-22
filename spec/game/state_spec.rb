require 'game/state'

RSpec.describe Game::State do
  subject { described_class.with(state: state) }

  let(:state) { 'NOT_RUNNING' }

  describe "#states" do
    it "returns a list of states" do
      expect(subject.states.include?("NOT_RUNNING")).to be true
      expect(subject.states.include?("RUNNING")).to be true
    end
  end

  describe "#toggle_running" do
    it "toggles state" do
      expect(subject.running?).to be false
      expect(subject.not_running?).to be true

      result_1 = subject.toggle_running

      expect(result_1.running?).to be true
      expect(result_1.not_running?).to be false

      result_2 = result_1.toggle_running

      expect(result_2.running?).to be false
      expect(result_2.not_running?).to be true
    end
  end

  describe "#running?" do
    context "if not running" do
      it { expect(subject.running?).to be false }
    end
    context "if running" do
      let(:state) { "RUNNING" }
      it { expect(subject.running?).to be true }
    end
  end

  describe "#running?" do
    context "if not running" do
      it { expect(subject.not_running?).to be true }
    end
    context "if running" do
      let(:state) { "RUNNING" }
      it { expect(subject.not_running?).to be false }
    end
  end
end
