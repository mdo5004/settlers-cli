class Color
    attr_reader :colors, :resource_colors
    @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m"}
    @@resource_colors = {:ore => :gray, :brick => :red, :wheat => :yellow, :sheep => :light_green, :wood => :green, :dessert => :magenta}
    
    def self.colorize(str,display_color)
        "#{display_color}#{str}#{self.default_color}"
    end
    def self.colorize_by_color(str,color)
        if !str.is_a? String 
            str = str.to_s
        end
        display = self.colorize(str,@@colors[color.to_sym])
        return display
    end
    def self.colorize_by_resource(str,resource)
        if !str.is_a? String 
            str = str.to_s
        end
        display = self.colorize(str,self.resource_color(resource))
        return display 
    end
    def self.resource_color(resource)
        @@colors[@@resource_colors[resource.to_sym].to_sym]  
    end
    def self.default_color
        @@colors[:default]
    end
    def self.color_of(obj)
        @@colors[obj.color.to_sym]
    end
end