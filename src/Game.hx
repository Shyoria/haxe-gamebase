import en.Hero;
import dn.Process;
import hxd.Key;

class Game extends deepnight.Game {
  public static var ME : Game;
  
	public var world : World;


	public var hero : en.Hero;

	public var curLevelIdx = 0;

  override public function new() {
    super();
		ME = this;
    
		world = new World(hxd.Res.world.world.entry.getText());
		fx = new Fx();
		hud = new Hud();

		loadLevel("FirstLevel");

		hero = new Hero(5,5);

		Process.resizeAll();
		trace(Lang.t._("Game is ready."));
	}

	public function loadLevel(levelName) {
		// hide everything

		// cleanup
		if (level!=null)
			level.destroy();
		for (e in Entity.ALL)
			e.destroy();
		fx.clear();
		if (camera!=null)
			camera.destroy();
		gc();

		// init
		level = new Level(world.resolveLevelIdentfier(levelName));
		level.attachMainEntities();

		camera = new Camera();

		// show again
	}

  /** Main loop **/
	override function update() {
		super.update();

		for(e in Entity.ALL) if( !e.destroyed ) e.update();

		if( !Console.ME.isActive() && !Modal.hasAny() ) {
			#if hl
			// Exit
			if( ca.isKeyboardPressed(Key.ESCAPE) )
				if( !cd.hasSetS("exitWarn",3) )
					trace(Lang.t._("Press ESCAPE again to exit."));
				else
					hxd.System.exit();
			#end

			// Restart
			if( ca.selectPressed() )
				Main.ME.startGame();
		}
	}
}
