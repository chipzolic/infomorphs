-----------------------------------------------------------------------------------------
--
-- fight_screen.lua
-- The infomorph battle takes place on this screen.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"


local hit = audio.loadSound("assets/attack1.mp3")
local dmg = audio.loadSound("assets/h1.wav")

--- Declaring FORWARD REFERENCES.
local fight = display.newImage("assets/fight.png")
local infomorph1 = display.newImage("entireGroup.png", system.DocumentsDirectory)


function leaderboards(event)
	audio.play(click)
	composer.gotoScene( "leaderboards", {effect = "slideLeft", time = "1000"});
end


--- Enemy health randomizer.
local enemy_health = math.random(100, 1950)

--- Forward declaration of enemy strength, for its text to be updated and to take damage (do the same for shield & weight)
local stat3e = display.newText( (enemy_health), 100, 200, "zcool.ttf", 12 )
local infomorph2 = display.newImage("assets/enemy_morph.png")

local yourmorph_journal = GGData:new("yourmorph.txt")

--- Forward declaring strenth dynamic value from journal
local stat2_value = display.newText(yourmorph_journal.strength, 100, 200, "zcool.ttf", 12 )


function you_won(event)
	composer.gotoScene( "victory", {effect = "slideLeft", time = "1000"});
end

function you_lost(event)
	composer.gotoScene( "loose", {effect = "slideLeft", time = "1000"});
end


--- Declaring your score as zero to start things off.
local your_score = 0


--- You take damage function.
function you_take_damage(event)
	--- Random Damage Factor
	local damage_factor_you = math.random(75, 450)
	audio.play(dmg)

	--- Opening up the journal containing your strength number.
	local yourmorph_journal = GGData:new("yourmorph.txt")
	local updated_strength = (yourmorph_journal.strength) - (damage_factor_you)
	yourmorph_journal.strength = updated_strength
	yourmorph_journal:save()

	stat2_value.text = yourmorph_journal.strength

	--- Death checker if statement.
		if yourmorph_journal.strength <= 0 then
			timer.performWithDelay( 1000, you_loose )
			print ("YOU LOST!")
			you_lost()
		else
		end

end

--- Enemy takes damage function.
function enemy_damage(event)

	--- Random Damage Factor
	local damage_factor = math.random(75, 450)

	enemy_health = enemy_health - damage_factor
	stat3e.text = enemy_health
	audio.play(dmg)

	local your_score = ((your_score + 50) * (damage_factor) / 10)
	local player_journal = GGData:new("player_journal.txt")
	player_journal.score = your_score
	player_journal:save()

	if enemy_health <= 0 then
		timer.performWithDelay( 1000, you_won )
	else
	end
end

--- Enemy attacks you function.
function enemy_attack(event)

			function fight_button_reset(event)
				function fight_button_visibility(event)
					fight.alpha = 1
				end
				timer.performWithDelay( 1000, fight_button_visibility )
			end
			
		function enemy_reset(event)
			transition.to(infomorph2, { time=125, alpha=1, x=infomorph2.x+295, y=infomorph2.y, onComplete=fight_button_reset})
			you_take_damage()
		end

	transition.to(infomorph2, { time=125, alpha=1, x=infomorph2.x-295, y=infomorph2.y, onComplete=enemy_reset})
	audio.play(hit)

end

--- You attack the enemy function.
function attack(event)

		audio.play(click)
		fight.alpha = 0

				function infomorph_reset(event)
					transition.to(infomorph1, { time=75, alpha=1, x=infomorph1.x-225, y=infomorph1.y})
				end

				function fight_button_available(event)
					enemy_attack()
				end

	function physical_attack(event)
		audio.play(hit)
		transition.to(infomorph1, { time=275, alpha=1, x=infomorph1.x+225, y=infomorph1.y, onComplete=infomorph_reset})
		timer.performWithDelay( 1000, enemy_damage )
		timer.performWithDelay( 2000, fight_button_available )
	end

		timer.performWithDelay( 400, physical_attack )
end



-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	Runtime:removeEventListener( "mouse", onMouseEvent )

	local background = display.newImage("assets/fightbg.jpg")
	background.x = 0
	background.y = 75
	background.alpha = 1
	background:scale(1, 1)
	sceneGroup:insert( background )


		------------ Fight button -----------------------------
			--local fight = display.newImage("assets/fight.png")
			fight.x = 75
			fight.y = 285
			fight.alpha = 1
			fight:scale(0.1, 0.1)
			fight:addEventListener("tap", attack);
			sceneGroup:insert( fight )
		-------------------------------------------------------

		local line1 = display.newImage("assets/line2.png")
		line1.x = 250
		line1.y = -100
		line1.alpha = 0.8
		line1:scale(0.1, 0.5)
		sceneGroup:insert( line1 )

	--- Your generated infomorph
	-- local infomorph1 = display.newImage("entireGroup.png", system.DocumentsDirectory)
	infomorph1.x = 95
	infomorph1.y = 115
	infomorph1.alpha = 1
	infomorph1:scale(0.12, 0.12)
	sceneGroup:insert( infomorph1 )

	--- ENEMY INFOMORPH
	--local infomorph2 = display.newImage("assets/enemy_morph.png")
	infomorph2.x = 375
	infomorph2.y = 125
	infomorph2.alpha = 1
	infomorph2:scale(0.12, 0.12)
	sceneGroup:insert( infomorph2 )

					-------------------- ENEMY INFOMORPH STATS ---------------------------------
					local stats_title = display.newText( "ENEMY INFOMORPH", 100, 200, "zcool.ttf", 18 )
					stats_title:setFillColor( 0, 0, 0 )
					stats_title.x = 385
					stats_title.y = 25
					stats_title.alpha = 1
					sceneGroup:insert( stats_title )
					
					local random_gen = math.random(10, 25)

					local clicks_random = random_gen
					local shield_random = random_gen * 10

					local stat4e = display.newText( "Clicks: " .. (clicks_random), 100, 200, "zcool.ttf", 12 )
					stat4e:setFillColor( 0, 0, 0 )
					stat4e.x = 375
					stat4e.y = 200
					stat4e.alpha = 1
					sceneGroup:insert( stat4e )

					local enemy_health_label = display.newText( "Strength: ", 100, 200, "zcool.ttf", 12 )
					enemy_health_label:setFillColor( 0, 0, 0 )
					enemy_health_label.x = 360
					enemy_health_label.y = 225
					enemy_health_label.alpha = 1
					sceneGroup:insert( enemy_health_label )

					--local stat3e = display.newText( "Strength:  324", 100, 200, "zcool.ttf", 12 )
					stat3e:setFillColor( 0, 0, 0 )
					stat3e.x = 405
					stat3e.y = 225
					stat3e.alpha = 1
					sceneGroup:insert( stat3e )

					local stat5e = display.newText( ("Shield: ") .. (shield_random), 100, 200, "zcool.ttf", 12 )
					stat5e:setFillColor( 0, 0, 0 )
					stat5e.x = 375
					stat5e.y = 250
					stat5e.alpha = 1
					sceneGroup:insert( stat5e )
					----------------------------------------------------------------------------


			-------------------- YOUR INFOMORPH STATS ---------------------------------
			local morp_title = display.newText( "YOUR INFOMORPH", 100, 200, "zcool.ttf", 18 )
			morp_title:setFillColor( 0, 0, 0 )
			morp_title.x = 85
			morp_title.y = 25
			morp_title.alpha = 1
			sceneGroup:insert( morp_title )

				-------------------- Your infomorph stats for the fight screen and Clicks journal for click stats ----------------
				--local yourmorph_journal = GGData:new("yourmorph.txt")
				local clicks_journal = GGData:new("clicks.txt")

				local stat1 = display.newText( "Clicks: " .. (clicks_journal.count), 100, 200, "zcool.ttf", 12 )
				stat1:setFillColor( 0, 0, 0 )
				stat1.x = 75
				stat1.y = 200
				stat1.alpha = 1
				sceneGroup:insert( stat1 )

				--- Strength label only.
				local stat2 = display.newText( "Strength: ", 100, 200, "zcool.ttf", 12 )
				stat2:setFillColor( 0, 0, 0 )
				stat2.x = 55
				stat2.y = 225
				stat2.alpha = 1
				sceneGroup:insert( stat2 )

							--- Strength DYNAMIC VALUE
							--local stat2_value = display.newText( , 100, 200, "zcool.ttf", 12 )
							stat2_value:setFillColor( 0, 0, 0 )
							stat2_value.x = 105
							stat2_value.y = 225
							stat2_value.alpha = 1
							sceneGroup:insert( stat2_value )

				local stat3 = display.newText( "Shield: " .. (yourmorph_journal.shield_score), 100, 200, "zcool.ttf", 12 )
				stat3:setFillColor( 0, 0, 0 )
				stat3.x = 75
				stat3.y = 250
				stat3.alpha = 1
				sceneGroup:insert( stat3 )


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
		confirm.alpha = 0;
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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene