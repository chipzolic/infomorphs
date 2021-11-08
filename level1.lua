-----------------------------------------------------------------------------------------
--
-- level1.lua
-- This is the infomorph drawing level, you get a blank canvas where you click and generate your artistic infomorph.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

--------------------------------------------

local journal = GGData:new("numbers.txt")

local clicks_journal = GGData:new("clicks.txt")


-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	physics.start()
	physics.pause()

end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()


		local background = display.newImage("assets/bg1.jpg")
		background.x = 175
		background.y = 100
		background.alpha = 1
		background:scale(0.5, 0.5)
		sceneGroup:insert( background )
		--background:setFillColor( .5 )
		

		function randomizer(event)
			local my_number = math.random( 1, 28 )
			local journal = GGData:new("numbers.txt")
			journal.number = my_number
			journal:save()

			print(my_number)
		end


		--- New display group for only art elements, not the background.
		local group = display.newGroup()

		local shape1 = display.newImage("assets/puta1.png")
		shape1.x = event.x
		shape1.y = event.y
		shape1.alpha = 0;
		shape1:scale(0.6, 0.6)
		shape1.fill.effect = "filter.brightness"
		shape1.fill.effect.intensity = 0.1
		group:insert( shape1 )
		sceneGroup:insert( shape1 )

		local shape2 = display.newImage("assets/puta2.png")
		shape2.x = event.x
		shape2.y = event.y
		shape2.alpha = 0;
		shape2:scale(0.6, 0.6)
		group:insert( shape2 )
		sceneGroup:insert( shape2 )

		local shape3 = display.newImage("assets/puta3.png")
		shape3.x = event.x
		shape3.y = event.y
		shape3.alpha = 0;
		shape3:scale(0.6, 0.6)
		group:insert( shape3 )
		sceneGroup:insert( shape3 )

		local shape4 = display.newImage("assets/stick2.png")
		shape4.x = event.x
		shape4.y = event.y
		shape4.alpha = 0;
		shape4:scale(0.4, 0.4)
		group:insert( shape4 )
		sceneGroup:insert( shape4 )

		local shape5 = display.newImage("assets/stick1.png")
		shape5.x = event.x
		shape5.y = event.y
		shape5.alpha = 0;
		shape5:scale(0.4, 0.4)
		group:insert( shape5 )
		sceneGroup:insert( shape5 )

		-------------------------- More shapes --------------------------------------------------
		local shape6 = display.newImage("assets/new/1.png")
		shape6.x = event.x
		shape6.y = event.y
		shape6.alpha = 0;
		shape6:scale(0.4, 0.4)
		group:insert( shape6 )
		sceneGroup:insert( shape6 )

		local shape7 = display.newImage("assets/new/2.png")
		shape7.x = event.x
		shape7.y = event.y
		shape7.alpha = 0;
		shape7:scale(0.4, 0.4)
		group:insert( shape7 )
		sceneGroup:insert( shape7 )

		local shape8 = display.newImage("assets/new/3.png")
		shape8.x = event.x
		shape8.y = event.y
		shape8.alpha = 0;
		shape8:scale(0.4, 0.4)
		group:insert( shape8 )
		sceneGroup:insert( shape8 )

		local shape9 = display.newImage("assets/new/4.png")
		shape9.x = event.x
		shape9.y = event.y
		shape9.alpha = 0;
		shape9:scale(0.4, 0.4)
		group:insert( shape9 )
		sceneGroup:insert( shape9 )

		local shape10 = display.newImage("assets/new/5.png")
		shape10.x = event.x
		shape10.y = event.y
		shape10.alpha = 0;
		shape10:scale(0.4, 0.4)
		group:insert( shape10 )
		sceneGroup:insert( shape10 )

		local shape11 = display.newImage("assets/new/6.png")
		shape11.x = event.x
		shape11.y = event.y
		shape11.alpha = 0;
		shape11:scale(0.4, 0.4)
		group:insert( shape11 )
		sceneGroup:insert( shape11 )

		local shape12 = display.newImage("assets/new/7.png")
		shape12.x = event.x
		shape12.y = event.y
		shape12.alpha = 0;
		shape12:scale(0.4, 0.4)
		group:insert( shape12 )
		sceneGroup:insert( shape12 )

		local shape13 = display.newImage("assets/new/8.png")
		shape13.x = event.x
		shape13.y = event.y
		shape13.alpha = 0;
		shape13:scale(0.4, 0.4)
		group:insert( shape13 )
		sceneGroup:insert( shape13 )

		local shape14 = display.newImage("assets/new/9.png")
		shape14.x = event.x
		shape14.y = event.y
		shape14.alpha = 0;
		shape14:scale(0.4, 0.4)
		group:insert( shape14 )
		sceneGroup:insert( shape14 )

		local shape15 = display.newImage("assets/new/10.png")
		shape15.x = event.x
		shape15.y = event.y
		shape15.alpha = 0;
		shape15:scale(0.4, 0.4)
		group:insert( shape15 )
		sceneGroup:insert( shape15 )
		
		-------------------------------------------------------------------------------------
		local confirm = display.newImage("assets/confirm.png")

		function confirmation(event)
			print("Capturing Screen Object!")

			confirm.alpha = 0;
			background.alpha = 0;

				function saver(event)
					display.save( sceneGroup, { filename="entireGroup.png", baseDir=system.DocumentsDirectory, captureOffscreenArea=false, backgroundColor={0,0,0,0} } )
					display.remove( group )
					audio.play(click)
					composer.gotoScene( "capture_screen", {effect = "slideLeft", time = "500"});
				end
	
			timer.performWithDelay( 500, saver )

		end

						---------------------------- Confirmation button ------------------------------------
						--local confirm = display.newImage("assets/confirm.png")
						confirm.x = 485
						confirm.y = 285
						confirm.alpha = 1;
						confirm:scale(0.012, 0.012)
						confirm:addEventListener("tap", confirmation);
						sceneGroup:insert( confirm )
						-------------------------------------------------------------------------------------

		local splat = audio.loadSound("assets/spray3.mp3")

		local clicks = 1

		------------------------------------------- MOUSE FUNCTION PURE ---------------------------------------------
			-- Called when a mouse event has been received.
			local function onMouseEvent( event )
				if event.type == "down" and event.x < 445 then
					if event.isPrimaryButtonDown then
						print( "Left mouse button clicked." )

						print(event.x)
						print(event.y)

						clicks = clicks + 1
						audio.play(splat)

						randomizer()

						--- Opening up the Random Number Journal
						local journal = GGData:new("numbers.txt")
						--journal.number = my_number
						--journal:save()

						--- Opening up the CLICKS Journal
						local clicks_journal = GGData:new("clicks.txt")
						clicks_journal.count = clicks
						clicks_journal:save()


						--------------------- SHAPE 1 ----------------
						if  journal.number == 1 then 
							shape1.alpha = 1;
							shape1:rotate( -15 )
							shape1:scale(0.6, 0.6)
							shape1.x = event.x
							shape1.y = event.y
							shape1.fill.effect = "filter.brightness"
							shape1.fill.effect.intensity = 0.1

						elseif journal.number == 2 then
							shape1.alpha = 1;
							shape1:rotate( 25 )
							shape1:scale(1, 1.4)
							shape1.x = event.x
							shape1.y = event.y
							shape1.fill.effect.intensity = 0.2

						elseif journal.number == 3 then

							shape1.alpha = 1;
							shape1:scale(1.2, 1.4)
							shape1:rotate( 45 )
							shape1.x = event.x
							shape1.y = event.y
							--shape1.fill.effect.intensity = 0.15

						elseif journal.number == 4 then
							shape1.alpha = 1;
							shape1:scale(1.3, 1.1)
							shape1:rotate( 75 )
							shape1.x = event.x
							shape1.y = event.y
							shape1.fill.effect.intensity = 0

						elseif journal.number == 5 then
							shape2.alpha = 1;
							shape2:rotate( -15 )
							shape2:scale(0.6, 0.6)
							shape2.x = event.x
							shape2.y = event.y
							shape2.fill.effect = "filter.brightness"
							shape2.fill.effect.intensity = 0.1

						elseif journal.number == 6 then
							shape2.alpha = 1;
							shape2:rotate( -25 )
							shape2:scale(0.8, 0.9)
							shape2.x = event.x
							shape2.y = event.y
							shape2.fill.effect = "filter.brightness"
							shape2.fill.effect.intensity = 0.0

						elseif journal.number == 7 then
							shape2.alpha = 1;
							shape2:rotate( -75 )
							shape2:scale(1.1, 1.1)
							shape2.x = event.x
							shape2.y = event.y
							shape2.fill.effect = "filter.brightness"
							shape2.fill.effect.intensity = 0.2

						elseif journal.number == 8 then
							shape2.alpha = 1;
							shape2:rotate( -7105 )
							shape2:scale(1.3, 1.4)
							shape2.x = event.x
							shape2.y = event.y
							shape2.fill.effect = "filter.brightness"
							shape2.fill.effect.intensity = 0

						elseif journal.number == 9 then
							shape3.alpha = 1;
							shape3:rotate( 75 )
							shape3:scale(0.6, 0.6)
							shape3.x = event.x
							shape3.y = event.y
							shape3.fill.effect = "filter.brightness"
							shape3.fill.effect.intensity = -0.2

						elseif journal.number == 10 then
							shape3.alpha = 1;
							shape3:rotate( 115 )
							shape3:scale(0.8, 0.9)
							shape3.x = event.x
							shape3.y = event.y
							shape3.fill.effect = "filter.brightness"
							shape3.fill.effect.intensity = -0.1

						elseif journal.number == 11 then
							shape3.alpha = 1;
							shape3:rotate( 155 )
							shape3:scale(1.2, 1.3)
							shape3.x = event.x
							shape3.y = event.y
							shape3.fill.effect = "filter.brightness"
							shape3.fill.effect.intensity = 0

						elseif journal.number == 12 then
							shape4.alpha = 1;
							shape4:rotate( 155 )
							shape4:scale(0.6, 0.7)
							shape4.x = event.x
							shape4.y = event.y
							shape4.fill.effect = "filter.brightness"
							shape4.fill.effect.intensity = 0

						elseif journal.number == 13 then
							shape4.alpha = 1;
							shape4:rotate( 225 )
							shape4:scale(1, 1.1)
							shape4.x = event.x
							shape4.y = event.y
							shape4.fill.effect = "filter.brightness"
							shape4.fill.effect.intensity = -0.1

						elseif journal.number == 14 then
							shape4.alpha = 1;
							shape4:rotate( 235 )
							shape4:scale(1, 1.3)
							shape4.x = event.x
							shape4.y = event.y
							shape4.fill.effect = "filter.brightness"
							shape4.fill.effect.intensity = -0.1

						elseif journal.number == 15 then
							shape4.alpha = 1;
							shape4:rotate( 335 )
							shape4:scale(1.2, 1.4)
							shape4.x = event.x
							shape4.y = event.y
							shape4.fill.effect = "filter.brightness"
							shape4.fill.effect.intensity = 0
		
						elseif journal.number == 16 then
							shape5.alpha = 1;
							shape5:rotate( 180 )
							shape5:scale(1.2, 1.4)
							shape5.x = event.x
							shape5.y = event.y
							shape5.fill.effect = "filter.brightness"
							shape5.fill.effect.intensity = 0

						elseif journal.number == 17 then
							shape5.alpha = 1;
							shape5:rotate( 280 )
							shape5:scale(1, 1)
							shape5.x = event.x
							shape5.y = event.y
							shape5.fill.effect = "filter.brightness"
							shape5.fill.effect.intensity = -0.2

						elseif journal.number == 18 then
							shape5.alpha = 1;
							shape5:rotate( 380 )
							shape5:scale(1, 1)
							shape5.x = event.x
							shape5.y = event.y
							shape5.fill.effect = "filter.brightness"
							shape5.fill.effect.intensity = -0.2

							------------------------------------------ Additional Shapes For Variety ------------------------------------
						elseif journal.number == 19 then
							shape6.alpha = 1;
							shape6:rotate( 380 )
							shape6:scale(1, 1)
							shape6.x = event.x
							shape6.y = event.y
							shape6.fill.effect = "filter.brightness"
							shape6.fill.effect.intensity = -0.2

						elseif journal.number == 20 then
							shape7.alpha = 1;
							shape7:rotate( 380 )
							shape7:scale(1, 1)
							shape7.x = event.x
							shape7.y = event.y
							shape7.fill.effect = "filter.brightness"
							shape7.fill.effect.intensity = -0.2

						elseif journal.number == 21 then
							shape8.alpha = 1;
							shape8:rotate( 380 )
							shape8:scale(1, 1)
							shape8.x = event.x
							shape8.y = event.y
							shape8.fill.effect = "filter.brightness"
							shape8.fill.effect.intensity = -0.2

						elseif journal.number == 22 then
							shape9.alpha = 1;
							shape9:rotate( 380 )
							shape9:scale(1, 1)
							shape9.x = event.x
							shape9.y = event.y
							shape9.fill.effect = "filter.brightness"
							shape9.fill.effect.intensity = -0.2

						elseif journal.number == 23 then
							shape10.alpha = 1;
							shape10:rotate( 380 )
							shape10:scale(1, 1)
							shape10.x = event.x
							shape10.y = event.y
							shape10.fill.effect = "filter.brightness"
							shape10.fill.effect.intensity = -0.2

						elseif journal.number == 24 then
							shape11.alpha = 1;
							shape11:rotate( 380 )
							shape11:scale(1, 1)
							shape11.x = event.x
							shape11.y = event.y
							shape11.fill.effect = "filter.brightness"
							shape11.fill.effect.intensity = -0.2

						elseif journal.number == 25 then
							shape12.alpha = 1;
							shape12:rotate( 380 )
							shape12:scale(1, 1)
							shape12.x = event.x
							shape12.y = event.y
							shape12.fill.effect = "filter.brightness"
							shape12.fill.effect.intensity = -0.2

						elseif journal.number == 26 then
							shape13.alpha = 1;
							shape13:rotate( 380 )
							shape13:scale(1, 1)
							shape13.x = event.x
							shape13.y = event.y
							shape13.fill.effect = "filter.brightness"
							shape13.fill.effect.intensity = -0.2

						elseif journal.number == 27 then
							shape14.alpha = 1;
							shape14:rotate( 380 )
							shape14:scale(1, 1)
							shape14.x = event.x
							shape14.y = event.y
							shape14.fill.effect = "filter.brightness"
							shape14.fill.effect.intensity = -0.2

						elseif journal.number == 28 then
							shape15.alpha = 1;
							shape15:rotate( 380 )
							shape15:scale(1, 1)
							shape15.x = event.x
							shape15.y = event.y
							shape15.fill.effect = "filter.brightness"
							shape15.fill.effect.intensity = -0.2

						else
						end	

					
					elseif event.isSecondaryButtonDown then
						print( "Right mouse button clicked." )        
					end
				end
			end

			-- Add the mouse event listener.
			Runtime:addEventListener( "mouse", onMouseEvent )
			------------------------------------------- MOUSE FUNCTION PURE ---------------------------------------------

	end

end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene