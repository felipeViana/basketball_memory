local cardObject = require 'src/components/cardObject'
local utils = require 'src/common/utils'

local flippedNow

local clickedX
local clickedY
local mouseReleased
local cards

local cardManager = {}

function cardManager.newPairs(totalPairs)
  for i = 1, totalPairs do
    local newPair = cardObject.newPair(i)

    table.insert(cards, newPair[1])
    table.insert(cards, newPair[2])
  end

  return cards;
  -- positions = utils.shuffle(positions)
end

function cardManager.load()
  cards = {}
  flippedNow = 0
end

function cardManager.unload()
  cards = {}
end

local function updateCards()
  -- check for newly revelead card
  if mouseReleased then
    for _, card in pairs(cards) do
      if clickedX >= card.x and clickedX <= card.x + card.width
      and clickedY >= card.y and clickedY <= card.y + card.height then
        if not card.flipped then
          card.flipped = true
          flippedNow = flippedNow + 1
        end
      end
    end
  end

  -- check for match
  local pairMatched = false
  if flippedNow == 2 then
    local kindsFlipped = nil
    for _, card in pairs(cards) do
      if card.flipped and not card.matched then
        if card.kind == kindsFlipped then
          pairMatched = true
        end
        kindsFlipped = card.kind
      end
    end

    if pairMatched then
      for _, card in pairs(cards) do
        if card.flipped and not card.matched then
          card.matched = true
        end
      end
    end
  end

  -- unflip if no match
  if flippedNow > 2 then
    for _, card in pairs(cards) do
      if not card.matched then
        card.flipped = false
      end
    end
    flippedNow = 0
  end
end

function cardManager.update(dt)
  updateCards()

  local gameComplete = true
  for _, card in pairs(cards) do
    if card.matched == false then
      gameComplete = false
    end
  end

  return gameComplete
end

function cardManager.draw()
  for _, card in pairs(cards) do
    cardObject.draw(card)
  end
end

function cardManager.mouseReleased(x, y, button)
  if button == 1 then
    clickedX = x
    clickedY = y
    mouseReleased = true
  else
    mouseReleased = false
  end
end

return cardManager;
