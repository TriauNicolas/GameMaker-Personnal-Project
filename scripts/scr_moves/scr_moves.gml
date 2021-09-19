/// @function                            ScrEnduranceBar(agilityCount, smoothStamina, maxStamina, stamina);
/// @param  {real}        agilityCount    Selected buttons
/// @description
function ScrMoves(){
	
	var idleLeft = argument[0];
	var idleRight = argument[1];
	var walkLeft = argument[2];
	var walkRight = argument[3];
	var jump = argument[4];
	
	// Moving horizontal
	_move = right - left;
	hsp = _move * walksp;
	
	// Jumping
	vsp = vsp + grv;

	// Sprites moving x
	if(!isShooting && place_meeting(x, y + 1, obj_wall)) {
		switch(_move) {
			case 0:
				if(sprite_index == walkRight || sprite_index == idleRight) {
					sprite_index = idleRight;
				} else {
					sprite_index = idleLeft;
				}
				break;
		
			case -1:
				sprite_index = walkLeft;
				break;
	
			case 1:
				sprite_index = walkRight;
				break;
		}
	}

	// Jump + change sprite
	if(space && place_meeting(x, y + 1, obj_wall)) {
		vsp = -jumpsp;
		isJumping = true;
		
		if(sprite_index == idleRight || sprite_index == walkRight) {
			sprite_index = jump;
		} else {
			sprite_index = jump;
			image_xscale = -1;
		}
	}
	
	// Checking horizontal collision
	if(place_meeting(x + hsp, y, obj_wall)) {
		while(!place_meeting(x + sign(hsp), y, obj_wall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
x = x + hsp;
		
	// Checking vertical collision
	if(place_meeting(x, y + vsp, obj_wall)) {
		show_debug_message("It vertical plateform");
			while(!place_meeting(x, y + sign(vsp), obj_wall)) {		
				y = y + sign(vsp);
			}
		isJumping = false;
		
		if(isJumping == false && sprite_index == jump) {
			if(image_xscale == 1) {
				sprite_index = idleRight;	
			} else {
				sprite_index = idleLeft;	
			}
			image_xscale = 1;
		}
		vsp = 0;
	}
y = y + vsp;
}