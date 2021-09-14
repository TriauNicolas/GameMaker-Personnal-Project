// Button pressed for directions
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);
space = keyboard_check(vk_space)
fire = mouse_button == mb_left

#region Moving

_move = right - left

hsp = _move * walksp

x = x + hsp

if(isIdle) {
	switch(_move) {

		case 0:
			if(sprite_index == spr_WalkRight || 
				sprite_index == spr_IDLERight ||
				sprite_index == spr_attackRight || 
				(sprite_index == spr_attackMoving && image_xscale = 1)) {
				sprite_index = spr_IDLERight;
			} else {
				sprite_index = spr_IDLELeft;
			}
			break;
		
		case -1:
			sprite_index = spr_WalkLeft;
			break;
	
		case 1:
			sprite_index = spr_WalkRight;
			break;
	}
}
#endregion

#region Shot

	shot()
	
#endregion