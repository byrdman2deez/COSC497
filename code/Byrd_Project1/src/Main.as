package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	
	/// Game to "whack" a dot by clicking on it
	public class Main extends Sprite 
	{	
		// -- CONSTANTS --
		
		private const FLASH_FRAMES		:int = 5;	// # of frames flashing a color when successfully clicking
		private const POINTS_PER_CLICK	:int = 20;	// # of points per successful click
		private const TIME_READY		:int = 2000;
		private const TIME_SET			:int = 3000;
		private const TIME_GO			:int = 4000;
		

		// -- MEMBERS --
		
		private var score		:int = 0;
		private var nextAppear	:int = 0;
		private var threshold	:int = 1500;
		private var bgFlash		:int = 0;
		private var scoreText	:TextField;
		
		//random number generator
		private var randGen:RandomGenerator;
		private var nextDraw:Number = 0;
		private var shape:Sprite;
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{			
			
			//draw background objects
			var block1:BlockO = new BlockO();
			block1.x = Math.random() * stage.stageWidth;
			block1.y = Math.random() * stage.stageHeight;
			addChild(block1);
			
			var block2:BlockI = new BlockI();
			block2.x = Math.random() * stage.stageWidth;
			block2.y = Math.random() * stage.stageHeight;
			addChild(block2);
			
			var block3:BlockJ = new BlockJ();
			block3.x = Math.random() * stage.stageWidth;
			block3.y = Math.random() * stage.stageHeight;
			addChild(block3);
			
			var block4:BlockT = new BlockT();
			block4.x = Math.random() * stage.stageWidth;
			block4.y = Math.random() * stage.stageHeight;
			addChild(block4);
			
			var block5:BlockL = new BlockL();
			block5.x = Math.random() * stage.stageWidth;
			block5.y = Math.random() * stage.stageHeight;
			addChild(block5);
			
			var block6:BlockS = new BlockS();
			block6.x = Math.random() * stage.stageWidth;
			block6.y = Math.random() * stage.stageHeight;
			addChild(block6);
			
			var block7:BlockZ = new BlockZ();
			block7.x = Math.random() * stage.stageWidth;
			block7.y = Math.random() * stage.stageHeight;
			addChild(block7);
			
			scoreText = new TextField();
			scoreText.defaultTextFormat = new TextFormat("Arial", 64, 0x000000);
			scoreText.text = "Score: " + score;
			scoreText.autoSize = TextFieldAutoSize.CENTER;
			scoreText.x = 0;
			scoreText.y = 0;
			addChild(scoreText);
			
			randGen = new RandomGenerator();
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			nextAppear = threshold * 2;
			addEventListener( Event.ENTER_FRAME, onFrame );
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			if (score <= 0) 
			{
				score = 0;
			}		
			else 
			{
				score -= 10;
				scoreText.text = "Score: " + score;
				scoreText.x = 0;
				scoreText.y = 0;
			}			
		}
		
		
		/// Called once every frame
		private function onFrame( e:Event ):void
		{
			var now:int = getTimer();	// get the # of milliseconds since program started
			graphics.clear();			// remove anything on the screen (that was drawn into this sprite's vector graphics layer.)
			
			/// Use conditionals for a street-light start, flashing and dot spawning logic
			if ( now < TIME_READY )
			{
				graphics.beginFill( 0xff0000 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_SET )
			{
				graphics.beginFill( 0xffff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_GO )
			{
				graphics.beginFill( 0x00ff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else
			{
				// Only create a new dot if the time is past when it's suppose to next appear.
				if ( now > nextAppear )
				{
					// Shrink the threshold, which determins how soon the next dot will appear.
					threshold -= 50;
					
					// If threshhold is less than half a second, don't create any more dots
					// as the game is about to end...
					if ( threshold < 500 )
					{
						// Make sure last dot is gone before showing game over
						if ( numChildren == 0 )
						{							
							removeEventListener( Event.ENTER_FRAME, onFrame ); 	// stop frame updates
							gameOver();											// perform game over actions
							return;
						}
					}
					else
					{
						// Make new dot to click...
						//Randomly choose dot or square
						nextDraw = randGen.FlipACoin();
						if (nextDraw == 0) 
						{
							shape = new Dot( this );							
						}
						else 
						{
							shape = new Box( this );
						}
						
						//var dot :Dot = new Dot( this );
						addChild( shape );
						shape.x = Math.random() * stage.stageWidth;
						shape.y = Math.random() * stage.stageHeight;
						addChild( shape );
						
						// Compute when the next dot will appear after this one.
						nextAppear = now + threshold;
					}
				}
			}
			
			// If a flash is suppose to be up on the screen...
			if ( bgFlash > 0 ) 
			{
				// reduce the # of frames flash should occur.
				bgFlash--;
				
				// draw a giant rectangle the complete size of the screen
				graphics.beginFill( 0x003399, 0.8 );
				graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
				graphics.endFill();
			}
		}
		
		
		/// Show game over information
		private function gameOver() :void
		{
			trace("Game over reached");
			
			// Create text field (assume system has Arial font installed.)
			var tf:TextField 		= new TextField();
			tf.defaultTextFormat 	= new TextFormat( "Arial", 64 );
			tf.autoSize 			= TextFieldAutoSize.CENTER;
			tf.text 				= "Score: " + score;
			addChild( tf );
			
			// Center text field
			tf.x = (stage.stageWidth * 0.5) - (tf.textWidth * 0.5);
			tf.y = (stage.stageHeight * 0.5) - (tf.textHeight * 0.5);
		}
		
		
		/// Add to score, setup a flash to occur
		public function addToScore():void {
			score += POINTS_PER_CLICK;
			scoreText.text = "Score: " + score;
			scoreText.x = 0;
			scoreText.y = 0;
			bgFlash = FLASH_FRAMES;
		}
		
	}
	
}