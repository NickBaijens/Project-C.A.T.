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
		// 6 = Town SE, 7 = Town SW, 8 = WaterCalm, 9 = Undiscovered, 10 = Grass Town
		//map array. numbers correspond to Tile.types array elements
		var map:Array<Array<Int>> = [
		/*0*/ [1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1, 1, 1, 1, 1, 1, 1],
		/*1*/ [1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1, 1, 1, 1, 1, 1, 1],
		/*2*/ [1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*3*/ [1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*4*/ [1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*5*/ [1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*6*/ [1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*7*/ [1, 1, 2, 2, 2, 2, 2, 10, 10, 10, 10, 2, 2, 2, 2, 2, 1, 1],
		/*8*/ [1, 1, 2, 2, 2, 2, 2, 10, 4,  5,  10, 2, 2, 2, 2, 2, 1, 1],
		/*9*/ [1, 1, 2, 2, 2, 2, 2, 10, 7,  6,  10, 2, 2, 2, 2, 2, 1, 1],
		/*10*/[1, 1, 2, 2, 2, 2, 2, 10, 10, 10, 10, 2, 2, 2, 2, 2, 1, 1],
		/*11*/[1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*12*/[1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*13*/[1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*14*/[1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*15*/[1, 1, 2, 2, 2, 2, 2, 2,  2,  2,  2,  2, 2, 2, 2, 2, 1, 1],
		/*16*/[1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1, 1, 1, 1, 1, 1, 1],
		/*17*/[1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1, 1, 1, 1, 1, 1, 1],
		] ;
		//for each element in the map, create a tile and position it. Also add it to tiles array for ease of access
		var tileCurrentID: Int = 0;
		for (row in 0...map.length) 
		{
			
			for (cell in 0...map[row].length)
			{
				var tile = new Tile(map[row][cell]);
				tile.x = cell * 64;
				tile.y = row * 64;
				tile.instanceID = tileCurrentID;
				tileCurrentID += 1;
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
