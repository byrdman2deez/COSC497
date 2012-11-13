package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class LoseState implements IState
	{
		
		public function LoseState() { }
				
		public function start():void 
		{
			var tf:TextField = maketf();
			tf.text = "Game Over";
			Display.ui.addChild(tf);
			center(tf);
			tf.y = 200;
			
			var btn:Sprite = makeButton("Main Menu", onMainMenu, Resources.Select);
			Display.ui.addChild(btn);
			center(btn);			
		}
		
		private function onMainMenu(btn:ButtonPure):void
		{
			State.current = new ShellState();
		}
		
		public function  update():void 
		{
			
		}
		
		public function end():void 
		{			
			Display.clear();
		}
	}

}