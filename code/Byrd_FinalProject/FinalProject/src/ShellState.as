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
			Systems.sound.stop(Resources.GameMusic);
			Systems.sound.play( Resources.MenuMusic );
			
			Global.gameOver = false;
			Global.level = 1;
			var tf:TextField = maketf();
			
			tf.text = "Dizzy Dash";
			Display.main.addChild(tf);
			center(tf);
			tf.y = 250;
						
			var btn:Sprite = makeButton("Start", onStart, Resources.Select);
			Display.main.addChild(btn);
			center(btn);
			btn.y = 350;
			
			btn = makeButton("Instructions", onIntructions, Resources.Select);
			Display.main.addChild(btn);
			center(btn);
			btn.y = 410;
		}
		
		public function onIntructions(btn:ButtonPure):void 
		{
			State.current = new InstructionsState();
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