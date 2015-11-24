package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Pickup extends BitPickup 
	{
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var speed:Number = 0;
		
		public var aliveTime:int = 0;
		
		public function Pickup() 
		{
			speed = 3.2 * Math.random();
			
			var r:Number = Math.random() * Math.PI*2;
			xSpeed = speed * Math.cos(r);
			ySpeed = speed * Math.sin(r);
			
			PlayState.Pickups.push(this);
		}
		
		public function hitTest(s:Sprite):Boolean
		{
			return s.hitTestObject(this);
		}
		
		public function frame():Boolean
		{
			xSpeed *= 0.95;
			ySpeed *= 0.95;
			x += xSpeed;
			y += ySpeed;
			
			if (xSpeed < 0.4 && xSpeed > 0.4) xSpeed = 0;
			if (ySpeed < 0.4 && ySpeed > 0.4) ySpeed = 0;
			
			aliveTime++;
			if (aliveTime > 900)
			{
				return true;
			}
			return false;
		}
		
		public function die():void
		{
			parent.removeChild(this);
		}
	}

}