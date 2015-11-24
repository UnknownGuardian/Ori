package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class PlayState extends Sprite 
	{
		private var snake:Snake;
		public static var overlay:Overlay = new Overlay();
		public static var player:Player = new Player();
		
		public static var Shots:Vector.<PlayerShot> = new Vector.<PlayerShot>();
		public static var ActiveEnemies:Vector.<IEnemy> = new Vector.<IEnemy>();
		public static var Pickups:Vector.<Pickup> = new Vector.<Pickup>();
		
		public var enemySpawnCounter:int = 0;
		public var enemySpawnCounterMax:int = 30;
		
		public static var GamePaused:Boolean = false;
		
		
		public function PlayState() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(player);
			player.x = 320;
			player.y = 240;
			addEventListener(Event.ENTER_FRAME, frame);
			
			parent.addChild(overlay);
			//overlay.alpha = 0.8;
			
			var full:FullCluster = new FullCluster();
			full.x = 320;
			full.y = 400;
			addChild(full);
			ActiveEnemies.push(full);
			
			/*snake = new Snake();
			snake.x = 200;
			snake.y = 300;
			addChild(snake);
			ActiveEnemies.push(snake);
			
			var orb:Orbiter = new Orbiter();
			orb.x = 400;
			orb.y = 300;
			addChild(orb);
			ActiveEnemies.push(orb);
			
			var bit:BigBit = new BigBit();
			bit.x = 320;
			bit.y = 100;
			addChild(bit);
			ActiveEnemies.push(bit);
			
			var full:FullCluster = new FullCluster();
			full.x = 320;
			full.y = 400;
			addChild(full);
			ActiveEnemies.push(full);*/
			
			/*var w:PauseWindow = new PauseWindow();
			w.x = 320;
			w.y = 240;
			addChild(w);*/
		}
		
		private function frame(e:Event):void 
		{
			overlay.frame();
			
			
			if (GamePaused) return;
			
			player.frame();
			
			var i:int = 0;
			for (i = 0; i < Shots.length; i++)
			{
				Shots[i].frame();
			}
			
			for (i = 0; i < ActiveEnemies.length; i++)
			{
				if (ActiveEnemies[i].frame())
				{
					ActiveEnemies[i].die();
					ActiveEnemies[i] = ActiveEnemies[ActiveEnemies.length - 1];
					ActiveEnemies.length--;
					i--;
				}
				else
				{
					inner:for (var j:int = 0; j < Shots.length; j++)
					{
						if (ActiveEnemies[i].hitTest(Shots[j])) //collision
						{
							var removed:PlayerShot = Shots[j];
							
							Shots[j].die();
							Shots[j] = Shots[Shots.length - 1];
							Shots.length--;
							j--;
							
							if (ActiveEnemies[i].takeDamage(5))
							{
								ActiveEnemies[i].die();
								ActiveEnemies[i] = ActiveEnemies[ActiveEnemies.length - 1];
								ActiveEnemies.length--;
								i--;
								break inner;
							}
						}
					}
				}
			}
			
			for (i = 0; i < Pickups.length; i++)
			{
				if (Pickups[i].frame())
				{
					Pickups[i].die();
					Pickups[i] = Pickups[Pickups.length - 1];
					Pickups.length--;
				}
				else if (Pickups[i].hitTest(player))
				{
					Module.dropsCollected++;
					Pickups[i].die();
					Pickups[i] = Pickups[Pickups.length - 1];
					Pickups.length--;
				}
			}
			
			
			enemySpawnCounter++;
			if (enemySpawnCounter > enemySpawnCounterMax)
			{
				enemySpawnCounter = 0;
				var enemyType:int = LevelStore.getNextEnemy();
				if (enemyType == -1)
				{
					//no more enemies right now. Wait until they are all killed
					if (ActiveEnemies.length == 0)
					{
						//no more active enemies, we must pop up the success window!
						displayWindow("success");
					}
					else
						trace("enemy waiting", ActiveEnemies.length, (ActiveEnemies[0] as DisplayObject).x, (ActiveEnemies[0] as DisplayObject).y, ActiveEnemies[0] is Orbiter , ActiveEnemies[0] is BigBit);
					return;
				}
				else
				{
					var en:IEnemy;
					if (enemyType == 1)
						en = new BigBit();
					else if (enemyType == 2)
						en = new Orbiter();
					else if (enemyType == 3)
						en = new FullCluster();
					else if (enemyType == 4)
						trace("IMPLEMENT ENEMY 4");
					
					addChild(en as DisplayObject);
					ActiveEnemies.push(en);
				}
			}
			
		}
		
		public function displayWindow(winType:String):void 
		{
			if (winType == "success")
			{
				addChild(new ContinueWindow());
			}
			else if (winType == "fail")
			{
				addChild(new RetryWindow());
			}
			GamePaused = true;
		}
		
		public static function StartNextWaveAndUnpause():void
		{
			LevelStore.nextLevel();
			GamePaused = false;
		}
		public static function StartSameWaveAndUnpause():void
		{
			LevelStore.restartLevel();
			GamePaused = false;
		}
		
	}

}