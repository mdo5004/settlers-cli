class SettlersOfCatan::Player
    attr_accessor :category, :color, :board
    attr_reader :settlements, :cities, :roads
    def initialize(category,color)
        @category = category
        @color = color

        @settlements = []
        4.times do 
            @settlements << SettlersOfCatan::Settlement.new(self,@color)
        end
        @cities = []
        4.times do 
            @cities << SettlersOfCatan::City.new(self,@color)
        end
        @roads = []
        15.times do 
            @roads << SettlersOfCatan::Road.new(self,@color)
        end

    end

    def place_settlement(facet_number)
        settlement = @settlements.find {|s| !s.is_on_the_board}
        
        if settlement
            did_place_settlement = @board.facet[facet_number-1].setOccupier(settlement)
        else
            puts "You don't have any more settlements"
            did_place_settlement = false
        end
        return did_place_settlement
    end
    def place_road(edge_number)
    end
    def place_city(facet_number)
    end
    def move_robber(to_location)
    end        
end