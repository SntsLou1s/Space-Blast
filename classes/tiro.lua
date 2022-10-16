Tiro = Classe:extend()

function Tiro:new(x, y)
    self.pos_x = x
    self.pos_y = y
    self.largura = 3
    self.altura = 5
    self.vel = 500
end

function Tiro:update(dt)
    self.pos_y = self.pos_y - self.vel * dt
end

function Tiro:draw()
    love.graphics.rectangle("fill", self.pos_x, self.pos_y, self.largura, self.altura)
end

function Tiro:fora_da_tela()
    if self.pos_y < -5 then
        return true
    else
        return false
    end
end