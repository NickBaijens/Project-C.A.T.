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
		// 0 = grassland, 1 = sea, 2 = dessert, 3 = rock, 4 = Town NW, 5 = Town NE
		// 6 = Town SE, 7 = Town SW, 8 = WaterCalm
		//map array. numbers correspond to Tile.types array elements
		var map:Array<Array<Int>> = [
		/*1*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*2*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*3*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*4*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*5*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*6*/ [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*7*/ [2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2],
		/*8*/ [2, 2, 2, 2, 2, 2, 0, 4, 5, 0, 2, 2, 2, 2, 2, 2],
		/*9*/ [2, 2, 2, 2, 2, 2, 0, 7, 6, 0, 2, 2, 2, 2, 2, 2],
		/*10*/[2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2],
		/*11*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*12*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*13*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*14*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*15*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		/*16*/[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		] ;
		//for each element in the map, create a tile and position it. Also add it to tiles array for ease of access
		for (row in 0...map.length) 
		{
			for (cell in 0...map[row].length)
			{
				var tile = new Tile(map[row][cell]);
				tile.x = cell * 64;
				tile.y = row * 64;
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
