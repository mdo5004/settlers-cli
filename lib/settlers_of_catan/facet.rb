class SettlersOfCatan::Facet
    attr_accessor :occupier, :neighbors, :facing
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
                display_value = facing=="right" ? "__" : "  "
            end
            display = display_value
        end

        if display_value.length == 1
            display = (facing=="right") ? "#{display}_" : display
        end
        return display
    end
    def occupier_color
        if @occupier
            c = Color.color_of(@occupier) 
        else
            c = Color.default_color
        end
        return c
    end
    def setOccupier(o)
        if @occupier
            if @occupier.player == o.player && @occupier.class == "Settlement"
                removeOccupier
            else
                puts "Space occupied by another player"
                return false
            end
        end
        @occupier = o
        o.location = self
        return true
    end
    def removeOccupier
        @occupier.location = nil
        @occupier = nil
    end
end