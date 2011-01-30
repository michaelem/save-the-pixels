package
{
	import org.flixel.*;
	
	public class Inventory
	{
		private var colors:Array;
		private var sprites:Array;
		public static const offset:FlxPoint = new FlxPoint(10, 494);
		public static const xRes:uint = 48;
		public static const yRes:uint = 48;
		
		public function Inventory(colors:Array)
		{
			this.sprites = new Array();
			this.colors = colors;
			for (var i:int = 0; i < colors.length; i++) {
				var xPos:int = xRes * i + offset.x * i + offset.x;
				var thaSprite:FlxSprite = new FlxSprite(xPos, offset.y);
				
				if (colors[i] == "white") {
					thaSprite.createGraphic((48), (48), 0xffffffff);
				} else if (colors[i] == "green") {
					thaSprite.createGraphic((48), (48), 0xff00ff00);
				}
				
				this.sprites.push(thaSprite);
			}
		}
		
		public function getSprites():Array {
			return this.sprites;
		}
		
		public function getPixelAtPoint(point:FlxPoint):String {
			if (point.y > offset.y && point.y <= offset.y + yRes) {
				for (var k:uint = 0; k< this.colors.length; k++){
					var xPos:int = xRes * k + offset.x * k + offset.x;
					if (point.x >= xPos && point.x <= xPos + xRes){
						return this.colors[k];
					}
				}
			}
			return null;
		}
		
		public function getInvNumberAtPoint(point:FlxPoint):uint {
			if (point.y >= offset.y && point.y <= offset.y + yRes) {
				for (var k:uint = 0; k< this.colors.length; k++){
					var xPos:int = xRes * k + offset.x * k + offset.x;
					if (point.x >= xPos && point.x <= xPos + xRes){
						return k;
					}
				}
			}
			return null;
		}
		
		public function removeColorAt(pos:uint):void {
			this.colors[pos] = null;
			this.sprites[pos].kill();
		}
		
		public function addColorAt(pos:uint, color:String):void {
			this.colors[pos] = color;
			var xPos:int = xRes * pos + offset.x * pos + offset.x;
			var thaSprite:FlxSprite = new FlxSprite(xPos, offset.y);
			if (this.colors[pos] == "white") {
				thaSprite.createGraphic((48), (48), 0xffffffff);
			} else if (this.colors[pos] == "green") {
				thaSprite.createGraphic((48), (48), 0xff00ff00);
			}
			this.sprites[pos] = thaSprite;
		}
	}
}