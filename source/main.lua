import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "ball"
import "globals"
import "paddle"

function setup()
	local ballSprite = Ball(8)
	ballSprite:add()
	
	local leftPaddleSprite = Paddle(50, kPaddleSideLeft, true)
	leftPaddleSprite:add()
	
	local rightPaddleSprite = Paddle(50, kPaddleSideRight, true)
	rightPaddleSprite:add()
	
	local bottomWall = gfx.sprite.addEmptyCollisionSprite(0, display.getHeight(), display.getWidth(), 1)
	bottomWall:setTag(kHorizontalWallTag)
	bottomWall:add()
	
	local topWall = gfx.sprite.addEmptyCollisionSprite(0, -1, display.getWidth(), 1)
	topWall:setTag(kHorizontalWallTag)
	topWall:add()
	
	local leftWall = gfx.sprite.addEmptyCollisionSprite(-1, 0, 1, display.getHeight())
	leftWall:setTag(kLeftWallTag)
	leftWall:add()
	
	local rightWall = gfx.sprite.addEmptyCollisionSprite(display.getWidth(), 0, 1, display.getHeight())
	rightWall:setTag(kRightWallTag)
	rightWall:add()
end

setup()

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end