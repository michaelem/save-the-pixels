package
{
	import org.flixel.*;
	
	public class GreenPixel extends Pixel
	{
		public function GreenPixel(x:uint, y:uint, l:Level)
		{
			super(x, y, l);
			this.color = 0xff00ff00;
			this.sprite = this.createSprite();
		}
		
		override public function getColor():String 
		{
			return 'green';
		}
		
		override public function canSurvive():Boolean
		{
			var pt:FlxPoint = this.level.clippBounds(this.xLoc+1, this.yLoc);
			var foo:String = this.level.getColorAt(pt.x, pt.y);
			return this.level.getColorAt(pt.x, pt.y) == 'green';
			
		}
	}
}