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
	x = x + hsp;
	
	// Jumping
	vsp = vsp + grv;
	y = y + vsp;

	// Sprites moving x
	if(!isShooting && !isJumping) {
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
	if(isJumping && place_meeting(x, y + 1, obj_wall)) {
		show_debug_message("pute");
		vsp = -jumpsp;
		sprite_index = jump;
		if(sprite_index == walkLeft || sprite_index == idleLeft) {
			image_xscale = -1;
		}
	}
	
	// Checking horizontal collision
	if(place_meeting(x + hsp, y, obj_wall)) {
		while(!place_meeting(x + sign(hsp), y, obj_wall)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	
	// Checking vertical collision
	if(place_meeting(x, y + vsp, obj_wall)) {
		while(!place_meeting(x, y + sign(vsp), obj_wall)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
}