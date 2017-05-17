require "spec_helper"

RSpec.describe SettlersOfCatan do
  it "has a version number" do
    expect(SettlersOfCatan::VERSION).not_to be nil
  end

  it "can setup a new game" do
      game = SettlersOfCatan::Game.new
      board = game.board
      expect(board).to be_a(SettlersOfCatan::GameBoard)
  end
    
    it "plays a whole game" do
        game = SettlersOfCatan::Game.new
        result = game.start
        expect(result).to be_truthy
    end
    
end
