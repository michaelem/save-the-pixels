package
{
	import org.flixel.*;
	
	public class Pixel
	{
		
		public static const xRes:uint = 48;
		public static const yRes:uint = 48;
		public static const xOffset:int = 10;
		public static const yOffset:int = 10
		public static const xCount:uint = 8;
		public static const yCount:uint = 8;
		protected var sprite:FlxSprite = null;
		protected var xLoc:uint;
		protected var yLoc:uint;
		protected var position:FlxPoint;
		protected var color:uint;
		protected var level:Level;
		private var fadeTimer:Number;
		private var isDying:Boolean;
		private var isDead:Boolean;
		
		public function Pixel(x:uint, y:uint, l:Level)
		{
			this.level = l;
			this.xLoc = x;
			this.yLoc = y;
			
			this.position = new FlxPoint(this.xLoc*(xRes)+xOffset+xOffset*this.xLoc, 
										 this.yLoc*(yRes)+yOffset+yOffset*this.yLoc);
			
			this.color = 0xffffffff;
			this.sprite = this.createSprite();
			this.fadeTimer = 0;
		}
		
		public function getColor():String 
		{
			return 'white';
		}
		
		protected function createSprite():FlxSprite
		{
			var thaSprite:FlxSprite = new FlxSprite(this.position.x, this.position.y);
			thaSprite.createGraphic((xRes), (yRes), this.color);
			return thaSprite;
		}
		
		
		public function getSprite():FlxSprite
		{
			return this.sprite;
		}
		
		public function getIsDying():Boolean
		{
			return this.isDying;
		}
		
		public function update():void
		{
			this.fadeTimer = this.fadeTimer + FlxG.elapsed;
			if (this.fadeTimer >= 0.05) {
				this.fadeTimer = 0;
				if (this.isDying) {
					if (this.sprite.color > 0x00000000) {
						this.sprite.color = this.sprite.color - 0x01010101;
					}
				}
				
			}
			
		}
		
		public function advanceRound():void {
			if (this.isDying == true) {
				this.isDead = true;
			} else {
				this.isDying = !this.canSurvive();
			}
		}
		
		public function dead():Boolean {
			return this.isDead;
		}
		
		public function canSurvive():Boolean {
			return true;
		}
		
		public function collides(point:FlxPoint):Boolean {
			if ((point.x >= this.position.x) && (point.y >= this.position.y)) {
				if ((point.x <= this.position.x + xRes) && (point.y <= this.position.y + yRes)) {
					return true;
				}
			}
			return false;
		}
		
		public function getLocation():FlxPoint
		{
			return new FlxPoint(this.xLoc, this.yLoc);
		}
	}
}