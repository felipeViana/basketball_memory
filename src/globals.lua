local assets = require "src/assets"
local utils = require "src/utils"
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

end

return globals;
