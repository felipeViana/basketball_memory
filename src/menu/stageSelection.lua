local sceneManager = require 'src/common/sceneManager'
local buttonManager = require 'src/components/buttonManager'
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {};
local music;

local verticalScroll;
local scrollAmount = 200;

local function goToStage11()
  sceneManager.changeScene(require 'src/stages/debugStage1-1')
end

local function goToStage12()
  sceneManager.changeScene(require 'src/stages/debugStage1-2')
end

local function goToStage13()
  sceneManager.changeScene(require 'src/stages/debugStage1-3')
end

local function goToStage14()
  sceneManager.changeScene(require 'src/stages/debugStage1-4')
end

local function goToStage15()
  sceneManager.changeScene(require 'src/stages/debugStage1-5')
end

local function goToStage21()
  sceneManager.changeScene(require 'src/stages/debugStage2-1')
end

local function goToStage22()
  sceneManager.changeScene(require 'src/stages/debugStage2-2')
end

local function goToStage23()
  sceneManager.changeScene(require 'src/stages/debugStage2-3')
end

local function goToStage24()
  sceneManager.changeScene(require 'src/stages/debugStage2-4')
end

local function goToStage25()
  sceneManager.changeScene(require 'src/stages/debugStage2-5')
end

local function goToStage31()
  sceneManager.changeScene(require 'src/stages/debugStage3-1')
end

local function goToStage32()
  sceneManager.changeScene(require 'src/stages/debugStage3-2')
end

local function goToStage33()
  sceneManager.changeScene(require 'src/stages/debugStage3-3')
end

local function goToStage34()
  sceneManager.changeScene(require 'src/stages/debugStage3-4')
end

local function goToStage35()
  sceneManager.changeScene(require 'src/stages/debugStage3-5')
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load()
  verticalScroll = 0;

  scrollableButtonManager = buttonManager.new()
  scrollableButtonManager:load()

  fixedButtonManager = buttonManager.new()
  fixedButtonManager:load()

  scrollableButtonManager:newTextButton({
    text = 'Stage 1-1',
    fn = goToStage11,
    x = 150,
    y = 50,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-2',
    fn = goToStage12,
    x = 150,
    y = 150,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-3',
    fn = goToStage13,
    x = 150,
    y = 250,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-4',
    fn = goToStage14,
    x = 150,
    y = 350,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-5',
    fn = goToStage15,
    x = 150,
    y = 450,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 2-1',
    fn = goToStage21,
    x = 500,
    y = 50,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-2',
    fn = goToStage22,
    x = 500,
    y = 150,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-3',
    fn = goToStage23,
    x = 500,
    y = 250,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-4',
    fn = goToStage24,
    x = 500,
    y = 350,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-5',
    fn = goToStage25,
    x = 500,
    y = 450,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 3-1',
    fn = goToStage31,
    x = 850,
    y = 50,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-2',
    fn = goToStage32,
    x = 850,
    y = 150,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-3',
    fn = goToStage33,
    x = 850,
    y = 250,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-4',
    fn = goToStage34,
    x = 850,
    y = 350,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-5',
    fn = goToStage35,
    x = 850,
    y = 450,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 3-6',
    fn = goToStage35,
    x = 850,
    y = 550,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-7',
    fn = goToStage35,
    x = 850,
    y = 650,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-8',
    fn = goToStage35,
    x = 850,
    y = 750,
  })

  fixedButtonManager:newArrowButton({
    fn = goBack,
    x = 25,
    y = 25,
    direction = 'left',
  })

  music = assets.menuMusic
  music:play()
end

function menu.unload()
  scrollableButtonManager:unload()
  fixedButtonManager:unload()
  music:pause()
end

function menu.update(dt)
  scrollableButtonManager:update(dt, verticalScroll)
  fixedButtonManager:update(dt)
end

function menu.draw()
  love.graphics.push()
  love.graphics.translate(0, verticalScroll)
  scrollableButtonManager:draw()
  love.graphics.pop()

  fixedButtonManager:draw()
end

function menu.mousereleased(_, _, button)
  scrollableButtonManager:mouseReleased(button)
  fixedButtonManager:mouseReleased(button)
end

function menu.keypressed(key)
  if key == 'up' then
    verticalScroll = verticalScroll + scrollAmount;
  elseif key == 'down' then
    verticalScroll = verticalScroll - scrollAmount;
  end
end

return menu;
