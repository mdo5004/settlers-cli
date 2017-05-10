class SettlersOfCatan::Facet < SettlersOfCatan::Space
    attr_accessor :neighbors, :facing
    @@all = []
    def initialize(number)
        @number = number
        @color = :default
        @neighbors = neighbors
        @@all << self
    end
    def self.all
        @@all
    end
    def show(mode="number")
        if @occupier
            display_value = @occupier.show
            occupier_color = @occupier.color
            display = Color.colorize_by_color(display_value,occupier_color)
        else
            display_value = @number.to_s
            if mode=="symbol"
                display_value = (facing=="right" && !([18,30,42].include? @number)) ? "__" : "  "
                
            end
            display = display_value
        end

        if display_value.length == 1
            display = (facing=="right") ? "#{display}_" : display
        end
        return display
    end
    
    
end