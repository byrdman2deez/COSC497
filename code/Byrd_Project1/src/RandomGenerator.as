package  
{	
	/**
	 * ...
	 * @author Mike Byrd
	 */
	public class RandomGenerator
	{
		private var min:Number;
		private var max:Number;	
		
		public function nextNumber(max:Number):Number
		{
			this.max = max;
			return Math.round(Math.random() * max);
		}			
		
		public function nextNumberBetween(min:Number, max:Number):Number
		{
			this.min = min;
			this.max = max;
			
			return Math.round(Math.random() * (max - min)) + min;
		}
		
		public function nextNumberNegToPos(num:Number):Number 
		{			
			return Math.round(Math.random() * (num * 2) - num);
		}
		
		public function FlipACoin():Number 
		{
			return Math.round(Math.random());
		}
		
	}

}