require "rubygems"

require_relative 'game/state'
require_relative 'game/turn'
require_relative 'game/board'
require_relative 'game/winner_helper'
require_relative 'game/computer'

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

    def play_turn
      puts "It is #{turn.current_turn}'s Turn"
      self.board.draw_board
      if player == turn.current_turn
        puts "Please Select an open cell: "
        input = gets
        set_cell_value(input: input)
      else
        handle_computer_move
      end
      handle_winner!
      self.turn = turn.next_turn
      play_turn
      
    end

    def handle_computer_move
      Game::Computer.with(board: self.board, symbol: self.computer).make_move!
    end

    def handle_winner!
      cells = check_for_winner!
      return unless cells

      self.board.draw_board

      puts "+=========================================+"
      puts "| The Winner is: #{cells.shift.value}     |"
      puts "| Would you like to play again? [ Y | N ] |"
      puts "+=========================================+"
      input = gets
      if input[0].upcase == "Y"
        new_game
      else
        exit 0
      end

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
      rescue ArgumentError => e
        puts e
        puts "Please Try Again"
        play_turn
      end
    end

    def sanitize_move_input(input:)
      split_string = input.to_s.gsub(' ', '').split("")
      fixed_string = "#{split_string[0]}#{split_string[1]}".upcase
      return -1 unless fixed_string.length == 2
      
      fixed_string
    end

    private

    def set_computer_player
      self.computer = self.player == 'X' ? 'O' : 'X'
      puts "Computer is: #{computer}"
    end

    def initial_game_board
      @board = Game::Board.new
    end

    def initial_turn
      Game::Turn.with(player: "X")
    end

    def initial_game_state
      Game::State.with(state: "NOT_RUNNING")
    end
  end
end
