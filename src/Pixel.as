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
		
		public function Pixel(x:uint, y:uint, l:Level)
		{
			this.xLoc = x;
			this.yLoc = y;
			this.color = 0xffffffff;
			this.sprite = this.createSprite();
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
		
		public function isDying():Boolean
		//this should implement the rules for the pixel to live or die. (in the subclasses.)
		{
			return false;
		}
		
		public function update():void
		{
			
		}
		
	}
}