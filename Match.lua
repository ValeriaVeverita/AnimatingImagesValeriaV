local composer = require( "composer" )
 
local scene = composer.newScene()
 
 --set local variables
 local background
 local sun
 local mercury
 local mercuryText
 local venus
 local venusText
 local earth
 local earthText
 local mars
 local marsText
 local jupiter
 local jupiterText
 local saturn
 local saturnText
 local uranus
 local uranusText
 local neptune
 local neptuneText
 local pannel
 local text
 -- create()
function scene:create( event )
 
  local sceneGroup = self.view
   --set the background
   background = display.newImageRect("ImagesTest/space.jpg", 1030, 800)
   sceneGroup:insert(background)
   --anchor the image
   background.anchorX = 0
   background.anchorY = 0

   --CREATE THE OBJECTS:
     --Mercruy
     mercury = display.newImageRect("ImagesTest/mercury.png", 230, 230)
     sceneGroup:insert(mercury)
     --set its possition
     mercury.x = 780
     mercury.y = 130
     --create the text
     mercuryText = display.newText("Mercury", 780, 130, "Georgia", 50)
     sceneGroup:insert(mercuryText)
     --set text color
     mercuryText:setTextColor(88/255, 24/255, 69/255)

     --Venus
     venus = display.newImageRect("ImagesTest/venus.png", 250, 250)
     sceneGroup:insert(venus)
     --set its possition
     venus.x = 300
     venus.y = 650
     --create the text
     venusText = display.newText("Venus", 300, 650, "Georgia", 50)
     sceneGroup:insert(venusText)
     --set its color
     venusText:setTextColor(144/255, 12/255, 63/255)

     --Earth
     earth = display.newImageRect("ImagesTest/earth.png", 220, 220)
     sceneGroup:insert(earth)
     --set its possition
     earth.x = 300
     earth.y = 120
     --create the text
     earthText= display.newText("Earth", 300, 120, "Georgia", 50)
     sceneGroup:insert(earthText)
     --set its color
     earthText:setTextColor(199/255, 0/255, 57/255)

     --Mars
     mars = display.newImageRect("ImagesTest/mars.png", 230, 230)
     sceneGroup:insert(mars)
     --set its possition
     mars.x = 550
     mars.y = 130
     --create the text
     marsText = display.newText("Mars", 550, 130, "Georgia", 60)
     sceneGroup:insert(marsText)
     --set text color
     marsText:setTextColor(218/255, 247/255, 166/255)
     
     --Jupiter
     jupiter = display.newImageRect("ImagesTest/jupiter.png", 230, 230)
     sceneGroup:insert(jupiter)
     --set its possition
     jupiter.x = 540
     jupiter.y = 650
     --create the text
     jupiterText = display.newText("Jupiter", 540, 650, "Georgia", 50)
     sceneGroup:insert(jupiterText)
     --set text color
     jupiterText:setTextColor(163/255, 228/255, 215/255)

     --Neptune
     neptune = display.newImageRect("ImagesTest/neptune.png", 230, 230)
     sceneGroup:insert(neptune)
     --set its possition
      neptune.x = 770
      neptune.y = 650
      --create the text
      neptuneText = display.newText("Neptune", 770, 650, "Georgia", 50)
      sceneGroup:insert(neptuneText)
      --set text color
      neptuneText:setTextColor(255/255, 195/255, 0/255)

      --Saturn
      saturn = display.newImageRect("ImagesTest/saturn.png", 300, 300)
      sceneGroup:insert(saturn)
      --set its possition and orientation
      saturn.x = 900
      saturn.y = 280
      saturn.rotation = 30
      --create the text
      saturnText = display.newText("Saturn", 890, 280, "Georgia", 50)
      sceneGroup:insert(saturnText)
      --set text color
      saturnText:setTextColor(74/255, 35/255, 90/255)

      --Uranus
      uranus = display.newImageRect("ImagesTest/uranus.png", 200, 200)
      sceneGroup:insert(uranus)
      --set its possition
      uranus.x = 900
      uranus.y = 480
      --create the text
      uranusText = display.newText("Uranus", 900, 480, "Georgia", 50)
      sceneGroup:insert(uranusText)
      --set its color
      uranusText:setTextColor(175/255, 96/255, 26/255)

      --display an object(sun)
      sun = display.newImageRect("ImagesTest/sun.png", 1500, 1500)
      sceneGroup:insert(sun)
      --set its possition
      sun.x = -500
      sun.y = 300

      --create the pannel
      pannel = display.newRoundedRect(500, 400, 600, 400, 13)
      sceneGroup:insert(pannel)
      --set its color
      pannel:setFillColor(249/255, 231/255, 159/255)
      --set the border
      pannel.strokeWidth = 6
      --set border's color
      pannel:setStrokeColor(14/255, 102/255, 85/255)

      --create the text
      text = display.newText("Now that we've explored\n         all the planets,\n       put them in order ", 500, 400, native.systemFontBold, 50)
      sceneGroup:insert(text)
      --set text color
      text:setTextColor(14/255, 102/255, 85/255)

      --Function:HideInfo
      --Description: after a certain period, the pannel and text hide
      local function HideInfo( event )
        pannel.isVisible = false
        text.isVisible = false
      end
      timer.performWithDelay(5000, HideInfo)
      --create boolean variables to keep track of which object was touched first
      mercuryTouched = false
      mercuryTextTouched = false
      venusTouched = false
      venusTextTouched = false
      earthTouched = false
      earthTextTouched = false
      marsTouched = false
      marsTextTouched = false
      jupiterTouched = false
      jupiterTextTouched = false
      saturnTouched = false
      saturnTextTouched = false
      uranusTouched = false
      uranusTextTouched = false
      neptuneTouched = false
      neptuneTextTouched = false


      --Function: MercuryListener
      --Input:touch listenre
      --Description: move mercury, when it is touched
      local function MercuryListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            mercuryTouched = true
            mercuryTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          mercury.x = touch.x
          mercury.y = touch.y
          mercuryText.x = touch.x
          mercuryText.y = touch.y
        end
        if(touch.phase == "ended") then
          mercuryTouched = false
          mercuryTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      mercury:addEventListener("touch", MercuryListener)
      mercuryText:addEventListener("touch", MercuryListener)


      --Function: VenusListener
      --Input:touch listenre
      --Description: move venus, when it is touched
      local function VenusListener( touch )
        if (touch.phase == "began")then
          if ( mercuryTouched ==false) and (mercuryTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            venusTouched = true
            venusTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          venus.x = touch.x
          venus.y = touch.y
          venusText.x = touch.x
          venusText.y = touch.y
        end
        if(touch.phase == "ended") then
          venusTouched = false
          venusTextTouched = false
         mercuryTouched = false
         mercuryTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      venus:addEventListener("touch", VenusListener)
      venusText:addEventListener("touch",VenusListener)


      --Function: EarthListener
      --Input:touch listenre
      --Description: move earth, when it is touched
      local function EarthListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(mercuryTouched == false) and (mercuryTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            earthTouched = true
            earthTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          earth.x = touch.x
          earth.y = touch.y
          earthText.x = touch.x
          earthText.y = touch.y
        end
        if(touch.phase == "ended") then
          earthTouched = false
          earthTextTouched = false
         venusTouched = false
         venusTextTouched = false
         mercuryTouched = false
         mercuryTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      earth:addEventListener("touch", EarthListener)
      earthText:addEventListener("touch", EarthListener)


      --Function: MarsListener
      --Input:touch listenre
      --Description: move mars, when it is touched
      local function MarsListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (mercuryTouched == false) and (mercuryTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            marsTouched = true
            marsTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          mars.x = touch.x
          mars.y = touch.y
          marsText.x = touch.x
          marsText.y = touch.y
        end
        if(touch.phase == "ended") then
          marsTouched = false
          marsTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         mercuryTouched = false
         mercuryTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      mars:addEventListener("touch", MarsListener)
      marsText:addEventListener("touch", MarsListener)


      --Function: JupiterListener
      --Input:touch listenre
      --Description: move jupiter, when it is touched
      local function JupiterListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (mercuryTouched == false) and (mercuryTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            jupiterTouched = true
            jupiterTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          jupiter.x = touch.x
          jupiter.y = touch.y
          jupiterText.x = touch.x
          jupiterText.y = touch.y
        end
        if(touch.phase == "ended") then
          jupiterTouched = false
          jupiterTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         mercuryTouched = false
         meruryTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      jupiter:addEventListener("touch", JupiterListener)
      jupiterText:addEventListener("touch", JupiterListener)


      --Function: SaturnListener
      --Input:touch listenre
      --Description: move saturn, when it is touched
      local function SaturnListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (mercuryTouched == false) and (mercuryTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            saturnTouched = true
            saturnTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          saturn.x = touch.x
          saturn.y = touch.y
          saturnText.x = touch.x
          saturnText.y = touch.y
        end
        if(touch.phase == "ended") then
          saturnTouched = false
          saturnTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      saturn:addEventListener("touch", SaturnListener)
      saturnText:addEventListener("touch", SaturnListener)


      --Function: UranusListener
      --Input:touch listenre
      --Description: move uranus, when it is touched
      local function UranusListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (mercuryTouched == false) and (mercuryTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            uranusTouched = true
            uranusTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          uranus.x = touch.x
          uranus.y = touch.y
          uranusText.x = touch.x
          uranusText.y = touch.y
        end
        if(touch.phase == "ended") then
          uranusTouched = false
          uranusTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         mercuryTouched = false
         mercuryTextTouched = false
          neptuneTouched = false
         neptuneTextTouched = false
       end
      end
      --add event listener to the respective object
      uranus:addEventListener("touch", UranusListener)
      uranusText:addEventListener("touch", UranusListener)

      --Function: NeptuneListener
      --Input:touch listenre
      --Description: move neptune, when it is touched
      local function NeptuneListener( touch )
        if (touch.phase == "began")then
          if ( venusTouched ==false) and (venusTextTouched == false) and(earthTouched == false) and (earthTextTouched == false) and (marsTouched == false) and (marsTextTouched == false) and (jupiterTouched == false) and (jupiterTextTouched == false) and (saturnTouched == false) and (saturnTextTouched == false) and (uranusTouched == false) and (uranusTextTouched == false) and (neptuneTouched == false) and (neptuneTextTouched == false) then
            neptuneTouched = true
            neptuneTextTouched = true
          end
        end
        if(touch.phase == "moved")then
          neptune.x = touch.x
          neptune.y = touch.y
          neptuneText.x = touch.x
          neptuneText.y = touch.y
        end
        if(touch.phase == "ended") then
          neptuneTouched = false
          neptuneTextTouched = false
         venusTouched = false
         venusTextTouched = false
         earthTouched = false
         earthTextTouched = false
         marsTouched = false
         marsTextTouched = false
         jupiterTouched = false
         jupiterTextTouched = false
         saturnTouched = false
         saturnTextTouched = false
         uranusTouched = false
         uranusTextTouched = false
          mercuryTouched = false
         mercuryTextTouched = false
       end
      end
      --add event listener to the respective object
      neptune:addEventListener("touch", NeptuneListener)
      neptuneText:addEventListener("touch", NeptuneListener)
end

scene:addEventListener( "create", scene )

return scene