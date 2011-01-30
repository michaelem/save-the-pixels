package
{
	import org.flixel.*;
	
	public class Level
	{
		private var pixelField:Array;
		private var round:uint;
		private var maxRounds:uint;
		private var pixelLayout:Array;
		private var roundTimer:Number;
		private var colorToSave:String;
		
		public function Level(layout:Array, maxRounds:uint, colorToSave:String)
		{
			this.pixelLayout = layout;
			this.colorToSave = colorToSave;
			this.pixelField = new Array();
			for (var x:uint = 0; x < 8; x++){
				this.pixelField[x] = new Array();
				for (var y:uint = 0; y < 8; y++){
					if (this.pixelLayout[y].slice(x, x+1) == 'w') {
						this.pixelField[x][y] = new Pixel(x, y, this);
					} else if (this.pixelLayout[y].slice(x, x+1) == 'g') {
						this.pixelField[x][y] = new GreenPixel(x, y, this);
					}
				}
			}
			this.maxRounds = maxRounds;
			this.round = 0;
			this.roundTimer = 0;
		}
		
		public function getSprites():Array {
			var sprites:Array = new Array();
			for (var i:uint = 0; i < 8; i++){
				for (var j:uint = 0; j < 8; j++){
					sprites.push(this.pixelField[i][j].getSprite());
				}
			}
			return sprites;
		}
		
		public function update():void {
			this.roundTimer = roundTimer + FlxG.elapsed;
			var advance:Boolean = false;
			
			if (this.roundTimer >= 8) {
				this.roundTimer = 0;
				this.round += 1;
				advance = true;
			}
			for (var i:uint = 0; i < 8; i++){
				for (var j:uint = 0; j < 8; j++){
					if (this.pixelField[i].length > j) {
						this.pixelField[i][j].update();
						if (advance == true) {
							this.pixelField[i][j].advanceRound();
						}
					}
				}
			}
		}
		
		public function getColorAt(x:uint, y:uint):String
		{
			if (pixelField[x][y].dead() == true) {
				return 'black';
			} else {
				return pixelField[x][y].getColor();
			}
		}
		
		public function clippBounds(x:uint, y:uint):FlxPoint
		{
			x = Math.min(x, this.pixelField.length-1);
			y = Math.min(y, this.pixelField[x].length-1);
			return new FlxPoint(x,y);
		}
		
		public function getAliveCount():uint
		{
			var alive:uint = 0;
			for (var i:uint = 0; i < 8; i++){
				for (var j:uint = 0; j < 8; j++){
					if ((this.pixelField[i][j].dead() == false) && (this.getColorAt(i,j) == this.colorToSave)) {
						alive += 1;
					}
				}
			}
			return alive;
		}
		
		public function setPixelAtLocation(loc:FlxPoint, pix:Pixel):void {
			//this.pixelField[loc.x][loc.y]
			this.pixelField[loc.x][loc.y] = pix;
		}
		
		public function getPixelAtPoint(point:FlxPoint):Pixel {
			for (var x:uint = 0; x < 8; x++){
				for (var y:uint = 0; y < 8; y++){
					if (this.pixelField[x][y].collides(point)) {
						return this.pixelField[x][y];
					}

				}
			}
			return null;
		}
	}
}