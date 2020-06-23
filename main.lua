local loadAssets = require 'src/common/loadAssets'
local globals = require 'src/common/globals'
local sceneManager = require 'src/common/sceneManager'

local DEBUG = true
local inPause = false
local justPaused = false

function love.load()
  loadAssets.loadAll()

  if DEBUG then
    love.audio.setVolume(0)
    sceneManager.changeScene(require 'src/menu/mainMenu')
    -- sceneManager.changeScene(require 'src/stages/stage1-1')
    -- sceneManager.changeScene(require 'src/scenes/cutScene11')
  else
    sceneManager.changeScene(require 'src/scenes/splash')
  end
end

function love.update(dt)
  if not inPause and justPaused then
    sceneManager.pushScene(require 'src/menu/pauseMenu')
    justPaused = false
    inPause = true
  end

  local currentScene = sceneManager.getCurrentScene()
  if currentScene.name ~= 'pauseMenu' then
    inPause = false
  end

  sceneManager.currentScene.update(dt)
end

function love.draw()
  sceneManager.draw()
end

function love.mousereleased(x, y, button, istouch)
  sceneManager.currentScene.mousereleased(x, y, button, istouch)
end

function love.keypressed(key)
  sceneManager.currentScene.keypressed(key)
  if key == "escape" and not inPause then
    justPaused = true
  end
end

function love.textinput(t)
  sceneManager.currentScene.textinput(t)
end

function love.focus(f)
  if not f and not inPause then
    justPaused = true
  end
end
