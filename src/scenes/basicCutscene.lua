local colors = require 'src/common/colors'
local drawUtils = require 'src/common/drawUtils'

local Talkies = require 'libs/talkies'

local scene = {}

local music

function scene.load(messages, musicAsset)
  for _, v in pairs(messages) do
    Talkies.say(
      v.message,
      v.config
    )
  end

  music = musicAsset
  music:play()
end

function scene.unload()
  music:stop()
  Talkies.clearMessages()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw(background)
  love.graphics.setColor(colors.white)
  
drawUtils.drawBackground(background)
  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

function scene.mousereleased()
  Talkies.mousereleased()
end

return scene;
