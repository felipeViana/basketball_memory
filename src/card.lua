local utils = require 'src/utils'
local assets = require 'src/assets'

local CARD_WIDTH = 124
local CARD_HEIGHT = 178
local CARD_DRAW_FACTOR = 0.7
local flippedNow = 0

local card = {
};

local cards = {};

function card.createCards( ... )
  local cardImages = {
    assets.image1,
    assets.image2,
    assets.image3,
    assets.image4,
    assets.image5,
    assets.image6,
  };

  local positions = {
    {x = CARD_WIDTH, y = CARD_HEIGHT},
    {x = CARD_WIDTH, y = 2*CARD_HEIGHT},

    {x = 2*CARD_WIDTH, y = CARD_HEIGHT},
    {x = 2*CARD_WIDTH, y = 2*CARD_HEIGHT},

    {x = 3*CARD_WIDTH, y = CARD_HEIGHT},
    {x = 3*CARD_WIDTH, y = 2*CARD_HEIGHT},

    {x = 4*CARD_WIDTH, y = CARD_HEIGHT},
    {x = 4*CARD_WIDTH, y = 2*CARD_HEIGHT},

    {x = 5*CARD_WIDTH, y = CARD_HEIGHT},
    {x = 5*CARD_WIDTH, y = 2*CARD_HEIGHT},

    {x = 6*CARD_WIDTH, y = CARD_HEIGHT},
    {x = 6*CARD_WIDTH, y = 2*CARD_HEIGHT},
  }
  positions = utils.shuffle(positions)

  for i = 1, 6 do
    table.insert(cards, {x = positions[i].x, y = positions[i].y, image=cardImages[i], flipped=false, kind = i, matched = false})
    table.insert(cards, {x = positions[i+6].x, y = positions[i+6].y, image=cardImages[i], flipped=false, kind = i, matched = false})
  end
end

function card.drawCards( ... )
  for i, card in ipairs(cards) do
    if card.flipped then
      love.graphics.draw(card.image, card.x, card.y, 0, CARD_DRAW_FACTOR, CARD_DRAW_FACTOR)
    else
      love.graphics.draw(assets.imageCardBack, card.x, card.y, 0, CARD_DRAW_FACTOR, CARD_DRAW_FACTOR)
    end
  end
end

function card.updateCards(mouseX, mouseY, mouseReleased)
  -- check newly revelead card
  if mouseReleased then
    for i, card in ipairs(cards) do
      if mouseX >= card.x and mouseX <= card.x + CARD_WIDTH * CARD_DRAW_FACTOR
      and mouseY >= card.y and mouseY <= card.y + CARD_HEIGHT * CARD_DRAW_FACTOR then
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
    for i, card in ipairs(cards) do
      if card.flipped and not card.matched then
        if card.kind == kindsFlipped then
          pairMatched = true
        end
        kindsFlipped = card.kind
      end
    end

    if pairMatched then
      for i, card in ipairs(cards) do
        if card.flipped and not card.matched then
          card.matched = true
        end
      end
    end
  end

  -- unflip if no match
  if flippedNow > 2 then
    for i, card in ipairs(cards) do
      if not card.matched then
        card.flipped = false
      end
    end
    flippedNow = 0
  end

  -- check for matches
end

return card
