class Level extends deepnight.Level {
	/** Level grid-based width**/
	override function get_cWid() return level.l_Collisions.cWid;

	/** Level grid-based height **/
  override function get_cHei() return level.l_Collisions.cHei;

  
  public var level : World.World_Level;
  var tilesetSource : h2d.Tile;

  var marks : Map<LevelMark, Map<Int,Bool>> = new Map();

  override public function new(l:World.World_Level) {
    super();
    level = l;
    tilesetSource = hxd.Res.world.tiles.toTile();
	}
	
	public function attachMainEntities() {
		// for(e in level.l_Entities.all_Trigger)
		// 	new en.Trigger(e);
	}

  /** Return TRUE if mark is present at coordinates **/
	public inline function hasMark(mark:LevelMark, cx:Int, cy:Int) {
		return !isValid(cx,cy) || !marks.exists(mark) ? false : marks.get(mark).exists( coordId(cx,cy) );
	}

	/** Enable mark at coordinates **/
	public function setMark(mark:LevelMark, cx:Int, cy:Int) {
		if( isValid(cx,cy) && !hasMark(mark,cx,cy) ) {
			if( !marks.exists(mark) )
				marks.set(mark, new Map());
			marks.get(mark).set( coordId(cx,cy), true );
		}
	}

	/** Remove mark at coordinates **/
	public function removeMark(mark:LevelMark, cx:Int, cy:Int) {
		if( isValid(cx,cy) && hasMark(mark,cx,cy) )
			marks.get(mark).remove( coordId(cx,cy) );
	}

	/** Return TRUE if "Collisions" layer contains a collision value **/
	public inline function hasCollision(cx,cy) : Bool {
		return !isValid(cx,cy) ? true : level.l_Collisions.getInt(cx,cy)==0;
	}

	/** Render current level**/
	override function render() {
		// Placeholder level render
		root.removeChildren();

		var tg = new h2d.TileGroup(tilesetSource, root);

		var layer = level.l_Collisions;
		for( autoTile in layer.autoTiles ) {
			var tile = layer.tileset.getAutoLayerHeapsTile(tilesetSource, autoTile);
			tg.add(autoTile.renderX, autoTile.renderY, tile);
		}
	}
}