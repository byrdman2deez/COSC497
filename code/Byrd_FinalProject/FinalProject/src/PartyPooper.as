package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import engine.*;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class PartyPooper extends Sprite
	{
		private var speed:Number = 5;
		private var target:Sprite;	
		private var direction:uint;
		private var dirx	: Number = 0;
		private var diry	: Number = 0
		private var isDisposed:Boolean = false;
		
		public function PartyPooper(target:Sprite) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0xff0000 );
			g.drawRect(0, 0, 20, 30);
			g.endFill();		
			
			this.target = target;
			var degrees:Number = Math.random() * 360;
			
			// First convert "degrees" to radians
			var radians:Number = degrees * 0.017453;
			
			dirx = Math.cos( radians );
			diry = Math.sin( radians );		
			
			//check for enemy's direction
			if (dirx >= 0 && dirx > diry) 
			{
				direction = Direction.RIGHT;
			}
			else if (dirx <= 0 && dirx < diry) 
			{
				direction = Direction.LEFT;
			}
			else if (diry <= 0 && diry < dirx) 
			{
				direction = Direction.UP;
			}
			else if (diry >= 0 && diry > dirx) 
			{
				direction = Direction.DOWN;
			}
			trace(direction);
		}
		
		public function update():void 
		{
			
			switch (direction) 
			{
				case Direction.RIGHT:
					this.x += speed;
					break;
				case Direction.LEFT:
					this.x -= speed;
					break;
				case Direction.UP:
					this.y -= speed;
					break;
				case Direction.DOWN:
					this.y += speed;
					break;
				default:
			}
			
			if ( x < 0 )
				x += Display.width;
			
			if ( x > Display.width )
				x -= Display.width;
				
			if ( y < 0 )
				y += Display.height;
				
			if ( y > Display.height )
				y -= Display.height;
			
			if (CheckCollision(target)) 
			{
				trace("Collided!");
			}
		}
		
		public function dispose():void 
		{
			target = null;
			isDisposed = true;
		}
		
		private function CheckCollision(sprite:Sprite):Boolean 
		{
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			if ( Math.abs( this.x - sprite.x ) < MIN_COLLISION_CHECK_PIXELS ||
				 Math.abs( this.y - sprite.y ) < MIN_COLLISION_CHECK_PIXELS )
			{
				if (this.hitTestObject( sprite )) 
				{
					return true;
				}
			}
			return false;
		}
	}

}