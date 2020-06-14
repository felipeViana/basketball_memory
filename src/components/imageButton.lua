local imageButton = {}

local BUTTON_HOT_COLOR = {95/255, 158/255, 168/255}

function imageButton.new(arg)
  return {
    fn = arg.fn,
    x = arg.x,
    y = arg.y,
    image = arg.image,
    width = arg.imageWidth * arg.scaleX,
    height = arg.imageHeight * arg.scaleY,
    scaleX = arg.scaleX,
    scaleY = arg.scaleY,
    hot = false,
    type = 'imageButton',
  }
end

function imageButton.draw(button)
  love.graphics.setColor(1, 1, 1)

  if button.hot then
    love.graphics.rectangle(
      'line',
      button.x,
      button.y,
      button.width,
      button.height
    )
    love.graphics.setColor(BUTTON_HOT_COLOR)
  end

  love.graphics.draw(button.image, button.x, button.y, 0, button.scaleX, button.scaleY)
end

return imageButton;
