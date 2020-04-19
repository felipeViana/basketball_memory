local CARD_WIDTH = 124
local CARD_HEIGHT = 178

local card = {

};

local cards = {}

function card.createCards( ... )
  -- table.insert(cards, {x = 0, y = 0, image=image1, flipped=false})
  -- table.insert(cards, {x = CARD_WIDTH, y = 0, image=image2, flipped=false})

  for i = 1, 8 do
    for j = 1, 3 do
      if (i+j) % 2 == 0 then
        table.insert(cards, {x = i*CARD_WIDTH, y = j*CARD_HEIGHT, image=image1, flipped=false})
      else
        table.insert(cards, {x = i*CARD_WIDTH, y = j*CARD_HEIGHT, image=image2, flipped=false})
      end
    end
  end
end

function card.drawCards( ... )
  for i, card in ipairs(cards) do
    if not card.flipped then
      love.graphics.draw(card.image, card.x, card.y, 0, 0.7, 0.7)
    else
      love.graphics.draw(imageCardBack, card.x, card.y, 0, 0.7, 0.7)
    end
  end
end

function card.updateCards(mouseX, mouseY, mouseReleased)
  if mouseReleased then
    -- cards[1].flipped = true

    for i, card in ipairs(cards) do
      if mouseX >= card.x and mouseX <= card.x + CARD_WIDTH * 0.7
      and mouseY >= card.y and mouseY <= card.y + CARD_HEIGHT * 0.7 then
        card.flipped = true
      end
    end
  end
end

return card
