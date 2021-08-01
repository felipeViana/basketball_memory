local globals = require 'src/common/globals'
local dictionary = {}

local englishDict = require 'src/locales/en'
local portugueseDict = require 'src/locales/pt'

function dictionary.localize(word)
  if globals.language == 'en' then
    return englishDict.locales()[word]
  elseif globals.language == 'pt' then
    return portugueseDict.locales()[word]
  else
    error('dictionary :: invalid language!')
  end
end

return dictionary;
