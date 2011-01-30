package
{
	import flash.ui.Mouse;
	
	import org.flixel.*;
	import org.flixel.data.FlxAnim;

	public class PlayState extends FlxState
	{
		private var level:Level;
		private var l0:Array;
		private var aliveCount:FlxText;
		private var inventory:Inventory;
		private var hoverColor:String;
		private var hoverInvNr:uint;
		override public function create():void
		{	
			this.hoverColor = "none";
			
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
			
			var availableColors:Array = new Array();
			availableColors.push("green");
			availableColors.push("green");
			availableColors.push("green");
			availableColors.push("green");
			availableColors.push("green");
			this.inventory = new Inventory(availableColors);
			

			for each (var sprt:FlxSprite in this.inventory.getSprites()) {
				add(sprt);
			}

		}
	
		override public function update():void
		{
			flash.ui.Mouse.show();
			this.aliveCount.text = "alive: " + this.level.getAliveCount();
			this.level.update();
			if (FlxG.mouse.pressed()) {
				if (this.hoverColor != "none") {
					var pxl:Pixel = level.getPixelAtPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
					if (pxl != null) {
						var nuPxl:Pixel = new GreenPixel(pxl.getLocation().x, pxl.getLocation().y, this.level);
						level.setPixelAtLocation(pxl.getLocation(), nuPxl);
						add(nuPxl.getSprite());
						this.inventory.removeColorAt(this.hoverInvNr);
						this.hoverColor = "none";
					} else {
						this.inventory.addColorAt(this.hoverInvNr, this.hoverColor);
						this.hoverColor = "none";
						this.hoverInvNr = null;
						for each (var sprt:FlxSprite in this.inventory.getSprites()) {
							add(sprt);
						}
					}
				}
				var invColor:String = this.inventory.getPixelAtPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y))
				if (invColor != null) {
					this.hoverColor = invColor;
					this.hoverInvNr = this.inventory.getInvNumberAtPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
					this.inventory.removeColorAt(this.hoverInvNr);
				}
				
				
				
				
			}
			super.update();
		}
	}
}