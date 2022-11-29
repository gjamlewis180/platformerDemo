/// @description handling player movement and jumping physics 


//set up vars for moving left and right 
//these function return 1 if true 
left=keyboard_check(ord("A"));
right=keyboard_check(ord("D"));
//jump=keyboard_check_pressed(ord("W"));

//determine if player should move left or right 
var dir_move=right-left

//set hspeed accordingly 
hspeed=dir_move * wlkspd;

vspeed=vspeed+grav

//jumping logic
if((place_meeting(x,y+1,obj_wall))&&sign(vspeed)!=-1 && canJump<=0)
{
	vspeed=-10;
}
else
{
	canJump--;
}
//horizontal collison check
if (place_meeting(x+hspeed,y,obj_wall))
{
    //as long as there is not a collision via 1 pixel in the direction of movement
	//add one to x depending on the sign of hspeed
	while(!place_meeting(x+sign(hspeed),y,obj_wall))
	{
		x=x+sign(hspeed);
	}
	hspeed=0;
}
//we only want our collison with platform to happen if we are falling down 
//so if vspeed isnt negative then started doing our collision check
if (sign(vspeed)!=-1)
{

	//vertical collison check
	if (place_meeting(x,y+vspeed,obj_wall))
	{
	    //as long as there is not a collision via 1 pixel in the direction of movement
		//add one to y depending on the sign of speed
		while(!place_meeting(x,y+sign(vspeed),obj_wall))
		{
			y=y+sign(vspeed);
		}
		vspeed=0;
	}
}


