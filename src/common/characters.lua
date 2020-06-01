local assets = require "src/common/assets"
local utils = require "src/common/utils"
local dictionary = require 'src/common/dictionary'

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
      title=playerName,
      ['image']=assets.protagonist,
    }
  ),
  bob = utils.tableWithAddedTable(
    generic,
    {
      title='Bob',
      ['image']=assets.bob,
    }
  ),
  creator = utils.tableWithAddedTable(
    generic,
    {
      title = dictionary.localize('Criador'),
      ['image']=assets.creator,
    }
  ),
  melissa = utils.tableWithAddedTable(
    generic,
    {
      title='Melissa',
      ['image']=assets.melissa,
    }
  ),
  windy = utils.tableWithAddedTable(
    generic,
    {
      title='Windy',
      ['image']=assets.windy,
    }
  ),
  shadTravis = utils.tableWithAddedTable(
    generic,
    {
      title='Shad ' .. dictionary.localize('e') .. ' Travis',
      ['image']=assets.shadTravis,
    }
  ),
  bobProtagonist = utils.tableWithAddedTable(
    generic,
    {
      title=playerName .. ' ' .. dictionary.localize('e') .. ' Bob',
      ['image']=assets.bobProtagonist,
    }
  ),
  melissaWindy = utils.tableWithAddedTable(
    generic,
    {
      title='Melissa ' .. dictionary.localize('e') .. ' Windy',
      ['image']=assets.melissaWindy,
    }
  ),
}

return characters;
