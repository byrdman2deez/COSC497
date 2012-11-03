package  
{
	import engine.IState;
	import engine.*;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class GameState implements IState
	{
		private var player:Player;
		private const ENEMY_BASE:int = 10;
		
		private var partyPoopers:Vector.<PartyPooper>;
		
		public function GameState() { }
				
		public function start():void 
		{
			player = new Player();
			Display.main.addChild(player);
			center(player);
			player.y += 275;
			
			partyPoopers = new Vector.<PartyPooper>();
			
			var partyPooper:PartyPooper;
			var point:Point;
			for (var i:int = 0; i < ENEMY_BASE; i++) 
			{
				partyPooper = new PartyPooper(player);
				partyPoopers.push(partyPooper);
				
				point = getRandomPointOnRect(Display.width, Display.height);
				Display.main.addChild(partyPooper);
				partyPooper.x = point.x;
				partyPooper.y = point.y;
			}
		}
		
		public function update():void 
		{
			player.update();
			for (var i:int = 0; i < partyPoopers.length; i++) 
			{
				partyPoopers[i].update();
			}
		}
		
		public function end():void 
		{
			Display.ui.removeChild(player);
			Display.clear();
		}
	}

}