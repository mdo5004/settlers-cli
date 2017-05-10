class SettlersOfCatan::Edge < SettlersOfCatan::Space
    attr_accessor :number, :direction
    def initialize(number, direction)
        @number = number
        @direction = direction
        @color = :default
    end

    def show(mode="symbol")
        if mode=="symbol"
            case @direction
            when "fwd"
                display = "/"
            when "back"
                display = "\\"
            when "horiz"
                display = "_____"
            end
            
        elsif mode=="number"
            case @direction
            when "fwd"
                display = @number <= 10 ? "#{@number + 1} " : "#{@number + 1}"
            when "back"
                display = @number <= 10 ? "#{@number + 1} " : "#{@number + 1}"
            when "horiz"
                display = @number <= 10 ? "_#{@number + 1}___" : "#{@number + 1}___" 
            end
        end
        
        display = Color.colorize_by_color(display,occupier_color)
        return display
    end

end