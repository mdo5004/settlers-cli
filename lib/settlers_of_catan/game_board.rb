class SettlersOfCatan::GameBoard
    attr_reader :facet, :tile_numbers

    def initialize
        @facet = ["1_", "2", "3_", "4", "5_", "6", "7_", "8", "9_", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54"]  
        @tiles = []
        @tile_color = []
        
        @resource_colors = {:ore => "gray", :brick => "red", :wheat => "yellow", :sheep => "light_green", :wood => "green", :dessert =>"magenta"}

        @tile_numbers = ["05","02","06","03","08","10","09","12","11","04","08","10","09","04","05","06","03","11"]

        @tile_resources = ["ore", "ore", "ore", "brick", "brick", "brick",  "wheat", "wheat", "wheat", "wheat", "sheep", "sheep", "sheep", "sheep", "wood", "wood", "wood", "wood", "dessert"]
        @tile_resources.shuffle!

        n = 0
        19.times do |i|
            if @tile_resources[i] == "dessert"
                @tiles << SettlersOfCatan::Tile.new("dessert", @tile_resources[i])
                @tile_numbers.insert(i,"  ")
            else
                @tiles << SettlersOfCatan::Tile.new(@tile_numbers[i], @tile_resources[i])
                
            end
            @tile_color << @resource_colors[@tile_resources[i].to_sym]
        end

        @colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m", :gray => "\e[90m", :light_green => "\e[92m"}

        
    end
    def current_board
        puts "\e[H\e[2J"
        puts "                            #{facet[0]}_____#{facet[1]}   "
        puts "                           /       \\   "
        puts "                          /         \\   "
        puts "                  #{facet[2]}_____/#{facet[3]}    #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[4]}_____#{facet[5]}   "
        puts "                 /       \\           /       \\   "
        puts "                /         \\         /         \\   "
        puts "        #{facet[6]}_____/#{facet[7]}    #{@colors[@tile_color[1].to_sym]}#{@tile_numbers[1]}#{@colors[:default]}    \\#{facet[8]}_____/#{facet[9]}   #{@colors[@tile_color[2].to_sym]}#{@tile_numbers[2]}#{@colors[:default]}    \\#{facet[10]}_____#{facet[11]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[12]}   #{@colors[@tile_color[3].to_sym]}#{@tile_numbers[3]}#{@colors[:default]}    \\#{facet[13]}_____/#{facet[14]}   #{@colors[@tile_color[4].to_sym]}#{@tile_numbers[4]}#{@colors[:default]}    \\#{facet[15]}_____/#{facet[16]}   #{@colors[@tile_color[5].to_sym]}#{@tile_numbers[5]}#{@colors[:default]}    \\#{facet[17]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[18]}_____/#{facet[19]}   #{@colors[@tile_color[6].to_sym]}#{@tile_numbers[6]}#{@colors[:default]}    \\#{facet[20]}_____/#{facet[21]}   #{@colors[@tile_color[7].to_sym]}#{@tile_numbers[7]}#{@colors[:default]}    \\#{facet[22]}_____/#{facet[23]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[24]}   #{@colors[@tile_color[8].to_sym]}#{@tile_numbers[8]}#{@colors[:default]}    \\#{facet[25]}_____/#{facet[26]}   #{@colors[@tile_color[9].to_sym]}#{@tile_numbers[9]}#{@colors[:default]}    \\#{facet[27]}_____/#{facet[28]}   #{@colors[@tile_color[10].to_sym]}#{@tile_numbers[10]}#{@colors[:default]}    \\#{facet[29]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[30]}_____/#{facet[31]}   #{@colors[@tile_color[11].to_sym]}#{@tile_numbers[11]}#{@colors[:default]}    \\#{facet[32]}_____/#{facet[33]}   #{@colors[@tile_color[12].to_sym]}#{@tile_numbers[12]}#{@colors[:default]}    \\#{facet[34]}_____/#{facet[35]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[36]}   #{@colors[@tile_color[13].to_sym]}#{@tile_numbers[13]}#{@colors[:default]}    \\#{facet[37]}_____/#{facet[38]}   #{@colors[@tile_color[14].to_sym]}#{@tile_numbers[14]}#{@colors[:default]}    \\#{facet[39]}_____/#{facet[40]}   #{@colors[@tile_color[15].to_sym]}#{@tile_numbers[15]}#{@colors[:default]}    \\#{facet[41]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[42]}_____/#{facet[43]}   #{@colors[@tile_color[16].to_sym]}#{@tile_numbers[16]}#{@colors[:default]}    \\#{facet[44]}_____/#{facet[45]}   #{@colors[@tile_color[17].to_sym]}#{@tile_numbers[17]}#{@colors[:default]}    \\#{facet[46]}_____/#{facet[47]} "
        puts "               \\           /       \\           /          "
        puts "                \\         /         \\         /       "
        puts "                 \\#{facet[48]}_____/#{facet[49]}   #{@colors[@tile_color[18].to_sym]}#{@tile_numbers[18]}#{@colors[:default]}    \\#{facet[50]}_____/#{facet[51]} "
        puts "                         \\           /   "
        puts "                          \\         /   "
        puts "                           \\#{facet[52]}_____/#{facet[53]} " 
        puts "\n \n \n"
        puts "Legend: [roygbw] = Settlement, [ROYGBW] = City"
    end
end