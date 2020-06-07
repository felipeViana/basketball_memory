local cardObject = require 'src/components/cardObject'
local utils = require 'src/common/utils'
local gridUtils = require 'src/common/gridUtils'
local assets = require 'src/common/assets'

local flippedNow
local mouseReleased
local cards = {}
local currentFlippedCards = {}
local lastPairState

local cardManager = {}

-- TODO: make it work for pairs of 3 cards as well
-- TODO: refactor flipCard

function cardManager.newPairs(rows, columns)
  local totalPairs = rows * columns / 2
  for i = 1, totalPairs do
    local newPair = cardObject.newPair(i)

    table.insert(cards, newPair[1])
    table.insert(cards, newPair[2])
  end

  local shuffledCards = utils.shuffle(cards)
  local grid = gridUtils.makeGrid(rows, columns)
  for i = 1, #shuffledCards do
    shuffledCards[i].x = grid[i][1]
    shuffledCards[i].y = grid[i][2]
  end
  return shuffledCards;
end

function cardManager.load()
  lastPairState = nil
  cards = {}
  currentFlippedCards = {}
  flippedNow = 0
end

function cardManager.unload()
  cards = {}
end

local function isMatch(card1, card2)
  return card1.kind == card2.kind
end

local function markPairAsMatched()
  currentFlippedCards[1].matched = true
  currentFlippedCards[2].matched = true
end

local function removePairFromQueue()
    table.remove(currentFlippedCards, 1)
    table.remove(currentFlippedCards, 1)
end

local function unflipPair()
  currentFlippedCards[1].flipped = false
  currentFlippedCards[2].flipped = false
end

local function flipCard(card)
  if not card.flipped then
    card.flipped = true
    table.insert(currentFlippedCards, card)
    flippedNow = flippedNow + 1
  end

  if flippedNow == 1 then
    lastPairState = nil
  end

  if flippedNow == 2 then
    local match = isMatch(currentFlippedCards[1], currentFlippedCards[2])

    if match then
      markPairAsMatched(card)
      removePairFromQueue()
      flippedNow = 0
      lastPairState = 'right'
    else
      lastPairState = 'wrong'
    end
  end

  if flippedNow == 3 then
    unflipPair()
    removePairFromQueue()
    flippedNow = 1
    lastPairState = nil
  end
end

local function updateCards()
  local mouseX, mouseY = love.mouse.getPosition()

  for _, card in pairs(cards) do
    card.hot = mouseX >= card.x and mouseX <= card.x + card.width and
               mouseY >= card.y and mouseY <= card.y + card.height

    if mouseReleased and card.hot then
      flipCard(card)
    end

  end

  mouseReleased = false
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

  love.graphics.setFont(assets.frostbiteFont)
  if lastPairState == 'right' then
    love.graphics.setColor(0, 1, 0)
    love.graphics.print("ACERTOU", 600, 300)
  elseif lastPairState == 'wrong' then
    love.graphics.setColor(1, 0, 0)
    love.graphics.print("ERROU", 600, 300)
  end
end

function cardManager.mouseReleased(button)
  if button == 1 then
    mouseReleased = true
  end
end

return cardManager;
