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
	public class WinState implements IState
	{
		
		public function WinState() 
		{
			var tf :TextField;
		}
		
		public function start():void 
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "You Win!";
			
			Display.ui.addChild( tf );			
			center( tf );
			tf.y = 10;
			
			Global.scoreTextField = maketf();
			Global.scoreTextField.text = "Score: " + Global.score;
			Display.ui.addChild( Global.scoreTextField );
			center( Global.scoreTextField );
			Global.scoreTextField.y = 300;
			
			var button:Sprite;	//temporary variable, re-used in composing buttons
			
			button = makeButton("Restart", clickRestart, 0x33ee22, 0xff2222);
			Display.ui.addChild( button );
			center( button );
			button.y = 150;
			
			button = makeButton("Main Menu", clickMenu, 0x33ee22, 0xff2222);
			Display.ui.addChild( button );
			center( button );
			button.y = 250;
			
		}	
		
		private function clickMenu(button:ButtonPure):void 
		{
			trace("ShellState: Main Menu");
			
			State.current = new ShellState();
		}
		public function clickRestart(button:ButtonPure):void 
		{
			trace("ShellState: New Game");
			
			State.current = new GameState();
		}
		
		public function update():void 
		{
			
		}
		
		public function end():void 
		{
			Global.score = 0;
			Display.clear();
		}
	}

}