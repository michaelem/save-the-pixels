package
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		override public function create():void
		{	
			var l1:Level = new Level(new Array());
			var spr:Array = l1.getSprites();
			for (var i:uint; i<spr.length; i++) {
				add(spr[i]);
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