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
		
		public function NextLevelState() { }
				
		public function start():void 
		{
			Global.level++;
			
			var tf:TextField;
			tf = maketf();
			tf.text = "You made it!";
			Display.ui.addChild(tf);
			center(tf);
			tf.y -= 100;
			
			var btn:Sprite;
			btn = makeButton("Next Level", onNextLevel);
			Display.ui.addChild(btn);
			center(btn);
			
			btn = makeButton("Main Menu", onMainMenu);
			Display.ui.addChild(btn);
			center(btn);
			btn.y += 60;
		}
		
		private function onMainMenu(btn:ButtonPure):void 
		{
			State.current = new ShellState();
		}
		
		public function onNextLevel(btn:ButtonPure):void 
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