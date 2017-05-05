class SettlersOfCatan::GameBoard
    attr_reader :facet, :tile_numbers
    def initialize
        @facet = Array (1..54)  

        @tile_numbers = ["02","03","03","04","04","05","05","06","06","08","08","09","09","10","10","11","11","12"]
        
    end
    def current_board
        puts "\e[H\e[2J"
        puts "                            #{facet[0]}______#{facet[1]}   "
        puts "                           /       \\   "
        puts "                          /         \\   "
        puts "                  #{facet[2]}______#{facet[3]}     #{@tile_numbers[0]}    #{facet[4]}_______#{facet[5]}   "
        puts "                 /       \\           /       \\   "
        puts "                /         \\         /         \\   "
        puts "        #{facet[6]}______#{facet[7]}     #{@tile_numbers[0]}    \\#{facet[8]}______#{facet[9]}    #{@tile_numbers[0]}    \\#{facet[10]}_____#{facet[11]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[12]}   #{tile_numbers[0]}    \\#{facet[13]}_____/#{facet[14]}   #{tile_numbers[0]}    \\#{facet[15]}_____/#{facet[16]}   #{tile_numbers[0]}    \\#{facet[17]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[18]}_____/#{facet[19]}   #{tile_numbers[0]}    \\#{facet[20]}_____/#{facet[21]}  #{tile_numbers[0]}     \\#{facet[22]}_____/#{facet[23]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[24]}   #{tile_numbers[0]}    \\#{facet[25]}_____/#{facet[26]}   #{tile_numbers[0]}    \\#{facet[27]}_____/#{facet[28]}   #{tile_numbers[0]}    \\#{facet[29]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[30]}_____/#{facet[31]}   #{tile_numbers[0]}    \\#{facet[32]}_____/#{facet[33]}   #{tile_numbers[0]}    \\#{facet[34]}_____/#{facet[35]} "
        puts "       /       \\           /       \\           /       \\   "
        puts "      /         \\         /         \\         /         \\   "
        puts "     /#{facet[36]}   #{tile_numbers[0]}    \\#{facet[37]}_____/#{facet[38]}   #{tile_numbers[0]}    \\#{facet[39]}_____/#{facet[40]}   #{tile_numbers[0]}    \\#{facet[41]} "
        puts "     \\           /       \\           /       \\           /   "
        puts "      \\         /         \\         /         \\         /   "
        puts "       \\#{facet[42]}_____/#{facet[43]}   #{tile_numbers[0]}    \\#{facet[44]}_____/#{facet[45]}   #{tile_numbers[0]}    \\#{facet[46]}_____/#{facet[47]} "
        puts "               \\           /       \\           /          "
        puts "                \\         /         \\         /       "
        puts "                 \\#{facet[48]}_____/#{facet[49]}   #{tile_numbers[0]}    \\#{facet[50]}_____/#{facet[51]} "
        puts "                         \\           /   "
        puts "                          \\         /   "
        puts "                           \\#{facet[52]}_____/#{facet[53]} " 
        puts "\n \n \n"
        puts "Legend: [roygbw] = Settlement, [ROYGBW] = City"
    end
end