package {
	import flash.display.MovieClip;



	public class Platform extends MovieClip {
		private var solid:Boolean = true;
		public function setSolidity(newSolid:Boolean):void {
			solid = newSolid;
		}
		public function isSolid() {
			return solid;
		}
	}
}