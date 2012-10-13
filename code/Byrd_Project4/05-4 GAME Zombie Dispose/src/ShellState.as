package  
{
	import engine.*;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class ShellState implements IState
	{
		/// CTOR
		public function ShellState() 
		{			
		}
		
		public function start():void
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "Main Menu";
			
			Display.ui.addChild( tf );
			center(tf);
			tf.y = 10;
			
			var button:Sprite;	//temporary variable, re-used in composing buttons
			
			button = makeButton("Play", clickPlay, 0x33ee22, 0xff2222, 0xffffff);
			Display.ui.addChild( button );
			center(button);
			button.y = 150;
		}
		
		
		public function update():void 
		{			
		}
		
		public function end():void 
		{
			Display.clear();
		}
		
		public function clickPlay(button:ButtonPure):void 
		{
			trace("ShellState: play");
			
			State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
		public function clickWin(button:ButtonPure):void 
		{
			trace("ShellState: Win");	
			State.current = new WinState();
		}
		
		public function clickLose(button:ButtonPure):void 
		{
			trace("ShellState: Lose");
			State.current = new LoseState();
		}
	}

}