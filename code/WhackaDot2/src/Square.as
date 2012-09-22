package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Square extends Sprite
	{
		
		public function Square() 
		{
			graphics.beginFill(0x00ffff);
			graphics.drawRect(-20, -20, 40, 40);
			graphics.endFill();			
		}
		
	}

}