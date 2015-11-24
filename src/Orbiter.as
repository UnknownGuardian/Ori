package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Orbiter extends Proxy implements IEnemy
	{
		public var rotationAmount:Number = 5;
		
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var speed:Number = 1;
		
		public var seekSpeed:Number = 1;
		
		public function Orbiter() 
		{
			addEventListener(Event.ADDED_TO_STAGE, placeOrbiter);
		}
		
		private function placeOrbiter(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, placeOrbiter);
			
			//move left
			var r:Number = Math.random();
			if (r < 0.25)
			{
				x = stage.stageWidth + width + 5;
				y = Math.random() * (stage.stageHeight - height - 10) + height / 2 + 5;
				xSpeed = -speed;
			}
			else if (r < 0.5)
			{
				x = -width - 5;
				y = Math.random() * (stage.stageHeight - height - 10) + height / 2 + 5;
				xSpeed = speed;
			}
			else if (r < 0.75)
			{
				x = Math.random() * (stage.stageWidth - width - 10) + width/2 + 5;
				y = stage.stageHeight + height;
				ySpeed = -speed;
			}
			else
			{
				x = Math.random() * (stage.stageWidth - width - 10) + width/2 + 5;
				y = -height;
				ySpeed = speed;
			}
			
		}
		
		public function frame():Boolean
		{
			ring.rotation += rotationAmount;
			
			
			
			if ( (PlayState.player.x - x) * (PlayState.player.x - x) + (PlayState.player.y - y) * (PlayState.player.y - y) < 90 * 90)
			{
				if (PlayState.player.x > x+10) x += seekSpeed;
				else if (PlayState.player.x < x-10) x -= seekSpeed;
				if (PlayState.player.y > y+10) y += seekSpeed;
				else if (PlayState.player.y < y-10) y -= seekSpeed;
			}
			else
			{
				x += xSpeed;
				y += ySpeed;
				
				if ( x < -width - 10 || x > stage.stageWidth + width + 10 || y < -height - 10 || y > stage.stageHeight + height + 10)
				{
					return true;
				}
			}
			return false;
		}
		
		public function hitTest(s:Sprite):Boolean
		{
			return hitTestPoint(s.x, s.y, true);
		}
		
		public function takeDamage(num:int):Boolean
		{
			rotationAmount *= 0.80;
			if (rotationAmount < 1 && rotationAmount > -1)
			{
				return true;
			}
			return false;
		}
		
		public function die():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				var p:Pickup = new Pickup();
				p.x = x;
				p.y = y;
				parent.addChild(p);
			}
			parent.removeChild(this);
		}
		
	}

}