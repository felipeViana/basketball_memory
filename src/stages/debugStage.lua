local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local assets = require 'src/common/assets'
local gridUtils = require 'src/common/gridUtils'

local stage = {}

local function exitStage()
  sceneManager.changeScene(require 'src/menu/stageSelection')
end

function stage.load()
  cardManager.load()
  local cards = cardManager.newPairs(4, 3)
end

function stage.unload()
end

function stage.update(dt)
  local gameComplete = cardManager.update(dt)

  if gameComplete then
    sceneManager.changeScene(require 'src/scenes/cutScene11')
  end
end

function stage.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.stageBackground)

  love.graphics.setFont(assets.timerFont)
  love.graphics.print("tempo infinito", 20, 20)

  cardManager.draw()
end

function stage.mousereleased(_, _, button)
  cardManager.mouseReleased(button)
end


return stage;
