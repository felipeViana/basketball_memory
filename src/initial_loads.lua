local assets = require "src/assets"

local initial_loads = {};

function initial_loads.load_imgs()
  assets.image1 = love.graphics.newImage("assets/1-1.png")
  assets.image2 = love.graphics.newImage("assets/1-2.png")
  assets.image3 = love.graphics.newImage("assets/1-3.jpg")
  assets.image4 = love.graphics.newImage("assets/1-4.jpg")
  assets.image5 = love.graphics.newImage("assets/1-5.png")
  assets.image6 = love.graphics.newImage("assets/1-6.png")
  assets.imageCardBack = love.graphics.newImage("assets/card-back.png")
end

return initial_loads;
