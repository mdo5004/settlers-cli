class SettlersOfCatan::Road
    attr_accessor :edge, :player, :color
    def initialize(player,color)
        @player = player
        @color = color
    end
end