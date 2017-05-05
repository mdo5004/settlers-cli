require 'pry'
require_relative 'game_board.rb'
class SettlersOfCatan::CLI
    def call
        start
    end

    def start
        puts "Let's play Settlers of Catan!" 
        puts "\n \n \n"
        
        board = SettlersOfCatan::GameBoard.new
        
        board.current_board
    end
end