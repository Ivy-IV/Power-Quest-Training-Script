-- Quick & Dirty training mod for use with Bizhawk's lua console


P1maxhealth = 0x60
P2maxhealth = 0x60

local p1health = 0x0292
local p2health = 0x02FB

local p1meter = 0x029E
local p2meter = 0x0307

local p1combocounter = 0x0319
local p2combocounter = 0x02B0

function playerOneInHitstun()
	return memory.readbyte(p2combocounter)~=0
end

function playerTwoInHitstun()
	return memory.readbyte(p1combocounter)~=0
end

local infiniteTime = function()
	memory.writebyte(0x0248, 0x9A)
end
while true do
	emu.frameadvance();
	infiniteTime();
	if not playerTwoInHitstun() then
		memory.writebyte(0x02FB, 0x60);
		memory.writebyte(0x029E, 9);
	end;
		if not playerOneInHitstun() then
		memory.writebyte(0x0292, 0x60);
		memory.writebyte(0x0307, 9);
	end;
	
end