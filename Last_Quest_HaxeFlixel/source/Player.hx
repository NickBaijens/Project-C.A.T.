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
	public var playerInv : Array <Int> = new Array();
	public var actionPoints:Int = 0;
	var apBttnTest: FlxButton;
	
	var player = new FlxSprite();
	
	var uiBG = new FlxSprite();
	
	
	public function new(pos: Tile) 
	{
		instance = this;
		playerInv = [];
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
		apBttnTest = new FlxButton(10, 10, "add 6 ap", updatePlayerActions.bind(6));
		PlayState.instance.add(apBttnTest);
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
	public function getMapZone()
	{
		
	}
	public function updatePlayerActions(amount: Int):Void
	{
		actionPoints += amount;
		actionPoints = actionPoints > 6?6:actionPoints;
		
	}
	public function addResource(ID:Int):Void
	{
		//Bank.instance.addResource(ID);
	}
	public function updatePlayerInv()
    {
		PlayState.instance.remove(uiBG);
		uiBG.loadGraphic("assets/images/UI/inventory3x3.png");
		uiBG.x = PlayState.instance.cameraFocus.x + -600;
		uiBG.y = PlayState.instance.cameraFocus.y + -260;
		PlayState.instance.add(uiBG);
		
		for ( i in 0...playerInv.length)
		{
			trace (i);
			var resourceImage = new FlxSprite();
			var resourceType : String = null;
			var xOffset : Int;
			var yOffset : Int;
			switch playerInv[i]
			{	
				case 0:resourceType = "assets/images/resources/water.png";
				case 1:resourceType = "assets/images/resources/food.png";
				case 2:resourceType = "assets/images/resources/stone.png";
				case 3:resourceType = "assets/images/resources/wood.png";
				case 4:resourceType = "assets/images/resources/iron.png";
				case 5:resourceType = "assets/images/resources/clay.png";
			}
			
			if (i <= 2)
			{
				xOffset = -590;
				yOffset = -250;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + ( i * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}
			if (i <= 5 && i > 2)
			{
				xOffset = -590;
				yOffset = -210;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + ( (i - 3) * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}
			if (i <= 8 && i >5)
			{
				xOffset = -590;
				yOffset = -170;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + (( i - 6) * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}
			
			
		}
    }
}
