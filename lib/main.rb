require "rubygems"

require_relative 'game/state'
require_relative 'game/board'

module TicTackToe
  class Main
    attr_reader :player_name, :player

    attr_accessor :board

    def initialize(player_name: 'N/A', player: 'X')
      @player_name = player_name
      @player = player
    end

    def new_game
      initialize_game_state
      initialize_game_board
    end

    def sanitize_move_input(input: )
      str = input.to_s.upcase.gsub(' ', '')
      return -1 if str.length != 2
      str
    end  

    private


    def initialize_game_board
      @board = Game::Board.new
      @board.draw_board
    end

    def initialize_game_state
      Game::State.with(state: "RUNNING")
    end
  end

end