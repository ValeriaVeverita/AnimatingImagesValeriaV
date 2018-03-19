local composer = require( "composer" )
 
local scene = composer.newScene()

local function changeScene(  )
  composer.gotoScene("Uranus", {effect = "fade", time = 1000})
end
--set local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local counter = 0
local background
local rocket
local saturn
local planet
local alien
local astronaut
local title
local button
local buttonNext
local pannel
local info1
local info2
local rocketSound
local rocketChannel

-- create()
function scene:create( event )
 
  local sceneGroup = self.view
  --set the background
  background = display.newImageRect("ImagesTest/space.jpg", 1030, 800)
  sceneGroup:insert(background)
  --anchor th background
  background.anchorX = 0
  background.anchorY = 0

  --display an object(rocket)
  rocket = display.newImageRect("ImagesTest/rocket2.jpg", 400, 400)
  sceneGroup:insert(rocket)
  --set its possition, orientation and visibility
  rocket.x = 0
  rocket.y = 0 
  rocket.rotation = 90
  rocket.isVisible = true

  --display an object(saturn)
  saturn = display.newImageRect("ImagesTest/saturn.png", 300, 300)
  sceneGroup:insert(saturn)
  --set its possition and visbility
  saturn.x = 1500
  saturn.y = -50
  saturn.alpha = 0

  --create the planet
  planet = display.newImageRect("ImagesTest/saturn.png", 1500, 1200)
  sceneGroup:insert(planet)
  --set its possition. orientation and visibility
  planet.x = HW
  planet.y = HH+400
  planet.rotation = 30
  planet.isVisible = false

  --create the pannel
  pannel = display.newImageRect("ImagesTest/pannel2.png",400, 320)
  sceneGroup:insert(pannel)
  --set its possition and visibility
  pannel.x = 200
  pannel.y = 200
  pannel.isVisible = false

  --create the pannel text
  info1 = display.newText("Welcome to Saturn",200, 150, "Georgia", 31)
  sceneGroup:insert(info1)
  --set its color and visibility
  info1:setTextColor(40/255, 116/255, 166/255)
  info1.isVisible = false

  --create the pannel text
  info2 = display.newText("Did you know that Saturn\nis the sixth planet from\nthe Sun and the second-largest\nin the Solar System, after Jupiter.", 200, 150, "Georgia", 25)
  sceneGroup:insert(info2)
  --set its color and visibility
  info2:setTextColor(40/255, 116/255, 166/255)
  info2.isVisible = false
  --create the alien
  alien = display.newImageRect("ImagesTest/alien6.png", 300, 300)
  sceneGroup:insert(alien)
  --set its possition and visbility
  alien.x = HW-150
  alien.y = HH
  alien.isVisible = false

  --create the astronaut 
  astronaut = display.newImageRect("ImagesTest/astronaut.png", 300, 450)
  sceneGroup:insert(astronaut)
  --set its possition and visibility
  astronaut.x = HW+150
  astronaut.y = HH - 50
  astronaut.isVisible = false

  --create the title
  title = display.newText("Saturn", HW, HH+200, native.systemFontBold, 130)
  sceneGroup:insert(title)
  --set its color and visibility
  title:setTextColor( 40/255, 116/255, 166/255 )
  title.isVisible = false

  --create the button
  button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
  sceneGroup:insert(button)
  --set its color and visbility
  button:setFillColor(40/255, 116/255, 166/255)
  button.isVisible = false

  --create the button text
  buttonNext = display.newText("Next...", HW, HH+320, "Georgia", 65)
  sceneGroup:insert(buttonNext)
  --set its visibility
  buttonNext.isVisible = false
   --create the sound
   rocketSound = audio.loadStream("Sounds/fly.mp3")
   rocketChannel = audio.play(rocketSound)
  --move the rocket by using the function transition.to
  transition.to(rocket, {x = 1300, y = 1000, time = 2500, alpha = 0})
  transition.to(rocket, {x = 100, y = HH, time = 2500, delay = 3000, alpha = 1, rotation = - 90, xScale = 0.7, yScale = 0.7})
  transition.to(rocket, {x = 700, y = HH - 100, time = 1500, delay = 5500, rotation = 90})
  --move Saturn
  transition.to(saturn, {x = 200, y = HH+300, time = 2500, alpha = 1, delay = 1500})
  transition.to(saturn, {x = 800, y = HH, time = 2000, delay = 3600})

  --Function:HideObjects
  --Description: after a certain period of time rocket and Saturn will hide, while other objects will appear
  local function HideObjects( event )
    audio.pause(rocketChannel)
    rocket.isVisible = false
    saturn.isVisible = false
    planet.isVisible = true
    alien.isVisible = true
    astronaut.isVisible = true
    pannel.isVisible = true
    title.isVisible = true
    button.isVisible = true
    buttonNext.isVisible = true
    info1.isVisible = true
        --Function:HideInfo
        --Description: after a period first information disappears and secpond one appers
        local function HideInfo( event )
          info1.isVisible = false
          info2.isVisible = true
        end
        timer.performWithDelay(2000, HideInfo)
  end
  timer.performWithDelay(7000, HideObjects)
  
  button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

 
return scene