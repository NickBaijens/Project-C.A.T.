package;
import flixel.FlxSprite;
import flixel.FlxG;
import openfl.geom.Point;
import flixel.ui.FlxButton;

class Player extends FlxSprite
{
	public var currentTile: Tile;
	public var inventory : Array <Resource> = new Array();
	public var actionPoints:Int = 0;
	var leftBttn: FlxButton;
	var rightBttn: FlxButton;
	var upBttn: FlxButton;
	var downBttn: FlxButton;
	
	public function new(pos: Tile) 
	{
		super();
		makeGraphic(128, 128, 0x554b5376);
		this.x = pos.x;
		this.y = pos.y;
		currentTile = pos;
		PlayState.instance.add(this);
		
		//update camera position
		PlayState.instance.cameraFocus.x = this.x;
		PlayState.instance.cameraFocus.y = this.y;
	}
	
	public function moveTo(tile: Tile)
	{
		this.x = tile.x;
		this.y = tile.y;
		currentTile = tile;
		if (currentTile == PlayState.instance.map.tiles[189]) //checks if player is in the bank
		{
			trace("in bank");
			Bank.instance.show();
		} else if (currentTile != PlayState.instance.map.tiles[189])
		{
			Bank.instance.hide();
		}
		
		//update camera position
		PlayState.instance.cameraFocus.x = this.x;
		PlayState.instance.cameraFocus.y = this.y;
	}
	public function getMapZone()
	{
		
	}
	public function updatePlayerActions()
	{
		
	}
	public function addResource(ID:Int):Void
	{
		Bank.instance.addResource(ID);
	}
}
