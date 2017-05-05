class SettlersOfCatan::GameBoard
    attr_reader :facet, :tile_numbers
    def initialize
        @facet = Array (1..54)  

        @tile_numbers = ["02","03","03","04","04","05","05","06","06","08","08","09","09","10","10","11","11","12"]
        @colors = {:red => "\e[31m",:green => "\e[32m",:yellow => "\e[33m",:blue => "\e[34m",:magenta => "\e[35m",:cyan => "\e[36m",:default => "\e[39m"}
        @tile_color=["red","green","yellow"]
    end
    def current_board
        puts "\e[H\e[2J"
        puts "                            #{facet[0]}______#{facet[1]}   "
        puts "                           /       \\   "
        puts "                          /         \\   "
        puts "                  #{facet[2]}______#{facet[3]}     #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    #{facet[4]}_______#{facet[5]}   "
        puts "                 /       \\           /       \\   "
        puts "                /         \\         /         \\   "
        puts "        #{facet[6]}______#{facet[7]}     #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[8]}______#{facet[9]}    #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[10]}_____#{facet[11]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[12]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[13]}_____/#{facet[14]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[15]}_____/#{facet[16]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[17]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[18]}_____/#{facet[19]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[20]}_____/#{facet[21]}  #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}     \\#{facet[22]}_____/#{facet[23]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[24]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[25]}_____/#{facet[26]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[27]}_____/#{facet[28]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[29]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[30]}_____/#{facet[31]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[32]}_____/#{facet[33]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[34]}_____/#{facet[35]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[36]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[37]}_____/#{facet[38]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[39]}_____/#{facet[40]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[41]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[42]}_____/#{facet[43]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[44]}_____/#{facet[45]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[46]}_____/#{facet[47]} "
        puts "               \\           /       \\           /          "
        puts "                \\         /         \\         /       "
        puts "                 \\#{facet[48]}_____/#{facet[49]}   #{@colors[@tile_color[0].to_sym]}#{@tile_numbers[0]}#{@colors[:default]}    \\#{facet[50]}_____/#{facet[51]} "
        puts "                         \\           /   "
        puts "                          \\         /   "
        puts "                           \\#{facet[52]}_____/#{facet[53]} " 
        puts "\n \n \n"
        puts "Legend: [roygbw] = Settlement, [ROYGBW] = City"
    end
end