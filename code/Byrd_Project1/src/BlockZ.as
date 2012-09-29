package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class BlockZ extends Sprite
	{
		
		public function BlockZ() 
		{
			graphics.lineStyle(3);
			
			graphics.beginFill(0xff0000);
			
			graphics.lineTo(0, 50);
			graphics.lineTo(50, 50);
			graphics.lineTo(50, 0);
			graphics.lineTo(0, 0);
			
			graphics.moveTo(50, 0);
			graphics.lineTo(100, 0);
			graphics.lineTo(100, 50);
			graphics.lineTo(50, 50);
		
			graphics.moveTo(50, 50);
			graphics.lineTo(50, 100);
			graphics.lineTo(100, 100);
			graphics.lineTo(100, 50);
			
			graphics.moveTo(100, 100);
			graphics.lineTo(150, 100);
			graphics.lineTo(150, 50);
			graphics.lineTo(100, 50);
			
			graphics.endFill();
		}
		
	}

}