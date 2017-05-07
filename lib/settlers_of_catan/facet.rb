class SettlersOfCatan::Facet
    attr_accessor :occupier
    def initialize(number)
        @number = number
        @color = :default
    end
    
    def show
        if @occupier
            display = Color.colorize_by_color(@occupier.show,occupier_color)
            return display

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
                @occupier = o
                o.facet = self
                did_set = true
            else
                puts ""
                did_set = false
            end
            return did_set
        end

    end
    def removeOccupier
        @occupier.facet = nil
        @occupier = nil
    end
end