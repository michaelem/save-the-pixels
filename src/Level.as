package
{
	public class Level
	{
		private var pixelField:Array;
		
		public function Level(layout:Array)
		{
			this.pixelField = new Array();
			for (var i:uint = 0; i < 8; i++){
				this.pixelField[i] = new Array();
				for (var j:uint = 0; j < 8; j++){
					this.pixelField[i][j] = new Pixel(i, j, this);
				}
			}
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
			
		}
	}
}