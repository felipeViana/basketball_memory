local gridUtils = {}

local x0 = 50
local y0 = 50

local dx = 120
local dy = 160

function gridUtils.makeGrid(totalX, totalY)
  local grid = {}

  for i = 0, totalX - 1 do
    for j = 0, totalY - 1 do
      table.insert(grid, {x0 + dx * i, y0 + dy * j})
    end
  end

  return grid;
end

return gridUtils;
