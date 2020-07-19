local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'

local lume = require 'libs/lume'

local messagesCreator = {}

local function messages1(fn)
  return {
    {
      message = dictionary.localize('1.1'),
      config = lume.extend(
        characters.narrator,
        {
          textSpeed='medium',
        }
      ),
    },
    {
      message = dictionary.localize('1.2'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages2(fn)
  return {
    {
      message = dictionary.localize('2.1'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('2.2'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('2.3'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('2.4'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('2.5'),
      config = lume.extend(
        characters.creator,
        {
          oncomplete = fn
        }
      ),
    },
  }
end

local function messages3p1(fn)
  return {
    {
      message = dictionary.localize('3-1.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-1.2'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-1.3'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-1.4'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-1.5'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-1.6'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-1.7'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
          textSpeed = 'medium',
        }
      ),
    },
  }
end

local function messages3p2(fn)
  return {
    {
      message = dictionary.localize('3-2.1'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.2'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-2.3'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.4'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-2.5'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.6'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-2.7'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.8'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.9'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.10'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.11'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.12'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.13'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.14'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.15'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.16'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.17'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.18'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.19'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('3-2.20'),
      config = characters.creator,
    },
    {
      message = dictionary.localize('3-2.21'),
      config = lume.extend(
        characters.bob,
        {
          oncomplete=fn,
        }
      ),
    },
  }
end

local function messages3p3(fn)
  return {
    {
      message = dictionary.localize('3-3.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-3.2'),
      config = characters.bobFather,
    },
    {
      message = dictionary.localize('3-3.3'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-3.4'),
      config = characters.bobFather,
    },
    {
      message = dictionary.localize('3-3.5'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-3.6'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-3.7'),
      config = characters.bobFather,
    },
    {
      message = dictionary.localize('3-3.8'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-3.9'),
      config = characters.bobFather,
    },
    {
      message = dictionary.localize('3-3.10'),
      config = lume.extend(
        characters.protagonist,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages3p4(fn)
  return {
    {
      message = dictionary.localize('3-4.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('3-4.2'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('3-4.3'),
      config = lume.extend(
        characters.creator,
        {
          leftBody = assets.protagonistBody,
          rightBody = assets.creatorBody,
        }
      )
    },
    {
      message = dictionary.localize('3-4.4'),
      config = lume.extend(
        characters.protagonist,
        {
          rightBody = assets.creatorBody,
        }
      )
    },
    {
      message = dictionary.localize('3-4.5'),
      config = lume.extend(
        characters.creator,
        {
          leftBody = assets.protagonistBody,
          rightBody = assets.creatorBody,
          options = {
            {'Sim', fn},
            {'Não', fn},
          },
          textSpeed = 'medium',
        }
      )
    }
  }
end

local function messages4(fn)
  return {
    {
      message = dictionary.localize('4.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('4.2'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('4.3'),
      config = characters.travis,
    },
    {
      message = dictionary.localize('4.4'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('4.5'),
      config = characters.travis,
    },
    {
      message = dictionary.localize('4.6'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('4.7'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.8'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.9'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.10'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('4.11'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.12'),
      config = characters.travis,
    },
    {
      message = dictionary.localize('4.13'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.14'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('4.15'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('4.16'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.17'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.18'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('4.19'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('4.20'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.21'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.22'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('4.23'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('4.24'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.25'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('4.26'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('4.27'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('4.28'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('4.29'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('4.30'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('4.31'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('4.32'),
      config = characters.melissaWindy,
    },
    {
      message = dictionary.localize('4.33'),
      config = characters.bobProtagonist,
    },
    {
      message = dictionary.localize('4.34'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages5p1(fn)
  return {
    {
      message = dictionary.localize('5-1.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-1.2'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-1.3'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-1.4'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-1.5'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('5-1.6'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('5-1.7'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('5-1.8'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages5p2(fn)
  return {
    {
      message = dictionary.localize('5-2.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-2.2'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('5-2.3'),
      config = lume.extend(
        characters.creator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages6(fn)
  return {
    {
      message = dictionary.localize('6.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.2'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.3'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('6.4'),
      config = characters.windy,
    },
    {
      message = dictionary.localize('6.5'),
      config = characters.travis,
    },
    {
      message = dictionary.localize('6.6'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.7'),
      config = characters.melissa,
    },
    {
      message = dictionary.localize('6.8'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.9'),
      config = characters.bobProtagonist,
    },
    {
      message = dictionary.localize('6.10'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.11'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('6.12'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('6.13'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.14'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('6.15'),
      config = characters.bob,
    },
    {
      message = dictionary.localize('6.16'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('6.17'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages7(fn)
  return {
    {
      message = dictionary.localize('7.1'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('7.2'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('7.3'),
      config = characters.narrator,
    },
    {
      message = dictionary.localize('7.4'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('7.5'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('7.6'),
      config = characters.shad,
    },
    {
      message = dictionary.localize('7.7'),
      config = characters.travis,
    },
    {
      message = dictionary.localize('7.8'),
      config = characters.protagonist,
    },
    {
      message = dictionary.localize('7.9'),
      config = lume.extend(
        characters.narrator,
        {
          oncomplete = fn,
        }
      ),
    },
  }
end

local function messages8(fn)
  error('not implemented')
end

local function messages9(fn)
  error('not implemented')
end

local function messages10(fn)
  error('not implemented')
end

local function messages11(fn)
  error('not implemented')
end

local function messages12(fn)
  error('not implemented')
end

local function messages13(fn)
  error('not implemented')
end

function messagesCreator.getMessage(sceneName, fn)
  if sceneName == '1' then
    return messages1(fn)
  elseif sceneName == '2' then
    return messages2(fn)
  elseif sceneName == '3-1' then
    return messages3p1(fn)
  elseif sceneName == '3-2' then
    return messages3p2(fn)
  elseif sceneName == '3-3' then
    return messages3p3(fn)
  elseif sceneName == '3-4' then
    return messages3p4(fn)
  elseif sceneName == '4' then
    return messages4(fn)
  elseif sceneName == '5-1' then
    return messages5p1(fn)
  elseif sceneName == '5-2' then
    return messages5p2(fn)
  elseif sceneName == '6' then
    return messages6(fn)
  elseif sceneName == '7' then
    return messages7(fn)
  elseif sceneName == '8' then
    return messages8(fn)
  elseif sceneName == '9' then
    return messages9(fn)
  elseif sceneName == '10' then
    return messages10(fn)
  elseif sceneName == '11' then
    return messages11(fn)
  elseif sceneName == '12' then
    return messages12(fn)
  elseif sceneName == '13' then
    return messages13(fn)
  else
    error('invalid sceneName')
  end
end

return messagesCreator
