package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import net.hires.utils.Stats;
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
		private const ENEMY_BASE:int = 3;
		
		private var partyPoopers:Vector.<PartyPooper>;
		private var canvas:BitmapData;
		
		public function GameState() { }
				
		public function start():void 
		{
			Display.ui.addChild(new Stats());
			Systems.sound.stop( Resources.MenuMusic );
			Systems.sound.play(Resources.GameMusic);
			Global.console.clear();
			
			gameStartTime = Time.elapsedTime;
			spawnTime = gameStartTime + 1200;
			canvas = new BitmapData(800, 800, true, 0x00000000);			
			player = new Player(canvas);
			exit = new Door(player);
			
			Display.ui.addChild(new Bitmap(canvas));			
			Display.ui.addChild(player);
			center(player);
			player.y += 375;
			
			
			Display.ui.addChild(exit);
			center(exit);
			exit.y = 20;
			
			partyPoopers = new Vector.<PartyPooper>();
		}
		
		public function update():void 
		{
			
			canvas.lock();
			canvas.fillRect(canvas.rect, 0x00000000);
			player.update();
			
			//give the player time to observe his surroundings
			if (Time.elapsedTime >= spawnTime) 
			{						
				if (isSpawned == false) 
				{
					var partyPooper:PartyPooper;
					var point:Point;
					for (var i:int = 0; i < ENEMY_BASE + ENEMY_BASE * Global.level; i++) 
					{
						partyPooper = new PartyPooper(player, canvas);
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
			canvas.unlock();
			//check if the player reached the exit
			if (player.CheckCollision(exit)) 
			{
				Systems.sound.play(Resources.Exit);
				State.current = new NextLevelState();
			}
			
			if (Global.level > 5) 
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