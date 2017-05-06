class SettlersOfCatan::GameBoard
    attr_reader :facet, :tile_numbers

    def initialize
        @facet = []
        54.times do |i|
             @facet << SettlersOfCatan::Facet.new(i+1)
        end
        @edge = []
        90.times do |i|
            dirs = ["horiz","fwd","back"]
        @edge << SettlersOfCatan::Edge.new(i,dirs[i%3])
        end
        
        @tile = []
        @tile_numbers = [5,2,6,3,8,10,9,12,11,4,8,10,9,4,5,6,3,11]
        @tile_resources = ["ore", "ore", "ore", "brick", "brick", "brick",  "wheat", "wheat", "wheat", "wheat", "sheep", "sheep", "sheep", "sheep", "wood", "wood", "wood", "wood", "dessert"]
        @tile_resources.shuffle!

        19.times do |i|
            if @tile_resources[i] == "dessert"
                @tile << SettlersOfCatan::Tile.new(7, @tile_resources[i], true)
                @tile_numbers.insert(i,7)
            else
                @tile << SettlersOfCatan::Tile.new(@tile_numbers[i], @tile_resources[i])                
            end
        end

        @colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m"}

        
    end
    def current_board
        puts "\e[H\e[2J"
        puts " "*28 + @facet[0].show + @edge[0].show + @facet[1].show
        puts " "*27 + @edge[1].show + " "*7 + @edge[2].show
        puts " "*26 + @edge[1].show + " "*9 + @edge[2].show
        puts " "*18 + @facet[2].show + @edge[3].show + @edge[1].show + @facet[3].show + " "*4  + @tile[0].show + " "*4  + @edge[2].show + @facet[4].show + @edge[6].show + @facet[5].show
        puts " "*17 + @edge[4].show + " "*7 + @edge[5].show + " "*11 + @edge[7].show + " "*7 + @edge[8].show
        puts " "*16 + @edge[4].show + " "*9 + @edge[5].show + " "*9 + @edge[7].show + " "*9 + @edge[8].show
        puts " "*8 + @facet[6].show + @edge[9].show + @edge[4].show + @facet[7].show + " "*4 + @tile[1].show + " "*4 + @edge[5].show + @facet[8].show + @edge[12].show + @edge[7].show + @facet[9].show + " "*3 + @tile[2].show + " "*4 + @edge[8].show + @facet[10].show + @edge[15].show + @facet[11].show
        puts " "*7 + @edge[10].show + " "*7 + @edge[11].show+ " "*11 + @edge[13].show+ " "*7 + @edge[14].show + " "*11 + @edge[16].show + " "*7 + @edge[17].show
        puts " "*6 + @edge[10].show + " "*9 + @edge[11].show+ " "*9 + @edge[13].show+ " "*9 + @edge[14].show + " "*9 + @edge[16].show + " "*9 + @edge[17].show
        puts " "*5 + @edge[10].show + @facet[12].show + " "*3 + @tile[3].show+ " "*4 + @edge[11].show + @facet[13].show + @edge[18].show+ @edge[13].show+ @facet[14].show + " "*3 + @tile[4].show+ " "*4+ @edge[14].show + @facet[15].show + @edge[21].show + @edge[16].show + @facet[16].show + " "*3 + @tile[5].show + " "*4 + @edge[17].show + @facet[17].show
        puts " "*5 + @edge[35].show + " "*11 + @edge[19].show + " "*7 + @edge[20].show + " "*11 + @edge[22].show+ " "*7 + @edge[23].show + " "*11 + @edge[34].show
        puts " "*6 + @edge[35].show + " "*9 + @edge[19].show + " "*9 + @edge[20].show + " "*9 + @edge[22].show+ " "*9 + @edge[23].show + " "*9 + @edge[34].show
        puts " "*7 + @edge[35].show + @facet[18].show + @edge[24].show + @edge[19].show + @facet[19].show + " "*3 + @tile[6].show + " "*4 + @edge[20].show + @facet[20].show + @edge[27].show + @edge[22].show + @facet[21].show + " "*3 + @tile[7].show + " "*4 + @edge[23].show + @facet[22].show + @edge[30].show + @edge[34].show + @facet[23].show
        puts " "*7 + @edge[25].show + " "*7 + @edge[26].show+ " "*11 + @edge[28].show+ " "*7 + @edge[29].show + " "*11 + @edge[31].show + " "*7 + @edge[32].show
        puts " "*6 + @edge[25].show + " "*9 + @edge[26].show+ " "*9 + @edge[28].show+ " "*9 + @edge[29].show + " "*9 + @edge[31].show + " "*9 + @edge[32].show
        puts " "*5 + @edge[25].show + @facet[24].show + " "*3 + @tile[8].show+ " "*4 + @edge[26].show + @facet[25].show + @edge[36].show+ @edge[28].show+ @facet[26].show + " "*3 + @tile[9].show+ " "*4+ @edge[29].show + @facet[27].show + @edge[39].show + @edge[31].show + @facet[28].show + " "*3 + @tile[10].show + " "*4 + @edge[32].show + @facet[29].show
        puts " "*5 + @edge[53].show + " "*11 + @edge[37].show + " "*7 + @edge[38].show + " "*11 + @edge[40].show+ " "*7 + @edge[41].show + " "*11 + @edge[52].show
        puts " "*6 + @edge[53].show + " "*9 + @edge[37].show + " "*9 + @edge[38].show + " "*9 + @edge[40].show+ " "*9 + @edge[41].show + " "*9 + @edge[52].show
        puts " "*7 + @edge[53].show + @facet[18].show + @edge[24].show + @edge[37].show + @facet[19].show + " "*3 + @tile[11].show + " "*4 + @edge[38].show + @facet[20].show + @edge[27].show + @edge[40].show + @facet[21].show + " "*3 + @tile[12].show + " "*4 + @edge[41].show + @facet[22].show + @edge[30].show + @edge[52].show + @facet[23].show
        puts "\n \n \n"
        puts "Legend: [roygbw] = Settlement, [ROYGBW] = City"
    end
end