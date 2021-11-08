-----------------------------------------------------------------------------------------
--
-- main.lua
-- This is the main file used to launch the game.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- this is the database module
GGData = require("GGData")

local composer = require "composer"

_G.click = audio.loadSound("assets/ui.mp3")
_G.victory = audio.loadSound("assets/won.mp3")
_G.loss = audio.loadSound("assets/lost.mp3")

-- load menu screen
-- composer.gotoScene( "menu" )
composer.gotoScene( "name" )
--composer.gotoScene( "level1" )
--composer.gotoScene( "capture_screen" )
--composer.gotoScene( "fight_screen" )
--composer.gotoScene( "leaderboards" )
--composer.gotoScene( "victory" )
--composer.gotoScene( "loose" )