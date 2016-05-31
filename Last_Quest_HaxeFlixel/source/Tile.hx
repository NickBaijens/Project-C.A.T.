package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Nick Baijens
 */
class Tile extends FlxSprite
{
	static var types = ["Grassland tile 64x64.png", "tile sea water2.png"];
	var type: String = types[1];
	public function new(i:Int) 
	{
		super();
		type = types[i];
		loadGraphic("assets/images/tiles/"+type);
		PlayState.instance.add(this);		
	}
}