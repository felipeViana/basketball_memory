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

end

return globals;
