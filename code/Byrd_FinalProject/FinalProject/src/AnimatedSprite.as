package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import engine.*;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class AnimatedSprite 
	{
		private var sheetBMD:BitmapData;
		private var rect:Rectangle;
		public var canvas:BitmapData;
		public var pos:Point;	
		private var speed:Number = 3;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var currentFrame:Point;
		private var frameSize:Point;
		private var sheetSize:Point;
		private var frameCount:int = 0;
		private var count:int = 0;
		public var isAnimated:Boolean = true;
		private var timeSinceLastFrame:Number = 0;
		public var direction:uint = Direction.DOWN;
		
		public function AnimatedSprite(sheetBMD:BitmapData, canvas:BitmapData, frameSize:Point, sheetSize:Point, timeSinceLastFrame:Number = 10) 
		{
			this.sheetBMD = sheetBMD;
			this.rect = rect;
			this.canvas = canvas;
			
			pos = new Point(0, 0);
			currentFrame = new Point(0, 0);
			this.frameSize = frameSize;
			this.sheetSize = sheetSize;
			this.timeSinceLastFrame = timeSinceLastFrame;
		}
		
		public function render():void 
		{
			pos.x = x - frameSize.x * 0.5;
			pos.y = y - frameSize.y * 0.5;
			animate();
		}
		
		public function animate():void 
		{
			canvas.copyPixels(sheetBMD, new Rectangle(currentFrame.x * frameSize.x, currentFrame.y * frameSize.y, frameSize.x, frameSize.y), pos, null, null, true);
			
			if (count % timeSinceLastFrame == 0 && isAnimated) 
			{
				currentFrame.x++;
				if (currentFrame.x >= sheetSize.x) 
				{
					currentFrame.x = 0;
				}		
			}			
			count++;	
		}
	}

}