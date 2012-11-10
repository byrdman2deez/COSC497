package  
{
	import engine.*;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class GameState implements IState
	{
		private var gameStartTime:int;
		private var spawnTime:int;
		private var isSpawned:Boolean = false;
		private var player:Player;
		private var exit:Door;
		private const ENEMY_BASE:int = 10;
		
		private var partyPoopers:Vector.<PartyPooper>;
		
		public function GameState() { }
				
		public function start():void 
		{
			gameStartTime = Time.elapsedTime;
			spawnTime = gameStartTime + 1200;
			
			//add player
			player = new Player();
			Display.ui.addChild(player);
			center(player);
			player.y += 275;
			
			//add exit
			exit = new Door(player);
			Display.ui.addChild(exit);
			center(exit);
			exit.y = 0;
			
			Global.console.clear();
			
			partyPoopers = new Vector.<PartyPooper>();
		}
		
		public function update():void 
		{
			player.update();
			
			//give the player time to observe his surroundings
			if (Time.elapsedTime >= spawnTime) 
			{						
				if (isSpawned == false) 
				{
					var partyPooper:PartyPooper;
					var point:Point;
					for (var i:int = 0; i < ENEMY_BASE * Global.level; i++) 
					{
						partyPooper = new PartyPooper(player);
						partyPoopers.push(partyPooper);
						
						point = Random.getRandomPointOnRect(Display.width, Display.height);
						Display.ui.addChild(partyPooper);
						partyPooper.x = point.x;
						partyPooper.y = point.y;
					}	
					isSpawned = true;
				}		
				else if (isSpawned) 
				{
					//update enemies if they are spawned
					for (var j:int = 0; j < partyPoopers.length; j++) 
					{
						partyPoopers[j].update();
					}
				}
			}	
			
			//check if the player reached the exit
			if (player.CheckCollision(exit)) 
			{
				State.current = new NextLevelState();
			}
			
			if (Global.level > 3) 
			{
				State.current = new WinState();
			}
			
			if (Global.gameOver) 
			{
				State.current = new LoseState();
			}
		}
		
		public function end():void 
		{
			Display.clear();
		}
	}

}