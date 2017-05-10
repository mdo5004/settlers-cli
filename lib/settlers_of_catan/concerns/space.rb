class SettlersOfCatan::Space
    attr_accessor :occupier
    def setOccupier(o)
        if @occupier
            if @occupier.player == o.player
                removeOccupier
            else
                puts "Space occupied by another player"
                return false
            end
        end
        @occupier = o
        o.location = self
        return true
    end
    def removeOccupier
        @occupier.location = nil
        @occupier = nil
    end
    def isFree?
        @occupier.nil? 
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