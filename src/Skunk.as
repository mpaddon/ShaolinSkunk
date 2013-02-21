package {//
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.text.TextField;

	public class Skunk extends MovieClip {
		private var speed:int = 5;
		private var moveLeft:Boolean = false;
		private var moveRight:Boolean = false;
		private var jump:Boolean = false;
		private var invincible:Boolean = false;
		private var xvel:int = 6;
		private var yvel:int = 0;
		private var xpos:int;
		private var ypos:int;
		private const YACC:int = 2;
		private const JUMPV:int = 20;
		private const MAX_Y:int = 30;
		private const DEF_SPEED:int = 5;

		function Skunk():void {
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			xpos = this.x;
			ypos = this.y;
			this.gotoAndStop(1);
		}
		public function godMode():void {
			invincible = true;
		}
		function init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, EnterFrame);
		}
		function reportKeyUp(event:KeyboardEvent):void {
			//trace("Keyboard Up");
			if (event.keyCode == Keyboard.LEFT) {
				moveLeft = false;
			}
			if (event.keyCode == Keyboard.RIGHT) {
				moveRight = false;
			}
			if (event.keyCode == Keyboard.SPACE) {
				//jump = false;
			}
		}
		function reportKeyDown(event:KeyboardEvent):void {
			//trace("Keyboard down");
			if (event.keyCode == Keyboard.LEFT) {
				moveLeft = true;
			}
			if (event.keyCode == Keyboard.RIGHT) {
				moveRight = true;
			}
			if (event.keyCode == Keyboard.SPACE) {
				if (!jump) {
					jump = true;
					yvel = -JUMPV;
				}
			}
		}
		function EnterFrame(event:Event):void {
			if (moveLeft && this.x > 0 ) {
				this.x -= speed;
				this.gotoAndStop(1);
			} else if (moveRight && this.x + this.width < stage.stageWidth) {
				this.x += speed;
				this.gotoAndStop(2);
			}
			//trace(stage.stageWidth);
			if(this.y + this.height > stage.stageHeight) {
				this.y = stage.stageHeight - this.height;
				yvel = 0;
			}
			if (yvel < MAX_Y) {
				yvel += YACC;
			}
			this.y += yvel;
		}
		public function stopJump():void {
			yvel = 0;
			speed = DEF_SPEED;
			jump = false;
		}
		public function stopx():void {
			xvel = 0;
		}
		public function setMotion(new_xvel:int, new_yvel:int):void{
			speed = new_xvel;
			yvel = new_yvel;
		}
	}
}