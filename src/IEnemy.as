package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public interface IEnemy 
	{
		function frame():Boolean;
		function hitTest(s:Sprite):Boolean;
		function takeDamage(num:int):Boolean;
		function die():void
	}

}