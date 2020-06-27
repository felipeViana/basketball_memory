local assets = require "src/common/assets"
local dictionary = require 'src/common/dictionary'
local globals = require 'src/common/globals'
local lume = require "libs/lume"

local generic = {
  image=assets.generic,
  talkSound=assets.talkSound,
  typedNotTalked=false,
}

local characters = {
  narrator = {
    title = dictionary.localize('Narrador'),
    talkSound=assets.typeSound,
  },
  protagonist = lume.extend(
    generic,
    {
      title=globals.playerName,
      ['image']=assets.protagonist,
      leftBody=assets.protagonistBody,
    }
  ),
  bob = lume.extend(
    generic,
    {
      title='Bob',
      ['image']=assets.bob,
      leftBody=assets.bobBody,
    }
  ),
  bobFather = lume.extend(
    generic,
    {
      title='pai do Bob',
      ['image']=assets.generic,
      leftBody=assets.genericBody,
    }
  ),
  creator = lume.extend(
    generic,
    {
      title = dictionary.localize('Criador'),
      ['image']=assets.creator,
      leftBody=assets.creatorBody,
    }
  ),
  melissa = lume.extend(
    generic,
    {
      title='Melissa',
      ['image']=assets.melissa,
      leftBody=assets.melissaBody,
    }
  ),
  windy = lume.extend(
    generic,
    {
      title='Windy',
      ['image']=assets.windy,
      leftBody=assets.windyBody,
    }
  ),
  shadTravis = lume.extend(
    generic,
    {
      title='Shad ' .. dictionary.localize('e') .. ' Travis',
      ['image']=assets.shadTravis,
      leftBody=assets.shadBody,
      rightBody=assets.travisBody,
    }
  ),
  bobProtagonist = lume.extend(
    generic,
    {
      title=globals.playerName .. ' ' .. dictionary.localize('e') .. ' Bob',
      ['image']=assets.bobProtagonist,
      leftBody=assets.bobBody,
      rightBody=assets.protagonistBody,
    }
  ),
  melissaWindy = lume.extend(
    generic,
    {
      title='Melissa ' .. dictionary.localize('e') .. ' Windy',
      ['image']=assets.melissaWindy,
      leftBody=assets.melissaBody,
      rightBody=assets.windyBody,
    }
  ),
}

return characters;
