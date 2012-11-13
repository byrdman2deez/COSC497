package  
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import engine.*;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class PartyPooper extends Sprite implements IDisposable
	{
		private var g:Graphics; 	
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var target:Sprite;	
		private var direction:uint;
		private var dirx	: Number = 0;
		private var diry	: Number = 0
		private var isDisposed:Boolean = false;
		private var collided:Boolean = false;
		private var canvas:BitmapData;
		private var image:AnimatedSprite;
		private var charIndex:int;
		private var sheet:BitmapData;
		
		private var debuffTimer:Number;
		private var maxDebuffTime:Number = 3000;
		private var debuffEndTime:Number = 0;
		private var debuffed:Boolean = false;
		private var player:Player;
		
		public function PartyPooper(target:Sprite, canvas:BitmapData) 
		{
			
			g = this.graphics;				
			player = target as Player;
			this.canvas = canvas;
			this.target = target;
			
			//sheet = Random.FlipACoin() == 0 ? Resources.yellowGirl : Resources.redGuy;
			charIndex = Random.getPosNumber(4);
			switch (charIndex) 
			{
				case 0:
					sheet = Resources.redGuy;
				break;
				case 1: 
					sheet = Resources.yellowGirl;
					break;
				case 2:
					sheet = Resources.mohawkGuy;
					speedX += 8;
					speedY += 8;
					break;
				case 3:
					sheet = Resources.purpleGirl;
					break;
				case 4:
					sheet = Resources.blueGuy;
					speedY = 0;
					speedX += 15;
				default:
			}
			
			image = new AnimatedSprite(sheet, canvas, new Point(32, 32), new Point(3, 3), 4);
			var degrees:Number = Math.random() * 360;
			
			// First convert "degrees" to radians
			var radians:Number = degrees * 0.017453;
			
			dirx = Math.cos( radians );
			diry = Math.sin( radians );		
			
			//check for enemy's direction
			if (dirx >= 0 && dirx > diry) 
			{
				direction = Direction.RIGHT;
				image.currentFrame.y = 1;
			}
			else if (dirx <= 0 && dirx < diry) 
			{
				direction = Direction.LEFT;
				image.currentFrame.y = 3;
			}
			else if (diry <= 0 && diry < dirx) 
			{
				direction = Direction.UP;
				image.currentFrame.y = 2;
			}
			else if (diry >= 0 && diry > dirx) 
			{
				direction = Direction.DOWN;
				image.currentFrame.y = 0;
			}		
		}
		
		public function update():void 
		{
			
			g.clear();
			g.beginFill( 0xff0000, 0.0 );
			switch (direction) 
			{
				case Direction.RIGHT:
					g.drawRect( -16, -16, 16, 30);
				break;
				case Direction.LEFT:
					g.drawRect( -0, -16, 16, 30);
				break;
				case Direction.UP:
					g.drawRect( -8, -8, 16, 30);
				break;
				case Direction.DOWN:
					g.drawRect( -12, -16, 16, 30);
				break;
				default:
			}
			g.endFill();
			
			image.x = this.x;
			image.y = this.y;
			image.render();
			
			if (speedX == 0) 
			{
				speedX = Random.getPosNumber(4);
			}
			else if (speedY == 0) 
			{
				speedY = Random.getPosNumber(4);
			}
			
			this.x += dirx * speedX;	
			this.y += diry * speedY;
			
			if ( x < 0 - width )
				x += Display.width;
			
			if ( x > Display.width )
				x -= Display.width;
				
			if ( y < 0 - height )
				y += Display.height;
				
			if ( y > Display.height )
				y -= Display.height;
			
			if (CheckCollision(player)) 
			{				
				if (!collided) 
				{
					Systems.sound.play(Resources.Hit);
					debuffTimer = Time.elapsedTime;
					player.Speed *= 0.5;
					player.HitCount++;			
					Global.console.add("speed reduced by 50%...");
					collided = true;
					debuffed = true;
					if (player.HitCount == 2 && debuffed) 
					{
						Systems.sound.play(Resources.Debuff);
					}	
					else if (player.HitCount == 3 && debuffed) 
					{
						Global.gameOver = true;
					}
				}				
			}			
			else 
			{
				collided = false;
			}
			if (Time.elapsedTime >= debuffTimer + maxDebuffTime && debuffed) 
			{
				Global.console.add("speed recovered!");				
				player.Speed *= 2;
				debuffed = false;
				debuffTimer = 0;
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