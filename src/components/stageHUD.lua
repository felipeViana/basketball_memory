local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local assets = require 'src/common/assets'

local hud = {}

local redColor = {1, 0, 0}
local yellowColor = {1, 1, 0}
local orangeColor = {1, 165/255, 0}

local STRETCHING_TIME = 0.3
local stretching = STRETCHING_TIME
local bigFont = true

-- TODO: refactor stretching font

local function exitStage()
  sceneManager.changeScene(require 'src/menu/stageSelection')
end

function hud.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = 'Sair',
    fn = exitStage,
    x = 100,
    y = 600,
  })

  sceneManager.pushScene(require 'src/stages/getPrepared')
end

function hud.unload()
  buttonManager:unload()
end

function hud.update(dt)
  buttonManager:update(dt)

  if stretching > 0 then
    stretching = stretching - dt
  end

  if stretching < 0 then
    bigFont = not bigFont
    stretching = STRETCHING_TIME
  end
end

function hud.draw(timeLeft)
  local x = 200
  local y = 25

  if bigFont and timeLeft < 5 then
    love.graphics.setFont(assets.timerFont2)
    x = 198
    y = 23
  else
    love.graphics.setFont(assets.timerFont)
  end

  love.graphics.setColor(1, 1, 1)
  if timeLeft < 5 then
    love.graphics.setColor(redColor)
  elseif timeLeft < 10 then
    love.graphics.setColor(orangeColor)
  elseif timeLeft < 15 then
    love.graphics.setColor(yellowColor)
  end
  love.graphics.print(string.format("tempo restante: %.2f", timeLeft), x, y)

  buttonManager:draw()
end

function hud.mouseReleased(button)
  buttonManager:mouseReleased(button)
end

return hud;
