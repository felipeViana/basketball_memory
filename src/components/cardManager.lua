local gridUtils = require 'src/common/gridUtils'
local assets = require 'src/common/assets'
local drawUtils = require 'src/common/drawUtils'
local dictionary = require 'src/common/dictionary'

local cardObject = require 'src/components/cardObject'
local soundManager = require 'src/components/soundManager'

local lume = require "libs/lume"

local flippedNow
local mouseReleased
local cards = {}
local currentFlippedCards = {}
local lastPairState

local cardManager = {}

local GRID_X = 550
local GRID_Y = 100
local DELTA_Y = 75

local showingForceFlippedCards = false
local showingForceFlippedRemaingTime = 2

-- TODO: make it work for pairs of 3 cards as well
-- TODO: refactor flipCard

function cardManager.newPairs(rows, columns)
  local totalPairs = rows * columns / 2
  cards = cardObject.newPairs(totalPairs)

  local shuffledCards = lume.shuffle(cards)
  local grid = gridUtils.makeGrid(rows, columns)
  for i = 1, #shuffledCards do
    shuffledCards[i].x = grid[i][1]
    shuffledCards[i].y = grid[i][2]
  end
  return shuffledCards;
end

function cardManager.load(showCardsBeforeStarting, timeToShowCardsBeforeStarting)
  showingForceFlippedCards = showCardsBeforeStarting
  showingForceFlippedRemaingTime = timeToShowCardsBeforeStarting

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

-- should be called only when card is flipped by player
local function flipCard(card)
  if not card.flipped then
    card.flipped = true
    table.insert(currentFlippedCards, card)
    flippedNow = flippedNow + 1
  end

  if flippedNow == 1 then
    lastPairState = nil
    return false, false
  elseif flippedNow == 2 then
    local match = isMatch(currentFlippedCards[1], currentFlippedCards[2])

    if match then
      markPairAsMatched(card)
      removePairFromQueue()
      flippedNow = 0
      lastPairState = 'right'
      soundManager.playSound(assets.rightPair)
      return false, true
    else
      lastPairState = 'wrong'
      soundManager.playSound(assets.wrongPair)
      return true, false
    end
  elseif flippedNow == 3 then
    unflipPair()
    removePairFromQueue()
    flippedNow = 1
    lastPairState = nil
    return false, false
  end

  error('cardManager :: flippedNow should be either 1, 2 or 3')
end

local function updateCards()
  local mouseX, mouseY = love.mouse.getPosition()
  mouseX = mouseX - drawUtils.getScreenDx()
  mouseY = mouseY - drawUtils.getScreenDy()

  local hasMissed, hasScored
  for _, card in pairs(cards) do
    card.hot = mouseX >= card.x and mouseX <= card.x + card.width and
               mouseY >= card.y and mouseY <= card.y + card.height

    if mouseReleased and card.hot and not card.flipped then
      hasMissed, hasScored = flipCard(card)
    end

  end

  mouseReleased = false

  return hasMissed, hasScored
end

function cardManager.update(dt)
  if showingForceFlippedCards then
    showingForceFlippedRemaingTime = showingForceFlippedRemaingTime - dt

    if showingForceFlippedRemaingTime < 0 then
      showingForceFlippedCards = false
    end
  else
    local hasMissed, hasScored = updateCards()

    local gameComplete = true
    for _, card in pairs(cards) do
      if card.matched == false then
        gameComplete = false
      end
    end

    return gameComplete, hasMissed, hasScored
  end
end

function cardManager.draw()
  for _, card in pairs(cards) do
    cardObject.draw(card, showingForceFlippedCards)
  end

  love.graphics.setFont(assets.frostbiteFont)
  if lastPairState == 'right' then
    love.graphics.setColor(0, 1, 0)
    love.graphics.print(string.upper(dictionary.localize('Score')), GRID_X, GRID_Y + 1.5 * DELTA_Y)
  elseif lastPairState == 'wrong' then
    love.graphics.setColor(1, 0, 0)
    love.graphics.print(string.upper(dictionary.localize('Missed')), GRID_X, GRID_Y + 1.5 * DELTA_Y)
  end
end

function cardManager.mouseReleased(button)
  if button == 1 then
    mouseReleased = true
  end
end

return cardManager;
