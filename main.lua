altura_tela = love.graphics.getHeight()
largura_tela = love.graphics.getWidth()

function love.load()
    Classe = require "classic"
    require "cenas/jogo"
    require "classes/nave"
    require "classes/tiro"
    require "classes/meteoro"
    jogo = Jogo()
    cenas = {
        jogo = jogo
    }
    cena = "jogo"
end

function love.update(dt)
    cenas[cena]:update(dt)
end

function love.draw()
    cenas[cena]:draw()
end