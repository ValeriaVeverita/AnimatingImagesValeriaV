local composer = require( "composer" )
 
local scene = composer.newScene()

local function changeScene(  )
      composer.gotoScene("Station",{effect = "fade", time = 1000})
end
 --set local variables
 local HW = display.contentWidth/2
 local HH = display.contentHeight/2
 local background 
 local astronaut
 local earth
 local mars
 local mercury
 local venus
 local neptune
 local saturn
 local satellite
 local label
 local title
 local button

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    --set the background
    background = display.newImageRect("ImagesTest/spaceBackground.jpg",2100,1550)
    sceneGroup:insert(background)

    --create the object
    astronaut=display.newImageRect("ImagesTest/astronaut.png",300,450)
    --set the possition, its orientation 
    astronaut.x = 200
    astronaut.y = 200
    astronaut:scale(-1,1)
    astronaut.rotation = 35
    sceneGroup:insert(astronaut)

    --set the title
    title = display.newText(" The amazing\nworld of space",HW, HH, native.systemFontBold, 70)
    --set the color of the text
    title:setTextColor(  234/255, 250/255, 241/255  )
    sceneGroup:insert(title)

    --create the object
    mercury = display.newImageRect("ImagesTest/mercury.png",250,250)
    --set the the possition of the object
    mercury.x = 570
    mercury.y = 150
    sceneGroup:insert(mercury)

    --create the object
    venus = display.newImageRect("ImagesTest/venus.png",230,230)
    --set the possition of the object and the opacity
    venus.x = 840
    venus.y = 200
    venus.alpha = 0.9
    sceneGroup:insert(venus)

    --create the object
    earth = display.newImageRect("ImagesTest/earth.png",200,200)
    --set the possition and opacity of the object
    earth.x = 950
    earth.y = 410
    earth.rotation = -90
    earth.alpha = 0.85
    sceneGroup:insert(earth)

    --create the object
    mars = display.newImageRect("ImagesTest/mars.png",150,150)
    --set the possition and opacity of the object
    mars.x = 900
    mars.y = 590
    mars.alpha = 0.8
    sceneGroup:insert(mars)

    --create the object
    saturn = display.newImageRect("ImagesTest/saturn.png",215,215)
    --set the possition and opacity of the object
    saturn.x = 720
    saturn.y = 650
    saturn.alpha = 0.78
    sceneGroup:insert(saturn)

    --create the object
    neptune = display.newImageRect("ImagesTest/neptune.png",115,115)
    --set the possition and opacity of the object
    neptune.x = 550
    neptune.y = 690
    neptune.alpha = 0.77
    sceneGroup:insert(neptune)

    --create the object
    satellite = display.newImageRect("ImagesTest/satellite.png",400,400)
    --set the possition of the object
    satellite.x = 200
    satellite.y = HH+200
    satellite.rotation = -80
    sceneGroup:insert(satellite)

    --create the object
    button = display.newImageRect("ImagesTest/button.png",170,120)
    --set the possition
    button.x = HW - 20
    button.y = HH + 150
    sceneGroup:insert(button)

    button:addEventListener("tap",changeScene)
end

scene:addEventListener( "create", scene )
 
return scene