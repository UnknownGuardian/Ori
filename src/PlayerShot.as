package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class PlayerShot extends OriShot
	{
		private var _xSpeed:Number = 0;
		private var _ySpeed:Number = 0;
		
		public function PlayerShot() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			/*
			 * Original code
			 * 
			rotation = Math.atan2(stage.mouseY - y, stage.mouseX - x)*180/Math.PI;
			_xSpeed = Math.cos(rotation * (Math.PI / 180)) * 5;
			_ySpeed = Math.sin(rotation * (Math.PI / 180)) * 5;
			*/
			var r:Number = Math.atan2(stage.mouseY - y, stage.mouseX - x);
			_xSpeed = Math.cos(r) * 5;
			_ySpeed = Math.sin(r) * 5;
		}
		
		public function frame():void
		{
			x += _xSpeed;
			y += _ySpeed;
		}
		
		public function die():void
		{
			parent.removeChild(this);
		}
	}

}