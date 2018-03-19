local composer = require( "composer" )
 
local scene = composer.newScene()

 local function changeScene(  )
   composer.gotoScene("Match", {effect = "fade", time = 1000})
 end

--set the local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local rocket
local background
local neptune
local counter = 0
local planet
local alien 
local astronaut
local title
local button
local buttonNext
local pannel
local info1
local info2
local scrollSpeed = 4
local  scrollSpeed2 = 5
local comet
local comet2
local comet3
local rocketSound
local rocketChannel
-- create()
function scene:create( event )
 
  local sceneGroup = self.view

  --set the background
  background = display.newImageRect("ImagesTest/space.jpg", 1030, 800)
  sceneGroup:insert(background)
  --anchor the background
  background.anchorX = 0
  background.anchorY = 0

  --display the object(rocket)
  rocket = display.newImageRect("ImagesTest/racheta.png", 450, 450)
  sceneGroup:insert(rocket)
  --set its possition, orientation and visibility
  rocket.x = 1200
  rocket.y = 900
  rocket.rotation = 230
  rocket.isVisible = true

 --display the object(comet)
 comet = display.newImageRect("ImagesTest/comet2.png", 300, 400)
 sceneGroup:insert(comet)
 --set the possition. orientation and visbility of the object
 comet.x = 1000
 comet.y = -180
 comet.rotation = 80

  --display the object(comet2)
 comet2 = display.newImageRect("ImagesTest/comet1.png", 300, 400)
 sceneGroup:insert(comet2)
 --set the possition. orientation and visbility of the object
 comet2.x = 1000
 comet2.y = -180
 comet2.rotation = 80

  --display the object(comet3)
 comet3 = display.newImageRect("ImagesTest/comet1.png", 300, 400)
 sceneGroup:insert(comet2)
 --set the possition. orientation and visbility of the object
 comet3.x = 1000
 comet3.y = -180
 comet3.rotation = 80

 --display the object(neptune)
 neptune = display.newImageRect("ImagesTest/neptune.png", 250, 250)
 sceneGroup:insert(neptune)
 ----set its possition
 neptune.x  = -120
 neptune. y = 700

 --create the planet
  planet = display.newImageRect("ImagesTest/neptune.png", 800, 800)
  sceneGroup:insert(planet)
  --set its possition and visibility
  planet.x = HW
  planet.y = HH+400
  planet.isVisible = false

  --create the pannel
  pannel = display.newImageRect("ImagesTest/pannel2.png",380, 320)
  sceneGroup:insert(pannel)
  --set its possition and visibility
  pannel.x = 200
  pannel.y = 200
  pannel.isVisible = false

  --create the pannel text
  info1 = display.newText("My name is Xenomo.\n    I am the citizen\n       of Neptune",220, 150, "Georgia", 35)
  sceneGroup:insert(info1)
  --set its color and visibility
  info1:setTextColor(175/255, 96/255, 26/255)
  info1.isVisible = false

  --create the pannel text2
  info2 = display.newText("Neptune is the eighth and\nfarthest known planet from\nthe Sun in the Solar System.", 200, 150, "Georgia", 30)
  sceneGroup:insert(info2)
  --set its color and visibility
  info2:setTextColor(175/255, 96/255, 26/255)
  info2.isVisible = false
  --create the alien
  alien = display.newImageRect("ImagesTest/alien5.png", 300, 300)
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
  title = display.newText("Neptune", HW, HH+200, native.systemFontBold, 130)
  sceneGroup:insert(title)
  --set its color and visibility
  title:setTextColor( 175/255, 96/255, 26/255 )
  title.isVisible = false

  --create the button
  button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
  sceneGroup:insert(button)
  --set its color and visbility
  button:setFillColor(175/255, 96/255, 26/255)
  button.isVisible = false

  --create the button text
  buttonNext = display.newText("Next...", HW, HH+320, "Georgia", 65)
  sceneGroup:insert(buttonNext)
  --set its visibility
  buttonNext.isVisible = false
  
  --create the sound
  rocketSound = audio.loadStream("Sounds/fly.mp3")
  --Function: MoveRocket
  --Description: move the rocket diagonally by decreasing the x and y, and make it spin simultaneously
  local function MoveRocket( event )
    rocket.x = rocket.x - scrollSpeed2
    rocket.y = rocket.y - scrollSpeed
   rocket.rotation = rocket.rotation + 10
   rocketChannel = audio.play(rocketSound)
   print ("rocket.x ="..rocket.x)

   if (rocket.x<=200) then
    Runtime:removeEventListener("enterFrame", MoveRocket)
    --move the comets
    transition.to(comet, {x = 0, y = 1000, time = 3000, alpha = 1})
    transition.to(comet2, {x = - 200, y = HH, time = 3000, delay = 1000})
    transition.to(comet3, {x = 200, y = 1000, time = 3000, delay = 2500})
    --move Neptune
    transition.to(neptune, {x = 100, alpha = 0, delay = 5500, time = 2000})
    transition.to(neptune, {x = 250, alpha = 1, delay = 7500, time = 1500})
    transition.to(neptune, {x = 400, alpha = 0, delay = 9000, time = 1500})
    transition.to(neptune, {x = 550, alpha = 1, delay = 10500, time = 1500})
    transition.to(neptune, {x = 700, alpha = 0, delay = 12000, time = 2500})
    transition.to(neptune, {x = 900, alpha = 1, delay = 13500, time = 2500})
    --move the rocket
    transition.to(rocket, {x = 850, y = 550, time = 3000, delay = 13000})
    --Function:HideObjects
   --Description: after a certain period of time rocket and Saturn will hide, while other objects will appear
   local function HideObjects( event )
    audio.pause(rocketChannel)
    rocket.isVisible = false
    neptune.isVisible = false
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
        timer.performWithDelay(1000, HideInfo)
  end
  timer.performWithDelay(16000, HideObjects)
   end
  end
  Runtime:addEventListener("enterFrame", MoveRocket)

  button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

return scene