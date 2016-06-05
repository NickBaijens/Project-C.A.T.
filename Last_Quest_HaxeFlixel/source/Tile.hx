package;

import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.input.mouse.FlxMouseEventManager;

class Tile extends FlxSprite
{
	static var types = ["Grassland tile 64x64.png", "Sea tile 64x64.png", "Dessertland tile 64x64.png", "Rockland tile 64x64.png", "Town NW tile 64x64.png", "Town NE tile 64x64.png", "Town SE tile 64x64.png", "Town SW tile 64x64.png","WaterCalm tile 64x64.png","Undiscovered tile 64x64.png"];
	public var tileInv : Array <Int> = new Array();
	var discovered : Bool = false;
	var type: String = types[1];
	public var instanceID: Int = 0;
	
	public function new(tiletype:Int) 
	{
		super();
		
		type = types[tiletype];
		updateTile(); //sets correct image for (un)discovered tiles
		
		tileInv.push(0); // test adding water to inventory
		FlxMouseEventManager.add(this, onDown, null, null, null);
		
	}
	
	private function onDown(sprite:FlxSprite)
	{
		var player  = PlayState.instance.player;
		
		if (FlxMath.distanceBetween(player,this)==64)
		{
			player.moveTo(this);
			trace(this.discovered);
			if (this.discovered == false)
			{
				this.discovered = true;
				updateTile();
			}
		}
		
	}
	function updateTile()
	{
		PlayState.instance.remove(this);
		if (type == "Town NW tile 64x64.png" || type == "Town NE tile 64x64.png" || type == "Town SE tile 64x64.png" || type == "Town SW tile 64x64.png")
		{
			loadGraphic("assets/images/tiles/" + type);
		} else if (discovered == true)
		{
			loadGraphic("assets/images/tiles/" + type);
		} else if (discovered == false)
		{
			loadGraphic("assets/images/tiles/Undiscovered tile 64x64.png");
		}
		PlayState.instance.add(this);
	}
}
