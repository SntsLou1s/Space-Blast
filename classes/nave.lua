Nave = Classe:extend()

function Nave:new()
    self.skin = love.graphics.newImage("recursos/imagens/nave_skin.png")
    self.pos_x = 300
    self.pos_y = 300
    self.largura = self.skin:getWidth()
    self.altura = self.skin:getHeight()
    self.vel = 250
    self.ataques = {}
    self.vidas = 3
    self.vida_skin = love.graphics.newImage("recursos/imagens/life.png")
end

function Nave:update(dt)
    self:mover(dt)
    self:atirar(dt)
    for i, tiro in pairs(self.ataques) do
        tiro:update(dt)
        if tiro:fora_da_tela() then
            table.remove(self.ataques, i)
        end
    end
end

function Nave:draw()
    love.graphics.draw(self.skin, self.pos_x, self.pos_y)
    for i, tiro in pairs(self.ataques) do
        tiro:draw()
    end
    for i = 1, self.vidas, 1 do
        love.graphics.draw(self.vida_skin, 25 * i, 40, 0, 0.5)
    end
end

-- Métodos da Nave

function Nave:mover(dt)
    if love.keyboard.isDown("w", "up") then
        self.pos_y = self.pos_y - self.vel * dt
    elseif love.keyboard.isDown("s", "down") then
        self.pos_y = self.pos_y + self.vel * dt
    end

    if love.keyboard.isDown("d", "right") then
        self.pos_x = self.pos_x + self.vel * dt
    elseif love.keyboard.isDown("a", "left") then
        self.pos_x = self.pos_x - self.vel * dt
    end
    self:detectar_paredes()
end

function Nave:detectar_paredes()
    if self.pos_x < 0 then
        self.pos_x = 0
    elseif self.pos_x + self.largura > largura_tela then
        self.pos_x = largura_tela - self.largura
    end

    if self.pos_y < 0 then
        self.pos_y = 0
    elseif self.pos_y + self.altura > altura_tela then
        self.pos_y = altura_tela - self.altura
    end
end

function Nave:atirar(dt)
    if love.keyboard.isDown("space") then
        if #self.ataques <= 10 then
            tiro = Tiro(self.pos_x + self.largura / 2, self.pos_y)
            table.insert(self.ataques, tiro) 
        end
    end
end

function Nave:perder_vida()
    self.vidas = self.vidas - 1
end