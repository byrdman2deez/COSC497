/**
 * Sources for assets
 *  never stop running - FoxSynergy @ http://opengameart.org/content/never-stop-running-8-bit
	gloin - SouljahdeShiva @ http://opengameart.org/content/gloin
	guy003 - Belohlavek @ http://opengameart.org/content/character-sprite-walk-animation
	rpg_16x16 - usr_share @ http://opengameart.org/content/16x16-8-bit-rpg-character-set
 */
package  
{
	import engine.*;
	import flash.display.BitmapData;
	import flash.media.Sound;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class Resources 
	{
		[Embed(
			source = "../lib/retro_party.ttf",
			fontName = "MainFont",
			mimeType = "application/x-font",
			advancedAntiAliasing = "true",
			embedAsCFF = "false")]
			static public var MainFont:Class;
		
		[Embed(source = "../lib/main_guy.png")]
		public static var MainGuy:Class;
		public static var mainGuy:BitmapData = new MainGuy().bitmapData;
		
		[Embed(source = "../lib/red_guy.png")]
		public static var RedGuy:Class;
		public static var redGuy:BitmapData = new RedGuy().bitmapData;
		
		[Embed(source = "../lib/yellow_girl.png")]
		public static var YellowGirl:Class;
		public static var yellowGirl:BitmapData = new YellowGirl().bitmapData;
		
		[Embed(source = "../lib/mohawk_guy.png")]
		public static var MohawkGuy:Class;
		public static var mohawkGuy:BitmapData = new MohawkGuy().bitmapData;
		
		[Embed(source = "../lib/purple_girl.png")]
		public static var PurpleGirl:Class;
		public static var purpleGirl:BitmapData = new PurpleGirl().bitmapData;
		
		[Embed(source = "../lib/blue_guy.png")]
		public static var BlueGuy:Class;
		public static var blueGuy:BitmapData = new BlueGuy().bitmapData;
		
		//sounds
		[Embed(source = "../lib/sounds/MenuMusic.mp3")]
		public static var MenuMusic:Class;
		
		[Embed(source = "../lib/sounds/NeverStopRunning.mp3")]
		public static var GameMusic:Class;
		
		[Embed(source="../lib/sounds/Select.mp3")]
		public static var Select:Class;
		
		[Embed(source = "../lib/sounds/Hit.mp3")]
		public static var Hit:Class;
		
		[Embed(source = "../lib/sounds/DebuffSound.mp3")]
		public static var Debuff:Class;
		
		[Embed(source = "../lib/sounds/Door.mp3")]
		public static var Exit:Class;
		
		public static function init():void 
		{
			new MainFont();
			SoundManager.add( new AudioClip(MenuMusic, true) );
			SoundManager.add( new AudioClip(GameMusic, true ) );
			SoundManager.add( new AudioClip(Select, false ) );
			SoundManager.add( new AudioClip(Hit, false) );
			SoundManager.add( new AudioClip(Debuff, false) );
			SoundManager.add(new AudioClip(Exit, false));
		}
		
	}

}