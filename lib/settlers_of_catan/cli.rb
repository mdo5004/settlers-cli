require 'pry'
require_relative 'game_board.rb'
class SettlersOfCatan::CLI
    def call
        start
    end

    def start
        puts "Let's play Settlers of Catan!" 
        puts "\n \n \n"

        setup
        first_turn
        second_turn
        game
    end

    private
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
    def game
        
            puts "Begin the game"
    end
    def setup
        @board = SettlersOfCatan::GameBoard.new
        colors = ["red","blue","white","orange"]
        color = ask("What color would you like to be? (1=red, 2=blue, 3=white, 4=orange)") {|text| ["red","blue","white","orange","1","2","3","4"].include?(text)}

        if color.to_i != 0 
            color = colors[color.to_i-1]
        end

        @players = []
        colors.each do |c|
            cat = c == color ? "human" : "computer"
            new_player = SettlersOfCatan::Player.new(cat,c)
            new_player.board = @board
            @players << new_player
        end
        @players.shuffle!

    end

    def place_first_pieces(player)
        if player.category == "human"
            @board.display_current_board
            facet_number = ask("Where would you like to place your first settlement?")
            player.place_settlement(facet_number)
        else
            # TODO -- COMPUTER PLAYER PICKS A FACET
        end
    end


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

            return user_input
        end
    end
end