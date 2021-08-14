local colors = require 'src/common/colors'

local checkBoxButton = {}

local BUTTON_HOT_COLOR = {95/255, 158/255, 168/255}

local SIZE = 40

function checkBoxButton.new(arg)
  return {
    fn = arg.fn,
    x = arg.x,
    y = arg.y,
    hot = false,
    checked = false,
    type = 'checkBoxButton',
    width = SIZE,
    height = SIZE
  }
end

function checkBoxButton.draw(button)
  love.graphics.setColor(1, 1, 1)

  love.graphics.setColor(colors.black)

  love.graphics.rectangle(
    'line',
    button.x,
    button.y,
    SIZE,
    SIZE
  )

  love.graphics.setColor(colors.green)
  if button.checked then
    love.graphics.line(
      button.x,
      button.y,
      button.x + SIZE,
      button.y + SIZE
    )

    love.graphics.line(
      button.x,
      button.y + SIZE,
      button.x + SIZE,
      button.y
    )
  end

end

return checkBoxButton;
