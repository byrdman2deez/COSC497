package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import engine.*;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class PartyPooper extends Sprite implements IDisposable
	{
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var target:Sprite;	
		private var direction:uint;
		private var dirx	: Number = 0;
		private var diry	: Number = 0
		private var isDisposed:Boolean = false;
		private var collided:Boolean = false;
		
		private var debuffStartTime:Number = 0;
		private var maxDebuffTime:Number = 3000;
		private var debuffEndTime:Number = 0;
		private var debuffed:Boolean = false;
		
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
		}
		
		public function update():void 
		{
			if (speedX == 0) 
			{
				speedX = Random.getNumberBetween(-6, 6);	
			}
			else if (speedY == 0) 
			{
				speedY = Random.getNumberBetween(-6, 6);
			}
			
			this.x += speedX;	
			this.y += speedY;
			
			if ( x < 0 - width )
				x += Display.width;
			
			if ( x > Display.width )
				x -= Display.width;
				
			if ( y < 0 - height )
				y += Display.height;
				
			if ( y > Display.height )
				y -= Display.height;
			
			if (CheckCollision(target)) 
			{				
				//Global.gameOver = true;
				if (!collided) 
				{
					var player:Player = target as Player;
					player.Speed *= 0.5;
					debuffStartTime = Time.elapsedTime;				
					player.HitCount++;
					collided = true;
					trace(player.Speed);
				}				
			}
			else 
			{
				collided = false;
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