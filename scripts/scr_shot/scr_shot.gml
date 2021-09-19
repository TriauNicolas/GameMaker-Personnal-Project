// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function ScrShot() {

var move = argument[0];

#region Setting the shooting sprite
	if(isIdle && fire && !isJumping) {
		bulletNum = 1;
		isShooting = true;
		isIdle = false;
		shootingRight = false;
		image_index = 0;
		
		switch(sprite_index) {
			case spr_IDLERight:
				sprite_index = spr_attackRight;
				shootingRight = true;
				break;
			
			case spr_IDLELeft:
				sprite_index = spr_attackLeft;
				shootingRight = false;
				break;
				
			case spr_WalkRight:
				sprite_index = spr_attackMoving;
				shootingRight = true;
				break;
				
			case spr_WalkLeft:
				sprite_index = spr_attackMoving;
				image_xscale = -1;
				shootingRight = false;
				break;
		}
	}
#endregion

#region Shot a bullet

function creatingBullet () {
	if(image_index >= 7 && bulletNum > 0) {
		var bullet = instance_create_layer(x, (y - sprite_height / 4), "Instances", obj_bullet);
		if(shootingRight) {
			bullet.direction = 0;
		} else {
			bullet.direction = 180;
		}
		bulletNum--
	}
}

#endregion

#region Shooting animations
	if(isShooting) {
		creatingBullet();
		
		// If the move change the sprite change
		if(sprite_index == spr_attackLeft || sprite_index == spr_attackRight) {
			var currentImageIndex = image_index;
			switch(move) {
				case 1:
					sprite_index = spr_attackMoving;
					image_index = currentImageIndex;
					shootingRight = true;
					break;
					
				case -1:
					sprite_index = spr_attackMoving;
					image_xscale = -1;
					image_index = currentImageIndex;
					shootingRight = false;
					break;
			}
		} else {
			var currentImageIndex = image_index;
			if(move == 0) {
				if(shootingRight) {
					sprite_index = spr_attackRight;
					image_index = currentImageIndex;
					shootingRight = true;
				} else {
					sprite_index = spr_attackLeft;
					image_xscale = 1;
					image_index = currentImageIndex;
					shootingRight = false;
				}	
			}
		}
		
		// Reset animation if another shot is made
		if(fire && image_index >= 10) {
			image_index = 1;
			bulletNum = 1;
			creatingBullet();
		}
		
		// End of the animation
		if(image_index >= image_number - 1) {
			image_xscale = 1;
			isIdle = true;
			isShooting = false;
			
			if(move == 0) {
				if(shootingRight) {
					sprite_index = spr_IDLERight;
				} else {
					sprite_index = spr_IDLELeft;
				}
			} else if (move == 1) {
				sprite_index = spr_WalkRight;
			} else {
				sprite_index = spr_WalkLeft;	
			}
		}
	}
}
#endregion