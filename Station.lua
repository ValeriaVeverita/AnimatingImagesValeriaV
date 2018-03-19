local composer = require( "composer" )
 
local scene = composer.newScene()
 
 local function changeScene(  )
  composer.gotoScene("Mercury", { effect = "fade", time = 1000} )
 end

function scene:create( event )
 
 local sceneGroup = self.view
 --set local variables
 local HW = display.contentWidth/2
 local HH = display.contentHeight/2
 -- Setting a variable to an mp3 file
 local count = audio.loadStream("Sounds/count.mp3")
 audio.play( count )
 --hide the status bar
 display.setStatusBar(display.HiddenStatusBar)

--set the background
 local background = display.newImageRect("ImagesTest/launcher.jpg",1050,900)
sceneGroup:insert(background)

--anchor the background
background.anchorX = 0
background.anchorY = 0
--set the visibility of the background
background.isVisible = true
local function hideBack( event )
  background.isVisible = false
end
 timer.performWithDelay(8000, hideBack)


--display a pannel with working people
local work = display.newRect(50,50,350,250)
sceneGroup:insert(work)
--anchor the pannel
work.anchorX = 0
work.anchorY = 0
--set the image
work.fill = {type = "image", filename = "ImagesTest/work.jpg"}
--set the border
work.strokeWidth = 5
--set the color of the border
work:setStrokeColor(  234/255, 237/255, 237/255) 
--set the visibility of the pannel
work.isVisible = true
local  function workHide( event )
  work.isVisible = false
end
timer.performWithDelay(4000, workHide)

--create the rocket
local rocket = display.newImageRect("ImagesTest/rocket2.jpg", 500,500)
sceneGroup:insert(rocket)
rocket.rotation = -45
--set the possition of the rocket
rocket.x = HW
rocket.y = HH+200
--create the function of movement
local function MoveRocket( event )
transition.to( rocket, { time=4000, y = - 500 } )
end
rocket:addEventListener("enterFrame", MoveRocket)
--add timer
timer.performWithDelay(4500,MoveRocket)
--add sound
local rocketS = audio.loadStream("Sounds/rocket.mp3")
local function soundPlay( event )
  local rocketA = audio.play (rocketS)
end
timer.performWithDelay(4000, soundPlay)


--create a text pannel
local pannel = display.newRect(HW+50,60, 450,200)
sceneGroup:insert(pannel)
--anchor the pannel
pannel.anchorX = 0
pannel.anchorY = 0
--set the color and border
pannel:setFillColor( 249/255, 231/255, 159/255)
pannel.strokeWidth = 5
pannel:setStrokeColor( 248/255, 196/255, 113/255 )
--set the visibility of the pannel
pannel.isVisible = true
--set the function of the pannel
local function pannelVisibility( event )
  pannel.isVisible = false
end
timer.performWithDelay(5000,pannelVisibility)

--create the text
local information = display.newText(" 2040, the astronaut Noah Moore is\n  to travel all around the Milky Way\n       and visit all 8 planets for the\n         first time in human history.",HW+50,100,native.systemFontBold, 25)
sceneGroup:insert(information)
--anchor the text
information.anchorX = 0
information.anchorY = 0
--set the color of the text
information:setTextColor(0,0,0)
--set the visibility of the tet
information.isVisible = true

local function textVisibility( event )
  information.isVisible = false
end

timer.performWithDelay(5000,textVisibility)

--create other objects
local robot = display.newImageRect("ImagesTest/robot2.png",280, 350)
sceneGroup:insert(robot)
--set the possition of the robot
robot.x = HW + 200
robot.y = HH+220

--Function: moveRobot
--Description: after a period of time the robot will move diagonaly and will fade out
local function moveRobot( event)
  transition.to(robot, { time = 1500, x = 1000, y = HH, alpha = 0})
end
 timer.performWithDelay(5000, moveRobot)

 --create another object
 local fixer = display.newImageRect("ImagesTest/robot.png", 250,300)
 sceneGroup:insert(fixer)
 --set the possition of the robot and the orientation
 fixer.x = 250
 fixer.y = HH+230
fixer:scale(-1,1)

--Function: moveFixer
--Descrition: after a period of time the fixer will move right and will shrink
local function moveFixer( event )
  transition.to(fixer, {time = 1500, x = 1000, xScale = 0.02, yScale = -0.02})
end
 timer.performWithDelay(5000, moveFixer)

--create the second background
local background2 = display.newImageRect("ImagesTest/spaceBackground.jpg",1020,1000)
--anchor the background
background2.anchorX = 0
background2.anchorY = 0
--set the visibility of the background
background2.isVisible = false
 sceneGroup:insert(background2)
--Function: backVisible
--Description: when all the objects hide the second background appear
local function backVisible( event )
  background2.isVisible = true
end
timer.performWithDelay(8000,backVisible)

   --create a text pannel
   local tPan = display.newRect(HW,HH, 600, 400)
   sceneGroup:insert(tPan)
   --set the color of the pannel
  tPan:setFillColor(234/255, 250/255, 241/255)
  --set the viibility of the tPan
  tPan.isVisible = false

  --Function:tPanVisible
  --Description: when all objects disappear, the text pannel appear
  local function tPanVisible( event )
     tPan.isVisible = true
  end
  timer.performWithDelay(8000, tPanVisible)

  --create an object
  local sign = display.newImageRect("ImagesTest/rocket sign.png", 200, 200)
  sceneGroup:insert(sign)
  --set the possition of this sign
   sign.x = HW - 230
   sign.y = HH - 150
   --set the visibility of the sign
   sign.isVisible = false
   local space = audio.loadStream("Sounds/space.mp3")
   --Function: signVisib
   --Description: when all objects disappear the sign appear
   local function signVisib( event )
    sign.isVisible = true
    audio.play(space)
   end
   timer.performWithDelay(8000, signVisib)

   --create the text
   local text = display.newText("          Let's start\n         an amazing\n     space adventure", HW, HH, native.systemFontBold, 50 )
   sceneGroup:insert(text)
   --set the color of the text
   text:setTextColor( 33/255, 97/255, 140/255 )
   --set the visibility of the text
   text.isVisible = false
    --Function: textVisible
    --Description: when all objects disappear, then text appears
    local function textVisible( event)
      text.isVisible = true
    end
    timer.performWithDelay(8000, textVisible)

    --create the button start
    local button = display.newImageRect("ImagesTest/button.png", 150, 100)
    sceneGroup:insert(button)
 --set the possition of the button
 button.x = HW + 10
 button.y = HH + 140
 --set the visibility of the button
 button.isVisible = false

 --Function:buttonVisible
 --Description: when all objects disappear, the button appear
  local function buttonVisible( event )
   button.isVisible = true
  end
  timer.performWithDelay(8000, buttonVisible)
  button:addEventListener("tap", changeScene)
end


scene:addEventListener( "create", scene )

return scene