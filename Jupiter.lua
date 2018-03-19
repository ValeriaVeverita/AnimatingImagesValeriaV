local composer = require( "composer" )
 
local scene = composer.newScene()
 local function changeScene(  )
   composer.gotoScene("Saturn", {effect = "fade", time = 1000})
 end
--set the local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local rocket
local background
local jupiter
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
local scrollSpeed = 8
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
  rocket.x = HW
  rocket.y = 0
  rocket.rotation = 90
  rocket.isVisible = true

  --display the object(jupiter)
  jupiter = display.newImageRect("ImagesTest/jupiter.png", 200, 200)
  sceneGroup:insert(jupiter)
  --set its possition 
  jupiter.x = - 100
  jupiter.y = - 100
  
  --create the planet
  planet = display.newImageRect("ImagesTest/jupiter.png", 800, 800)
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
  info1 = display.newText("I am happy to\nsee you on Jupiter",200, 150, "Georgia", 35)
  sceneGroup:insert(info1)
  --set its color and visibility
  info1:setTextColor(212/255, 172/255, 13/255)
  info1.isVisible = false

  --create the pannel text
  info2 = display.newText(" An interesting fact is that\nJupiter is the fifth planet\nfrom the Sun and the\nlargest in the Solar System.", 200, 150, "Georgia", 25)
  sceneGroup:insert(info2)
  --set its color and visibility
  info2:setTextColor(212/255, 172/255, 13/255)
  info2.isVisible = false
  --create the alien
  alien = display.newImageRect("ImagesTest/alien4.jpg", 300, 300)
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
  title = display.newText("Jupiter", HW, HH+200, native.systemFontBold, 130)
  sceneGroup:insert(title)
  --set its color and visibility
  title:setTextColor( 212/255, 172/255, 13/255 )
  title.isVisible = false

  --create the button
  button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
  sceneGroup:insert(button)
  --set its color and visbility
  button:setFillColor(212/255, 172/255, 13/255)
  button.isVisible = false

  --create the button text
  buttonNext = display.newText("Next...", HW, HH+320, "Georgia", 65)
  sceneGroup:insert(buttonNext)
  --set its visibility
  buttonNext.isVisible = false
  
  --create the sound
  rocketSound = audio.loadStream("Sounds/fly.mp3")
  --Function
  local function MoveRocket( event )
    rocket.y = rocket.y + scrollSpeed
    rocketChannel = audio.play(rocketSound)
    print("rocket.y"..rocket.y)
    if (rocket.y <= 0) then
     scrollSpeed = 8
     rocket.rotation = 90
     counter = counter + 1
     print ("counter"..counter)

    end
    if (rocket.y>=1000)then
      scrollSpeed = -scrollSpeed/2
      rocket.rotation = -90
    end

    if (counter == 3) then
      --when the rocket hits three times the border, cancel the previous function
      Runtime:removeEventListener("enterFrame", MoveRocket)
      --move the rocket
      transition.to( rocket, {y = 800, alpha = 0.5, time = 3000})
      transition.to(rocket, {y = HH, x =200, alpha = 1, time = 3000, delay = 3100, rotation = 180})
      transition.to(rocket, {y = 300, x = 400, rotation = 270 , alpha = 0.5, time = 3000, delay = 6000})
      transition.to(rocket, {y = HH, x = 600, alpha = 1, time = 3000, rotation = 360, delay = 9000})
      --move Jupiter
      transition.to (jupiter, {y = HH, x = 850, time = 4500, rotation = 3600, xScale = 1.5, yScale = 1.5 })
      --Function:HideObjects
     --Description: after a certain period of time rocket and Saturn will hide, while other objects will appear
      local function HideObjects( event )
        audio.pause(rocketChannel)
        rocket.isVisible = false
        jupiter.isVisible = false
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
      timer.performWithDelay(12000, HideObjects)
    end
  end 
  Runtime:addEventListener("enterFrame", MoveRocket) 
  button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

return scene