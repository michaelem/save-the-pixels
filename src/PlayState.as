package
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		private var level:Level;
		override public function create():void
		{	
			this.level = new Level(new Array());
			var spr:Array = this.level.getSprites();
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
	
		override public function update():void
		{
			this.level.update()
		}
	}
}