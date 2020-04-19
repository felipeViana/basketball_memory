local initial_loads = require 'src/initial_loads'
local sceneManager = require 'src/sceneManager'
local o_ten_one = require 'libs/splashes/o-ten-one'

local DEBUG = true

local inSplash = true

if DEBUG then
  inSplash = false
  sceneManager.changeScene(require 'src/gameTitle')
end

function love.load()
  initial_loads.load_imgs()
  splash = o_ten_one({background={0, 0, 0}})
  function splash.onDone()
    print "Done"
    inSplash = false
    sceneManager.changeScene(require 'src/card')
  end
  gameIsPaused = false
end

function love.update(dt)
  if inSplash then
    splash:update(dt)
  else
    if gameIsPaused then
      return
    end

    sceneManager.currentScene.update(dt)
  end
end

function love.draw()
  if inSplash then
    splash:draw()
  else
    sceneManager.currentScene.draw()
  end
end

function love.mousereleased(x, y, button, istouch)
  sceneManager.currentScene.mousereleased(x, y, button, istouch)
end

function love.keypressed( ... )
  if inSplash then
    splash:skip()
  else
    sceneManager.currentScene.keypressed()
  end
end

function love.focus(f)
  gameIsPaused = not f
end

function love.quit()
  print("Thanks for playing!")
end
