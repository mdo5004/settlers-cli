class SettlersOfCatan::GamePiece
    attr_accessor :player, :color, :location
    
    def initialize(player,color)
        @player = player
        @color = color
    end
    def is_on_the_board
        if @location == nil
            on_the_board = false
        else
            on_the_board = true
        end
        return on_the_board
    end
end