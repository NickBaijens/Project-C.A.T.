package;

import Inventory;
import Give;
import Pickup;
import Stats;
import flixel.ui.FlxButton;
/**
 * ...
 * @author Dave
 */
class PlayerMenu
{
	var invButton : Inventory = new Inventory();
	var giveButton : Give = new Give();
	var pickupButton : Pickup = new Pickup();
	var statDisplay : Stats = new Stats();
	var endDayButton : FlxButton;
	
	public var harvestButton : FlxButton;
	public var harvestButtonVisable : Bool = false;
	
	public var eatButton : FlxButton;
	public var drinkButton : FlxButton;
	public var currentAP : FlxButton;
	public var positionDisplay : FlxButton;
	
	static public var instance : PlayerMenu;
	public function new() 
	{
		instance = this;
		endDayButton = new FlxButton(10, 35, "\nEnd Day", PlayState.instance.endDay);
		endDayButton.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		PlayState.instance.add(endDayButton);
		
		harvestButton = new FlxButton(10, 70, "\nHarvest", Player.instance.currentTile.addResource);
		harvestButton.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		eatButton = new FlxButton(100, 35, "\nEat", eat);
		eatButton.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		//eatButton.graphic
		PlayState.instance.add(PlayerMenu.instance.eatButton);
		drinkButton = new FlxButton(100, 70, "\nDrink", drink);
		drinkButton.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		PlayState.instance.add(PlayerMenu.instance.drinkButton);
		currentAP = new FlxButton(100, 0, "");
		currentAP.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		PlayState.instance.add(PlayerMenu.instance.currentAP);
		positionDisplay = new FlxButton(10, 0, "");
		positionDisplay.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		PlayState.instance.add(PlayerMenu.instance.positionDisplay);
		
	}
	public function updatePlayerMenu()
	{
		
		if (Player.instance.currentTile == PlayState.instance.map.tiles[946])
		{
			
			PlayState.instance.add(endDayButton);
			//trace("player in barracks");
		}
		else if (Player.instance.currentTile != PlayState.instance.map.tiles[946])
		{
			//trace("player not in barracks");
			PlayState.instance.remove(endDayButton);
			
		}
		var water = 0;
		var food = 0;
		for (i in 0...Inventory.instance.playerInv.length)
		{
			var x = Inventory.instance.playerInv[i];
			switch x
			{
				case 0: water += 1;
				case 1: food += 1;
			}
		}
		if (water >= 1 && food >= 1 && Player.instance.actionPoints < Player.instance.maxAP)
		{
			PlayState.instance.add(PlayerMenu.instance.drinkButton);
			PlayState.instance.add(PlayerMenu.instance.eatButton);
		}
		else if (water >= 1 && food == 0 && Player.instance.actionPoints < Player.instance.maxAP)
		{
			PlayState.instance.add(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		else if (water == 0 && food >= 1 && Player.instance.actionPoints < Player.instance.maxAP)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.add(PlayerMenu.instance.eatButton);
		}
		else if (water == 0 && food == 0)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		else if (Player.instance.actionPoints == Player.instance.maxAP)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		if (PlayerMenu.instance.drinkButton.text == "\nCan't drink")
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
		}
		if (PlayerMenu.instance.eatButton.text == "\nCan't eat")
		{
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
	}
	function eat():Void
	{
		if (eatButton.text == "\nEat")
		{
			Player.instance.updatePlayerActions(Player.instance.maxAP);
			eatButton.text = "\nCan't eat";
			
			for (i in 0...Inventory.instance.playerInv.length)
			{
				var x = Inventory.instance.playerInv[i];
				if (x == 1)
				{
					Inventory.instance.playerInv.splice(i, 1);
					Inventory.instance.updateInventory();
					break;
				}
			}
		}
	}
	function drink():Void
	{
		if (drinkButton.text == "\nDrink")
		{
			Player.instance.updatePlayerActions(Player.instance.maxAP);
			drinkButton.text = "\nCan't drink";
			
			for (i in 0...Inventory.instance.playerInv.length)
			{
				var x = Inventory.instance.playerInv[i];
				if (x == 0)
				{
					Inventory.instance.playerInv.splice(i, 1);
					Inventory.instance.updateInventory();
					break;
				}
			}
		}
	}
}