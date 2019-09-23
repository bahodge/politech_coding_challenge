require 'values'

require_relative 'winner_helper'
require_relative 'board'
require_relative 'row'

module Game
  class Computer < Value.new(:board, :symbol)

    def make_move!
      if resolve_best_move.nil? || resolve_best_move.empty?
        raise ArgumentError, "Computer Player Cannot Move" 
      end
      input = resolve_best_move[:cell].coords_to_input

      self.board.set_cell_value(input: input, value: symbol)
    end

    private

    def resolve_best_move
      if categorize_moves[:best_moves] != []
        p categorize_moves[:best_moves].first
        categorize_moves[:best_moves].first
      elsif categorize_moves[:good_moves] != []
        pick_random_move(move_set: categorize_moves[:good_moves])
      elsif categorize_moves[:bad_moves] != []
        pick_random_move(move_set: categorize_moves[:bad_moves])
      else
        {}
      end
    end

    def pick_random_move(move_set:)
      max = move_set.length > 0 ? move_set.length - 1 : 0
      result = rand(0..max).floor
      move_set[result]
    end

    def categorize_moves
      moves = { best_moves: [], good_moves: [], bad_moves: []}
      grade_moves.each do |move|
        if move[:grade] == 1  
          moves[:best_moves] << move
        elsif move[:grade] == 0
          moves[:good_moves] << move
        else
          moves[:bad_moves] << move
        end
      end
      moves
    end

    def copy_board_rows
      rows = []
      self.board.rows.each do |row|
        new_row = Game::Row.new(y: row.y)
        row.cells.each do |cell|
          next if cell.value == ' '
          new_row.set_cell_value(cell: cell, value: cell.value)
        end
        rows << new_row
      end
      rows
    end

    def grade_moves
      grades = []
      get_possible_cells.each do |cell|
        test_board = Game::Board.new(rows: copy_board_rows)
        input = cell.coords_to_input
        test_board.set_cell_value(input: input, value: symbol)
        grades << grade_move(test_board: test_board, cell: cell)
      end
      grades
    end

    def grade_move(test_board:, cell: )
      helper = Game::WinnerHelper.with(board: test_board)
      result = helper.check!
      
      if result && result.first.value == self.symbol
        {cell: cell, grade: 1}
      elsif result && result.first.value != self.symbol
        {cell: cell, grade: -1}
      else
        {cell: cell, grade: 0}
      end
    end


    def get_possible_cells
      all_cells.collect {|cell| cell if cell.value == ' ' }.compact
    end

    def all_cells
      cells = []
        self.board.rows.each do |row|
          cells << row.cells
        end
      cells.flatten
    end

  end
end