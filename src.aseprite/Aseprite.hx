typedef AsepriteSize = {
  var w:Int;
  var h:Int;
}

typedef AsepriteMeta = {
  var image:String;
  var format:String;
  var size:AsepriteSize;
}

typedef AsepriteFrameFrame = {
  var x:Int;
  var y:Int;
  var w:Int;
  var h:Int;
}

typedef AsepriteFrame = {
  var filename:String;
  var frame:AsepriteFrameFrame;
  var rotated:Bool;
  var sourceSize:AsepriteSize;
}

typedef AsepriteData = {
  var meta:AsepriteMeta;
  var frames:Array<AsepriteFrame>;
}

class Aseprite {
  public static function main() {
    Aseprite.toAtlas("res/atlas/atlas.json");
  }

  public static function toAtlas(filePath:String) {
    var newFilePath = '${haxe.io.Path.withoutExtension(filePath)}.atlas';
    // load file
    var file = sys.io.File.getContent(filePath);
    var data:AsepriteData = haxe.Json.parse(file);

    sys.io.File.saveContent(newFilePath,'');
    var atlasFile = sys.io.File.append(newFilePath);

    // read meta
    atlasFile.writeString('${data.meta.image}\n'); //png
    atlasFile.writeString('size: ${data.meta.size.w},${data.meta.size.h}\n');
    atlasFile.writeString('format: ${data.meta.format}\n');
    atlasFile.writeString('filter: Linear,Linear\n');
    atlasFile.writeString('repeat: none\n');

    for (frame in data.frames) {
      atlasFile.writeString('${frame.filename}\n');
      atlasFile.writeString('  rotate: ${Std.string(frame.rotated)}\n');
      atlasFile.writeString('  xy: ${frame.frame.x}, ${frame.frame.y}\n');
      atlasFile.writeString('  size: ${frame.frame.w}, ${frame.frame.h}\n');
      atlasFile.writeString('  orig: ${frame.sourceSize.w}, ${frame.sourceSize.h}\n');
      atlasFile.writeString('  offset: 0, 0\n');
      atlasFile.writeString('  index: -1\n');
    }

    atlasFile.close();

    return newFilePath;
  }
}