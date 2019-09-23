require "rubygems"

require_relative 'game/state'
require_relative 'game/turn'
require_relative 'game/board'
require_relative 'game/winner_helper'

module TicTackToe
  class Main
    attr_accessor :board, :player, :computer, :turn, :state

    def initialize(player: 'X', computer: 'O')
      @player = player
      @computer = computer
      @state = initial_game_state
      @turn = initial_turn
    end

    def new_game
      get_player_symbol_choice
      set_computer_player
      initial_game_board
    end

    def play_game
    end

    def handle_winner(winning_cells:)
      # find each cell and cross it out
      puts "The Winner is: #{winning_cells.shift.value}"
    end

    def check_for_winner!
      helper = Game::WinnerHelper.with(board: self.board)
      helper.check!
    end

    def get_player_symbol_choice
      puts "Please Select your symbol: [X | O]: "
      symbol = gets
      symbol.strip!.upcase!
      if ['X', 'O'].include?(symbol)
        self.player = symbol
      else
        get_player_symbol_choice
      end
    end

    def set_cell_value(input:)
      sanitized_input = sanitize_move_input(input: input)
      begin
        board.set_cell_value(input: sanitized_input, value: turn.player)
        next_turn
      rescue ArgumentError => e
        puts e
        puts "Please Try Again"
      end
    end

    def sanitize_move_input(input:)
      str = input.to_s.upcase.gsub(' ', '')
      return -1 if str.length != 2

      str
    end

    private

    def set_computer_player
      self.computer = self.player == 'X' ? 'O' : 'X'
      # puts "Computer is: #{computer}"
    end

    def next_turn
      # check if someone won
      # if no one won
      # change the turn to the next person
      # if someone won
      # do winning things
    end

    def initial_game_board
      @board = Game::Board.new
      @board.draw_board
    end

    def initial_turn
      Game::Turn.with(player: "X")
    end

    def initial_game_state
      Game::State.with(state: "NOT_RUNNING")
    end
  end
end
