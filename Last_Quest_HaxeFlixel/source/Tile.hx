package;

import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.input.mouse.FlxMouseEventManager;

/**
 * ...
 * @author Nick Baijens
 */
class Tile extends FlxSprite
{
	static var types = ["Grassland tile 64x64.png", "tile sea water2.png"];
	var type: String = types[1];
	public var instanceID: Int = 0;
	
	public function new(tiletype:Int) 
	{
		super();
		
		type = types[tiletype];
		loadGraphic("assets/images/tiles/"+type);
		PlayState.instance.add(this);
		FlxMouseEventManager.add(this, onDown, null, null, null);
		
	}
	
	private function onDown(sprite:FlxSprite)
	{
		var player  = PlayState.instance.player;
		
		if (FlxMath.distanceBetween(player,this)==64)
		{
			player.moveTo(this);
		}
		
	}	
}
