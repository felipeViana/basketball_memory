local sceneManager = {};

local emptyFunc = function() end

function sceneManager._validateScene(s)
  s = s or {}

  s.load = s.load or emptyFunc
  s.unload = s.unload or emptyFunc
  s.update = s.update or emptyFunc
  s.draw = s.draw or emptyFunc
  s.resize = s.resize or emptyFunc
  s.keypressed = s.keypressed or emptyFunc
  s.textinput = s.textinput or emptyFunc
  s.mousepressed = s.mousepressed or emptyFunc
  s.mousereleased = s.mousereleased or emptyFunc
  s.wheelmoved = s.wheelmoved or emptyFunc
  return s
end

function sceneManager.changeScene(s, option)
  s = s or error("ChangeScene requires a Scene")

  sceneManager.currentScene.unload()
  sceneManager.currentScene = sceneManager._validateScene(s)
  sceneManager.currentScene.load(option)
end

sceneManager.currentScene = sceneManager._validateScene(nil)
return sceneManager;
