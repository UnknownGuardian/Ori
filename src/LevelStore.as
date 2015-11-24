package  
{
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class LevelStore 
	{
		public static var level1:Array = [];
		public static var level2:Array = [];
		public static var level3:Array = [];
		public static var level4:Array = [];
		public static var level5:Array = [];
		public static var level6:Array = [];
		public static var level7:Array = [];
		public static var level8:Array = [];
		public static var level9:Array = [];
		public static var level10:Array = [];
		public static var level11:Array = [];
		public static var level12:Array = [];
		public static var level13:Array = [];
		public static var level14:Array = [];
		public static var level15:Array = [];
		public static var level16:Array = [];
		public static var level17:Array = [];
		public static var level18:Array = [];
		public static var level19:Array = [];
		public static var level20:Array = [];
		
		public static var MaxLevel:int = 20;
		
		public static var currentWave:int = 2;
		public static var currentEnemyIndex:int = 0;
		
		public function LevelStore() 
		{
			
		}
		
		public static function fillLevels():void
		{
			for (var i:int = 1; i <= MaxLevel; i++)
			{
				//var numEnemies:int = 10 + i * 3;
				var numEnemies:int = 2 + i * 3;
				for (var j:int = 0; j < numEnemies; j++)
				{
					var hardest:int = i < 2 ? 1 : i < 4 ? 2 : i < 8 ? 3 : 4;
					LevelStore["level" + i].push( 1 + Math.round(Math.random() * (hardest - 1)));
				}
				trace(LevelStore["level" + i]);
			}
		}
		
		//returns enemy number or -2 if no enemies left in game. -1 if no enemies left in level
		public static function getNextEnemy():int
		{
			var enemies:Array = LevelStore["level" + currentWave];
			if (enemies.length <= currentEnemyIndex)
			{
				//move this somewhere else
				/*currentEnemyIndex = 0;
				currentWave++;
				if (currentWave > MaxLevel)
				{
					return -2;
				}*/
				return -1;
			}
			trace(currentEnemyIndex, currentWave);
			var num:int = enemies[currentEnemyIndex];
			currentEnemyIndex++;
			return num;
			
		}
		
		public static function nextLevel():void
		{
			currentWave++;
			currentEnemyIndex = 0;
		}
		public static function restartLevel():void
		{
			currentEnemyIndex = 0;
		}
	}

}