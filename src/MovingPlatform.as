package {
	import Platform;
	import p2d;
	
	public class MovingPlatform extends Platform
	{
		private var speed:Number = 1;
		private var wayPoints:Array = new Array();
		private var actionFunction:Function;
		
		public function MovingPlatform():void
		{
		}
		
		public function setAction(newFunction:Function):void
		{
			actionFunction = newFunction;
		}
		
		public function performAction():void
		{
			actionFunction();
		}
		
		private var current:Number = 0;
		
		public function addWayPoint(newWP:p2d):void
		{
			wayPoints.push(newWP);
		}
		
		private function nextWayPoint():p2d
		{
			//trace("waypoints.length = " + wayPoints.length + " current = " + current);
			if (wayPoints.length < 1)
			{
				return new p2d(this.x, this.y);
			}
			return wayPoints[current];
		}
		
		public function wayPointAdvance():void
		{
			current++;
			if (current >= wayPoints.length)
			{
				current = 0;
			}
			//trace("Waypoint reached: (" + x + ", " + y + "), proceeding to (" + nextWayPoint().getX() + ", " + nextWayPoint().getY() + ")");
		} 
		
		public function act():void
		{
			var nxt:p2d = nextWayPoint();
			var xToMove = nxt.getX() - this.x;
			var yToMove = nxt.getY() - this.y;
			var len = Math.sqrt(xToMove * xToMove + yToMove * yToMove);
			if (len <= speed)
			{
				this.x = nxt.getX();
				this.y = nxt.getY();
				this.wayPointAdvance();
			}
			else
			{
				this.x += xToMove * speed / len;
				this.y += yToMove * speed / len;
			}
		}
		
		public function teleportToNext():void
		{
			//trace("(" + x + ", " + y + ")->(" + nextWayPoint().getX() + ", " + nextWayPoint().getY() + ")");
			var nxt:p2d = nextWayPoint();
			this.x = nxt.getX();
			this.y = nxt.getY();
			//trace("(" + x + ", " + y + ")");
		}
		
		public function getSpeed():Number
		{
			return speed;
		}
		
		public function setSpeed(newSpeed:Number):void
		{
			speed = newSpeed;
		}
	}
}