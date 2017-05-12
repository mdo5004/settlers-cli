class SettlersOfCatan::Facet < SettlersOfCatan::Space
    attr_accessor :neighbors, :facing, :edges
    @@all = []
    def initialize(number)
        @number = number
        @color = :default
        @neighbors = neighbors
        @@all << self
    end
    def self.all
        @@all
    end
    def show(mode="number")
        if @occupier
            display_value = @occupier.show
            display = Color.colorize_by_occupier(display_value,@occupier)
        else
            display_value = @number.to_s
            if mode=="symbol"
                display_value = (facing=="right" && !([18,30,42].include? @number)) ? "__" : "  "

            end
            display = display_value
        end

        if display_value.length == 1

            display = (facing=="right") ? "#{display}#{Color.colorize_by_color("_",horizontal_edge_color)}" : display
        end
        return display
    end

    def horizontal_edge_color
        color = "default"
        leading_edge = @edges.find do |edge|
            edge.direction == "horiz"
        end 
        if leading_edge.occupier
            color = leading_edge.occupier.color
        end
    end

end