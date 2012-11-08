
package  
{
	import as3isolib.enum.RenderStyleType;
	import engine.*;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;

	public class Player extends Sprite
	{
		private var speed:Number = 100;		
		private var hitCount:Number = 0;
		
		public function get Speed():Number { return speed; }
		public function set Speed(speed:Number):void { this.speed = speed; }
		
		public function get HitCount():Number { return hitCount; } 
		public function set HitCount(hitCount:Number):void { this.hitCount = hitCount }
		
		public function Player() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x0000ff );
			g.drawRect(0, 0, 20, 30);
			g.endFill();
		}
		
		
		public function update():void
		{			
			if ( Input.getKeyHeld( Keyboard.S ) || Input.getKeyHeld( Keyboard.DOWN ) )
				this.y += speed * Time.deltaTime;
			if ( Input.getKeyHeld( Keyboard.W ) || Input.getKeyHeld( Keyboard.UP ) )
				this.y -= speed * Time.deltaTime;
				
			if ( Input.getKeyHeld( Keyboard.D ) || Input.getKeyHeld( Keyboard.RIGHT ) )
				this.x += speed * Time.deltaTime;
			if ( Input.getKeyHeld( Keyboard.A ) || Input.getKeyHeld( Keyboard.LEFT) )
				this.x -= speed * Time.deltaTime;			
				
			if (hitCount >= 3) 
			{
				Global.gameOver = true;
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