local sceneManager = require 'src/sceneManager'
local buttonManager = require 'src/components/button'

local settings = {};

local function toggleFullScreen()
  local fullScreen = love.window.getFullscreen()
  if fullScreen then
    love.window.setFullscreen(false)
  else
    love.window.setFullscreen(true)
  end
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function settings.load()
  buttonManager.load()
  buttonManager.new(
    'Fullscreen ?',
    toggleFullScreen,
    400,
    200
  )
  buttonManager.new(
    'Go back',
    goBack,
    400,
    500
  )
end

function settings.unload()
  buttonManager.unload()
end

function settings.update(dt)
  buttonManager.update(dt)
end

function settings.draw()
  buttonManager.draw()
end

function settings.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return settings;
