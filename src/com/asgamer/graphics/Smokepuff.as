package com.asgamer.graphics
{
	
	import flash.display.BlendMode;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Smokepuff extends MovieClip
	{
		
		public var vx:Number;
		public var vy:Number;
		
		public function Smokepuff() : void
		{
			alpha = Math.random();
			vx = Math.random() - Math.random();
			vy = Math.random() * 3 - 5;
			scaleX = scaleY = Math.random();
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		private function loop(e:Event) : void
		{
			alpha -= 0.01;
			y += vy;
			x += vx;
			scaleX = scaleY += 0.02;
			
			if (alpha < 0)
				removeSelf();
		}
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			parent.removeChild(this);
		}
		
	}
	
}