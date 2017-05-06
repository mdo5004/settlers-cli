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

        @board.current_board
    end

    private
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
            @players << SettlersOfCatan::Player.new(cat,c)
        end
        binding.pry
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