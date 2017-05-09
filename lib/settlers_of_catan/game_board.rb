class SettlersOfCatan::GameBoard
    attr_reader :facet, :tile_numbers

    def initialize
        @facet = Array.new(11){Array.new(6)}
        facet_x = [0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10]
        facet_y = [2, 3, 1, 2, 3, 4, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 1, 2, 3, 4, 2, 3]

        54.times do |i|
            @facet[facet_x[i]][facet_y[i]] = SettlersOfCatan::Facet.new(i+1)
        end
        54.times do |i|

            n1  = facet_x[i] == 0 ? nil : @facet[facet_x[i] - 1][facet_y[i]] 
            n2  = facet_x[i] == 10 ? nil : @facet[facet_x[i] + 1][facet_y[i]]

            if facet_x[i] % 2 == 0
                if facet_y[i] % 2 == 0 
                    # row is even, column is even
                    n3  = facet_y[i] == 5 ? nil : @facet[facet_x[i]][facet_y[i] + 1]
                else
                    # row is even, column is odd
                    n3  = facet_y[i] == 0 ? nil : @facet[facet_x[i]][facet_y[i] - 1]
                end
            else
                if facet_y[i] % 2 == 0
                    # row is odd, column is even
                    n3  = facet_y[i] == 0 ? nil : @facet[facet_x[i]][facet_y[i] - 1]
                else
                    # row is odd, column is odd
                    n3  = facet_y[i] == 5 ? nil : @facet[facet_x[i]][facet_y[i] + 1]
                end
            end
            facet = @facet[facet_x[i]][facet_y[i]]
            facet.neighbors = [n1,n2,n3]
        end

        @edge = []
        90.times do |i|
            dirs = ["horiz", "fwd","back"]
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

    end
    def display_current_board
        puts "\e[H\e[2J"
        puts " "*28 + @facet[0][2].show + @edge[0].show + @facet[0][3].show
        puts " "*27 + @edge[1].show + " "*7 + @edge[2].show
        puts " "*26 + @edge[1].show + " "*9 + @edge[2].show
        puts " "*18 + @facet[1][2].show + @edge[3].show + @edge[1].show + @facet[1][2].show + " "*4  + @tile[0].show + " "*4  + @edge[2].show + @facet[1][3].show + @edge[6].show + @facet[1][4].show
        puts " "*17 + @edge[4].show + " "*7 + @edge[5].show + " "*11 + @edge[7].show + " "*7 + @edge[8].show
        puts " "*16 + @edge[4].show + " "*9 + @edge[5].show + " "*9 + @edge[7].show + " "*9 + @edge[8].show
        puts " "*8 + @facet[2][0].show + @edge[9].show + @edge[4].show + @facet[2][1].show + " "*4 + @tile[1].show + " "*4 + @edge[5].show + @facet[2][2].show + @edge[12].show + @edge[7].show + @facet[2][3].show + " "*3 + @tile[2].show + " "*4 + @edge[8].show + @facet[2][4].show + @edge[15].show + @facet[2][5].show
        puts " "*7 + @edge[10].show + " "*7 + @edge[11].show+ " "*11 + @edge[13].show+ " "*7 + @edge[14].show + " "*11 + @edge[16].show + " "*7 + @edge[17].show
        puts " "*6 + @edge[10].show + " "*9 + @edge[11].show+ " "*9 + @edge[13].show+ " "*9 + @edge[14].show + " "*9 + @edge[16].show + " "*9 + @edge[17].show
        puts " "*5 + @edge[10].show + @facet[3][0].show + " "*3 + @tile[3].show+ " "*4 + @edge[11].show + @facet[3][1].show + @edge[18].show+ @edge[13].show+ @facet[3][2].show + " "*3 + @tile[4].show+ " "*4+ @edge[14].show + @facet[3][3].show + @edge[21].show + @edge[16].show + @facet[3][4].show + " "*3 + @tile[5].show + " "*4 + @edge[17].show + @facet[3][5].show
        puts " "*5 + @edge[35].show + " "*11 + @edge[19].show + " "*7 + @edge[20].show + " "*11 + @edge[22].show+ " "*7 + @edge[23].show + " "*11 + @edge[34].show
        puts " "*6 + @edge[35].show + " "*9 + @edge[19].show + " "*9 + @edge[20].show + " "*9 + @edge[22].show+ " "*9 + @edge[23].show + " "*9 + @edge[34].show
        puts " "*7 + @edge[35].show + @facet[4][0].show + @edge[24].show + @edge[19].show + @facet[4][1].show + " "*3 + @tile[6].show + " "*4 + @edge[20].show + @facet[4][2].show + @edge[27].show + @edge[22].show + @facet[4][3].show + " "*3 + @tile[7].show + " "*4 + @edge[23].show + @facet[4][4].show + @edge[30].show + @edge[34].show + @facet[4][5].show
        puts " "*7 + @edge[25].show + " "*7 + @edge[26].show+ " "*11 + @edge[28].show+ " "*7 + @edge[29].show + " "*11 + @edge[31].show + " "*7 + @edge[32].show
        puts " "*6 + @edge[25].show + " "*9 + @edge[26].show+ " "*9 + @edge[28].show+ " "*9 + @edge[29].show + " "*9 + @edge[31].show + " "*9 + @edge[32].show
        puts " "*5 + @edge[25].show + @facet[5][0].show + " "*3 + @tile[8].show+ " "*4 + @edge[26].show + @facet[5][1].show + @edge[36].show+ @edge[28].show+ @facet[5][2].show + " "*3 + @tile[9].show+ " "*4+ @edge[29].show + @facet[5][3].show + @edge[39].show + @edge[31].show + @facet[5][4].show + " "*3 + @tile[10].show + " "*4 + @edge[32].show + @facet[5][5].show
        puts " "*5 + @edge[53].show + " "*11 + @edge[37].show + " "*7 + @edge[38].show + " "*11 + @edge[40].show+ " "*7 + @edge[41].show + " "*11 + @edge[52].show
        puts " "*6 + @edge[53].show + " "*9 + @edge[37].show + " "*9 + @edge[38].show + " "*9 + @edge[40].show+ " "*9 + @edge[41].show + " "*9 + @edge[52].show
        puts " "*7 + @edge[53].show + @facet[6][0].show + @edge[42].show + @edge[37].show + @facet[6][1].show + " "*3 + @tile[11].show + " "*4 + @edge[38].show + @facet[6][2].show + @edge[45].show + @edge[40].show + @facet[6][3].show + " "*3 + @tile[12].show + " "*4 + @edge[41].show + @facet[6][4].show + @edge[48].show + @edge[52].show + @facet[6][5].show
        puts " "*7 + @edge[43].show + " "*7 + @edge[44].show+ " "*11 + @edge[46].show+ " "*7 + @edge[47].show + " "*11 + @edge[49].show + " "*7 + @edge[50].show
        puts " "*6 + @edge[43].show + " "*9 + @edge[44].show+ " "*9 + @edge[46].show+ " "*9 + @edge[47].show + " "*9 + @edge[49].show + " "*9 + @edge[50].show
        puts " "*5 + @edge[43].show + @facet[7][0].show + " "*3 + @tile[13].show+ " "*4 + @edge[44].show + @facet[7][1].show + @edge[54].show+ @edge[46].show+ @facet[7][2].show + " "*3 + @tile[14].show+ " "*4+ @edge[47].show + @facet[7][3].show + @edge[57].show + @edge[49].show + @facet[7][4].show + " "*3 + @tile[15].show + " "*4 + @edge[50].show + @facet[7][5].show
        puts " "*5 + @edge[62].show + " "*11 + @edge[55].show + " "*7 + @edge[56].show + " "*11 + @edge[58].show+ " "*7 + @edge[59].show + " "*11 + @edge[61].show
        puts " "*6 + @edge[62].show + " "*9 + @edge[55].show + " "*9 + @edge[56].show + " "*9 + @edge[58].show+ " "*9 + @edge[59].show + " "*9 + @edge[61].show
        puts " "*7 + @edge[62].show + @facet[8][0].show + @edge[42].show + @edge[55].show + @facet[8][1].show + " "*3 + @tile[16].show + " "*4 + @edge[56].show + @facet[8][2].show + @edge[63].show + @edge[58].show + @facet[8][3].show + " "*3 + @tile[17].show + " "*4 + @edge[59].show + @facet[8][4].show + @edge[66].show + @edge[61].show + @facet[8][5].show
        puts " "*15 + @edge[68].show + " "*11 + @edge[64].show + " "*7 + @edge[65].show + " "*11 + @edge[67].show
        puts " "*16 + @edge[68].show + " "*9 + @edge[64].show + " "*9 + @edge[65].show + " "*9 + @edge[67].show    
        puts " "*17 + @edge[68].show + @facet[9][1].show + @edge[69].show + @edge[64].show + @facet[9][2].show + " "*3 + @tile[18].show + " "*4 + @edge[65].show + @facet[9][3].show + @edge[72].show + @edge[67].show + @facet[9][4].show
        puts " "*25 + @edge[71].show + " "*11 + @edge[73].show
        puts " "*26 + @edge[71].show + " "*9 + @edge[73].show
        puts " "*27 + @edge[71].show + @facet[10][2].show + @edge[75].show + @edge[73].show + @facet[10][3].show
    end
end
0
1
2
3
4
5
