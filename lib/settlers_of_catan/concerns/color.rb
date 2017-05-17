class Color
    attr_reader :colors, :resource_colors
    @@colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[37m", :light_green => "\e[92m", :white => "\e[97m", :black => "\e[30m"}
    @@background_colors = {:red => "\e[41m",:green => "\e[42m",:yellow => "\e[43m",:blue => "\e[44m",:magenta => "\e[45m",:cyan => "\e[46m",:default => "\e[49m", :gray => "\e[100m", :light_green => "\e[102m", :white => "\e[47m", :dark_gray => "\e[100m", :black => "\e[40m", :orange => "\e[103m"}
    @@resource_colors = {:ore => :gray, :brick => :red, :wheat => :yellow, :sheep => :light_green, :wood => :green, :dessert => :default}
    
    @@text_color_for_background = {:red => :white, :green => :white, :yellow => :white, :blue => :white, :magenta => :white, :cyan => :white, :default => :default, :gray => :white, :light_green => :white, :white => :black, :dark_gray => :white, :black => :white, :orange => :black}
    
    def self.colorize(str,display_color)
        if display_color
            "#{display_color}#{str}#{self.default_color}"
        else
            return str
        end
    end
    def self.colorize_by_occupier(str,occupier)
        if !str.is_a? String 
            str = str.to_s
        end
        occupier_color = occupier ? occupier.color : "default"
        bkg = @@background_colors[occupier_color.to_sym]
        txt = @@colors[@@text_color_for_background[occupier_color.to_sym]]
        color = "#{bkg}#{txt}"
        display = self.colorize(str,color)
        return display
    end
    def self.colorize_by_color(str,color)
        if !str.is_a? String 
            str = str.to_s
        end
        bkg = @@background_colors[color.to_sym]
        txt = @@colors[@@text_color_for_background[color.to_sym]]
        color = "#{bkg}#{txt}"
        display = self.colorize(str,color)
        return display
    end
    def self.colorize_by_resource(str,resource)
        if !str.is_a? String 
            str = str.to_s
        end
        color = self.resource_color(resource)
        display = self.colorize(str,color)
        return display 
    end
    def self.resource_color(resource)
        color = @@resource_colors[resource.to_sym].to_sym
        bkg = @@background_colors[color]
        txt = @@colors[@@text_color_for_background[color]]
        return "#{bkg}#{txt}"
    end
    def self.default_color
        return @@background_colors[:default]+@@colors[:default]
    end
    def self.color_of(obj)
        @@background_colors[obj.color.to_sym]
    end
end