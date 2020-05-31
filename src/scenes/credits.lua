local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(0, 0, 0)
end

function scene.unload()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.print('Em Memória da lenda Kobe Bryant e sua Filha Gianna Bryant', 100, 100)
  love.graphics.print('Eles se tornaram inspiração para muitas pessoas nessa vida', 100, 200)
  love.graphics.print('e deixaram um bom exemplo para nós. Faça como eles, seja uma Lenda.', 100, 250)
  love.graphics.print('Sua memória é o que você pode deixar de melhor', 100, 300)
  love.graphics.print('para as pessoas depois de partir pois você é responsável', 100, 350)
  love.graphics.print('por como as pessoas se lembram de você ou não.', 100, 400)
  love.graphics.print('Então, qual será a memória que os outros irão ter de você?', 100, 450)
  love.graphics.print('#Lendasnuncamorrem', 100, 500)

  love.graphics.print('Fim', 300, 650)
end

return scene;
