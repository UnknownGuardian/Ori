package 
{
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author UnknownGuardian
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			TweenPlugin.activate([GlowFilterPlugin]);
			LevelStore.fillLevels();
			addChild(new PlayState());
			//addChild(new Overlay());
			addChild(new Stats());
			
			
		}

	}

}