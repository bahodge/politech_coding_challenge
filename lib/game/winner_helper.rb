require 'values'

module Game
  class WinnerHelper < Value.new(:board)

    def check!
      # p "column_cells_a: #{column_cells_a.collect{|c| [c.x, c.y]}}"
      # p "column_cells_b: #{column_cells_b.collect{|c| [c.x, c.y]}}"
      # p "column_cells_c: #{column_cells_c.collect{|c| [c.x, c.y]}}"
      # p "row_1_cells: #{row_1_cells.collect{|c| [c.x, c.y]}}"
      # p "row_2_cells: #{row_2_cells.collect{|c| [c.x, c.y]}}"
      # p "row_3_cells: #{row_3_cells.collect{|c| [c.x, c.y]}}"
      p "diagonal_1_cells: #{diagonal_1_cells.collect{|c| [c.x, c.y]}}"
      p "diagonal_2_cells: #{diagonal_2_cells.collect{|c| [c.x, c.y]}}"
    end

    def check_cell_set(cell_set: )
      
    end

    def all_match?

    end

    private

    def all_cells
      self.board.rows.collect(&:cells).flatten
    end

    def column_cells_a
      all_cells.select {|cell| cell.x == 0 }
    end

    def column_cells_b
      all_cells.select {|cell| cell.x == 1 }
    end

    def column_cells_c
      all_cells.select {|cell| cell.x == 2 }
    end

    def row_1_cells
      self.board.rows.first.cells
    end

    def row_2_cells
      self.board.rows[1].cells
    end

    def row_3_cells
      self.board.rows.last.cells
    end

    def diagonal_1_cells
      cells = []
      cells << board.find_cell_from_input(input: 'A1')
      cells << board.find_cell_from_input(input: 'B2')
      cells << board.find_cell_from_input(input: 'C3')
      cells
    end

    def diagonal_2_cells
      cells = []
      cells << board.find_cell_from_input(input: 'C1')
      cells << board.find_cell_from_input(input: 'B2')
      cells << board.find_cell_from_input(input: 'A3')
      cells
    end
  end
end