require "rubygems"

require_relative 'game/state'

module TicTackToe
  class Main
    attr_reader :player_name, :player

    def initialize(player_name: 'N/A', player: 'X')
      @player_name = player_name
      @player = player
    end

    def new_game
      initialize_game_state
      initialize_game_board
    end
    
  

    private

    def initialize_game_board

    end

    def initialize_game_state
      Game::State.with(state: "RUNNING")
    end


  end

end