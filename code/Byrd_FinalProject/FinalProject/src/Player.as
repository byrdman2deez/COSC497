
package  
{
	import engine.*;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;

	public class Player extends Sprite
	{
		private var speed:Number = 80;		
		private var hitCount:Number = 0;
		private var canvas:BitmapData;
		private var image:AnimatedSprite; 
		
		public function get Speed():Number { return speed; }
		public function set Speed(speed:Number):void { this.speed = speed; }
		
		public function get HitCount():Number { return hitCount; } 
		public function set HitCount(hitCount:Number):void { this.hitCount = hitCount }
		
		public function Player(canvas:BitmapData) 
		{
			this.canvas = canvas;
			
			var g:Graphics = this.graphics;	
			g.beginFill( 0x0000ff, 0.0 );
			g.drawRect(-8, -16, 16, 32);
			g.endFill();			
			image = new AnimatedSprite(Resources.mainGuy, canvas, new Point(32, 32), new Point(4, 4), 4);
		}
		
		
		public function update():void
		{			
			image.x = this.x;
			image.y = this.y;
			image.render();
			
			//canvas.unlock();
			
			if ( Input.getKeyHeld( Keyboard.S ) || Input.getKeyHeld( Keyboard.DOWN ) )
			{
				this.y += speed * Time.deltaTime;
				image.direction = Direction.DOWN;
				image.currentFrame.y = 0;
			}
			if ( Input.getKeyHeld( Keyboard.W ) || Input.getKeyHeld( Keyboard.UP ) )
			{	
				this.y -= speed * Time.deltaTime;
				image.direction = Direction.UP;
				image.currentFrame.y = 1;
			}	
			if ( Input.getKeyHeld( Keyboard.D ) || Input.getKeyHeld( Keyboard.RIGHT ) )
			{
				this.x += speed * Time.deltaTime;
				image.direction = Direction.RIGHT;
				image.currentFrame.y = 3;
			}
			if ( Input.getKeyHeld( Keyboard.A ) || Input.getKeyHeld( Keyboard.LEFT) )
			{
				this.x -= speed * Time.deltaTime;			
				image.direction = Direction.LEFT;
				image.currentFrame.y = 2;
			}
		}
		
		public function CheckCollision(sprite:Sprite):Boolean 
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