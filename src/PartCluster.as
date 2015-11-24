package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class PartCluster extends ClusterMini implements IEnemy
	{
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var speed:Number = 12;
		
		public var moveDelay:Number = 0;
		public var moveDelayMax:Number = 10;
		
		public function PartCluster(angleToPlayer:Number = 0) 
		{
			var r:Number = Math.random() * 0.7 - .35 + angleToPlayer;
			xSpeed = speed * Math.cos(r);
			ySpeed = speed * Math.sin(r);
		}
		
		
		public function frame():Boolean
		{
			moveDelay++;
			if (moveDelay > moveDelayMax)
			{
				moveDelay = 0;
				x += xSpeed;
				y += ySpeed;
				if (x < -width / 2 || x > stage.stageWidth + width / 2 || y < -height / 2 || y > stage.stageHeight + height / 2) return true;
			}
			return false;
		}
		
		public function hitTest(s:Sprite):Boolean
		{
			return hitTestPoint(s.x, s.y, true);
		}
		public function takeDamage(num:int):Boolean
		{
			return true;
		}
		
		public function die():void
		{
			for (var i:int = 0; i < 4; i++)
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