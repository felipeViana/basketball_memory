local globals = require 'src/common/globals'

function love.conf(t)
  t.identity = nil -- save directory (string)
  t.accelerometerjoystick = false
  t.title = "Basketball memory legends"
  t.version = "11.3"
  t.console = false

  t.window.width = globals.baseScreenWidth
  t.window.height = globals.baseScreenHeight
  t.window.minwidth = globals.baseScreenWidth
  t.window.minheight = globals.baseScreenHeight

  t.window.fullscreen = false
  t.window.icon = "assets/images/logo.png"
  t.window.borderless = false
  t.window.resizable = true

  t.modules.audio = true
  t.modules.data = false
  t.modules.event = true
  t.modules.font = true
  t.modules.graphics = true
  t.modules.image = true
  t.modules.joystick = false
  t.modules.keyboard = true
  t.modules.math = true
  t.modules.mouse = true
  t.modules.physics = false
  t.modules.sound = true
  t.modules.system = false
  t.modules.thread = false
  t.modules.timer = true
  t.modules.touch = false
  t.modules.video = false
  t.modules.window = true

  math.randomseed(os.time())
end
