class SettlersOfCatan::Player
    attr_accessor :category, :color
    def initialize(category,color)
        @category = category
        @color = color
    end
end