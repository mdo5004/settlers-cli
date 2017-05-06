class SettlersOfCatan::Edge
    attr_accessor :number, :direction, :occupier

    # colors from http://misc.flogisoft.com/bash/tip_colors_and_formatting
    def initialize(number, direction)
        @number = number
        @direction = direction
        @color = :default

        @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m", :default => "\e[39m"}
    end

    def show
        case @direction
        when "fwd"
            display = "/"
        when "back"
            display = "\\"
        when "horiz"
            display = "_____"
        end
        return "#{occupier_color}#{display}#{@@colors[:default]}"
    end

    def occupier_color
        if @occupier
            c = @@colors[@occupier.color] 
        else
            c = @@colors[:default]
        end
        return c
    end
end