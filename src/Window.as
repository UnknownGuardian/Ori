package  
{
	import com.greensock.easing.Cubic;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Window extends Sprite 
	{
		public var title:TextField = new TextField();
		
		public function Window(width:int = 448, height:int = 336, windowTitle:String = "Title") 
		{
			graphics.lineStyle(3, 0xFFFFFF, 1);
			graphics.beginFill(0x3222222, 1);
			graphics.drawRect( -width / 2, -height / 2, width, height);
			graphics.endFill();
			
			title.defaultTextFormat = new TextFormat("_typewriter", 26,0xFFFFFF,true,null,null,null,null,"center");
			//title.autoSize = 'center';
			title.text = windowTitle;
			title.x = -width/2 + 5;
			title.width = width - 10
			title.height = 35;
			title.y = -height / 2 + 5;
			title.selectable = false;
			addChild(title);
			fadeIn();
			
			addEventListener(Event.ADDED_TO_STAGE, centerize);
		}
		
		private function centerize(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, centerize);
			
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
		}
		
		public function fadeIn():void
		{
			alpha = 0;
			scaleX = 0;
			scaleY = 0;
			TweenLite.to(this, 1,{ alpha:1, scaleX:1, scaleY:1, ease:Cubic.easeOut } );
		}
		
		public function fadeOut():void
		{
			TweenLite.to(this, 1,{ alpha:0, scaleX:0, scaleY:0, ease:Cubic.easeOut, onComplete:die } );
		}
		
		public function hookSpaceListener():void
		{
			if(stage)
				stage.addEventListener(KeyboardEvent.KEY_DOWN, kDown);
			else
				addEventListener(Event.ADDED_TO_STAGE, backupAddSpace);
		}
		
		public function die():void
		{
			while (numChildren > 0) removeChildAt(0);
			
		}
		
		
		
		
		
		
		
		private function backupAddSpace(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, backupAddSpace);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, kDown);
		}
		private function kDown(e:KeyboardEvent):void {
			if (e.keyCode == 32) //space
			{
				removeSpaceListener();
				fadeOut();
			}
		}
		private function removeSpaceListener():void	{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, kDown);
		}
		
		
	}

}