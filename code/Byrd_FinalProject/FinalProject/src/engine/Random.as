package engine 
{	
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mike Byrd
	 * Static function used to generate psuedo random numbers
	 */
	public class Random
	{
		///Return a random integer between 0 and a max positive number
		public static function getPosNumber(max:Number = 9999999):Number
		{
			return Math.round(Math.random() * max);
		}			
		
		///Returns a random integer between two numbers
		public static function getNumberBetween(min:Number, max:Number):Number
		{
			return Math.round(Math.random() * (max - min)) + min;
		}

		///Return a random negative or positive number between the specified range (possibly redundant)
		//public static function getNumberNegToPos(num:Number = 9999999):Number 
		//{			
		//	return Math.round(Math.random() * (num * 2) - num);
		//}

		///Returns 0 or 1
		public static function FlipACoin():Number 
		{
			return Math.round(Math.random());
		}
		
		public static function getRandomPointOnRect( width:int, height:int, offsetWidth:int = 0, offsetHeight:int = 0 ) :Point
		{
			var point	: Point = new Point();
			var max		: int = (width * 2) + (height * 2);
			var i		: int = Math.floor(Math.random() * max);
			if ( i < width )
				point.x = i - offsetHeight;
			else if ( i < width * 2 )
			{
				point.x = i * 0.5;
				point.y = height + offsetHeight;
			} else if ( i > max - height )
			{
				point.y = max - i;
				point.x -= offsetWidth
			}
			else
			{
				point.x = width + offsetWidth;
				point.y = max - height - i;
			}
			
			return point;
		}

	}

}