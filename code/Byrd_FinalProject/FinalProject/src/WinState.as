package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class WinState implements IState
	{
		
		public function WinState() { }
		
		public function start():void 
		{
			var tf:TextField = maketf();
			tf.text = "You Win";
			Display.ui.addChild(tf);
			center(tf);
			tf.y -= 65;
			
			var btn:Sprite = makeButton("Main Menu", onMainMenu, Resources.Select);
			Display.ui.addChild(btn);
			center(btn);
			
		}
		
		private function onMainMenu(btn:ButtonPure):void 
		{
			State.current = new ShellState();
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