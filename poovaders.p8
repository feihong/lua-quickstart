pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
t=0

function _init()
 ship={sp=1,x=60,y=60}
end

function _update()
	t=(t+1)%9
	if t<3 then
	 ship.sp=1
	elseif t<6 then 
	 ship.sp=2
	else
	 ship.sp=3
	end
end

function _draw()
	cls()
	spr(ship.sp,ship.x,ship.y)
end
__gfx__
00000000008008000080080000800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008008000080080000800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700008888000088880000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000008cc800008cc800008cc800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000088888800888888008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000a0880a00008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000a0000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000a0000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
