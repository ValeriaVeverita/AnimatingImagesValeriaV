local composer = require( "composer" )
 
local scene = composer.newScene()

local function changeScene(  )
  composer.gotoScene("Jupiter", {effect = "fade", time = 1000})
end

--set local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local background
local scrollSpeed = 3
local scrollSpeed2 = 0
local rocket
local mars
local planet
local press
local pressPannel
local title
local astronaut
local alien 
local button
local buttonNext
local pannel 
local info1
local info2
local counter = 0
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

  --create the rocket
  rocket = display.newImageRect("ImagesTest/racheta.png", 500, 500)
  sceneGroup:insert(rocket)
  --set its possition, visibility and orientation
  rocket.x = HW
  rocket.y = -200
  rocket.rotation = 90
  rocket.isVisible = true
  
  --create Mars
  mars = display.newImageRect("ImagesTest/mars.png",200, 200)
  sceneGroup:insert(mars)
  --set its possition, visibility 
  mars.x = 1100
  mars.y = 0
  mars.alpha = 0

  --create the planet
  planet = display.newImageRect("ImagesTest/mars.png", 800, 800)
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
  info1 = display.newText("Hello! I am happy\nto see you on Mars",200, 150, "Georgia", 40)
  sceneGroup:insert(info1)
  --set its color and visibility
  info1:setTextColor(46/255, 204/255, 113/255)
  info1.isVisible = false

  --create the pannel text2
  info2 = display.newText("It's good to know that\nMars is the fourth planet from\nthe Sun and the second-smallest\nplanet in the Solar System\nafter Mercury.", 200, 150, "Georgia", 25)
  sceneGroup:insert(info2)
  --set its color and visibility
  info2:setTextColor(46/255, 204/255, 113/255)
  info2.isVisible = false
  --create the alien
  alien = display.newImageRect("ImagesTest/alien2.png", 300, 300)
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
  title = display.newText("Mars", HW, HH+200, native.systemFontBold, 130)
  sceneGroup:insert(title)
  --set its color and visibility
  title:setTextColor(46/255, 204/255, 113/255 )
  title.isVisible = false

  --create the button
  button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
  sceneGroup:insert(button)
  --set its color and visbility
  button:setFillColor(46/255, 204/255, 113/255)
  button.isVisible = false

  --create the button text
  buttonNext = display.newText("Next...", HW, HH+320, "Georgia", 65)
  sceneGroup:insert(buttonNext)
  --set its visibility
  buttonNext.isVisible = false
  
  --create the sound
  rocketSound = audio.loadStream("Sounds/fly.mp3")
  --Function: MoveRocket
  --Description: When the scene changes, the rocket moves verticaly. When it hits one point it moves left
  local function MoveRocket( event)
    rocket.y = rocket.y + scrollSpeed
    rocket.x = rocket.x + scrollSpeed2
    rocketChannel = audio.play(rocketSound)
    print ("rocket.x="..rocket.x)
    if (rocket.y<=-200)then
      scrollSpeed = 3
      scrollSpeed2 = 0
    end
    if (rocket.y >= 800) then
      scrollSpeed = - 3
      scrollSpeed2 = scrollSpeed2-3
      rocket.rotation = -90
    end

    if (rocket.x<=100) then
      --when the rocket reaches the possition(x=100), the previous function stops and other functions are called 
      Runtime:removeEventListener("enterFrame", MoveRocket)
      --move mars and the rocket
      transition.to(mars, {x = HW+150, y =HH+200, alpha = 2, time = 2000})
      transition.to(rocket, {x = HW + 150, y = 100, rotation = 0, time = 2000, alpha = 0})
      transition.to(rocket, {delay = 2000, x = HW+150, y = HH+100, alpha = 1, rotation = 90, time= 3000})
      --Function: HideObjects
      --Description: After a certain period of time, Mars and the rocket hide, while other objects appear
      local function HideObjects( event )
        audio.pause(rocketChannel)
        rocket.isVisible = false
        mars.isVisible = false
        planet.isVisible = true
        alien.isVisible = true
        astronaut.isVisible = true
        pannel.isVisible = true
        title.isVisible = true
        button.isVisible = true
        buttonNext.isVisible = true
        info1.isVisible = true
      end
      timer.performWithDelay(5000, HideObjects)

      --Function:HideInfo
      --Description: After a certain period, the firs text hides and the second one appears
      local function HideInfo( event )
        info1.isVisible = false
        info2.isVisible = true
      end
      timer.performWithDelay(7000, HideInfo)
    end
  end  
 Runtime:addEventListener("enterFrame", MoveRocket)
 button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

return scene