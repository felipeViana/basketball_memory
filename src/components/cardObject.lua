local lume = require 'libs/lume'

local assets = require 'src/common/assets'

local CARD_WIDTH = 160
local CARD_HEIGHT = 200
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


  local extraScale = 1
  if not isFlipped then
    image = assets.cardBack
    extraScale = 0.4
  end

  local x = card.x
  local y = card.y

  local width = card.width
  local height = card.height
  
  if card.hot and not isFlipped then
    extraScale = 0.5

    x = x - 0.1 * width / 2;
    y = y - 0.1 * height / 2;
  end


  love.graphics.setColor(1, 1, 1)

  love.graphics.draw(
    image,
    x,
    y,
    0,
    card.scaleX * extraScale,
    card.scaleY * extraScale
  )
end

return cardObject;
