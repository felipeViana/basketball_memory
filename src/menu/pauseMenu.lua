local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {
  name = 'pauseMenu'
};

local function goBack()
  sceneManager.popScene()
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = 450,
    y = 200,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ExitGame'),
    fn = quitGame,
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
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'fill',
    380,
    50,
    420,
    600
  )

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    380,
    50,
    420,
    600
  )
  love.graphics.setFont(assets.squareFont)
  love.graphics.print('paused', 530, 70)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
