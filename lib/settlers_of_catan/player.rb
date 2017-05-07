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
        settlement = @settlements.find {|s| !s.is_on_the_board}
        if settlement
            @board.facet[facet_number-1].setOccupier(settlement)
        else
            puts "Cannot place settlement"
        end
    end
    def place_road(edge_number)
    end
    def place_city(facet_number)
    end
    def move_robber(to_location)
    end        
end