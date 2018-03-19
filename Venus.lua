local composer = require( "composer" )
 
local scene = composer.newScene()

local function changeScene(  )
  composer.gotoScene("Earth", {effect = "fade", time = 1000})
end
--create local variables
local background 
local HW = display.contentWidth/2
local HH = display.contentHeight/2
local rocket
local venus
local planet
local pressPannel
local press
local astronaut
local alien
local infoPannel
local info
local name
local button
local buttonNext
local floor
local scrollSpeed
local space
local text
local rocketSound
local rocketChannel
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    --add and start physics
    local physics = require ("physics")
    physics.start()

    --add the background
    background = display.newImageRect("ImagesTest/space.jpg",1030,800)
    sceneGroup:insert(background)
    --anchor the image
    background.anchorX = 0
    background.anchorY = 0

    --add the floor
    floor = display.newRect(0,HH+300, 2500, 30)
    sceneGroup:insert(floor)
    floor.alpha = 0
    
    --create an object
    planet = display.newImageRect("ImagesTest/venus.png", 800, 800)
    sceneGroup:insert(planet)
    --set the possition  and visibility of the object
    planet.x = HW
    planet.y = HH + 400
    planet.isVisible = false

    --create an object
    button = display.newRoundedRect(HW, HH+300, 200, 100, 5)
    sceneGroup:insert(button)
    --set the visibility and the color of the objects
    button.isVisible = false
    button:setFillColor( 29/255, 120/255, 102/255 )

    --display the text
    buttonNext = display.newText("Next ...", HW, HH+300, "Georgia", 60)
    sceneGroup:insert(buttonNext)
    --set its visibility
    buttonNext.isVisible = false

    --create an object
    infoPannel = display.newImageRect("ImagesTest/pannel.png", 400, 330)
    sceneGroup:insert(infoPannel)
    --set the possition of the pannel and its visiility
    infoPannel.x = HW 
    infoPannel.y = 150
    infoPannel.isVisible = false

    --display the text
    info = display.newText("         Hi! I am Owaw,\n the citizen of the planet\n                Venus", HW, 115, native.systemFontBold, 35)
    sceneGroup:insert(info)
    --set the color of the text and its visibility
    info:setTextColor( 69/255, 179/255, 157/255 )
    info.isVisible = false

    --create an object
    space = display.newImageRect("ImagesTest/spaceship.png", 200, 200)
    sceneGroup:insert(space)
    --set its visibility
    space.isVisible = false


    --create an object
    astronaut =display.newImageRect("ImagesTest/astronaut2.png", 300, 350)
    sceneGroup:insert(astronaut)
    --set its position , orientation and visbility
    astronaut.x = HW+100
    astronaut.y = HH
    astronaut:scale(-1,1) 
    astronaut.rotation = 10
    astronaut.isVisible = false

    --create an object
    pressPannel = display.newRoundedRect(200, HH+40, 200, 100, 50)
    sceneGroup:insert(pressPannel)
    --set the color of the pannel
    pressPannel:setFillColor( 214/255, 137/255, 16/255 )
    --set the visibility of the pannel
    pressPannel.isVisible = false

    --create text
    text = display.newText("Did you know that Venus\nis the second planet from\nthe Sun, orbiting it every 224.7\nEarth days. It has the longest\nrotation period of any planet\nin the Solar System and rotates\nin the opposite direction\nto most other planets.", HW, 120, "Georgia", 25)
    text.isVisible = false
    sceneGroup:insert(text)
    --set text's color
    text:setTextColor(69/255, 179/255, 157/255)

    --create a text
    press = display.newText("Press",203, HH+40, native.systemFontBold, 45)
    --set the visibility of the text
    press.isVisible = false

    --create an object
    alien = display.newImageRect("ImagesTest/alien3.png", 200, 250)
    sceneGroup:insert(alien)
    --set its possition and visibility
    alien.x = 300
    alien.y = HH + 35
    alien.isVisible = false
    -- create an object 
    venus = display.newImageRect("ImagesTest/venus.png", 200, 200)
    venus.isVisible = true
    sceneGroup:insert(venus)
    --set the possition of the object
    venus.x = 1020
    venus.y = 0
    --set the visibility of the object
    venus.alpha = 0

    --set the speed of the rocket
    scrollSpeed = 3

    --create a text
    name = display.newText("Venus", HW, HH+200, native.systemFontBold, 100)
    sceneGroup:insert(name)
    --set the visibility of the text
    name.isVisible = false

    --add the rocket
    rocket = display.newImageRect("ImagesTest/rocket2.jpg", 300, 300)
    rocket.isVisible = true
    sceneGroup:insert(rocket)
    --set its possition and orientation
    rocket.x = 1000
    rocket.y = 0
    rocket.rotation = 180
    --set the transperancy of the object
    rocket.alpha = 0

    --create the sound
    rocketSound = audio.loadStream("Sounds/fly.mp3")
    --Function: MoveRocket
    --Input: move the possition of the rocket, by adding y and x value
    --Output: none
    --Description: when the scene schanges the rocket will move diagonaly
    local function MoveRocket( event )
      --increase the x and y possition of the rocket by a certain value ( scrollSpeed)
      rocket.x = rocket.x - scrollSpeed-1
      rocket.y = rocket.y + scrollSpeed
      rocketChannel = audio.play(rocketSound)
      --print the possition of the x on the console
      print ("rocket.x ="..rocket.x)
      --increase the visibility of the object
      rocket.alpha = rocket.alpha + 0.01

      if (rocket.x <= 200) then
        -- stop the evnt listener(the rocket will not move anymore)
        Runtime:removeEventListener( "enterFrame", MoveRocket )
        --set the visibility of the "press" and"pressPannel" objects
        press.isVisible = true
        pressPannel.isVisible = true
        --add physics to the rocket and floor
        physics.addBody(rocket, "dynamic", {density = 1.0, friction = 0.2, bounce = 1, radius = 20})
        physics.addBody(floor, "static", {density = 1.0, friction = 0.3, bounce = 0.2})
        --change the orientation of the object
        rocket.rotation = -20
        --move the venus 
        transition.to(venus,{x = HW+250, y = HH+200, alpha = 1, time = 1500, xScale = 1.2, yScale = 1.2})
      end

      --Function: RocketTouched
      --Description: when the rocket is touched, a force is applied and the rocket moves
      local function RocketTouched( event)
        if (event.phase =="began") then
          display.getCurrentStage():setFocus(rocket)
          elseif (event.phase == "ended") then
          --hide the "press" and "pressPannel" objects
          press.isVisible = false
          pressPannel.isVisible = false
          --when the rocket is touched, a certain force is applied to the object
         rocket:applyLinearImpulse(0.1, 0, rocket.x, rocket.y)
         display.getCurrentStage():setFocus(nil)

          --Function: HideObjects
          --Description: After a certain period of time certain objects are hidden, others become visible
          local function HideObjects( event )
            --hide "venus" and "rocket"
            audio.pause(rocketChannel)
            venus.isVisible = false
            rocket.isVisible = false
            --show the "planet", "spaceship", "astronaut", "alien", "button"
            -- set its visibility and move the spaceship
            astronaut.isVisible = true
            planet.isVisible = true
            name.isVisible = true
            space.isVisible = true
            button.isVisible = true
            buttonNext.isVisible = true
            transition.to(space, {x = 300, y = HH, xScale = 2, yScale = 2, time = 2000,})

            --Function: HideSpacdee
            --Description: After a time the spaceship disappears and the alien appears
            local function HideSpace( event )
              space.isVisible = false
              alien.isVisible = true
              info.isVisible = true
              infoPannel.isVisible = true

              --Function: HideInfo
              --Description: When the "info" hides, another text appear
              local function HideInfo( event )
               info.isVisible = false
               text.isVisible = true
              end
              timer.performWithDelay(1000, HideInfo)

            end
            timer.performWithDelay(2100, HideSpace)
          
          end
          timer.performWithDelay(2000,HideObjects )
        end
      end
      --add event listener to the rocket
      rocket:addEventListener("touch", RocketTouched)
    end
    Runtime: addEventListener("enterFrame", MoveRocket)

  button:addEventListener("tap", changeScene)
end

scene:addEventListener( "create", scene)

return scene