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
	var apBttnTest: FlxButton;
	
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
		updatePlayerActions(6);
		apBttnTest = new FlxButton(10, 10, "add 6 ap", updatePlayerActions.bind(6));
		PlayState.instance.add(apBttnTest);
	}
	
	public function moveTo(tile: Tile)
	{
		if (actionPoints > 0 || tile.type == "Town NW tile 128x128.png"|| tile.type == "Town NE tile 128x128.png"|| tile.type == "Town SW tile 128x128.png"|| tile.type == "Town SE tile 128x128.png")
		{
			this.x = tile.x;
			this.y = tile.y;
			player.x = this.x + (64 - (player.width / 2));
			player.y = this.y + (64 - (player.height / 2));
			//refocus camera
			PlayState.instance.cameraFocus.x = this.x;
			PlayState.instance.cameraFocus.y = this.y;
			
			currentTile = tile;
		}
		if (currentTile == PlayState.instance.map.tiles[945]) //checks if player is in the bank
		{
			trace("in bank");
			Bank.instance.show();
		} else if (currentTile != PlayState.instance.map.tiles[945])
		{
			Bank.instance.hide();
			actionPoints -= actionPoints > 0? 1: -0;
		}
		
		//update camera position
		
	}
	public function getMapZone()
	{
		
	}
	public function updatePlayerActions(amount: Int):Void
	{
		actionPoints += amount;
		actionPoints -= actionPoints % 6;
	}
	public function addResource(ID:Int):Void
	{
		Bank.instance.addResource(ID);
	}
}
