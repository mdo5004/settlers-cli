class SettlersOfCatan::Facet
    attr_accessor :occupier
    def initialize(number)
        @number = number
        @color = :default
        
        @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m", :default => "\e[39m"}
    end

    def show
        if @number % 2 == 1 && @number < 10
            display = "#{@number}_"
        else
            display = "#{@number}"
        end
    end
end