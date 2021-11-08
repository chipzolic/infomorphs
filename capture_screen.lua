-----------------------------------------------------------------------------------------
--
-- capture_screen.lua
-- The generated infomorph is displayed on this screen, along with some randomly generated strength & shield statistics are applied to it, based on the number of clicks you do to generate it.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"


--- Creating a new journal for saving the generated stats of your Infomorph.
local yourmorph_journal = GGData:new("yourmorph.txt")

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

	--- Open the clicks journal and grab the number of clicks in there.
	local clicks_journal = GGData:new("clicks.txt")
	local clicks_score = clicks_journal.count
	print (clicks_score)

	--- Random number generator for use in calculating Strength & Shield
	local random_score = math.random(10, 35)

	-- Dynamic Strength Calculator
	local strength_score = (100 * random_score)
	--local strength_random = random_gen * 10

	-- Dynamic Shield Calculator
	local shield_score = ((strength_score * random_score) / 100)



	function fight(event)
		audio.play(click)
	
		print("FIRING")
	
		---- Save the generated stats of your infomorph in its respective journal
		local yourmorph_journal = GGData:new("yourmorph.txt")
		yourmorph_journal.strength = strength_score
		yourmorph_journal.shield_score = shield_score
		yourmorph_journal:save()
		-------------------------------------------------------------------------
			function nexto(event)
				composer.gotoScene( "fight_screen", {effect = "slideLeft", time = "1000"});
			end
	
		timer.performWithDelay( 1500, nexto )
	end
	
	--------------------------------------------

-------------------------------------------------

function scene:create( event )

	local sceneGroup = self.view

	physics.start()
	physics.pause()

	local background = display.newImage("assets/white2.jpg")
	background.x = 175
	background.y = 55
	background.alpha = 1
	background:scale(0.5, 0.5)
	sceneGroup:insert( background )

	--- Your generated infomorph
	local infomorph1 = display.newImage("entireGroup.png", system.DocumentsDirectory)
	infomorph1.x = 110
	infomorph1.y = 115
	infomorph1.alpha = 1
	infomorph1:scale(0.13, 0.13)
	sceneGroup:insert( infomorph1 )

	local line1 = display.newImage("assets/line2.png")
	line1.x = 315
	line1.y = -100
	line1.alpha = 0.8
	line1:scale(0.1, 0.5)
	sceneGroup:insert( line1 )

		----------- Title of your Infomorph ----------
			local morp_title = display.newText( "YOUR INFOMORPH", 100, 200, "zcool.ttf", 18 )
			morp_title:setFillColor( 0, 0, 0 )
			morp_title.x = 85
			morp_title.y = 25
			morp_title.alpha = 1
			sceneGroup:insert( morp_title )

				----------- STATS of your Infomorph ----------
				local stats_title = display.newText( "STATS", 100, 200, "zcool.ttf", 18 )
				stats_title:setFillColor( 0, 0, 0 )
				stats_title.x = 385
				stats_title.y = 25
				stats_title.alpha = 1
				sceneGroup:insert( stats_title )


					local stat1 = display.newText( ("Clicks: ") .. (clicks_score), 100, 200, "zcool.ttf", 14 )
					stat1:setFillColor( 0, 0, 0 )
					stat1.x = 385
					stat1.y = 100
					stat1.alpha = 1
					sceneGroup:insert( stat1 )

					local stat2 = display.newText( ("Strength: ") .. (strength_score), 100, 200, "zcool.ttf", 14 )
					stat2:setFillColor( 0, 0, 0 )
					stat2.x = 410
					stat2.y = 125
					stat2.alpha = 1
					sceneGroup:insert( stat2 )
					
					local stat3 = display.newText( ("Shield: ") .. (shield_score), 100, 200, "zcool.ttf", 14 )
					stat3:setFillColor( 0, 0, 0 )
					stat3.x = 395
					stat3.y = 150
					stat3.alpha = 1
					sceneGroup:insert( stat3 )

end





function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	Runtime:removeEventListener( "mouse", onMouseEvent )
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()

		function randomizer(event)
			local my_number = math.random( 1, 18 )
			local journal = GGData:new("numbers.txt")
			journal.number = my_number
			journal:save()

			print(my_number)
		end

		---------------------------- Confirmation button ------------------------------------
		local confirm = display.newImage("assets/confirm.png")
		confirm.x = 485
		confirm.y = 285
		confirm.alpha = 1;
		confirm:scale(0.012, 0.012)
		confirm:addEventListener("tap", fight);
		sceneGroup:insert( confirm )
		-------------------------------------------------------------------------------------

		local splat = audio.loadSound("assets/splat.mp3")

		local clicks = 1

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