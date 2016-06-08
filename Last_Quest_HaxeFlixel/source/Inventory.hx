package;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
/**
 * ...
 * @author Dave
 */
class Inventory extends FlxSprite
{
	static public var instance: Inventory;
	
	public var playerInv: Array <Int> = new Array();
	var inventoryBttns: Array<FlxButton> = new Array<FlxButton>();

	public function new() 
	{
		super();
		instance = this;
		updateInventory();
	}
	
	public function updateInventory()
	{
		//clear inventory UI
		for (k in 0...inventoryBttns.length)
		{
			inventoryBttns[k].kill();
		}
		
		//create background
		var invBG = new FlxButton(10, 150, "");
		invBG.loadGraphic("assets/images/UI/inventory3x3.png", false, 126, 126);
		PlayState.instance.add(invBG);
		inventoryBttns.push(invBG);
		
		//create inventory items according to playerInv, positioned in a 3x3 grid
		var i: Int = 0;
		for (y in 0...3)
		{
			for (x in 0...3)
			{			
				if (playerInv[i] != null)
				{
					var invItem = new FlxButton(x * 42, y * 42, "", dropResource.bind(i, playerInv[i]));
					invItem.loadGraphic("assets/images/resources/" + playerInv[i] + ".png", false, 42,42);
					invItem.x += 10;
					invItem.y += 150;
					PlayState.instance.add(invItem);
					inventoryBttns.push(invItem);
				}
				i += 1;
			}
		}
	}
	
	//use this to take a resource from a tile and place it in the inventory
	public function takeResource(ID: Int)
	{
		if (Player.instance.currentTile.tileInv.indexOf(ID) != -1 && playerInv.length<9)
		{
			Player.instance.currentTile.tileInv.remove(ID);
			playerInv.push(ID);
			updateInventory();
			Player.instance.updateTileInv();
		}
	}
	
	//use this to drop a resource on a tile
	public function dropResource(index:Int,ID:Int):Void
	{
		trace(Player.instance.currentTile.tileInv);
		playerInv.splice(index,1);
		Player.instance.currentTile.tileInv.push(ID);
		updateInventory();
		trace(Player.instance.currentTile.tileInv);
		Player.instance.updateTileInv();
	}
}