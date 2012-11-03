
package  
{
	import engine.*;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;

	public class Player extends Sprite
	{
		private const SPEED:int = 70;		
		
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
				this.y += SPEED * Time.deltaTime;
			if ( Input.getKeyHeld( Keyboard.W ) || Input.getKeyHeld( Keyboard.UP ) )
				this.y -= SPEED * Time.deltaTime;
				
			if ( Input.getKeyHeld( Keyboard.D ) || Input.getKeyHeld( Keyboard.RIGHT ) )
				this.x += SPEED * Time.deltaTime;
			if ( Input.getKeyHeld( Keyboard.A ) || Input.getKeyHeld( Keyboard.LEFT) )
				this.x -= SPEED * Time.deltaTime;
		}
	}

}