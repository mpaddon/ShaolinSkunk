package
{
	public class p2d
	{
		private var xVal:Number;
		private var yVal:Number;
		public function p2d(newX:Number, newY:Number)
		{
			xVal = newX;
			yVal = newY;
		}
		
		public function getX():Number
		{
			return xVal;
		}
		
		public function getY():Number
		{
			return yVal;
		}
		
		public function setX(newX:Number):void
		{
			xVal = newX;
		}
		
		public function setY(newY:Number):void
		{
			yVal = newY;
		}
	}
}