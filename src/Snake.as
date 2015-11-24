package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Snake extends SnakeHead implements IEnemy
	{
		
		
		public function Snake() 
		{
			
		}
		
		public function frame():Boolean
		{
			return false;
		}
		
		public function hitTest(s:Sprite):Boolean
		{
			return hitTestPoint(s.x, s.y, true);
		}
		
		public function takeDamage(num:int):Boolean
		{
			return false;
		}
		
		public function die():void
		{
			
		}
	}

}

/*
 * package  
{
	import flash.display.Sprite;
	
	public class Snake extends Sprite
	{
		private var tailLength:int = 10;
		private var head:SnakeHead = new SnakeHead();
		private var nodes:Vector.<Sprite> = new Vector.<Sprite>();
		
		public function Snake() 
		{
			addChild(head);
			nodes[0] = head;
			for (var i:int=1; i<tailLength; i++) {
				nodes[i] = new SnakeBody();
				addChild(nodes[i]);
			}
		}
		
		public function frame():void
		{
			for (var i:int = 1; i < tailLength; i++) {
				var nodeAngle:Number = Math.atan2(nodes[i].y - nodes[i - 1].y, nodes[i].x - nodes[i - 1].x);
				nodes[i].x = nodes[i - 1].x + 18 + Math.cos(nodeAngle);//=new Point(nodes[i-1].x+tailLenght*Math.cos(nodeAngle),nodes[i-1].y+tailLenght*Math.sin(nodeAngle));
				nodes[i].y = nodes[i - 1].y + 18 + Math.sin(nodeAngle);//=new Point(nodes[i-1].x+tailLenght*Math.cos(nodeAngle),nodes[i-1].y+tailLenght*Math.sin(nodeAngle));
			}
			
			head.x = mouseX;
			head.y = mouseY;
		}
	}

}
*/
