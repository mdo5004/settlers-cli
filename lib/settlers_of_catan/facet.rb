class SettlersOfCatan::Facet
    attr_accessor :occupier
    def initialize(number)
        @number = number
        @color = :default

        @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m", :default => "\e[39m"}
    end
    def color_code(color)
        return @@colors[color.to_sym]
    end
    def default_color_code
        return @@colors[:default]
    end
    def show
        if @occupier
            occupier_color = @occupier.color
            occupier_color_code = color_code(occupier_color)
            display_value = @occupier.show
            display = occupier_color_code + display_value + default_color_code
        else
            display_value = @number.to_s
            display = display_value
        end
        if display_value.length == 1 
            if @number % 2 == 1 && @number < 10
                display = "#{display}_"
            else 
                display = "#{display} "
            end
        else
            display = "#{display}"
        end
        return display
    end
    
    def setOccupier(o)
        if @occupier
            removeOccupier
        end
        @occupier = o
        o.facet = self
    end
    def removeOccupier
        @occupier.facet = nil
        @occupier = nil
    end
end