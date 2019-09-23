require 'values'

module Game
  class Turn < Value.new(:player)
    def players
      ['X', 'O']
    end

    def current_turn
      player
    end

    def next_turn
      x_turn? ? Game::Turn.with(player: 'O') : Game::Turn.with(player: 'X')
    end

    def x_turn?
      self.player == 'X'
    end

    def o_turn?
      self.player == 'O'
    end
  end
end
