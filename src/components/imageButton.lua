local imageButton = {}
imageButton.meta = {
  __index = imageButton,
}

local BUTTON_HOT_COLOR = {95/255, 158/255, 168/255}

function imageButton.new(arg)
  local button = {
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
  setmetatable(button, imageButton.meta)

  return button
end

function imageButton:draw()
  love.graphics.setColor(1, 1, 1)

  if self.hot then
    love.graphics.rectangle(
      'line',
      self.x,
      self.y,
      self.width,
      self.height
    )
    love.graphics.setColor(BUTTON_HOT_COLOR)
  end

  love.graphics.draw(self.image, self.x, self.y, 0, self.scaleX, self.scaleY)
end

return imageButton;
