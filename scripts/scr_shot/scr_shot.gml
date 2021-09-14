// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function shot(){
	
	if(isIdle && fire) {
		bulletNum = 1;
		isShooting = true;
		isIdle = false;
		shootingRight = false;
		image_index = 0;
		
		switch(sprite_index) {
			case spr_IDLERight:
				sprite_index = spr_attackRight
				shootingRight = true;
				break;
			
			case spr_IDLELeft:
				sprite_index = spr_attackLeft
				shootingRight = false;
				break;
				
			case spr_WalkRight:
				sprite_index = spr_attackMoving
				shootingRight = true;
				break;
				
			case spr_WalkLeft:
				sprite_index = spr_attackMoving
				image_xscale = -1
				shootingRight = false;
				break;
		}
	}

	if(isShooting) {
		if(image_index >= 7 && bulletNum > 0) {
			var bullet = instance_create_layer(x, (y - sprite_height / 4), "Instances", obj_bullet);
			if(shootingRight) {
				bullet.direction = 0;
			} else {
				bullet.direction = 180;
			}
			bulletNum--
		}
		if(image_index >= image_number - 1) {
			image_xscale = 1;
			isIdle = true;
			isShooting = false;
			
			if(shootingRight) {
				sprite_index = spr_IDLERight	
			} else {
				sprite_index = spr_IDLELeft	
			}
		}
	}
}