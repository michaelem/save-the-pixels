package
{
	import org.flixel.*;
	public class PlayState extends FlxState
	{
		private var level:Level;
		private var l0:Array;
		override public function create():void
		{	
			l0 = new Array();
			l0[0] = 'wwwwwwww';
			l0[1] = 'gggggggg';
			l0[2] = 'wgwgwgwg';
			l0[3] = 'gwgwgwgw';
			l0[4] = 'gggwwwgg';
			l0[5] = 'wwggwwgg';
			l0[6] = 'ggwwggww';
			l0[7] = 'wwwwgggg';
			
			
			this.level = new Level(l0, 30);
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
			this.level.update();
		}
	}
}