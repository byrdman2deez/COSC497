package  
{
	import adobe.utils.CustomActions;
	import flash.display.Bitmap;
	import flash.geom.Vector3D;
	import utils.Direction;
	import utils.Display;
	
	
	/**
	 * Tiny square that moves around, like the punk it is!
	 */
	public class Enemy 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;
		public var halfWidth	: Number = 15;
		public var halfHeight	: Number = 15;
		public var color		: uint;
		
		private var dirx	: Number = 0;
		private var diry	: Number = 0
		
		public var enemyTexture:Bitmap = Resources.enemyBlueUp;
		
		public static var enemyBlueRight:Bitmap = Resources.enemyBlueRight;
		public static var enemyBlueLeft:Bitmap = Resources.enemyBlueLeft;
		public static var enemyBlueDown:Bitmap = Resources.enemyBlueDown;
		public static var enemyBlueUp:Bitmap = Resources.enemyBlueUp;
		
		public static var enemyRedRight:Bitmap = Resources.enemyRedRight;
		public static var enemyRedLeft:Bitmap = Resources.enemyRedLeft;
		public static var enemyRedDown:Bitmap = Resources.enemyRedDown;
		public static var enemyRedUp:Bitmap = Resources.enemyRedUp;
		
		private var direction:uint;
		private var isRed:Boolean;
		
		/// CTOR
		public function Enemy() 
		{
			
			
			// set random position on left side of the screen.
			x = Math.random() * (Display.width / 2);
			y = Math.random() * Display.height;			
			
			// Pick # at random; if 1 set color to red, otherwise make it blue.
			color = int( Math.random() * 2 ) ? 0xff0000 : 0x0000ff;			
			
			//check for enemy's color
			if (color == 0xff0000) 
			{
				isRed = true;
			}
			else if (color == 0x0000ff) 
			{
				isRed = false;
			}			
			
			// Pick a random direction to move by first choosing an angle, and then
			// doing some slick (yet simple) trig to figure out the X, Y.
			var degrees:Number = Math.random() * 360;
			
			// First convert "degrees" to radians
			var radians:Number = degrees * 0.017453;
			
			dirx = Math.cos( radians );
			diry = Math.sin( radians );		
			
			//check for enemy's direction
			if (dirx >= 0 && dirx > diry) 
			{
				direction = Direction.RIGHT;
			}
			else if (dirx <= 0 && dirx < diry) 
			{
				direction = Direction.LEFT;
			}
			else if (diry <= 0 && diry < dirx) 
			{
				direction = Direction.UP;
			}
			else if (diry >= 0 && diry > dirx) 
			{
				direction = Direction.DOWN;
			}
						
			//use the enemy's color and direction to choose which bitmap to display
			switch (direction) 
			{
			case Direction.RIGHT:
				if (isRed) 
				{
					enemyTexture = new Resources.RedEnemyRight;
				}
				else 
				{
					enemyTexture = new Resources.BlueEnemyRight;
				}
			break;
			case Direction.LEFT:
				if (isRed) 
				{
					enemyTexture = new Resources.RedEnemyLeft;
				}
				else 
				{
					enemyTexture = new Resources.BlueEnemyLeft;
				}
				break;
			case Direction.UP:
				if (isRed) 
				{
					enemyTexture = new Resources.RedEnemyUp;
				}
				else 
				{
					enemyTexture = new Resources.BlueEnemyUp;
				}
			break;
			case Direction.DOWN:
				if (isRed) 
				{
					enemyTexture = new Resources.RedEnemyDown;
				}	
				else 
				{
					enemyTexture = new Resources.BlueEnemyDown;
				}
			break;
				default:
					break;
			}
			
			//enemyTexture = enemyRedUp;	
			enemyTexture.x = x - halfWidth;
			enemyTexture.y = y - halfHeight;
			
		}
		
		
		/// Called from somewhere else
		public function update():void
		{
			// Change location
			x += dirx;
			y += diry;
			
			enemyTexture.x = x - halfWidth;
			enemyTexture.y = y - halfHeight;
			
			// Check for screen wrapping
			if ( x < 0 )
				x += Display.width;
			
			if ( x > Display.width )
				x -= Display.width;
				
			if ( y < 0 )
				y += Display.height;
				
			if ( y > Display.height )
				y -= Display.height;
			
			
		}
	}

}