class SettlersOfCatan::CLI
    def call
        start
    end

    def start
        @game = SettlersOfCatan::Game.new
        @game.start("human")
    end

end