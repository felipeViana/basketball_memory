local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {};

local GRID_X = 50
local GRID_Y = 50

local WIDTH = 500
local HEIGHT = 400

local BUTTON_WIDTH = 200

local function restart()
  sceneManager.popScene(true)
end

local function quitStage()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load(goToNextStage)
  buttonManager:load()

  if goToNextStage ~= nil then
    buttonManager:newTextButton({
      text = 'Próxima Fase',
      fn = goToNextStage,
      x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
      y = GRID_Y + 75,
    })
  end
  buttonManager:newTextButton({
    text = 'Reiniciar',
    fn = restart,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + 150,
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
  love.graphics.setColor(0, 128/255, 0, 0.9)
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
  love.graphics.setFont(assets.squareFont)
  love.graphics.print('Você Venceu', GRID_X + WIDTH / 3, GRID_Y + 25)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
