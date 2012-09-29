package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class BlockI extends Sprite
	{
		
		public function BlockI() 
		{
			graphics.lineStyle(3);
			
			graphics.beginFill(0x00efff);
			
			graphics.lineTo(0, 50);
			graphics.lineTo(50, 50);
			graphics.lineTo(50, 0);
			graphics.lineTo(0, 0);
			
			graphics.moveTo(50, 0);
			graphics.lineTo(100, 0);
			graphics.lineTo(100, 50);
			graphics.lineTo(50, 50);
			
			graphics.moveTo(100, 0);
			graphics.lineTo(150, 0);
			graphics.lineTo(150, 50);
			graphics.lineTo(100, 50);
			
			graphics.moveTo(150, 0);
			graphics.lineTo(200, 0);
			graphics.lineTo(200, 50);
			graphics.lineTo(150, 50);
			
			graphics.endFill();
		}
		
	}

}