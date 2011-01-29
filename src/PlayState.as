package
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		override public function create():void
		{	
			var thaPixels:Array = new Array();
			for (var i:uint = 0; i < 8; i++){
				thaPixels[i] = new Array();
				for (var j:uint = 0; j < 8; j++){
					thaPixels[i][j] = new Pixel(i, j);
					add(thaPixels[i][j].getSprite());
				}
			}
			
			var yourPixels:Array = new Array();
			for (var k:uint = 0; k < 6; k++) {
				var xPos:int = 48 * k + 10 * k +10;
				var thaSprite:FlxSprite = new FlxSprite(xPos, 494);
				thaSprite.createGraphic((48), (48), 0xffffffff);
				add(thaSprite);
			}
		}
	}
}