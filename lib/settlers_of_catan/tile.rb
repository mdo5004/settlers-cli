class SettlersOfCatan::Tile
    attr_reader :number, :resource
    attr_accessor :occupied_by_robber

    def initialize(number,resource,occupied_by_robber = false)
        @number = number
        @resource = resource
        
        @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m", :default => "\e[39m"}

        @@resource_colors = {:ore => "gray", :brick => "red", :wheat => "yellow", :sheep => "light_green", :wood => "green", :dessert =>"magenta"}
    end

    def show
        if occupied_by_robber
            
        else
            if @number < 10
                if @number == 7
                    display = "  "
                else
                    display = "0#{@number}"
                end
            else
                display = "#{@number}"
            end
        end
        return "#{display_color}#{display}#{@@colors[:default]}"
    end

    def display_color
        if @resource
            c = @@colors[@@resource_colors[@resource.to_sym].to_sym] 
        else
            c = @@colors[:default]
        end
        return c
    end
end