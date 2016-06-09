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
	static public var instance : PlayerMenu;
	public function new() 
	{
		instance = this;
		endDayButton = new FlxButton(10, 35, "End Day", PlayState.instance.endDay);
		PlayState.instance.add(endDayButton);
		
		harvestButton = new FlxButton(10, 60, "Harvest", Player.instance.currentTile.addResource);
		
		eatButton = new FlxButton(100, 35, "Eat", eat);
		PlayState.instance.add(PlayerMenu.instance.eatButton);
		drinkButton = new FlxButton(100, 60, "Drink", drink);
		PlayState.instance.add(PlayerMenu.instance.drinkButton);
		currentAP = new FlxButton(100, 10, "");
		PlayState.instance.add(PlayerMenu.instance.currentAP);
		
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
		if (water >= 1 && food >= 1 && Player.instance.actionPoints < 6)
		{
			PlayState.instance.add(PlayerMenu.instance.drinkButton);
			PlayState.instance.add(PlayerMenu.instance.eatButton);
		}
		else if (water >= 1 && food == 0 && Player.instance.actionPoints < 6)
		{
			PlayState.instance.add(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		else if (water == 0 && food >= 1 && Player.instance.actionPoints < 6)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.add(PlayerMenu.instance.eatButton);
		}
		else if (water == 0 && food == 0)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		else if (Player.instance.actionPoints == 6)
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
		if (PlayerMenu.instance.drinkButton.text == "Can't drink")
		{
			PlayState.instance.remove(PlayerMenu.instance.drinkButton);
		}
		if (PlayerMenu.instance.eatButton.text == "Can't eat")
		{
			PlayState.instance.remove(PlayerMenu.instance.eatButton);
		}
	}
	function eat():Void
	{
		if (eatButton.text == "Eat")
		{
			Player.instance.updatePlayerActions(6);
			eatButton.text = "Can't eat";
			
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
		if (drinkButton.text == "Drink")
		{
			Player.instance.updatePlayerActions(6);
			drinkButton.text = "Can't drink";
			
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