require 'values'

require_relative 'winner_helper'
require_relative 'board'
require_relative 'row'

module Game
  class Computer < Value.new(:board, :symbol)

    def make_move!
        if resolve_best_move == nil || resolve_best_move.empty?
          raise ArgumentError, "Cannot Move" 
        end
        input = resolve_best_move[:cell].coords_to_input

        self.board.set_cell_value(input: input, value: symbol)
    end

    private

    def resolve_best_move
      return pick_random_move(move_set: categorize_moves[:best_moves]) unless categorize_moves[:best_moves].empty?
      return pick_random_move(move_set: categorize_moves[:good_moves]) unless categorize_moves[:good_moves].empty?
      return pick_random_move(move_set: categorize_moves[:bad_moves]) unless categorize_moves[:bad_moves].empty?

      {}
    end

    def pick_random_move(move_set:) 
      result = rand(0..move_set.length).floor
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
      
      if result
        winning_symbol = result.first.value
        if winning_symbol == self.symbol 
          return {cell: cell, grade: 1}
        else
          return {cell: cell, grade: -1}
        end
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