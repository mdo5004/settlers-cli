class SettlersOfCatan::Settlement
    attr_accessor :player, :color, :facet
    def initialize(player,color)
        @player = player
        @color = color
    end
    
end