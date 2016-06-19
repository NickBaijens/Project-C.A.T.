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
	public var moveToTile:Tile;
	public var currentTile: Tile;
	public var lastTile : Tile;
	public var playerMoved : Bool = false;
	
	public var actionPoints:Int = 0;
	public var maxAP:Int = 9; //boosted to 9 for SP demo
	var apBttnTest: FlxButton;
	
	var player = new FlxSprite();
	
	var uiBG = new FlxSprite();
	var tileInvUI: Array<FlxButton> = new Array<FlxButton>();
		
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
		moveToTile = pos;
		currentTile = pos;
		//trace("lastTile.type = " + lastTile.type);
		//trace("currentTile.type = " + currentTile.type);
		PlayState.instance.add(this);
		PlayState.instance.add(player);
		
		//update camera position
		PlayState.instance.cameraFocus.x = this.x;
		updatePlayerActions(maxAP);
		PlayState.instance.cameraFocus.y = this.y;
		//Test buttons!
		//apBttnTest = new FlxButton(10, 10, "add 6 ap", updatePlayerActions.bind(6));
		//PlayState.instance.add(apBttnTest);
		//PlayState.instance.add(new FlxButton(10, 85, "Add Water", Inventory.instance.takeResource.bind(0)));
		//PlayState.instance.add(new FlxButton(10, 110, "Add Food", Inventory.instance.takeResource.bind(1)));		
	}
	
	public function moveTo(tile: Tile)
	{
		moveToTile = tile;
		
		//trace(lastTile.type);
		//trace(currentTile.type);
		if (currentTile.type != "Town NW tile 128x128.png" && currentTile.type != "Town NE tile 128x128.png" && currentTile.type != "Town SW tile 128x128.png" && currentTile.type != "Town SE tile 128x128.png")
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
				lastTile = currentTile;
				currentTile = moveToTile;
			}
		}
		else if (currentTile.type == "Town NW tile 128x128.png" || currentTile.type == "Town NE tile 128x128.png" || currentTile.type == "Town SW tile 128x128.png" || currentTile.type == "Town SE tile 128x128.png")
		{
			if (moveToTile.type == "Town NW tile 128x128.png" || moveToTile.type == "Town NE tile 128x128.png" || moveToTile.type == "Town SW tile 128x128.png" || moveToTile.type == "Town SE tile 128x128.png")
			{
				this.x = tile.x;
				this.y = tile.y;
			
				player.x = this.x + (64 - (player.width / 2));
				player.y = this.y + (64 - (player.height / 2));
				//refocus camera
				PlayState.instance.cameraFocus.x = this.x;
				PlayState.instance.cameraFocus.y = this.y;
				
				playerMoved = true;
				lastTile = currentTile;
				currentTile = moveToTile;
				
				
			}
			//leaving town
			else if (moveToTile.type != "Town NW tile 128x128.png" && moveToTile.type != "Town NE tile 128x128.png" && moveToTile.type != "Town SW tile 128x128.png" && moveToTile.type != "Town SE tile 128x128.png")
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
					lastTile = currentTile;
					currentTile = moveToTile;
				}
			}
		}
		
		//trace("current AP: " + actionPoints);
		updateTileInv();
		
	}

	public function updatePlayerActions(amount: Int):Void
	{
		actionPoints += amount;
		actionPoints = actionPoints > maxAP?maxAP:actionPoints;
	}
	
	public function addResource(ID:Int):Void
	{
		Inventory.instance.takeResource(ID);
		Inventory.instance.updateInventory();
	}
	
	public function updateTileInv()
	{
		//clear inventory UI
		for (k in 0...tileInvUI.length)
		{
			tileInvUI[k].kill();
		}
		//trace(currentTile.type);
		if (currentTile.type != "Town NE tile 128x128.png" && currentTile.type != "Town SW tile 128x128.png" && currentTile.type != "Town SE tile 128x128.png")
		{
			//trace(currentTile.type);
			//create background
			var invBG = new FlxButton(1020, 150, "");
			invBG.loadGraphic("assets/images/UI/tileInv.png", false, 126, 126);
			PlayState.instance.add(invBG);
			tileInvUI.push(invBG);
			
			//create inventory items according to tileInv, positioned in a list
			for (type in 0...6)
			{
				//trace(type);
				var invIcon = new FlxButton(1020, 150 + (type * 42), "");
				invIcon.loadGraphic("assets/images/resources/" + type + ".png",false,42,42);
				PlayState.instance.add(invIcon);
				var resourceAmount = new FlxButton(1060, 150 + (type * 42), "",Inventory.instance.takeResource.bind(type));
				
				var currentResourceAmount: Int = 0;
				for (resource in currentTile.tileInv)
				{
					//trace(currentTile.tileInv);
					//trace(resource);
					//trace(type);
					if (resource == type)
					{
						currentResourceAmount += 1;
					}
				}
				resourceAmount.text = "x"+currentResourceAmount;
				PlayState.instance.add(resourceAmount);
				
				
				tileInvUI.push(invIcon);
				tileInvUI.push(resourceAmount);
			}
		}
		
	}
}
