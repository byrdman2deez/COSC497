package engine 
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	
	public function makeButton( text:String, callback:Function, clickSound:Class = null, upColor:uint = 0x0000ff, downColor:uint = 0xff0000, overColor:uint = 0x00ff00 ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, callback, clickSound, upColor, downColor, overColor);
		return bp;
	}
}