package;
import flixel.FlxSprite;
import flixel.FlxG;
import openfl.geom.Point;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.math.FlxMath;

class Player extends FlxSprite
{
	static public var instance : Player;
	public var currentTile: Tile;
	public var inventory : Array <Resource> = new Array();
	public var actionPoints:Int = 0;
	var leftBttn: FlxButton;
	var rightBttn: FlxButton;
	var upBttn: FlxButton;
	var downBttn: FlxButton;
	
	var player = new FlxSprite();
	
	
	public function new(pos: Tile) 
	{
		instance = this;
		
		super();
		player.loadGraphic("assets/images/characters/CharacterMockup.png");
		makeGraphic(128, 128, FlxColor.TRANSPARENT);
		this.x = pos.x;
		this.y = pos.y;
		player.x = this.x + (64 - (player.width / 2));
		player.y = this.y + (64 - (player.height / 2));
		currentTile = pos;
		PlayState.instance.add(this);
		PlayState.instance.add(player);
		
		//update camera position
		PlayState.instance.cameraFocus.x = this.x;
		PlayState.instance.cameraFocus.y = this.y;
	}
	
	public function moveTo(tile: Tile)
	{
		this.x = tile.x;
		this.y = tile.y;
		player.x = this.x + (64 - (player.width / 2));
		player.y = this.y + (64 - (player.height / 2));
		//refocus camera
		PlayState.instance.cameraFocus.x = this.x;
		PlayState.instance.cameraFocus.y = this.y;
		
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
