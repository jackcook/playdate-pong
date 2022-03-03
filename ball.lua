import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "globals"

class("Ball").extends(gfx.sprite)

function Ball:init(radius)
	Ball.super.init(self)
	
	self.radius = radius
	self.xSpeed = 6
	self.ySpeed = 5
	
	self:setSize(radius, radius)
	self:setCollideRect(0, 0, self:getSize())
	self:setTag(kBallTag)
	self:setCollisionsEnabled(true)
	self:reset()
end

function Ball:draw(x, y, width, height)
	gfx.fillCircleInRect(x, y, width, height)
end

function Ball:update()
	_, _, collisions, _ = self:moveWithCollisions(self.x + self.xSpeed, self.y + self.ySpeed)
	
	for i = 1, #collisions do
		if collisions[i].normal.y ~= 0 then
			self.ySpeed = self.ySpeed * -math.abs(collisions[i].normal.y)
		end
		
		if collisions[i].normal.x ~= 0 then
			self.xSpeed = self.xSpeed * -math.abs(collisions[i].normal.x)
		end
		
		if collisions[i].other:getTag() == kLeftWallTag or collisions[i].other:getTag() == kRightWallTag then
			self:reset()
		end
	end
	
	int = display.getRect():intersection(self:getBoundsRect())
	
	if int.width == 0 or int.height == 0 then
		self:reset()
	end
end

function Ball:reset()
	self:moveTo(display.getWidth() / 2, display.getHeight() / 2)
end