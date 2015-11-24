package  
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Overlay extends OverlayScreenBar
	{
		
		public function Overlay() 
		{
			mouseEnabled = false;
			
		}
		
		public function frame():void
		{
			bar.y += 4;
			if (bar.y > stage.stageHeight + 300)
			{
				bar.y = -bar.height;
			}
		}
		
	}

}