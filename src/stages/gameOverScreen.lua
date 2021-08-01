local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {};

local GRID_X = 50
local GRID_Y = 50

local WIDTH = 400
local HEIGHT = 500

local BUTTON_WIDTH = 200

local function restart()
  sceneManager.popScene(true)
end

local function quitStage()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('Restart'),
    fn = restart,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + 75,
  })

  buttonManager:newTextButton({
    text = dictionary.localize('ExitToMenu'),
    fn = quitStage,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + HEIGHT - 100,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  love.graphics.setColor(220/255, 20/255, 60/255, 0.9)
  love.graphics.rectangle(
    'fill',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'line',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )


  local textFont = assets.squareFont
  love.graphics.setFont(textFont)
  local winText = dictionary.localize('Game Over')
  local textWidth = textFont:getWidth(winText)

  love.graphics.print(winText, GRID_X + WIDTH / 2 - textWidth / 2, GRID_Y + 25)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
