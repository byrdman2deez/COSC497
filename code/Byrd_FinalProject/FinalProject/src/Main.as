package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.*;
	
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Resources.init();
			Systems.init(stage);				
			
			State.current = new ShellState();
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			Time.update();
			Input.update();
			State.update();
		}
		
	}
	
}