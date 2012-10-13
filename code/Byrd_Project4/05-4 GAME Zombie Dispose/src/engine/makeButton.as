package engine 
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	
	public function makeButton( text:String, callback:Function, upColor:uint = 0x909090, downColor:uint = 0xf0f0f0, overColor:uint = 0x0f0f0f ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, callback, upColor, downColor, overColor);
		return bp;
	}
}