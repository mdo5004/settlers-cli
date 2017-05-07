class SettlersOfCatan::Edge
    attr_accessor :number, :direction, :occupier

    # colors from http://misc.flogisoft.com/bash/tip_colors_and_formatting
    def initialize(number, direction)
        @number = number
        @direction = direction
        @color = :default

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
        display = Color.colorize_by_color(display,occupier_color)
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
end