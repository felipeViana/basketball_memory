local globals = require 'src/common/globals'
local dictionary = {}

local englishDict = require 'src/locales/en'
local portugueseDict = require 'src/locales/pt'

function dictionary.localize(word)
  if globals.language == 'en' then
    if englishDict.locales()[word] ~= nil then
      return englishDict.locales()[word]
    else
      error("dictionary :: missing key for en: " .. word)
    end
  elseif globals.language == 'pt' then
    if portugueseDict.locales()[word] ~= nil then
      return portugueseDict.locales()[word]
    else
      error("dictionary :: missing key for pt: " .. word)
    end
  else
    error('dictionary :: invalid language!')
  end
end

return dictionary;
