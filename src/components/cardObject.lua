local assets = require 'src/common/assets'

local CARD_WIDTH = 124
local CARD_HEIGHT = 178
local CARD_SCALE = 0.7

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

function cardObject.draw(card)
  local image = card.image
  if not card.flipped then
    image = assets.cardBack
  end

  local extraScale = 1
  if card.hot  then
    extraScale = 1.2
  end

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(image, card.x + card.width*(1-extraScale)/2, card.y + card.height*(1-extraScale)/2, 0, card.scaleX * extraScale, card.scaleY * extraScale)
end

return cardObject;
