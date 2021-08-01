local assets = require 'src/common/assets'

local CARD_WIDTH = 124
local CARD_HEIGHT = 178
local CARD_SCALE = 0.7

local colors = {
  {1, 1, 1},
  {0, 0, 1},
  {1, 0, 0},
  {0, 1, 0},
  {0, 1, 1},
  {1, 1, 0},
}

local cardObject = {}

local function newCard(i)
  return {
    image = assets.cardImages[i],
    kind = i,
    x = 0,
    y = 0,
    flipped = false,
    matched = false,
    hot = false,
    width = CARD_WIDTH * CARD_SCALE,
    height = CARD_HEIGHT * CARD_SCALE,
    scaleX = CARD_SCALE,
    scaleY = CARD_SCALE,
  }
end

function cardObject.newPair(i)
  return {newCard(i), newCard(i)}
end

-- @flipped True if card should be forced to be showed flipped
function cardObject.draw(card, flipped)
  local image = card.image
  if not card.flipped then
    image = assets.cardBack
  end
  if flipped then
    image = card.image
  end

  local extraScale = 1
  if card.hot  then
    extraScale = 1.2
  end

  local width = card.width
  local height = card.height

  -- code for bigger cards
  -- if card.flipped then
  --   extraScale = 178/500

  --   width = width * extraScale
  --   height = height * extraScale
  -- end


  love.graphics.setColor(1, 1, 1)
  -- love.graphics.setColor(colors[card.kind])
  love.graphics.draw(
    image,
    card.x + width*(1-extraScale)/2,
    card.y + height*(1-extraScale)/2,
    0,
    card.scaleX * extraScale,
    card.scaleY * extraScale
  )
end

return cardObject;
