local assets = require "src/common/assets"

local loadAssets = {};

local function loadCards()
  assets.cardBack = love.graphics.newImage("assets/cards/card-back.png")

  assets.card1 = love.graphics.newImage("assets/cards/card1.png")
  assets.card2 = love.graphics.newImage("assets/cards/card2.png")
  assets.card3 = love.graphics.newImage("assets/cards/card3.png")
  assets.card4 = love.graphics.newImage("assets/cards/card4.png")
  assets.card5 = love.graphics.newImage("assets/cards/card5.png")
  assets.card6 = love.graphics.newImage("assets/cards/card6.png")
  assets.card7 = love.graphics.newImage("assets/cards/card7.png")
  assets.card8 = love.graphics.newImage("assets/cards/card8.png")
  assets.card9 = love.graphics.newImage("assets/cards/card9.png")
  assets.card10 = love.graphics.newImage("assets/cards/card10.png")
  assets.card11 = love.graphics.newImage("assets/cards/card11.png")
  assets.card12 = love.graphics.newImage("assets/cards/card12.png")
  assets.card13 = love.graphics.newImage("assets/cards/card13.png")
  assets.card14 = love.graphics.newImage("assets/cards/card14.png")
  assets.card15 = love.graphics.newImage("assets/cards/card15.png")
  assets.card16 = love.graphics.newImage("assets/cards/card16.png")
  assets.card17 = love.graphics.newImage("assets/cards/card17.png")
  assets.card18 = love.graphics.newImage("assets/cards/card18.png")
  assets.card19 = love.graphics.newImage("assets/cards/card19.png")
  assets.card20 = love.graphics.newImage("assets/cards/card20.png")
  assets.card21 = love.graphics.newImage("assets/cards/card21.png")
  assets.card22 = love.graphics.newImage("assets/cards/card22.png")
  assets.card23 = love.graphics.newImage("assets/cards/card23.png")
  assets.card24 = love.graphics.newImage("assets/cards/card24.png")

  assets.cardImages = {
    assets.card1,
    assets.card2,
    assets.card3,
    assets.card4,
    assets.card5,
    assets.card6,
    assets.card7,
    assets.card8,
    assets.card9,
    assets.card10,
    assets.card11,
    assets.card12,
    assets.card13,
    assets.card14,
    assets.card15,
    assets.card16,
    assets.card17,
    assets.card18,
    assets.card19,
    assets.card20,
    assets.card21,
    assets.card22,
    assets.card23,
    assets.card24
  };
end

local function loadFaces()
  assets.bob = love.graphics.newImage("assets/faces/bob.png")
  assets.protagonist = love.graphics.newImage("assets/faces/protagonist.png")
  assets.generic = love.graphics.newImage("assets/faces/generic.png")
  assets.creator = love.graphics.newImage("assets/faces/creator.png")
  assets.melissa = love.graphics.newImage("assets/faces/melissa.png")
  assets.windy = love.graphics.newImage("assets/faces/windy.png")
  assets.shadTravis = love.graphics.newImage("assets/faces/shad+travis.png")
  assets.bobProtagonist = love.graphics.newImage("assets/faces/bob+protagonist.png")
  assets.melissaWindy = love.graphics.newImage("assets/faces/melissa+windy.png")
end

local function loadBackgrounds()
  -- trocar por assets próprios
  assets.genericBackground = love.graphics.newImage("assets/backgrounds/generic_bg.jpeg")
  assets.kobeBackground = love.graphics.newImage("assets/backgrounds/kobe_bg.jpeg")
  assets.stageBackground = love.graphics.newImage("assets/backgrounds/stage_bg.jpeg")
  assets.titleBackground = love.graphics.newImage("assets/backgrounds/title_bg.jpeg")

  assets.houseOutsideBackground = love.graphics.newImage("assets/backgrounds/houseOutsideBackground.jpeg")

  assets.daliBackground = love.graphics.newImage("assets/backgrounds/dali_wallpaper.jpg")
  assets.trophyBackground = love.graphics.newImage("assets/backgrounds/trophy_wallpaper.jpg")
  assets.streetBackground = love.graphics.newImage("assets/backgrounds/street_wallpaper.jpg")
  assets.animeHouseBackground = love.graphics.newImage("assets/backgrounds/house_wallpaper.png")
  assets.basketballCourtBackground = love.graphics.newImage("assets/backgrounds/baskteball_court_wallpaper.jpg")
  assets.podiumBackground = love.graphics.newImage("assets/backgrounds/podium_wallpaper.png")
end

local function loadFlags()
  assets.flagUK = love.graphics.newImage("assets/flags/flag_uk.jpg")
  assets.flagBR = love.graphics.newImage("assets/flags/flag_br.jpg")
end

local function loadBodies()
  assets.bobBody = love.graphics.newImage("assets/bodies/bob.png")
  assets.creatorBody = love.graphics.newImage("assets/bodies/creator.png")
  assets.genericBody = love.graphics.newImage("assets/bodies/generic.png")
  assets.melissaBody = love.graphics.newImage("assets/bodies/melissa.png")
  assets.protagonistBody = love.graphics.newImage("assets/bodies/protagonist.png")
  assets.shadBody = love.graphics.newImage("assets/bodies/shad.png")
  assets.travisBody = love.graphics.newImage("assets/bodies/travis.png")
  assets.windyBody = love.graphics.newImage("assets/bodies/windy.png")
end

local function loadImgs()
  loadCards()
  loadFaces()
  loadBackgrounds()
  loadFlags()
  loadBodies()
end

local function loadFonts()
  assets.squareFont = love.graphics.newFont('assets/fonts/Square.ttf', 28)
  assets.smallFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 16)
  assets.textFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 28)
  assets.bigFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 36)
  assets.talkiesFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 20)

  assets.timerFont = love.graphics.newFont('assets/fonts/DS-DIGI.ttf', 30)
  assets.timerFont2 = love.graphics.newFont('assets/fonts/DS-DIGI.ttf', 34)

  assets.frostbiteFont = love.graphics.newFont('assets/fonts/FROSTBITE-Narrow.ttf', 28)
end

local function loadSfx()
  assets.typeSound = love.audio.newSource("assets/sfx/typeSound.wav", "static")
  assets.talkSound = love.audio.newSource("assets/sfx/talk.wav", "static")
  assets.rightPair = love.audio.newSource("assets/sfx/comb2.wav", "static")
  assets.rightPair:setVolume(0.8)
  assets.wrongPair = love.audio.newSource("assets/sfx/errorC.wav", "static")
  assets.selectSound = love.audio.newSource("assets/sfx/select.wav", "static")

  -- trocar por assets próprios
  assets.winningSound = love.audio.newSource("assets/sfx/megaman_winning.wav", "static")
  assets.losingSound = love.audio.newSource("assets/sfx/losing.wav", "static")
end

local function loadMusic()
  assets.menuMusic = love.audio.newSource("assets/music/menuSong.wav", "stream")
  assets.menuMusic:setVolume(0.6)
  assets.menuMusic:setLooping(true)

  -- trocar por assets próprios
  assets.inGameMusic = love.audio.newSource("assets/music/Mind-Bender.mp3", "stream")
  assets.inGameMusic:setVolume(0.6)
  assets.inGameMusic:setLooping(true)

  assets.scene1Music = love.audio.newSource("assets/music/On-Thngs-to-Come_Looping.mp3", "stream")
  assets.scene1Music:setLooping(true)

  assets.scene2Music = love.audio.newSource("assets/music/Extreme-Sports-Mayhem_Looping.mp3", "stream")
  assets.scene2Music:setLooping(true)

  assets.scene3Music = love.audio.newSource("assets/music/Autumn-Changes_Looping.mp3", "stream")
  assets.scene3Music:setLooping(true)

  assets.streetMusic = love.audio.newSource("assets/music/streetMusic.mp3", "stream")
  assets.streetMusic:setLooping(true)

  assets.scene5Music = love.audio.newSource("assets/music/WalkingOnTheMesmerizingSkyInSpring.mp3", "stream")
  assets.scene5Music:setLooping(true)

  assets.scene6Music = love.audio.newSource("assets/music/S31-Let the Games Begin.ogg", "stream")
  assets.scene6Music:setLooping(true)

  assets.scene11Music = love.audio.newSource("assets/music/champion.wav", "stream")
  assets.scene11Music:setVolume(0.6)
  assets.scene11Music:setLooping(true)

  assets.endingMusic = love.audio.newSource("assets/music/ending.wav", "stream")
  assets.endingMusic:setLooping(true)
end

function loadAssets.loadAll()
  loadImgs()
  loadFonts()
  loadSfx()
  loadMusic()
end

return loadAssets;
