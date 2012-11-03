package  
{
	import engine.IState;
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
			var tf:TextField = maketf();
			
			tf.text = "Restroom Rendezvous";
			Display.ui.addChild(tf);
			center(tf);
			tf.y = 50;
			
			var btn:Sprite = makeButton("Start", onStart);
			Display.ui.addChild(btn);
			center(btn);
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