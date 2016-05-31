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
	static var types = ["Grassland tile 64x64.png", "Sea tile 64x64.png", "Dessertland tile 64x64.png", "Rockland tile 64x64.png", "Town NW tile 64x64.png", "Town NE tile 64x64.png", "Town SE tile 64x64.png", "Town SW tile 64x64.png","WaterCalm tile 64x64.png"];
	public var tileInv : Array <Int> = new Array();
	var discovered : Bool = false;
	var type: String = types[8]; 
	public function new(i:Int) 
	{
		super();
		type = types[i];
		if (type == "Town NW tile 64x64.png" || type == "Town NE tile 64x64.png" || type == "Town SE tile 64x64.png" || type == "Town SW tile 64x64.png")
		{
			loadGraphic("assets/images/tiles/" + type);
		} else if (discovered == true)
		{
			loadGraphic("assets/images/tiles/" + type);
		} else if (discovered == false)
		{
			loadGraphic("assets/images/tiles/Dessertland tile 64x64.png");
		}
		PlayState.instance.add(this);
		
		tileInv.push(0); // test adding water to inventory
		
	}
}
