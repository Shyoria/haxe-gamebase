package en;

import dn.heaps.filter.PixelOutline;
import h2d.filter.DropShadow;

class Hero extends Entity {
  var ca : dn.heaps.Controller.ControllerAccess;

  var shadow : h2d.filter.DropShadow;

  public function new(cx,cy) {
    super(cx, cy);

    ca = Main.ME.controller.createAccess("hero");
    ca.setLeftDeadZone(0.2);

    shadow = new h2d.filter.DropShadow(0,0,0x1,1,0.5);
    spr.filter = new h2d.filter.Group([
      new dn.heaps.filter.PixelOutline(0xffffff, 0.5),
    ]);
    Assets.tiles.defineAnim("heroIdle","0(10), 1(15), 2(10)");

    spr.anim.registerStateAnim("heroIdle",0);
  }

  override function dispose() {
    super.dispose();
    ca.dispose();
  }

  // movement should be in fixed update, animation should be in delta part

  override function update() {
		super.update();

		if( ca.leftDown() || ca.isKeyboardDown(hxd.Key.LEFT) )
			dx -= 0.01*tmod;

		if( ca.rightDown() || ca.isKeyboardDown(hxd.Key.RIGHT) )
      dx += 0.01*tmod;
    
		if( ca.upDown() || ca.isKeyboardDown(hxd.Key.UP) )
			dy -= 0.01*tmod;

		if( ca.downDown() || ca.isKeyboardDown(hxd.Key.DOWN) )
			dy += 0.01*tmod;
	}
}