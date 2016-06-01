package;

import flixel.FlxSprite;
import flixel.FlxG;

class WorldMap extends FlxSprite
{
	public var tiles : Array<Tile> = new Array();
	
    public function new()
    {
        super();
		getMap();
    }
	
	public function getMap()
	{
		//map array. numbers correspond to Tile.types array elements
		var map:Array<Array<Int>> = [
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 1, 1, 0],
		[0, 0, 0, 0],
		] ;
		//for each element in the map, create a tile and position it. Also add it to tiles array for ease of access
		for (row in 0...map.length) 
		{
			
			for (cell in 0...map[row].length)
			{
				var tile = new Tile(map[row][cell]);
				tile.x = cell * 64;
				tile.y = row * 64;
				tile.instanceID = tilecurrentid;
				tilecurrentid += 1;
				//offset x and y values here to offset the map position
				//tile.x -= 32;
				//tile.y -= 32;
				tiles.push(tile);
			}
		}
	}
	
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
