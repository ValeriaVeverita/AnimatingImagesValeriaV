local composer = require( "composer" )
 
local scene = composer.newScene()
 
local function changeScene(  )
   composer.gotoScene("Venus",{effect = "fade", time = 1000})
end
  
--set local variables
    local counter = 0
    local HW = display.contentWidth/2
    local HH = display.contentHeight/2
    local scrollSpeed = 5
    local rocket
    local mercury
    local label
    local button
    local astronaut
    local alien
    local infoPannel
    local planet
    local pannel
    local name 
    local button
    local background
    local floor
    local buttonText
    local press
    local pressPannel
   local rocketSound
   local rocketChannel
   local alienSound
   local alienChannel
function scene:create( event )
  
    local sceneGroup = self.view
    --load and start physics
     local physics = require ("physics")
    physics.start()
    -- set the background
    background = display.newImageRect("ImagesTest/spaceBackground.jpg", 1020, 900)
    --anchor the background
    background.anchorX = 0
    background.anchorY = 0
    sceneGroup:insert(background)
    
    --set the floor 
    floor = display.newRect(2, HH+200, 1020, 20)
    --anchor the floor
    floor.anchorX = 0
    floor.anchorY = 0
    --set the visibility of the object
    floor.alpha = 0

     --create an object
    pressPannel = display.newRoundedRect(200, HH+40, 200, 100, 50)
    sceneGroup:insert(pressPannel)
    --set the color of the pannel
    pressPannel:setFillColor( 214/255, 137/255, 16/255 )
    --set the visibility of the pannel
    pressPannel.isVisible = false

    --create a text
    press = display.newText("Press",203, HH+40, native.systemFontBold, 45)
    --set the visibility of the text
    press.isVisible = false

    
    --create a new object
    mercury = display.newImageRect("ImagesTest/mercury.png", 100, 100)
    --set its possition
    mercury.x = 1000
    mercury.y = - 100
    sceneGroup:insert(mercury)
    mercury.isVisible = true

    --create the object
    rocket = display.newImageRect("ImagesTest/racheta.png", 500, 400)
    --set the possition of the rocket and its orientation
    rocket.x = HW
    rocket.y = HH
    sceneGroup:insert(rocket)
    print ("rocket.x = "..rocket.x)
    rocket.isVisible = true

    --create a new object
    planet = display.newImageRect("ImagesTest/mercury.png", 900, 900)
    sceneGroup:insert(planet)
   --set the possition of the object
    planet.x = HW
    planet.y = HH + 400
    --set the visibility of the planet
    planet.isVisible = false

    --create a new object
    astronaut = display.newImageRect("ImagesTest/astronaut3.png", 250, 400)
    sceneGroup:insert(astronaut)
    --set the possition of the astronaut and its orientation
    astronaut.x = HW - 150
    astronaut.y = HH - 80
    astronaut:scale(-1,1)
    astronaut.rotation = 10
    --set the visibility of the astronaut
    astronaut.isVisible = false

    --create a new object
    pannel = display.newImageRect("ImagesTest/pannel2.png", 320, 300)
    sceneGroup:insert(pannel)
    --set its possition 
    pannel.x = HW + 100
    pannel.y = HH - 250
    --set its visibility
    pannel.isVisible = false

    --create a text
    infoPannel = display.newText("Mercury is the closeset\nto the sun.Its orbital\n period around the Sun of\n87.97 days is the shortest\nof all the planets in\nthe Solar System", HW+100, HH-285, "Georgia", 25)
    sceneGroup:insert(infoPannel)
    --set the color of the text
    infoPannel:setTextColor( 120/255, 66/255, 18/255 )
    -- set the visibility of the text
    infoPannel.isVisible = false

    --create a new object
    alien = display.newImageRect("ImagesTest/alien6.png", 200, 200)
    sceneGroup:insert(alien)
    --set the possition of the alien and its orientation
    alien.x = HW + 200
    alien.y = HH - 30
    alien.rotation = 30
    --set the visibility of the alien
    alien.isVisible = false

   --create the title
    name = display.newText("Mercury", HW, HH+150, native.systemFontBold, 100)
    sceneGroup:insert(name)
    --set color of the title
    name: setTextColor( 202/255, 111/255, 30/255 )
    --set its visibility
    name.isVisible = false

    --create the button
    button = display.newRoundedRect(HW, HH+300, 240, 125, 10)
    sceneGroup:insert(button)
    --set the color
    button:setFillColor( 202/255, 111/255, 30/255 )
    button.isVisible = false

    --create the button text
    buttonText = display.newText("Next...", HW, HH+295, "Georgia", 80)
    sceneGroup:insert(buttonText)
    buttonText.isVisible = false
    
    --create the sound
    rocketSound = audio.loadStream("Sounds/fly.mp3")
    --Function: MoveRocket
    --Input: rocket change its possition
    --Output: none
    --Description: the rocket moves, when it reaches a point(the end of the tablet) it moves in opposite direction
  local function MoveRocket( event )
    rocket.x = rocket.x + scrollSpeed
    rocketChannel = audio.play(rocketSound)
    if (rocket.x > 1000) then
      --turn the rocket in the opposite direction when it reaches one point
      rocket.xScale = -1
      -- move the rocket in the opposite direction
      scrollSpeed = -5
      --when the rocket will touch a certain point, the counter will increase by one
      counter = counter + 1
      print ("counter = " .. counter)
    end

    if (rocket.x < 0) then
      rocket.xScale = 1
      scrollSpeed = 5
    end

      -- when the rocket touches a certain point twice it will perform the functions
     if (counter == 2) then
      --cancel the event( the rocket will stop to move in from rigth to left/vice-versa)
      Runtime:removeEventListener( "enterFrame", MoveRocket )
      --change the orientation of the rocket
      rocket.rotation = 20
      --make "press" and "pressPannel" visible
      local function PressVisible( event )
       press.isVisible = true
       pressPannel.isVisible = true
      end
      timer.performWithDelay(9000, PressVisible)
      --the mercury planet will move from right-top corner to the center
      transition.to(mercury, {x = 700, y = HH +200, xScale = 2, yScale = 2, time = 3000})
      --the rocket moves
      transition.to( rocket, {x = 0, y = 0, time = 5000})
      transition.to( rocket, {rotation = 150, time = 1500, delay = 5000, x = 250, y = HH})
      --add physics to the rocket and the floor
      physics.addBody(rocket, "dynamic", {density = 1.0, friction = 0, bounce = 0.2, radius = 20})
      physics.addBody(floor, "static", {density = 1.0, friction = 0.3, bounce = 0.2})
    end

  --Function: RocketTouched
  --Description: when the rocket is touched a force is applyed and the rocket moves. After a time( under the presure) the rocket moves down, which causes the effect of mocing in a parabolic path
  local function RocketTouched(event)
    if (event.phase =="began") then
      display.getCurrentStage():setFocus(rocket)
     elseif (event.phase == "ended") then
     rocket:applyLinearImpulse(0.01, 0.25,rocket.x, rocket.y)
     display.getCurrentStage():setFocus(nil)
     --Function: ObjectsHide
     --Description: after a period of time, th objects would not be visible
     local function ObjectsHide( event )
      audio.pause(rocketChannel)
      rocket.isVisible = false
      mercury.isVisible = false
      name.isVisible = true
      alien.isVisible = true
      infoPannel.isVisible = true
      pannel.isVisible = true
      astronaut.isVisible = true
      planet.isVisible = true
      button.isVisible = true
      buttonText.isVisible = true
      press. isVisible = false
      pressPannel.isVisible = false
   end
   timer.performWithDelay(4000, ObjectsHide)
    end
  end
  --add event listener to the rocket
  rocket:addEventListener("touch", RocketTouched)

  
end
Runtime:addEventListener("enterFrame", MoveRocket)


 
 button:addEventListener("tap",changeScene)
end

scene:addEventListener( "create", scene )

return scene