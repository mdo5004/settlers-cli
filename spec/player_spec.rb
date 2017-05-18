require "spec_helper"

RSpec.describe SettlersOfCatan::Player do
    before(:each) do
        @player = SettlersOfCatan::Player.new("human","blue") 
        @board = SettlersOfCatan::GameBoard.new
        @player.board = @board
    end
    it "starts with zero victory points" do
        expect(@player.victory_points).to eq(0)
    end
    it "starts with four settlements" do
        expect(@player.settlements.length).to eq(4)
        expect(@player.settlements[0]).to be_a(SettlersOfCatan::Settlement)
    end
    it "starts with four cities" do
        expect(@player.cities.length).to eq(4)
        expect(@player.cities[0]).to be_a(SettlersOfCatan::City)
    end
    it "starts with fifteen roads" do
        expect(@player.roads.length).to eq(15)
        expect(@player.roads[0]).to be_a(SettlersOfCatan::Road)
    end
    
    it "can place a settlement" do
        settlement = @player.place_settlement(1)
        expect(settlement).to be_truthy
        expect(settlement).to be_a(SettlersOfCatan::Settlement)
    end
    it "can place a road" do
        expect(false).to be(true)
    end
    it "can upgrade a settlement to a city" do
        expect(false).to be(true)
    end
    it "cannot place a city" do
        expect(false).to be(true)
    end
    it "can can have the longest road" do
        expect(false).to be(true)
    end
    it "can have the largest army" do
        expect(false).to be(true)
    end
    it "can purchase development cards" do
        expect(false).to be(true)
    end
    it "can roll the dice" do
        expect(false).to be(true)
    end
    it "can trade cards with another player" do
        expect(false).to be(true)
    end
    it "can win the game" do
        expect(false).to be(true)
    end
    it "gains a settlement when it upgrades a settlement to a city" do
        expect(false).to be(true)
    end
    it "cannot place more than four settlements" do
        expect(false).to be(true)
    end
    it "cannot place more than four cities" do
        expect(false).to be(true)
    end
    it "cannot place more than fifteen roads" do
        expect(false).to be(true)
    end
    
end