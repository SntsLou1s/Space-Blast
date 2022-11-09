TelaInicial = Classe:extend()

function TelaInicial:new()
    self.bg_image = love.graphics.newImage("recursos/imagens/telaInicial.jpg")
    self.seta = love.graphics.newImage("recursos/imagens/seta.png")
    self.menu = {
        jogar = 300,
        sair = 375
    }
    self.opcao = "jogar"
end

function TelaInicial:update()
    self:selecionar()
    if love.keyboard.isDown("return") then
        if self.opcao == "jogar" then
            cena_atual = "jogo"
        elseif self.opcao == "sair" then
            os.exit()
        end
    end
end

function TelaInicial:draw()
    love.graphics.draw(self.bg_image, 0, 0)
    love.graphics.draw(self.seta, 210, self.menu[self.opcao])
end

function TelaInicial:selecionar()
    if love.keyboard.isDown("up") then
        self.opcao = "jogar"
    elseif love.keyboard.isDown("down") then
        self.opcao = "sair"
    end
end