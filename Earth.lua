local composer = require( "composer" )
 
local scene = composer.newScene()

 local function changeScene(  )
   composer.gotoScene("Mars", {effect="fade", time = 2000})
 end
--set local variables
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local background
local rocket
local scrollSpeed = 5
local counter = 0 
local asterois
local asterois2
local earth
local press
local pressText
local planet
local alien
local astronaut
local title
local info1
local info2
local pannel
local button
local buttonText
local rocketSound
local rocketChannel
-- create()
function scene:create( event )
 
  local sceneGroup = self.view
    
    --set the background
   background = display.newImageRect("ImagesTest/space.jpg", 1030, 770)
   sceneGroup:insert(background)
   --anchor the background
   background.anchorX = 0
   background.anchorY = 0

   --create an object
   planet = display.newImageRect("ImagesTest/earth.png", 800, 800)
   sceneGroup:insert(planet)
   --set its possition
   planet.x = HW
   planet.y = 750
   planet.isVisible = false

   --create an object
   asterois = display.newImageRect("ImagesTest/asteroid2.png", 200, 400)
   sceneGroup:insert(asterois)
   --set the possition . orientation and visibility of the object
   asterois.x = 0
   asterois.y = 0
   asterois.rotation = -50
   asterois.alpha = 0

   --create an object
   asterois2 = display.newImageRect("ImagesTest/asteroid2.png", 200, 400)
   sceneGroup:insert(asterois2)
   --set the possition, orientation and visibility of the object
   asterois2.x = 1000
   asterois2.y = 0
   asterois2.alpha = 0

   --create an object
   earth = display.newImageRect("ImagesTest/earth.png", 200, 200)
   sceneGroup:insert(earth)
   --set the possition, orientation and visibility of the object
   earth.x = 0
   earth.y = 0
   earth.alpha = 0

   --create an object
   astronaut = display.newImageRect("ImagesTest/astronaut.png", 270, 450)
   sceneGroup:insert(astronaut)
   --set its possition, orientation and visibility
   astronaut.x = HW + 150
   astronaut.y = HH 
   astronaut.isVisible = false

   --create an object
   alien = display.newImageRect("ImagesTest/robot2.png", 350, 500)
   sceneGroup:insert(alien)
   --set its possition , orientation and visbility
   alien.x = HW - 150
   alien.y = HH 
   alien:scale(-1,1)
   alien.isVisible = false

   --create the title
    title = display.newText("Earth", HW, HH+200, native.systemFontBold, 150)
    sceneGroup:insert(title)
    --set its color and visibility
    title:setTextColor(214/255, 137/255, 16/255)
    title.isVisible = false

   --create an object
   button = display.newRoundedRect(HW, HH+320, 200, 100, 15)
   sceneGroup:insert(button)
   --set its visibility
   button.isVisible = false

   --create the text
   buttonText = display.newText("Next...", HW, HH+320, "Georgia", 70)
   sceneGroup:insert(buttonText)
   --set text color
   buttonText:setTextColor(214/255, 137/255, 16/255)
   buttonText.isVisible = false

   --create the pannel
   pannel = display.newImageRect("ImagesTest/pannel.png", 600, 200)
   sceneGroup:insert(pannel)
   --set its possition and visibility
   pannel.x = HW+120
   pannel.y = 100
   pannel.isVisible = false

   --create another object
   rocket = display.newImageRect("ImagesTest/racheta.png", 500, 500)
   sceneGroup:insert(rocket)
   rocket.isVisible = true
   --set its possition and orientation
   rocket.x = 0 
   rocket.y = HH
   print ("rocket.x = "..rocket.x)

   --create the sound
   rocketSound = audio.loadStream("Sounds/fly.mp3")
   --Function:MoveRocket
   --Description: the rocket moves, because the x and y value increase, when it hits one point it moves in opposite way
   local function MoveRocket( event )
    rocketChannel = audio.play(rocketSound)
     rocket.x = rocket.x + scrollSpeed
     if (rocket.x < 0) then
       rocket.xScale = 1
       scrollSpeed = 5
     end
     if (rocket.x > 1000) then
       rocket.xScale = -1
       scrollSpeed = - 5
       counter = counter + 1
       print("counter = "..counter)
      end

      if (counter == 3) then
        --stop the movement
        Runtime:removeEventListener("enterFrame", MoveRocket)
        --move the asteroids
        transition.to(asterois, {x = HW, y = 1000, alpha = 2, time = 2000 })

        --Function: MoveAsteroid
        --Description: after a period of time, other asteroids will appear and will move
        local function MoveAsteroid( event )
          transition.to(asterois2, {x = 100, y = 1000, alpha = 2, time = 3000 })
        end
        timer.performWithDelay(2000, MoveAsteroid)

        --Function:MoveEarth
        --Description: after a period of time the object appears and moves to a certain point
        local function MoveEarth( event )
          transition.to(earth, {x = HW , y = HH+200, alpha = 2, time = 2000, xScale = 1.5, yScale = 1.5})
          transition.to(earth,{x = 200, y = 200, delay = 2000, time = 2000, xScale = 1, yScale = 1})
          transition.to(rocket,{x = 200, y = 200, time = 2000, delay = 3000, alpha = 0 })
        end
        timer.performWithDelay(3000, MoveEarth)

        --Function:HideObjects
        --Description: after a certain period Earth disappear and other objects appear
        local function HideObjects( event )
          audio.pause(rocketChannel)
          earth.isVisible = false
          planet.isVisible = true
          astronaut.isVisible = true
          alien.isVisible = true
          title.isVisible = true
          buttonText.isVisible = true
          button.isVisible = true
          pannel.isVisible = true
          --create the text
          info1 = display.newText("Welcome to Earth.\nMy name is HS239J.",HW+120, 70, "Georgia", 40 )
          sceneGroup:insert(info1)
          --set its color
          info1:setTextColor( 11/255, 83/255, 69/255 )
          --Function:InfoAppear
          --Description:After a certain period of time, the text appears
         local function InfoAppear( event )
            --hide the first information
            info1.isVisible = false
           --create the text
           info2 = display.newText("       Earth is the third planet\nfrom the Sun and the only object\n      in the Universe known to\n                  harbor life.", HW+120, 70, "Georgia", 30)
           sceneGroup:insert(info2)
           --set the color of the text
           info2:setTextColor(11/255, 83/255, 69/255)
         end
          timer.performWithDelay(1000, InfoAppear)
        end
        timer.performWithDelay(8000, HideObjects)
      end

    end
    Runtime:addEventListener("enterFrame", MoveRocket)
    button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene )

return scene