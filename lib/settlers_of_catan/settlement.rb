class SettlersOfCatan::Settlement
    attr_accessor :player, :color, :facet
    def initialize(player,color)
        @player = player
        @color = color
        @facet = nil
    end

    def show
        return "$"
    end
    def is_on_the_board
        if @facet == nil
            on_the_board = false
        else
            on_the_board = true
        end
        return on_the_board
    end

end