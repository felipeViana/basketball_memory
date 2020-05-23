local load_assets = require 'src/load_assets'
local defaults = require 'src/defaults'
local sceneManager = require 'src/sceneManager'

local DEBUG = true
local gameIsPaused = false

function love.load()
  load_assets.load_all()
  defaults.load_all()

  if DEBUG then
    sceneManager.changeScene(require 'src/scenes/cutScene11')
  else
    sceneManager.changeScene(require 'src/scenes/splash')
  end
end

function love.update(dt)
  if gameIsPaused then
    return
  end

  sceneManager.currentScene.update(dt)
end

function love.draw()
  sceneManager.currentScene.draw()
end

function love.mousereleased(x, y, button, istouch)
  sceneManager.currentScene.mousereleased(x, y, button, istouch)
end

function love.keypressed(key)
  sceneManager.currentScene.keypressed(key)
  if key == "escape" then
    love.event.quit(0)
  end
end

function love.textinput(t)
  sceneManager.currentScene.textinput(t)
end

function love.focus(f)
  gameIsPaused = not f
end
