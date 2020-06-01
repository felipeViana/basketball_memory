local assets = require "src/common/assets"
local utils = require "src/common/utils"
local globals = {};

function globals.loadAll()
  playerName = 'Felipe'
  language = 'english'

  defaultNarratorTalkingConfig = {
    title = 'Narrador',
    talkSound=assets.typeSound,
  }

  defaultPersonTalkingConfig = {
    image=assets.generic,
    talkSound=assets.talkSound,
    typedNotTalked=false,
  }

  defaultProtagonistTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title=playerName,
      ['image']=assets.protagonist,
    }
  )
  defaultBobTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Bob',
      ['image']=assets.bob,
    }
  )
  defaultCreatorTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Criador',
      ['image']=assets.creator,
    }
  )
  defaultMelissaTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Melissa',
      ['image']=assets.melissa,
    }
  )
  defaultWindyTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Windy',
      ['image']=assets.windy,
    }
  )
  defaultShadTravisTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Shad e Travis',
      ['image']=assets.shadTravis,
    }
  )
  defaultBobProtagonistTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='' .. playerName .. ' e Bob',
      ['image']=assets.bobProtagonist,
    }
  )
  defaultMelissaWindyTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      title='Melissa e Windy',
      ['image']=assets.melissaWindy,
    }
  )
end

return globals;
