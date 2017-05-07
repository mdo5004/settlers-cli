class SettlersOfCatan::Player
    attr_accessor :category, :color, :board
    def initialize(category,color)
        @category = category
        @color = color
        
        @settlements = [SettlersOfCatan::Settlement.new(self,@color)] * 4
    end

    def place_settlement(facet_number)
        
    end

end