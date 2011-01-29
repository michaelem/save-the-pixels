package
{
	public class GreenPixel extends Pixel
	{
		public function GreenPixel(x:uint, y:uint)
		{
			super(x, y);
			this.color = 0xff00ff00;
			this.sprite = this.createSprite();
		}
	}
}