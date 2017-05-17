class SettlersOfCatan::Game
    attr_accessor :board, :players
    def initialize
        puts "Let's play Settlers of Catan!" 
        puts "\n \n \n"
        setup_board
    end
    def start(mode="automatic")
        setup_players(mode)

        first_turn
        second_turn


        while !won?
            turn
        end
        return won?
    end

    def setup_board
        @board = SettlersOfCatan::GameBoard.new
    end

    def setup_players(mode)
        @players = []
        colors = ["red","blue","white","orange"]
        if mode=="human"
            color = ask("What color would you like to be? (1=red, 2=blue, 3=white, 4=orange)") {|text| ["red","blue","white","orange","1","2","3","4"].include?(text)}

            if color.to_i != 0 
                color = colors[color.to_i-1]
            end
        else
            color = nil
        end

        colors.each do |c|
            cat = c == color ? "human" : "computer"
            new_player = SettlersOfCatan::Player.new(cat,c)
            new_player.board = @board
            @players << new_player
        end
        @players.shuffle!

    end

    def first_turn
        @players.each do |player|
            place_first_pieces(player)
        end
    end
    def second_turn
        @players.reverse.each do |player|
            place_first_pieces(player)
        end
    end

    def won?
        @players.select do |player|
            player.victory_points >= 10 
        end
    end
    def turn
        # TODO
        @player[0].victory_points += 1
    end


    def place_first_pieces(player)
        if player.category == "human"
            @board.display_current_board
            facet_number = ask("Where would you like to place your settlement?")
            did_place = player.place_settlement(facet_number.to_i)
            if !did_place
                place_first_pieces(player)
            end
            @board.display_current_roads
            edge_number = ask("Where would you like to place your road?")
            did_place = player.place_road(edge_number.to_i)
        else
            # TODO -- COMPUTER PLAYER PICKS A FACET
        end
    end

    private
    def ask(phrase, &condition)
        puts phrase
        begin
            user_input = STDIN.gets.strip.downcase
        rescue
            user_input = gets.strip.downcase
        end

        if block_given?
            valid_text = condition.call(user_input)
            if !valid_text
                user_input = ask(phrase) {condition}
            end
        end
        return user_input

    end
end