local utils = {}

local function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[deepcopy(orig_key)] = deepcopy(orig_value)
      end
      setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

local function tableWithAddedProperty(table, key, value)
  local newTable = deepcopy(table)
  newTable[key] = value
  return newTable
end

function utils.shuffle(array)
  -- fisher-yates
  local output = { }
  local random = math.random

  for index = 1, #array do
    local offset = index - 1
    local value = array[index]
    local randomIndex = offset*random()
    local flooredIndex = randomIndex - randomIndex%1

    if flooredIndex == offset then
      output[#output + 1] = value
    else
      output[#output + 1] = output[flooredIndex + 1]
      output[flooredIndex + 1] = value
    end
  end

  return output
end

function utils.tableWithAddedTable(t1, t2)
  local newTable = deepcopy(t1)
  for k, v in pairs(t2) do
    newTable[k] = v
  end
  return newTable
end

return utils
