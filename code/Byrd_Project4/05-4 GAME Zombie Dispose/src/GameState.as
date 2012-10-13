package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.*;
	import flash.events.MouseEvent;	
	import flash.geom.Point;
	import flash.text.TextField;

	
	public class GameState implements IState
	{
		private var gameOver:Boolean;			
		
		private const ZOMBIE_BASE		:int = 5;	// guaranteed # of zombies
		private const ZOMBIE_MULTIPLIER	:int = 10;	// how many more zombies per level
		
		private var player	:Player;
		private var zombies	:Vector.<Zombie>;
		private var bullets	:Vector.<Bullet>;
		
		private var consoleTextField:TextField;
		private var box:Box;
				
		/// CTOR - minimize putting any code in here!
		public function GameState() 
		{
		}

		
		/// @see IState
		public function start():void
		{						
			Global.scoreTextField = maketf();
			Global.scoreTextField.text = "Score: " + Global.score;
			Global.scoreTextField.y = 10;
			Display.ui.addChild( Global.scoreTextField );
			
			player = new Player();
			Display.main.addChild( player );			
			center( player );		
			
			Global.console = Console.getInstance();
			Global.console.clear();
			
			box = new Box(300, 200, 0x808080, 0.4);
			box.y = 280;
			Display.console.addChild(box);
			
			bullets = new Vector.<Bullet>();
			zombies = new Vector.<Zombie>();
			var zombie:Zombie;
			var point:Point;
			for ( var i:int = 0; i < (ZOMBIE_BASE + (Global.level * ZOMBIE_MULTIPLIER) ); i++ )
			{
				zombie = new Zombie( player );
				zombies.push( zombie );			// track all zombies outselves

				// Layout zombie on the screen
				point = getRandomPointOnRect( Display.width, Display.height );
				Display.main.addChild( zombie );
				zombie.x = point.x;
				zombie.y = point.y;
			}			
			trace("Zombies: " + zombies.length);
			trace("Level: " + Global.level);
		}
		
		
		/// @see IState
		public function update():void
		{
			var delta:Number = Time.deltaTime;	// cache delta value, used frequently
			
			player.update();
			
			if (Global.consoleLines >= 10) 
			{
				Global.console.clear();
				Global.consoleLines = 0;
			}
			
			var len:int = zombies.length;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				if ( zombies[i].isDisposed )
				{
					// Remove object from both vector and display list
					Display.main.removeChild( zombies.splice( i, 1 )[0] );
					if (zombies.length <= 0) 
					{
						Global.level++;						
						if (Global.level <= 3) 
						{
							State.current = new NextLevelState();
						}
						else 
						{							
							State.current = new WinState();
						}						
					}
				}
				else
				{
					zombies[i].update( delta );
				}
			}
			len = bullets.length;
			for ( i = len - 1; i >= 0; i-- )
			{
				if ( bullets[i].update( zombies ) )
					bullets.splice( i, 1 );
			}
			
			if (Global.gameOver) 
			{				
				State.current = new LoseState();
			}			
		}
		
		
		public function addBullet( bullet:Bullet ):void
		{
			bullets.push( bullet );
			Display.main.addChild( bullet );
		}
		
		
		/// @see IState
		public function end():void
		{
			Display.main.removeChild( player)
			Display.ui.removeChild(Global.scoreTextField);
			
			if (Global.level > 3) 
			{
				Global.level = 1;				
			}
			
			for (var i:int = 0; i < bullets.length; i++) 
			{
				Display.main.removeChild(bullets[i]);				
			}		
			
			for (var j:int = 0; j < zombies.length; j++) 
			{
				Display.main.removeChild(zombies[j]);				
			}	
			
		}		
		
	}

}