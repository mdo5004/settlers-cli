class SettlersOfCatan::Facet
    attr_accessor :occupier
    def initialize(number)
        @number = number
        @color = :default
    end

    def show
        if @occupier
            display_value = @occupier.show
            occupier_color = @occupier.color
            display = Color.colorize_by_color(display_value,occupier_color)
        else
            display_value = @number.to_s
            display = display_value
        end
        if display_value.length == 1 
            if @number % 2 == 0 && @number < 10
                display = "#{display} "
            else 
                display = "#{display}_"
            end
        else
            display = "#{display}"
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