package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class BlockL extends Sprite
	{
		
		public function BlockL() 
		{
			init();
		}
		
		private function init():void 
		{
			graphics.lineStyle(3);
			
			//orange
			graphics.beginFill(0xff9100);
			
			graphics.lineTo(0, 50);
			graphics.lineTo(50, 50);
			graphics.lineTo(50, 0);
			graphics.lineTo(0, 0);
		
			graphics.moveTo(0, 50);
			graphics.lineTo(0, 100);
			graphics.lineTo(50, 100);
			graphics.lineTo(50, 50);
			
			graphics.moveTo(0, 100);
			graphics.lineTo(0, 150);
			graphics.lineTo(50, 150);
			graphics.lineTo(50, 100);
			
			graphics.moveTo(50, 150);
			graphics.lineTo(100, 150);
			graphics.lineTo(100, 100);
			graphics.lineTo(50, 100);	
			
			graphics.endFill();
			
		}
		
	}

}