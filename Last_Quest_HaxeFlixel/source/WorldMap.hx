package;

import flixel.FlxSprite;
import flixel.FlxG;

class WorldMap extends FlxSprite
{
	var map : Array<Tile> = new Array();
    public function new()
    {
        super();
		displayMap();
		getMap();
    }
	public function getMap()
	{
		var testmap:Array<Array<Int>> = [
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 1, 1, 0],
		[0, 0, 0, 0],
		] ;
		//trace ( testmap[1]);
		/*for (i in testMap)
		{
			var tile = new Tile(0);
			tile.x = x * 64;
			tile.y = y * 64;
			tile.x -= 32;
			map.push(tile);
		}*/
	}
	public function displayMap()
	{
		for (y in 0...20)
		{
			for (x in 0...20)
			{
				
			}
		}
		
	}
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
