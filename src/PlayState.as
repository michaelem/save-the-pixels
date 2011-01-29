package
{
	import flash.ui.Mouse;
	
	import org.flixel.*;
	public class PlayState extends FlxState
	{
		private var level:Level;
		private var l0:Array;
		private var aliveCount:FlxText;
		override public function create():void
		{	
			
			
			l0 = new Array();
			l0[0] = 'wwwwwwww';
			l0[1] = 'gggggggw';
			l0[2] = 'wgwgwgwg';
			l0[3] = 'gwgwgwgw';
			l0[4] = 'gggwwwgg';
			l0[5] = 'wwggwwgg';
			l0[6] = 'ggwwggww';
			l0[7] = 'wwwwgggg';
			this.aliveCount = new FlxText(0474, 10, 70, "alive:")
			this.aliveCount.size = 12;
			
			this.level = new Level(l0, 30, 'green');
			var spr:Array = this.level.getSprites();
			for (var i:uint; i<spr.length; i++) {
				add(spr[i]);
			}
			add(this.aliveCount);
			
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
			flash.ui.Mouse.show();
			this.aliveCount.text = "alive: " + this.level.getAliveCount();
			this.level.update();
			if (FlxG.mouse.pressed()) {
				var pxl:Pixel = level.getPixelAtPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
				var nuPxl:Pixel = new GreenPixel(pxl.getLocation().x, pxl.getLocation().y, this.level);
				level.setPixelAtLocation(pxl.getLocation(), nuPxl);
				add(nuPxl.getSprite());
				
			}
		}
	}
}