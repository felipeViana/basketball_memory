local assets = require "src/assets"
local utils = require "src/utils"
local defaults = {};

function defaults.load_all()
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

return defaults;
