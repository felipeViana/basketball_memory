local assets = require "src/assets"

local load_assets = {};

function load_cards()
  assets.card1 = love.graphics.newImage("assets/images/1-1.png")
  assets.card2 = love.graphics.newImage("assets/images/1-2.png")
  assets.card3 = love.graphics.newImage("assets/images/1-3.jpg")
  assets.card4 = love.graphics.newImage("assets/images/1-4.jpg")
  assets.card5 = love.graphics.newImage("assets/images/1-5.png")
  assets.card6 = love.graphics.newImage("assets/images/1-6.png")
  assets.cardBack = love.graphics.newImage("assets/images/card-back.png")
end

function load_faces()
  assets.bob = love.graphics.newImage("assets/faces/bob.png")
  assets.protagonist = love.graphics.newImage("assets/faces/protagonist.png")
  assets.generic = love.graphics.newImage("assets/faces/generic.png")
end

function load_backgrounds()
  assets.bgImage = love.graphics.newImage("assets/images/bg_game.jpeg")
  assets.kobeBackground = love.graphics.newImage("assets/images/kobe.jpeg")
end

function load_imgs()
  load_cards()
  load_faces()
  load_backgrounds()
end

function load_fonts()
  assets.textFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 28)
end

function load_sfx()
  assets.typeSound = love.audio.newSource("assets/sfx/typeSound.wav", "static")
  assets.talkSound = love.audio.newSource("assets/sfx/talk.wav", "static")
end

function load_assets.load_all()
  load_imgs()
  load_fonts()
  load_sfx()
end

return load_assets;
