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
		PlayState.instance.add(eatButton);
		drinkButton = new FlxButton(100, 60, "Drink", drink);
		PlayState.instance.add(drinkButton);
		currentAP = new FlxButton(100, 10, "");
		PlayState.instance.add(currentAP);
		
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
	}
	function eat():Void
	{
		if (eatButton.text == "Eat")
		{
			Player.instance.updatePlayerActions(6);
			eatButton.text = "Can't eat";
		}
	}
	function drink():Void
	{
		if (drinkButton.text == "Drink")
		{
			Player.instance.updatePlayerActions(6);
			drinkButton.text = "Can't drink";
		}
	}
}