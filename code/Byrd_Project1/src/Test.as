package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Test extends Sprite
	{
		
		public function Test() 
		{
			var square:Square = new Square();
			square.x = 5;
			square.y = 5;
			addChild(square);
		}
		
	}

}