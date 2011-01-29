package
{
	public class GreenPixel extends Pixel
	{
		public function GreenPixel(x:uint, y:uint, l:Level)
		{
			super(x, y, l);
			this.color = 0xff00ff00;
			this.sprite = this.createSprite();
		}
		
		override public function canSurvive():Boolean
		{
			return false;
		}
	}
}