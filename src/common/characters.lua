local assets = require "src/common/assets"
local utils = require "src/common/utils"
local dictionary = require 'src/common/dictionary'
local globals = require 'src/common/globals'

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
  protagonist = utils.tableWithAddedTable(
    generic,
    {
      title=globals.playerName,
      ['image']=assets.protagonist,
      leftBody=assets.protagonistBody,
    }
  ),
  bob = utils.tableWithAddedTable(
    generic,
    {
      title='Bob',
      ['image']=assets.bob,
      leftBody=assets.bobBody,
    }
  ),
  creator = utils.tableWithAddedTable(
    generic,
    {
      title = dictionary.localize('Criador'),
      ['image']=assets.creator,
      leftBody=assets.creatorBody,
    }
  ),
  melissa = utils.tableWithAddedTable(
    generic,
    {
      title='Melissa',
      ['image']=assets.melissa,
      leftBody=assets.melissaBody,
    }
  ),
  windy = utils.tableWithAddedTable(
    generic,
    {
      title='Windy',
      ['image']=assets.windy,
      leftBody=assets.windyBody,
    }
  ),
  shadTravis = utils.tableWithAddedTable(
    generic,
    {
      title='Shad ' .. dictionary.localize('e') .. ' Travis',
      ['image']=assets.shadTravis,
      leftBody=assets.shadBody,
      rightBody=assets.travisBody,
    }
  ),
  bobProtagonist = utils.tableWithAddedTable(
    generic,
    {
      title=globals.playerName .. ' ' .. dictionary.localize('e') .. ' Bob',
      ['image']=assets.bobProtagonist,
      leftBody=assets.bobBody,
      rightBody=assets.protagonistBody,
    }
  ),
  melissaWindy = utils.tableWithAddedTable(
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
