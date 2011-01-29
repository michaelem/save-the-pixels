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
		
		public function Level(layout:Array, maxRounds:uint)
		{
			this.pixelLayout = layout;
			this.pixelField = new Array();
			for (var i:uint = 0; i < 8; i++){
				this.pixelField[i] = new Array();
				for (var j:uint = 0; j < 8; j++){
					if (this.pixelLayout[j].slice(i, i+1) == 'w') {
						this.pixelField[i][j] = new Pixel(i, j, this);
					} else if (this.pixelLayout[j].slice(i, i+1) == 'g') {
						this.pixelField[i][j] = new GreenPixel(i, j, this);
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
			if (this.roundTimer >= 2) {
				this.roundTimer = 0;
				this.round += 1;
				for (var i:uint = 0; i < 8; i++){
					for (var j:uint = 0; j < 8; j++){
						if (this.pixelField[i].length > j) {
							this.pixelField[i][j].advanceRound();
						}
					}
				}
			}
			for (var i:uint = 0; i < 8; i++){
				for (var j:uint = 0; j < 8; j++){
					if (this.pixelField[i].length > j) {
						this.pixelField[i][j].update();
					}
				}
			}
		}
		
		public function getColorAt(x:uint, y:uint):String
		{
			if (x < this.pixelField.length()) {
				if (y < this.pixelField[x].lenght()) {
					return pixelField[x][y].getColor();
				}
			}
			return null;
		}
	}
}