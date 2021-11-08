-----------------------------------------------------------------------------------------
--
-- name.lua
-- The player enters their name on this screen, which gets saved in the db, the player score is also associated with this record.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"


local hit = audio.loadSound("assets/attack1.mp3")
local dmg = audio.loadSound("assets/h1.wav")

--- Creating a new Player journal for saving player names & score.
local player_journal = GGData:new("player_journal.txt")

--------------------------------------------

--local journal = GGData:new("numbers.txt")

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImage("assets/white2.jpg")
	background.x = 175
	background.y = 55
	background.alpha = 1
	background:scale(0.5, 0.5)
	sceneGroup:insert( background )


		--------------------------------- TEXT FIELD FOR ENTERING PLAYER NAME -----------------------------
				local defaultField
				
				local function textListener( event )
				
					if ( event.phase == "began" ) then
						-- User begins editing "defaultField"
				
					elseif ( event.phase == "ended" or event.phase == "submitted" ) then
						-- Output resulting text from "defaultField"
						print( event.target.text )
				
					elseif ( event.phase == "editing" ) then
						print( event.newCharacters )
						print( event.oldText )
						print( event.startPosition )
						print( event.text )
					end
				end
				
				-- Create text field
				defaultField = native.newTextField( 225, 150, 280, 50 )
				sceneGroup:insert( defaultField )
				defaultField:addEventListener( "userInput", textListener )


				
							function begin(event)

								audio.play(click)

								-- Opening up the journal again
								local player_journal = GGData:new("player_journal.txt")
								-- Grabbing the player name from the text field input box and saving it in the journal.
								player_journal.name = defaultField.text
								player_journal:save()
				
								function play_begin(event)
									composer.gotoScene( "level1", {effect = "slideLeft", time = "1000"});
								end

								timer.performWithDelay( 750, play_begin )
							end

	

		----------- Title ----------
			local player_name = display.newText( "PLAYER NAME?", 100, 200, "zcool.ttf", 38 )
			player_name:setFillColor( 0, 0, 0 )
			player_name.x = 225
			player_name.y = 60
			player_name.alpha = 1
			sceneGroup:insert( player_name )


			---------------------------- Confirmation button ------------------------------------
			local confirm = display.newImage("assets/confirm.png")
			confirm.x = 485
			confirm.y = 285
			confirm.alpha = 1;
			confirm:scale(0.012, 0.012)
			confirm:addEventListener("tap", begin);
			sceneGroup:insert( confirm )
			-------------------------------------------------------------------------------------


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