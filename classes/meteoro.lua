Meteoro = Classe:extend()

function Meteoro:new()
    self.skin = love.graphics.newImage("recursos/imagens/meteoro_skin.png")
    self.largura = self.skin:getWidth()
    self.altura = self.skin:getHeight()
    self.pos_x = love.math.random(0, largura_tela - self.largura)
    self.pos_y = -self.altura
    self.vel = 70
end

function Meteoro:update(dt)
    self.pos_y = self.pos_y + self.vel * dt
end

function Meteoro:draw()
    love.graphics.draw(self.skin, self.pos_x, self.pos_y)
end

function Meteoro:fora_da_tela()
    if self.pos_y > altura_tela then
        return true
    end
    return false
end