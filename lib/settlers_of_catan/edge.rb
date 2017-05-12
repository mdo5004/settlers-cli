class SettlersOfCatan::Edge < SettlersOfCatan::Space
    attr_accessor :number, :direction
    @@all = []
    def initialize(number, direction)
        @number = number
        @direction = direction
        @color = :default
        @@all << self
    end
    def self.all
        @@all
    end
    def show(mode="symbol")
        if mode=="symbol"
            case @direction
            when "fwd"
                display_value = "/"
            when "back"
                display_value = "\\"
            when "horiz"
                display_value = "_____"
            end
            
        elsif mode=="number"
            case @direction
            when "fwd"
                display_value = @number < 9 ? "#{@number + 1} " : "#{@number + 1}"
            when "back"
                display_value = @number < 9 ? "#{@number + 1} " : "#{@number + 1}"
            when "horiz"
                display_value = @number < 9 ? "_#{@number + 1}___" : "#{@number + 1}___" 
            end
        end

        display = Color.colorize_by_occupier(display_value,@occupier)
        
        return display
    end

end