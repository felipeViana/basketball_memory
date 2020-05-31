local assets = require "src/common/assets"
local utils = require "src/common/utils"
local globals = {};

function globals.loadAll()
  playerName = 'Felipe'

  defaultPersonTalkingConfig = {
    image=assets.generic,
    talkSound=assets.talkSound,
    typedNotTalked=false,
  }

  defaultProtagonistTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.protagonist,
    }
  )
  defaultBobTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.bob,
    }
  )
  defaultCreatorTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.creator,
    }
  )
  defaultMelissaTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.melissa,
    }
  )
  defaultWindyTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.windy,
    }
  )
  defaultShadTravisTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.shadTravis,
    }
  )
  defaultBobProtagonistTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.bobProtagonist,
    }
  )
  defaultMelissaWindyTalkingConfig = utils.tableWithAddedTable(
    defaultPersonTalkingConfig,
    {
      ['image']=assets.melissaWindy,
    }
  )
end

return globals;
