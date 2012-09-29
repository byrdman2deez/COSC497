package  
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Resources 
	{
		//Player Images		
		[Embed(source = "../lib/Player/PlayerDownBlue.png")]
		public static var BlueGuyDown:Class;
		public static var playerBlueDown:Bitmap = new Resources.BlueGuyDown;
		
		[Embed(source = "../lib/Player/PlayerUpBlue.png")]
		public static var BlueGuyUp:Class;
		public static var playerBlueUp	:Bitmap = new Resources.BlueGuyUp;
		
		[Embed(source = "../lib/Player/PlayerLeftBlue.png")]
		public static var BlueGuyLeft:Class;
		public static var playerBlueLeft:Bitmap = new Resources.BlueGuyLeft;
		
		[Embed(source = "../lib/Player/PlayerRightBlue.png")]
		public static var BlueGuyRight:Class;
		public static var playerBlueRight:Bitmap = new Resources.BlueGuyRight;
		
		[Embed(source = "../lib/Player/PlayerDownRed.png")]
		public static var RedGuyDown:Class;
		public static var playerRedDown:Bitmap = new Resources.RedGuyDown;
		
		[Embed(source = "../lib/Player/PlayerUpRed.png")]
		public static var RedGuyUp:Class;
		public static var playerRedUp:Bitmap = new Resources.RedGuyUp;
		
		[Embed(source = "../lib/Player/PlayerLeftRed.png")]
		public static var RedGuyLeft:Class;
		public static var playerRedLeft:Bitmap = new Resources.RedGuyLeft;
		
		[Embed(source = "../lib/Player/PlayerRightRed.png")]
		public static var RedGuyRight:Class;
		public static var playerRedRight:Bitmap = new Resources.RedGuyRight;		
		
		
		
		//Enemy Images
		[Embed(source = "../lib/Enemy/EnemyBlueDown.png")]
		public static var BlueEnemyDown:Class;
		public static var enemyBlueDown:Bitmap = new Resources.BlueEnemyDown;
		
		[Embed(source = "../lib/Enemy/EnemyBlueLeft.png")]
		public static var BlueEnemyLeft:Class;
		public static var enemyBlueLeft:Bitmap = new Resources.BlueEnemyLeft;
		
		[Embed(source = "../lib/Enemy/EnemyBlueRight.png")]
		public static var BlueEnemyRight:Class;
		public static var enemyBlueRight:Bitmap = new Resources.BlueEnemyRight;
		
		[Embed(source = "../lib/Enemy/EnemyBlueUp.png")]
		public static var BlueEnemyUp:Class;
		public static var enemyBlueUp:Bitmap = new Resources.BlueEnemyUp;
		
		[Embed(source = "../lib/Enemy/EnemyRedDown.png")]
		public static var RedEnemyDown:Class;
		public static var enemyRedDown:Bitmap = new Resources.RedEnemyDown;
		
		[Embed(source = "../lib/Enemy/EnemyRedLeft.png")]
		public static var RedEnemyLeft:Class;
		public static var enemyRedLeft:Bitmap = new Resources.RedEnemyLeft;
		
		[Embed(source = "../lib/Enemy/EnemyRedRight.png")]
		public static var RedEnemyRight:Class;
		public static var enemyRedRight:Bitmap = new Resources.RedEnemyRight;
		
		[Embed(source="../lib/Enemy/EnemyRedUp.png")]	
		public static var RedEnemyUp:Class;
		public static var enemyRedUp:Bitmap = new Resources.RedEnemyUp;
		
	}

}