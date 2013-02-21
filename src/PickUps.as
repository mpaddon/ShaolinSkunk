package{
	import flash.display.MovieClip;
	public class PickUps extends MovieClip {
		public var f1:Function;
		function pickUps():void{
		}
		public function setAction(f1:Function):void{
			this.f1 = f1;
		}
		public function performAction():void{
			f1();
		}
		
	}
}