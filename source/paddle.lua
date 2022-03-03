import "globals"

kPaddleSideLeft = 0
kPaddleSideRight = 1

kPaddleHorizontalMargin = 6
kPaddleVerticalMargin = 0
kPaddleSpeed = 6
kPaddleWidth = 8

class("Paddle").extends(gfx.sprite)

function Paddle:init(length, side, controllable)
	Paddle.super.init(self)
	
	self.length = length
	self.controllable = controllable
	
	self:setSize(kPaddleWidth, length)
	self:setCollideRect(0, 0, self:getSize())
	self:setTag(kPaddleTag)
	
	if side == kPaddleSideLeft then
		self:moveTo(kPaddleHorizontalMargin + kPaddleWidth / 2, display.getHeight() / 2)
	elseif side == kPaddleSideRight then
		self:moveTo(display.getWidth() - kPaddleHorizontalMargin - kPaddleWidth / 2, display.getHeight() / 2)
	end
end

function Paddle:draw(x, y, width, height)
	gfx.fillRoundRect(x, y, width, height, 2)
end

function Paddle:update()
	if not self.controllable then
		return
	end
	
	if playdate.buttonIsPressed(playdate.kButtonUp) then
		self:safeMoveBy(0, -kPaddleSpeed)
	end
	
	if playdate.buttonIsPressed(playdate.kButtonDown ) then
		self:safeMoveBy(0, kPaddleSpeed)
	end
	
	local pos, chg = playdate.getCrankChange()
	
	if chg ~= 0 then
		self:safeMoveBy(0, chg)
	end
end

function Paddle:safeMoveBy(x, y)
	local curX, curY, w, h = self:getBounds()
	
	if curY + y < kPaddleVerticalMargin then
		self:moveTo(self.x, kPaddleVerticalMargin + self.length / 2)
		return
	elseif curY + y + h > display.getHeight() - kPaddleVerticalMargin then
		self:moveTo(self.x, display.getHeight() - kPaddleVerticalMargin - self.length / 2)
		return
	end
	
	self:moveBy(x, y)
end