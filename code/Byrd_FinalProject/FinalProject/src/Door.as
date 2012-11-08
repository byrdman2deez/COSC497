package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import engine.*;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Door extends Sprite	
	{		
		public function Door(target:Sprite) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x00ff00 );
			g.drawRect(0, 0, 60, 20);
			g.endFill();
		}		
	}
}