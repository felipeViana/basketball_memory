local sceneManager = require 'src/sceneManager'
local o_ten_one = require 'libs/splashes/o-ten-one'

local scene = {}
local inSplash = true

function scene.load()
  splash = o_ten_one({background={0, 0, 0}})

  function splash.onDone()
    inSplash = false
    sceneManager.changeScene(require 'src/scenes/gameTitle')
  end
end

function scene.update(dt)
  splash:update(dt)
end

function scene.draw()
  splash:draw()
end

function scene.keypressed(key)
  splash:skip()
end

return scene;
