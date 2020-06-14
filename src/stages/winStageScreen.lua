local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {};

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
      text = 'ir para próxima fase',
      fn = goToNextStage,
      x = 450,
      y = 200,
    })
  end
  buttonManager:newTextButton({
    text = 'Reiniciar',
    fn = restart,
    x = 450,
    y = 300,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ExitToMenu'),
    fn = quitStage,
    x = 450,
    y = 500,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  love.graphics.setColor(0, 128/255, 0)
  love.graphics.rectangle(
    'fill',
    300,
    50,
    620,
    600
  )
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'line',
    300,
    50,
    620,
    600
  )
  love.graphics.setFont(assets.squareFont)
  love.graphics.print('Você Venceu', 530, 70)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
