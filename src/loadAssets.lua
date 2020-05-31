local assets = require "src/assets"

local loadAssets = {};

local function loadCards()
  assets.card1 = love.graphics.newImage("assets/cards/1-1.png")
  assets.card2 = love.graphics.newImage("assets/cards/1-2.png")
  assets.card3 = love.graphics.newImage("assets/cards/1-3.jpg")
  assets.card4 = love.graphics.newImage("assets/cards/1-4.jpg")
  assets.card5 = love.graphics.newImage("assets/cards/1-5.png")
  assets.card6 = love.graphics.newImage("assets/cards/1-6.png")
  assets.cardBack = love.graphics.newImage("assets/cards/card-back.png")
end

local function loadFaces()
  assets.bob = love.graphics.newImage("assets/faces/bob.png")
  assets.protagonist = love.graphics.newImage("assets/faces/protagonist.png")
  assets.generic = love.graphics.newImage("assets/faces/generic.png")
end

local function loadBackgrounds()
  assets.genericBackground = love.graphics.newImage("assets/backgrounds/generic_bg.jpeg")
  assets.kobeBackground = love.graphics.newImage("assets/backgrounds/kobe_bg.jpeg")
  assets.stageBackground = love.graphics.newImage("assets/backgrounds/stage_bg.jpeg")
  assets.titleBackground = love.graphics.newImage("assets/backgrounds/title_bg.jpeg")
end

local function loadImgs()
  loadCards()
  loadFaces()
  loadBackgrounds()
end

local function loadFonts()
  assets.squareFont = love.graphics.newFont('assets/fonts/Square.ttf', 28)
  assets.textFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 28)
  assets.bigFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 36)
end

local function loadSfx()
  assets.typeSound = love.audio.newSource("assets/sfx/typeSound.wav", "static")
  assets.talkSound = love.audio.newSource("assets/sfx/talk.wav", "static")
end

function loadAssets.loadAll()
  loadImgs()
  loadFonts()
  loadSfx()
end

return loadAssets;
