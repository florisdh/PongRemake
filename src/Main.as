package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import UI.Menus.DeathMenu;
	import UI.Menus.Menu;
	import UI.Menus.StartMenu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Main extends Sprite 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _game:Game;
		private var _menu:Menu;
		
		// State
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		// -- Construct -- //
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_game = new Game(stage);
			_game.addEventListener(Game.DEATH, onDeath);
			
			showStartMenu();
			//start();
			
			// Event listeners
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onDeath(e:Event):void 
		{
			stop();
			showEndMenu();
		}
		
		private function update(e:Event):void 
		{
			_game.update();
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			_game.onKeyDown(e);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			_game.onKeyUp(e);
		}
		
		// -- Methods -- //
		
		private function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			hideMenu();
			
			_game.start();
		}
		
		private function pause(e:Event = null):void 
		{
			if (_paused) return;
			_paused = false;
			
			hideMenu();
			
			_game.pause();
		}
		
		private function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			hideMenu();
			
			_game.stop();
		}
		
		private function showStartMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			_menu.addEventListener(StartMenu.START, start);
			addChild(_menu);
		}
		
		private function showPauseMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			addChild(_menu);
		}
		
		private function showEndMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new DeathMenu();
			_menu.addEventListener(DeathMenu.MAINMENU, showStartMenu);
			addChild(_menu);
		}
		
		private function hideMenu(e:Event = null):void 
		{
			if (_menu)
			{
				removeChild(_menu);
				_menu = null;
				stage.focus = null;
			}
		}
	}
	
}