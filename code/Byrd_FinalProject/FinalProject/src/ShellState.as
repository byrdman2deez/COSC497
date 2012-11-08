package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class ShellState implements IState
	{
		
		public function ShellState() { }
		
		public function start():void 
		{
			Global.gameOver = false;
			Global.level = 1;
			
			var tf:TextField = maketf();
			
			tf.text = "Dizzy Dash";
			Display.main.addChild(tf);
			center(tf);
			tf.y = 150;
						
			var btn:Sprite = makeButton("Start", onStart);
			Display.main.addChild(btn);
			center(btn);
			btn.y = 250;
		}
		
		private function onStart(btn:ButtonPure):void 
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