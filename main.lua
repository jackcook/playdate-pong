import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "ball"
import "globals"
import "paddle"

function setup()
	ballSprite = Ball(8)
	ballSprite:add()
	
	leftPaddleSprite = Paddle(50, kPaddleSideLeft, true)
	leftPaddleSprite:add()
	
	rightPaddleSprite = Paddle(50, kPaddleSideRight, true)
	rightPaddleSprite:add()
	
	bottomWall = gfx.sprite.addEmptyCollisionSprite(0, display.getHeight(), display.getWidth(), 1)
	bottomWall:setTag(kHorizontalWallTag)
	bottomWall:add()
	
	topWall = gfx.sprite.addEmptyCollisionSprite(0, -1, display.getWidth(), 1)
	topWall:setTag(kHorizontalWallTag)
	topWall:add()
	
	leftWall = gfx.sprite.addEmptyCollisionSprite(-1, 0, 1, display.getHeight())
	leftWall:setTag(kLeftWallTag)
	leftWall:add()
	
	rightWall = gfx.sprite.addEmptyCollisionSprite(display.getWidth(), 0, 1, display.getHeight())
	rightWall:setTag(kRightWallTag)
	rightWall:add()
end

setup()

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end