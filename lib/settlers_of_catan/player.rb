class SettlersOfCatan::Player
    attr_accessor :category, :color
    def initialize(category,color)
        @category = category
        @color = color
    end

    def place_first_pieces
        puts "#{@color} player placing first piece"
    end

end