function love.conf(t)
  t.title = "Basketball memory legends"
  t.window.width = 1280
  t.window.height = 720
  t.version = "11.3"

  t.console = true

  math.randomseed(os.time())

  t.window.fullscreen = false

  t.window.icon = "assets/logo.png"
end
