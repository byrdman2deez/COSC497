package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Box extends Sprite
	{
		
		
		public function Box(width:Number, height:Number, color:uint = 0xff0000, alpha:Number = 1) 
		{	
			graphics.beginFill(color, alpha);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
	}

}