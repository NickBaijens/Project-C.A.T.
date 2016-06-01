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
		makeGraphic(64, 64, 0x554b5376);
		this.x = pos.x;
		this.y = pos.y;
		currentTile = pos;
		PlayState.instance.add(this);
		PlayState.instance.add(new FlxButton(5, 80, "Add Water", addResource.bind(0)));
		PlayState.instance.add(new FlxButton(5, 100, "Add Food", addResource.bind(1)));
		PlayState.instance.add(new FlxButton(5, 120, "Add Stone", addResource.bind(2)));
		PlayState.instance.add(new FlxButton(5, 140, "Add Wood", addResource.bind(3)));
		PlayState.instance.add(new FlxButton(5, 160, "Add Iron", addResource.bind(4)));
		PlayState.instance.add(new FlxButton(5, 180, "Add Clay", addResource.bind(5)));
	}
	
	public function moveTo(tile: Tile)
	{
		this.x = tile.x;
		this.y = tile.y;
		currentTile = tile;
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
