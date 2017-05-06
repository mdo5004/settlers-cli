class SettlersOfCatan::Tile
   attr_reader :number, :resource
    
    def initialize(number,resource)
        @number = number
        @resource = resource
    end
end