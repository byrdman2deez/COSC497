package engine 
{
	import flash.automation.ActionGenerator;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 *	Input Manager
	 * Up -> StartPress -> Press -> (Double Tap)-> Held -> EndPressBegin -> Release -> Up
	 */
	public class Input 
	{
		static private const UP			: uint = 0;
		static private const PRESS		: uint = 1;
		static private const HELD		: uint = 2;		
		static private const DOUBLE_PRESS:uint = 3;
		
		static private var mouseDown:Boolean;
		static private var tapCount:uint = 0;
		
		static private var timeSinceLastPress:int = -1;

		static private const START_PRESS:uint = 9999;
		static private const END_PRESS_BEGIN:uint = 6666;
		static private const END_PRESS:uint = 3333;
		
		static private var keys		: Vector.<uint>;
		static private var active	: Vector.<KeyState>;
		static private var last		: Vector.<uint>;
		
		
		static public function init( stage:Stage ):void 
		{
			stage.removeEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.removeEventListener( KeyboardEvent.KEY_UP,   onKeyUp );	
			stage.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp);

			keys 	= new Vector.<uint>(256);	// state of all keys
			active 	= new Vector.<KeyState>();		// only keys in a state other than up
			last 	= new Vector.<uint>(256);	// previous keys			
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.addEventListener( KeyboardEvent.KEY_UP, 	onKeyUp );	
			stage.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		static private function onMouseUp(e:MouseEvent):void 
		{			
			mouseDown = false;
		}
		
		static private function onMouseDown(e:MouseEvent):void 
		{
			mouseDown = true;
		}
		
				
		
		/// Flash Event: A key was just pressed
		static public function onKeyDown( e:KeyboardEvent ):void
		{
			if ( keys[ e.keyCode ] != UP )
				return;
			
			keys[ e.keyCode ] = START_PRESS;
			last[e.keyCode] = UP;
			
			if (tapCount == 1 && timeSinceLastPress > Time.frameCount - 3) 
			{
				tapCount++;				
			}
			
			var keyState:KeyState = new KeyState( e.keyCode, Time.frameCount );
			active.push( keyState );
		}
		
		/// Flash Event: A key was raised
		static public function onKeyUp( e:KeyboardEvent ):void
		{										
			last[ e.keyCode ] = END_PRESS_BEGIN;			
		}
		
		/// Call this once per frame
		static public function update():void
		{
			var code	:uint;
			var keyState:KeyState;
			
			// Go through all the inputs currently mark as being active...
			for ( var i:int = active.length - 1; i > -1; i-- )
			{
				keyState = active[i];
				code = keyState.code;						
				
				if (keys[code] == DOUBLE_PRESS) 
				{
					keys[code] = HELD;
				}
				
				if ( keys[code] == START_PRESS )
				{			
					if (tapCount == 2) 
					{
						keys[code] = DOUBLE_PRESS;						
						tapCount = 0;
						break;
					}
					
					keys[code] = PRESS;		
					tapCount++;
					timeSinceLastPress = Time.frameCount;
					keyState.frame = Time.frameCount;
				}
				
				if ( keys[code] == PRESS && last[code] == UP && keyState.frame < Time.frameCount)
				{
					keys[code] = HELD;	
					continue;
				}	
				
				if (keys[code] == END_PRESS && keyState.frame < Time.frameCount) 
				{										
					keys[code] = UP;	
					last[code] = UP;
					
					for (var j:int = active.length - 1; j > - 1; j--) 
					{						
						if(keys[code] == UP && last[code] == UP)
						active.splice(i, 1);
					}								
				}
				
				if (last[code] == END_PRESS_BEGIN) 
				{					
					keys[code] = END_PRESS;	
					keyState.frame = Time.frameCount;
				}				
			}
			trace(keys[code]);			
		}
		
		static public function getKeyDown( code:uint ):Boolean
		{
			return keys[ code ] == PRESS;
		}

		static public function getKeyHeld( code:uint ):Boolean
		{
			return keys[ code ] == HELD;
		}
		static public function getKeyUp( code:uint):Boolean 
		{
			return keys[ code ] == UP;
		}
		static public function getKeyReleased(code: uint):Boolean 
		{
			return keys[ code ] == END_PRESS;
		}
		static public function getKeyDoubleTap(code: uint):Boolean 
		{
			return keys[ code ] == DOUBLE_PRESS;
		}
		static public function getMouseDown():Boolean 
		{
			return mouseDown == true;
		}
		
	}
}


internal class KeyState
{
	public var code	:uint;
	public var frame:uint;
	
	/// CTOR
	function KeyState( code:uint, frame:uint ) :void
	{
		this.code 	= code;
		this.frame 	= frame;
	}
}