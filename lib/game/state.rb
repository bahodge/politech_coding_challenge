require 'values'

module Game
  class State < Value.new(:state)
    
    def states
      ['NOT_RUNNING', 'RUNNING']
    end

    def running?
      self.state == "RUNNING"
    end

    def not_running?
      self.state == "NOT_RUNNING"
    end
    
  end
end