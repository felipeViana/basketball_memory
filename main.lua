local initial_loads = require 'src/initial_loads'
local sceneManager = require 'src/sceneManager'

local DEBUG = false
local gameIsPaused = false
playerName = 'Felipe'

function love.load()
  initial_loads.load_imgs()
  if DEBUG then
    sceneManager.changeScene(require 'src/scenes/splash')
  end
  sceneManager.changeScene(require 'src/scenes/splash')
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
