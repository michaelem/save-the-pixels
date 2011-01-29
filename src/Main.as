package {
	    import org.flixel.*;
	 
	    [SWF(width="600", height="600", backgroundColor="#ABCC7D")]
	    [Frame(factoryClass="Preloader")]
	 
	    public class Main extends FlxGame
	    {
		        public function Main():void
		        {
			            super(600, 600, PlayState, 1);
		        }
	    }
}