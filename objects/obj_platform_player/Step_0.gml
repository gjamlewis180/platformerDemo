/// @description Insert description here


//get inputs
var keyLeft=keyboard_check(ord("A"));
var keyRight=keyboard_check(ord("D"));
var keyJump=keyboard_check_pressed(ord("W"));

//where to move to horiz
hSpd= (keyRight-keyLeft) * hWalkSpd;

//where to move vert
vSpd=vSpd+grav;

//work out if you should be able to jump
//coyote time effect
if((canJump >0) && (keyJump))
{
	vSpd=vJumpSpd;
	canJump=0;
}
else
{
	canJump--;
}


//collide and move
//horizontal
if(place_meeting(x+hSpd,y,obj_wall))
{
	while(abs(hSpd)>0.1)
	{
		hSpd*=0.5;
		if(!place_meeting(x+hSpd,y,obj_wall))
		{
			x+=hSpd;
		}
		hSpd=0;
	}
}
x+=hSpd;

//vertical
if(place_meeting(x,y + vSpd,obj_wall))
{
	if(vSpd>0)
	{
		canJump=10;
	}
	while(abs(vSpd)>0.1)
	{
		vSpd*=0.5;
		if(!place_meeting(x,y + vSpd,obj_wall))
		{
			y+=vSpd;
		}
		vSpd=0;
	}
}
y+=vSpd;
