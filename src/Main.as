package {
	    import org.flixel.*;
	 
	    [SWF(width="474", height="600", backgroundColor="#ABCC7D")]
	    [Frame(factoryClass="Preloader")]
	 
	    public class Main extends FlxGame
	    {
		        public function Main():void
		        {
			            super(474, 600, PlayState, 1);
		        }
	    }
}