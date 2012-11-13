package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class InstructionsState implements IState
	{
		
		public function InstructionsState() { }
		
		public function start():void 
		{
			var tf:TextField = maketf(24);
			tf.text = "So you came to a party " + "\nand you got WAY too drunk..." + "\nNow you have to find your way"
				+ "\nto the restroom so you don't vomit " + "\nall over these unsuspecting partygoers!" + "\n\n\nUse the arrow keys to move"
				+ "\n\nIf you run into other people you might " + "\nfind yourself feeling a little nauseous...";
			Display.main.addChild(tf);
			
			var btn:Sprite = makeButton("Main Menu", onMainMenu, Resources.Select);
			Display.main.addChild(btn);
			center(btn);
			btn.y = 350;
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