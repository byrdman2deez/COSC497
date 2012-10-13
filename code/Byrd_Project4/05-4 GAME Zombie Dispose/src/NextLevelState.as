package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class NextLevelState implements IState
	{
		
		public function NextLevelState() 
		{
			
		}
		
		public function start():void 
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "So You Survived...?";
			
			Display.ui.addChild( tf );
			center(tf);
			tf.y = 80;
			
			var button:Sprite;
			
			button = makeButton("Next Level ->", clickNextLevel);
			Display.ui.addChild( button );
			center( button );
		}
		
		private function clickNextLevel(button:ButtonPure):void 
		{
			State.current = new GameState();	
		}
		
		public function update():void 
		{
			
		}
		
		public function end():void 
		{
			Display.clear();
		}
		
	}

}