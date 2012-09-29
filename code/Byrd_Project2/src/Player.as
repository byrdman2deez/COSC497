package  
{
	import flash.display.Bitmap;
	import flash.display.FocusDirection;
	import flash.ui.Keyboard;
	import utils.Direction;
	import utils.Display;
	import utils.Input;

	
	/**
	 * ...
	 */
	
	
	public class Player 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;		
		public var halfWidth	: Number = 30;
		public var halfHeight	: Number = 30;
		public var color		: uint = 0xff0000;
		public var playerTexture:Bitmap;
		
		public var blueGuyRight:Bitmap;
		public var blueGuyLeft:Bitmap;
		public var blueGuyDown:Bitmap;
		public var blueGuyUp:Bitmap;
		
		public var redGuyRight:Bitmap;
		public var redGuyLeft:Bitmap;
		public var redGuyDown:Bitmap;
		public var redGuyUp:Bitmap;
		
		private var isRed:Boolean = true;			
		private var direction:uint = Direction.LEFT;
		
		/// CTOR
		public function Player() 
		{
			// Start player 75% of the way across the screen and
			// half way (50%) down the screen.
			
			x = Display.width * 0.75;
			y = Display.height * 0.5;
			playerTexture = Resources.playerRedLeft;
			
			blueGuyRight = Resources.playerBlueRight;
			blueGuyLeft = Resources.playerBlueLeft;
			blueGuyDown = Resources.playerBlueDown;
			blueGuyUp = Resources.playerBlueUp;
			
			redGuyRight = Resources.playerRedRight;
			redGuyLeft = Resources.playerRedLeft;
			redGuyDown = Resources.playerRedDown;
			redGuyUp = Resources.playerRedUp;
			
			playerTexture.x = x - halfWidth;//Display.width * 0.75;
			playerTexture.y = y - halfHeight;//Display.height * 0.5;
			
			Display.game.addChild(playerTexture);
		}
		
		
		
		public function update():void
		{
			// Check input if movement should occur.
			
			if ( x < 0 )
				x = Display.width;
			
			if ( x > Display.width )
				x = 0;
				
			if ( y < 0 )
				y = Display.height;
				
			if ( y > Display.height )
				y = 0;
			
			if ( Input.isDown( Keyboard.DOWN ) ) 	
			{							
				y += 10;	
				Display.game.removeChild(playerTexture);
				if (isRed) 
				{
					playerTexture = redGuyDown;
				}
				else 
				{
					playerTexture = blueGuyDown;
				}					
				playerTexture.y = y - halfHeight;
				playerTexture.x = x - halfWidth;
				Display.game.addChild(playerTexture);
				direction = Direction.DOWN;
			}
			if ( Input.isDown( Keyboard.UP ) ) 		
			{
				y -= 10;
				Display.game.removeChild(playerTexture);
				if (isRed) 
				{
					playerTexture = redGuyUp;
				}
				else 
				{
					playerTexture = blueGuyUp;	
				}				
				playerTexture.y = y - halfHeight;
				playerTexture.x = x - halfWidth;
				Display.game.addChild(playerTexture);	
				direction = Direction.UP;
			}
			
			if ( Input.isDown( Keyboard.LEFT ) )	
			{
				x -= 10;
				Display.game.removeChild(playerTexture);
				if (isRed) 
				{
					playerTexture = redGuyLeft;
				}
				else 
				{
					playerTexture = blueGuyLeft;	
				}				
				playerTexture.y = y - halfHeight;
				playerTexture.x = x - halfWidth;
				Display.game.addChild(playerTexture);
				direction = Direction.LEFT;
			}
			if ( Input.isDown( Keyboard.RIGHT ) )	
			{
				x += 10;				
				Display.game.removeChild(playerTexture);				
				if (isRed) 
				{
					playerTexture = redGuyRight;
				}
				else 
				{
					playerTexture = blueGuyRight;		
				}						
				playerTexture.y = y - halfHeight;
				playerTexture.x = x - halfWidth;
				Display.game.addChild(playerTexture);
				direction = Direction.RIGHT;				
			}
			
			// Change color
			if ( Input.isDown( Keyboard.Z ) )		
			{
				isRed = true;
				switch (direction) 
				{
					case Direction.RIGHT:
						Display.game.removeChild(playerTexture);
						playerTexture = redGuyRight;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.RIGHT;					
					break;
					case Direction.LEFT:
						Display.game.removeChild(playerTexture);
						playerTexture = redGuyLeft;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.LEFT;		
					break;
					case Direction.UP:
						Display.game.removeChild(playerTexture);
						playerTexture = redGuyUp;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.UP;		
					break;
					case Direction.DOWN:
						Display.game.removeChild(playerTexture);
						playerTexture = redGuyDown;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.DOWN;		
					break;
					default:
						break;
				}
				color = 0xff0000;
			}
			if ( Input.isDown( Keyboard.X ) )		
			{
				isRed = false;
				switch (direction) 
				{
					case Direction.RIGHT:
						Display.game.removeChild(playerTexture);
						playerTexture = blueGuyRight;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.RIGHT;					
					break;
					case Direction.LEFT:
						Display.game.removeChild(playerTexture);
						playerTexture = blueGuyLeft;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.LEFT;		
					break;
					case Direction.UP:
						Display.game.removeChild(playerTexture);
						playerTexture = blueGuyUp;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.UP;		
					break;
					case Direction.DOWN:
						Display.game.removeChild(playerTexture);
						playerTexture = blueGuyDown;								
						playerTexture.y = y - halfHeight;
						playerTexture.x = x - halfWidth;
						Display.game.addChild(playerTexture);
						direction = Direction.DOWN;		
					break;
					default:
						break;
				}
				color = 0x0000ff;
			}
		}
		
		/// Simple AABB collision 
		public function isColliding( enemy:Enemy ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + enemy.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( x - enemy.x);		// actual distance between centers
			
			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.
				
				length 	= halfHeight + enemy.halfHeight;
				diff	= Math.abs( y - enemy.y );
				
				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}
			
			return false;
		}
		
	}

}