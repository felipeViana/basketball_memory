sceneManager = {};

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

sceneManager.currentScene = sceneManager._validateScene(nil)


function sceneManager.loadScene(s)
  currentScene = s
end

function sceneManager.unloadScene(s)
end

function sceneManager.changeScene(s)
  s = s or error("ChangeScene requires a Scene")

  sceneManager.currentScene.unload()
  sceneManager.currentScene = sceneManager._validateScene(s)
  sceneManager.currentScene.load()
end


return sceneManager;
