local lume = require 'libs/lume'

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

local cardNumbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}

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

-- returns table containing many pairs of cards
-- each pair will have a random image from the possible card assets
function cardObject.newPairs(amount)
  local pairNumbers = lume.shuffle(cardNumbers)

  local pairs = {}
  for i = 1, amount do
    local newPair = cardObject.newPair(pairNumbers[i])

    table.insert(pairs, newPair[1])
    table.insert(pairs, newPair[2])
  end

  return pairs
end

-- @flipped True if card should be forced to be showed flipped
function cardObject.draw(card, flipped)
  local image = card.image

  local isFlipped = card.flipped or flipped

  if not isFlipped then
    image = assets.cardBack
  end

  local extraScale = 1
  if card.hot and not isFlipped then
    extraScale = 1.2
  end

  local width = card.width
  local height = card.height

  love.graphics.setColor(1, 1, 1)

  love.graphics.draw(
    image,
    card.x + width * (1 - extraScale) / 2,
    card.y + height * (1 - extraScale) / 2,
    0,
    card.scaleX * extraScale,
    card.scaleY * extraScale
  )
end

return cardObject;
