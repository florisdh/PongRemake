package  
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import GameObjects.Ball;
	import GameObjects.Player;
	/**
	 * ...
	 * @author FDH
	 */
	public class Game 
	{
		
		private var _stage:Stage;
		
		private var _engine:Engine;
		
		private var _player:Player;
		private var _ball:Ball;
		
		// State
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		public function Game(stage:Stage) 
		{
			_stage = stage;
			init();
		}
		
		public function init(e:Event = null):void 
		{
			_engine = new Engine(_stage);
			
			_player = new Player();
			_ball = new Ball();
			
			_engine.addObject(_player);
			_engine.addObject(_ball);
		}
		
		public function destroy(e:Event = null):void
		{
			
		}
		
		public function update(e:Event = null):void 
		{
			_engine.update();
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			_player.onKeyDown(e);
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			_player.onKeyUp(e);
		}
		
		public function start():void 
		{
			if (_started) return;
			_started = true;
			
			_engine.start();
		}
		
		public function pause():void 
		{
			if (_paused) return;
			_paused = false;
			
		}
		
		public function stop():void 
		{
			if (!_started) return;
			_started = false;
			
		}
		
	}

}