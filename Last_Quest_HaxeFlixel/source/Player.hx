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
	public var lastTile : Tile;
	public var playerMoved : Bool = false;
	
	public var actionPoints:Int = 0;
	var apBttnTest: FlxButton;
	
	var player = new FlxSprite();
	
	var uiBG = new FlxSprite();
		
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
		lastTile = pos;
		currentTile = pos;
		trace("lastTile.type = " + lastTile.type);
		trace("currentTile.type = " + currentTile.type);
		PlayState.instance.add(this);
		PlayState.instance.add(player);
		
		//update camera position
		PlayState.instance.cameraFocus.x = this.x;
		PlayState.instance.cameraFocus.y = this.y;
		updatePlayerActions(6);
		//Test buttons!
		apBttnTest = new FlxButton(10, 10, "add 6 ap", updatePlayerActions.bind(6));
		PlayState.instance.add(apBttnTest);
		PlayState.instance.add(new FlxButton(10, 85, "Add Water", Inventory.instance.takeResource.bind(0)));
		PlayState.instance.add(new FlxButton(10, 110, "Add Food", Inventory.instance.takeResource.bind(1)));		
	}
	
	public function moveTo(tile: Tile)
	{
		currentTile = tile;
		trace(lastTile.type);
		trace(currentTile.type);
		if (lastTile.type != "Town NW tile 128x128.png" && lastTile.type != "Town NE tile 128x128.png" && lastTile.type != "Town SW tile 128x128.png" && lastTile.type != "Town SE tile 128x128.png")
		{
			if (actionPoints > 0)
			{
				this.x = tile.x;
				this.y = tile.y;
			
				player.x = this.x + (64 - (player.width / 2));
				player.y = this.y + (64 - (player.height / 2));
				//refocus camera
				PlayState.instance.cameraFocus.x = this.x;
				PlayState.instance.cameraFocus.y = this.y;
				actionPoints -= 1;
				playerMoved = true;
			}
		}
		else if (lastTile.type == "Town NW tile 128x128.png" || lastTile.type == "Town NE tile 128x128.png" || lastTile.type == "Town SW tile 128x128.png" || lastTile.type == "Town SE tile 128x128.png")
		{
			if (currentTile.type == "Town NW tile 128x128.png" || currentTile.type == "Town NE tile 128x128.png" || currentTile.type == "Town SW tile 128x128.png" || currentTile.type == "Town SE tile 128x128.png")
			{
				this.x = tile.x;
				this.y = tile.y;
			
				player.x = this.x + (64 - (player.width / 2));
				player.y = this.y + (64 - (player.height / 2));
				//refocus camera
				PlayState.instance.cameraFocus.x = this.x;
				PlayState.instance.cameraFocus.y = this.y;
				playerMoved = true;
			}
			//leaving town
			else if (currentTile.type != "Town NW tile 128x128.png" && currentTile.type != "Town NE tile 128x128.png" && currentTile.type != "Town SW tile 128x128.png" && currentTile.type != "Town SE tile 128x128.png")
			{
				this.x = tile.x;
				this.y = tile.y;
			
				player.x = this.x + (64 - (player.width / 2));
				player.y = this.y + (64 - (player.height / 2));
				//refocus camera
				PlayState.instance.cameraFocus.x = this.x;
				PlayState.instance.cameraFocus.y = this.y;
				actionPoints -= 1;
				playerMoved = true;
			}
		}			
			
		if (currentTile == PlayState.instance.map.tiles[945]) //checks if player is in the bank
		{
			trace("in bank");
			Bank.instance.show();
		} else if (currentTile != PlayState.instance.map.tiles[945])
		{
			Bank.instance.hide();
		}
		
		lastTile = currentTile;
		trace("current AP: " + actionPoints);
		//update camera position
		
	}

	public function updatePlayerActions(amount: Int):Void
	{
		actionPoints += amount;
		actionPoints = actionPoints > 6?6:actionPoints;
	}
	
	public function addResource(ID:Int):Void
	{
		Inventory.instance.takeResource(ID);
		Inventory.instance.updateInventory();
	}
}
