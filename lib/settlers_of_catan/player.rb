class SettlersOfCatan::Player
    attr_accessor :category, :color, :board
    def initialize(category,color)
        @category = category
        @color = color
        
        @settlements = [SettlersOfCatan::Settlement.new(self,@color)] * 4
        @cities = [SettlersOfCatan::City.new(self,@color)] * 4
        @roads = [SettlersOfCatan::Road.new(self,@color)] * 15
        
    end

    def place_settlement(facet_number)
        
    end

end