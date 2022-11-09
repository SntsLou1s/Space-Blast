Jogo = Classe:extend()

function Jogo:new()
    nave = Nave()
    meteoros = {}
    delay = 0
    pontos = 0
end

function Jogo:update(dt)
    delay = delay + dt
    if delay > 1 then
        meteoro = Meteoro()
        table.insert(meteoros, meteoro)
        delay = 0
    end
    
    nave:update(dt)

    for i, meteoro in pairs(meteoros) do
        meteoro:update(dt)
        if meteoro:fora_da_tela() then
            table.remove(meteoros, i)
            nave:perder_vida()
        end
        if colisao(nave, meteoro) then
            table.remove(meteoros, i)
            nave:perder_vida()
        end
        for j, tiro in pairs(nave.ataques) do
            if colisao(tiro, meteoro) then
                love.graphics.print("Colisão")
                table.remove(meteoros, i)
                table.remove(nave.ataques, j)
                pontos = pontos + 1
            end
        end
    end
    if nave.vidas == 0 then
        cena_atual = "telaInicial"
        nave = Nave()
        meteoros = {}
        pontos = 0
    end
end

function Jogo:draw()
    love.window.setTitle("Space Blast")
    nave:draw()
    for i, meteoro in pairs(meteoros) do
        meteoro:draw()
    end
    love.graphics.print("Pontos: " .. pontos, 25, 10, 0, 1.5)
end

-- Colisão
function colisao(t, m)
    if t.pos_x + t.largura >= m.pos_x and
    t.pos_x < m.pos_x + m.largura and
    t.pos_y < m.pos_y + m.altura and
    t.pos_y + t.altura > m.pos_y
    then
        return true
    end
end