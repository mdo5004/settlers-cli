class SettlersOfCatan::Player
    attr_accessor :category, :color, :board, :victory_points
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
        
        @victory_points = 0
    end

    def place_settlement(facet_number)
        puts "Placed settlement on facet "
        settlement = @settlements.find {|s| !s.is_on_the_board}
        facet = @board.select_facet_by_number(facet_number)
        s = nil
        if settlement && facet.isFree?
            if facet.setOccupier(settlement)
                s = settlement
            end
        else
            puts "Can't place settlement"
        end
        return s
    end
    def place_road(edge_number)
        road = @roads.find {|s| !s.is_on_the_board}
        edge = SettlersOfCatan::Edge.all[edge_number-1]
        if road && edge.isFree?
            edge.setOccupier(road)
        else
            puts "Can't place roads" 
        end
    end
    def place_city(facet_number)
    end
    def move_robber(to_location)
    end        
end