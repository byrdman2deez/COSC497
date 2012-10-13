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
	public class LoseState implements IState
	{
		
		public function LoseState() 
		{
			
		}
		
		public function start():void 
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "You Lose...";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			Global.scoreTextField = maketf();
			Global.scoreTextField.text = "Score: " + Global.score;
			Global.scoreTextField.y = 200;
			Display.ui.addChild( Global.scoreTextField );
			center( Global.scoreTextField );
			Global.scoreTextField.y = 350;
			var button:Sprite;	//temporary variable, re-used in composing buttons
			
			button = makeButton("Restart", clickRestart, 0x33ee22, 0xff2222);
			Display.ui.addChild( button );
			center( button );
			button.y = 150;

			
			button = makeButton("Main Menu", clickMainMenu, 0x33ee22, 0xff2222);
			Display.ui.addChild( button );
			center( button );
			button.y = 250;
		}	
		
		private function clickMainMenu():void 
		{
			State.current = new ShellState();
		}
		
		public function update():void 
		{
			
		}
		
		public function end():void 
		{
			Global.gameOver = false;
			Global.score = 0;
			Display.clear();
		}
		
		public function clickRestart(button:ButtonPure):void 
		{
			trace("ShellState: Main Menu");
			State.current = new GameState();			
		}
		
	}

}