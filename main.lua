altura_tela = love.graphics.getHeight()
largura_tela = love.graphics.getWidth()

function love.load()
    Classe = require "classic"
    require "cenas/jogo"
    require "cenas/telaInicial"
    require "classes/nave"
    require "classes/tiro"
    require "classes/meteoro"
    jogo = Jogo()
    telaInicial = TelaInicial()
    cenas = {
        jogo = jogo,
        telaInicial = telaInicial
    }
    cena_atual = "telaInicial"
end

function love.update(dt)
    cenas[cena_atual]:update(dt)
end

function love.draw()
    cenas[cena_atual]:draw()
end