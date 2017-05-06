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
        puts "                 /       \\           /       \\   "
        puts "                /         \\         /         \\   "
        puts "        #{@facet[6].show}_____/#{@facet[7].show}    #{@tile[1].show}    \\#{@facet[8].show}_____/#{@facet[9].show}   #{@tile[2].show}    \\#{@facet[10].show}_____#{@facet[11].show} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{@facet[12].show}   #{@tile[3].show}    \\#{@facet[13].show}_____/#{@facet[14].show}   #{@tile[4].show}    \\#{@facet[15].show}_____/#{@facet[16].show}   #{@tile[5].show}    \\#{@facet[17].show} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{@facet[18].show}_____/#{@facet[19].show}   #{@tile[6].show}    \\#{@facet[20].show}_____/#{@facet[21].show}   #{@tile[7].show}    \\#{@facet[22].show}_____/#{@facet[23].show} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{@facet[24].show}   #{@tile[8].show}    \\#{@facet[25].show}_____/#{@facet[26].show}   #{@tile[9].show}    \\#{@facet[27].show}_____/#{@facet[28].show}   #{@tile[10].show}    \\#{@facet[29].show} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{@facet[30].show}_____/#{@facet[31].show}   #{@tile[11].show}    \\#{@facet[32].show}_____/#{@facet[33].show}   #{@tile[12].show}    \\#{@facet[34].show}_____/#{@facet[35].show} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{@facet[36].show}   #{@tile[13].show}    \\#{@facet[37].show}_____/#{@facet[38].show}   #{@tile[14].show}    \\#{@facet[39].show}_____/#{@facet[40].show}   #{@tile[15].show}    \\#{@facet[41].show} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{@facet[42].show}_____/#{@facet[43].show}   #{@tile[16].show}    \\#{@facet[44].show}_____/#{@facet[45].show}   #{@tile[17].show}    \\#{@facet[46].show}_____/#{@facet[47].show} "
        puts "               \\           /       \\           /          "
        puts "                \\         /         \\         /       "
        puts "                 \\#{@facet[48].show}_____/#{@facet[49].show}   #{@tile[18].show}    \\#{@facet[50].show}_____/#{@facet[51].show} "
        puts "                         \\           /   "
        puts "                          \\         /   "
        puts "                           \\#{@facet[52].show}_____/#{@facet[53].show} " 
        puts "\n \n \n"
        puts "Legend: [roygbw] = Settlement, [ROYGBW] = City"
    end
end