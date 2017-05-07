class SettlersOfCatan::Tile
    attr_reader :number, :resource
    attr_accessor :occupied_by_robber

    def initialize(number,resource,occupied_by_robber = false)
        @number = number
        @resource = resource
        
    end

    def show
        if occupied_by_robber
        display = "RB"    
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
        display = Color.colorize_by_resource(display,@resource)
        end
        
        return display
    end

    def display_color
        if @resource
            c = Color.resource_color(@resource)
        else
            c = Color.colors[:default]
        end
        return c
    end
end