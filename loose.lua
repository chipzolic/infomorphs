-----------------------------------------------------------------------------------------
--
-- loose.lua
-- If you loose the battle, this screen is displayed.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

local hit = audio.loadSound("assets/attack1.mp3")
local dmg = audio.loadSound("assets/h1.wav")

function leaderboards(event)
	audio.play(click)
	composer.gotoScene( "leaderboards", {effect = "slideLeft", time = "1000"});
end

--------------------------------------------
-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	audio.play(loss)

	Runtime:removeEventListener( "mouse", onMouseEvent )

	local background = display.newImage("assets/white2.jpg")
	background.x = 175
	background.y = 55
	background.alpha = 1
	background:scale(0.5, 0.5)
	sceneGroup:insert( background )

		----------- Title of YOU LOST ----------
			local morp_title = display.newText( "You Lost!", 100, 200, "zcool.ttf", 38 )
			morp_title:setFillColor( 0, 0, 0 )
			morp_title.x = 225
			morp_title.y = 150
			morp_title.alpha = 1
			sceneGroup:insert( morp_title )
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then

		---------------------------- Confirmation button ------------------------------------
		local confirm = display.newImage("assets/confirm.png")
		confirm.x = 485
		confirm.y = 285
		confirm.alpha = 1;
		confirm:scale(0.012, 0.012)
		confirm:addEventListener("tap", leaderboards);
		sceneGroup:insert( confirm )
		-------------------------------------------------------------------------------------

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
		--physics.stop()
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
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene