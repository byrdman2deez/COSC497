package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class BlockO extends Sprite
	{
		
		public function BlockO() 
		{
			graphics.lineStyle(3);
			
			graphics.beginFill(0xffff00);
			
			graphics.lineTo(0, 50);
			graphics.lineTo(50, 50);
			graphics.lineTo(50, 0);
			graphics.lineTo(0, 0);
			
			graphics.moveTo(0, 50);
			graphics.lineTo(0, 100);
			graphics.lineTo(50, 100);
			graphics.lineTo(50, 50);
			
			graphics.moveTo(50, 100);
			graphics.lineTo(100, 100);
			graphics.lineTo(100, 50);
			graphics.lineTo(50, 50);
			
			graphics.moveTo(100, 50);
			graphics.lineTo(100, 0);
			graphics.lineTo(50, 0);
			graphics.lineTo(50, 50);
			
			graphics.endFill();
		}
		
	}

}