local assets = require 'src/common/assets'

local CARD_WIDTH = 124
local CARD_HEIGHT = 178
local CARD_SCALE = 0.7

local cardImages = {
  assets.card1,
  assets.card2,
  assets.card3,
  assets.card4,
  assets.card5,
  assets.card6,
};
local cardObject = {}

local function newCard(i, j)
  return {
    image = cardImages[i],
    kind = i,
    flipped = false,
    matched = false,
    -- x = CARD_WIDTH * i,
    -- y = CARD_HEIGHT * j,
    width = CARD_WIDTH * CARD_SCALE,
    height = CARD_HEIGHT * CARD_SCALE,
    scaleX = CARD_SCALE,
    scaleY = CARD_SCALE,
  }
end

function cardObject.newPair(i)
  local card1 = newCard(i, 1)
  local card2 = newCard(i, 2)

  return {card1, card2}
end

function cardObject.draw(card)
  local image = card.image
  if not card.flipped then
    image = assets.cardBack
  end

  love.graphics.draw(image, card.x, card.y, 0, card.scaleX, card.scaleY)
end

return cardObject;
