local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(0, 0, 0)
end

function scene.draw()
  love.graphics.setFont(assets.textFont)
  love.graphics.print('Em Memória da lenda Kobe Bryant e sua Filha Gianna Bryant', 100, 100)

  love.graphics.setFont(assets.smallFont)
  love.graphics.printf(
    dictionary.localize('credits'),
    100,
    200,
    700
  )
end

return scene;
