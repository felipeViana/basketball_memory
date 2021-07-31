local globals = require 'src/common/globals'
local dictionary = {}

local englishDict = require 'src/locales/en'
local portugueseDict = require 'src/locales/pt'

function dictionary.localize(word)
  if globals.language == 'en' then
    return englishDict[word]
  else
    return portugueseDict[word]
  end
end

return dictionary;
