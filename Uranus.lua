local composer = require( "composer" )
 
local scene = composer.newScene()

 local function changeScene(  )
   composer.gotoScene("Neptune", {effect = "fade", time = 1000})
 end
 
--set the local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local rocket
local background
local uranus
local planet
local alien 
local astronaut
local title
local button
local buttonNext
local pannel
local info1
local info2
local scrollSpeed = 0
local  scrollSpeed2 = 0
local scrollSpeed3 = 0
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
  rocket.y = 500
  rocket.xScale = -1
  rocket.isVisible = true

  --display an object(Uranus)
  uranus = display.newImageRect("ImagesTest/uranus.png", 200, 200)
  sceneGroup:insert(uranus)
  --set its possition and visibility
  uranus.x = 1200
  uranus.y = 0
  uranus.alpha = 0

  --create the planet
  planet = display.newImageRect("ImagesTest/uranus.png", 800, 800)
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
  info1 = display.newText("Hello! I am happy\nto see you on Uranus",200, 150, "Georgia", 40)
  sceneGroup:insert(info1)
  --set its color and visibility
  info1:setTextColor(236/255, 112/255, 99/255)
  info1.isVisible = false

  --create the pannel text2
  info2 = display.newText("It's good to know that\nUranus is the seventh planet\nfrom the Sun. It has the\nthird-largest planetary radius\nand fourth-largest planetary\nmass in the Solar System.", 200, 150, "Georgia", 25)
  sceneGroup:insert(info2)
  --set its color and visibility
  info2:setTextColor(236/255, 112/255, 99/255)
  info2.isVisible = false
  --create the alien
  alien = display.newImageRect("ImagesTest/alien.png", 300, 300)
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
  title:setTextColor( 236/255, 112/255, 99/255 )
  title.isVisible = false

  --create the button
  button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
  sceneGroup:insert(button)
  --set its color and visbility
  button:setFillColor(236/255, 112/255, 99/255)
  button.isVisible = false

  --create the button text
  buttonNext = display.newText("Next...", HW, HH+320, "Georgia", 65)
  sceneGroup:insert(buttonNext)
  --set its visibility
  buttonNext.isVisible = false
   
   --create the sound
   rocketSound = audio.loadStream("Sounds/fly.mp3")
  --Function:MoveRocket
  --Decsription: Move the rocket, by increasing/decreasing the x and y value
  local function MoveRocket( event )
    rocket.x = rocket.x + scrollSpeed 
    rocket.y = rocket.y + scrollSpeed2
    rocketChannel = audio.play(rocketSound)
    print ("rocket.x="..rocket.x)
    if(rocket.x <= 1200) then
      scrollSpeed = - 3
      scrollSpeed2 = 0
    end
    if (rocket.x <=HW)then
      --when the rocket reaches one point, the previous function will be canceled
      Runtime:removeEventListener("enterFrame", MoveRocket)
      --move the rocket
     transition.to(rocket,{x = 1000, y = 100, time = 3000, rotation = 130})
     transition.to(rocket, {x = 200, time = 4000, delay = 3100, rotation = 0})
     transition.to (rocket, {x = 750, y = 500, time = 4000, delay = 11000, rotation = -120})
     --move Uranus
     transition.to(uranus, {x = HW, y = 200, time= 3000, alpha = 1, xScale = 0.5, yScale = 0.5, delay = 5000})
     transition.to(uranus, {x = 1000, y = 350, time = 2000, xScale = 0.7, yScale = 0.7, delay = 8000})
     transition.to(uranus, {x = HW, y = 500, time = 2000, xScale = 0.9, yScale = 0.9, delay = 10000})
     transition.to(uranus, {x = 850, y = 650, time = 2000, xScale = 1.2, yScale = 1.2, delay = 12000})

     --Function: HideObjects
     --Description: after a period of time, the rocket and Uranus disappear, while other objects appear
     local function HideObjects( event )
        audio.pause(rocketChannel)
       rocket.isVisible = false
       uranus.isVisible = false
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
      timer.performWithDelay(15000, HideObjects)
   end
  end
  Runtime:addEventListener("enterFrame", MoveRocket)
 button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

return scene