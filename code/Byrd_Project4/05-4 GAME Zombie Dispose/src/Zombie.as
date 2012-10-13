package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import engine.IDisposable;

	/**
	 * Enemy
	 */
	public class Zombie extends Sprite implements IDisposable
	{
		private const SPEED:Number = 30;
		
		private var target	:Sprite;
		private var speed	:Number;
		
		public var isDisposed:Boolean = false;
		
		
		/// CTOR
		public function Zombie( target:Sprite ) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x33ee22 );
			g.drawRect(0, 0, 10, 14);
			g.endFill();
			
			speed = SPEED + (Math.random() * 2) * Global.level;
			
			this.target = target;
		}
		
		
		/// psuedo destructor
		public function dispose() :void
		{
			target = null;
			isDisposed = true;
		}
		
		public function update( delta:Number ) :void
		{
			
			
			var v:Vector3D = new Vector3D();
			v.x = (this.x - target.x);
			v.y = (this.y - target.y);
			v.normalize();
			v.scaleBy( speed * delta );
			this.x -= v.x;
			this.y -= v.y;
			
			if (CheckCollision(target)) 
			{
				Global.gameOver = true;								
			}
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