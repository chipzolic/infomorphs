-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"


local hit = audio.loadSound("assets/attack1.mp3")
local dmg = audio.loadSound("assets/h1.wav")




function leaderboards(event)
	audio.play(click)
	composer.gotoScene( "level1", {effect = "slideLeft", time = "1000"});
end


--- Declaring enemy health here, as 350.
local enemy_health = 350

--- Forward declaration of enemy strength, for its text to be updated and to take damage (do the same for shield & weight)
local stat3e = display.newText( (enemy_health), 100, 200, "zcool.ttf", 12 )


function enemy_damage(event)
	enemy_health = enemy_health - 25
	stat3e.text = enemy_health
	audio.play(dmg)
end



function attack(event)

		audio.play(click)

				function fight_button_reset(event)
					transition.to(fight, { time=75, alpha=1, x=fight.x-10, y=fight.y+10 })
				end

	transition.to(fight, { time=75, alpha=0, x=fight.x+10, y=fight.y-10, onComplete=fight_button_reset})

				function infomorph_reset(event)
					transition.to(infomorph1, { time=75, alpha=1, x=infomorph1.x-225, y=infomorph1.y})
				end

				function fight_button_available(event)
					fight.alpha = 1
				end

	function physical_attack(event)
		fight.alpha = 0
		audio.play(hit)
		transition.to(infomorph1, { time=275, alpha=1, x=infomorph1.x+225, y=infomorph1.y, onComplete=infomorph_reset})
		timer.performWithDelay( 1000, enemy_damage )
		timer.performWithDelay( 6000, fight_button_available )
	end

		timer.performWithDelay( 400, physical_attack )
end




--------------------------------------------

--local journal = GGData:new("numbers.txt")

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	--physics.start()
	--physics.pause()

	--audio.play(dmg)

	Runtime:removeEventListener( "mouse", onMouseEvent )

	local background = display.newImage("assets/white2.jpg")
	background.x = 175
	background.y = 55
	background.alpha = 1
	background:scale(0.5, 0.5)
	sceneGroup:insert( background )


	







		----------- Title of LEADERBOARDS ----------
			local morp_title = display.newText( "LEADERBOARDS", 100, 200, "zcool.ttf", 28 )
			morp_title:setFillColor( 0, 0, 0 )
			morp_title.x = 225
			morp_title.y = 35
			morp_title.alpha = 1
			sceneGroup:insert( morp_title )

					-------------------- Leaderboard player names  ----------------
					local p1 = display.newText( "1. Saad Akhter Ali", 100, 200, "zcool.ttf", 16 )
					p1:setFillColor( 0, 0, 0 )
					p1.x = 225
					p1.y = 75
					p1.alpha = 1
					sceneGroup:insert( p1 )

					local p2 = display.newText( "2. Patrick Dugan", 100, 200, "zcool.ttf", 16 )
					p2:setFillColor( 0, 0, 0 )
					p2.x = 225
					p2.y = 100
					p2.alpha = 1
					sceneGroup:insert( p2 )

					local p3 = display.newText( "3. James Kora", 100, 200, "zcool.ttf", 16 )
					p3:setFillColor( 0, 0, 0 )
					p3.x = 225
					p3.y = 125
					p3.alpha = 1
					sceneGroup:insert( p3 )

					local p4 = display.newText( "4. Greg Shak", 100, 200, "zcool.ttf", 16 )
					p4:setFillColor( 0, 0, 0 )
					p4.x = 225
					p4.y = 150
					p4.alpha = 1
					sceneGroup:insert( p4 )

					
					local p5 = display.newText( "5. Paul Stefan", 100, 200, "zcool.ttf", 16 )
					p5:setFillColor( 0, 0, 0 )
					p5.x = 225
					p5.y = 175
					p5.alpha = 1
					sceneGroup:insert( p5 )









--	filename="entireGroup.png", baseDir=system.DocumentsDirectory,

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
		--physics.start()


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
		confirm:addEventListener("tap", leaderboards);
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
	
	--package.loaded[physics] = nil
	--physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )




-----------------------------------------------------------------------------------------

return scene