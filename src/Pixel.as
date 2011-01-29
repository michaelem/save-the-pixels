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
		protected var color:uint;
		private var fadeTimer:Number;
		private var isDying:Boolean;
		
		public function Pixel(x:uint, y:uint, l:Level)
		{
			this.xLoc = x;
			this.yLoc = y;
			this.color = 0xffffffff;
			this.sprite = this.createSprite();
			this.fadeTimer = 0;
		}
		
		public function getColor():String 
		{
			return 'w';
		}
		
		protected function createSprite():FlxSprite
		{
			var xPos:int = this.xLoc*(xRes)+xOffset+xOffset*this.xLoc;
			var yPos:int = this.yLoc*(yRes)+yOffset+yOffset*this.yLoc;
			var thaSprite:FlxSprite = new FlxSprite(xPos, yPos);
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
			this.isDying = !this.canSurvive();
		}
		
		public function canSurvive():Boolean {
			return true;
		}
		
		
	}
}