// Button pressed for directions
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);
space = keyboard_check(vk_space);
fire = mouse_button == mb_left;

#region Moving

if(space) {
	isJumping = true;	
} else {
	isJumping = false;	
}

	ScrMoves(spr_IDLELeft, spr_IDLERight, spr_WalkLeft, spr_WalkRight, spr_Jump);

#endregion

#region Shot

	ScrShot(_move);
	
#endregion