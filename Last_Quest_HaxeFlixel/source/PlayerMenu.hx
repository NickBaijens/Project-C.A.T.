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
	
	static public var instance : PlayerMenu;
	public function new() 
	{
		instance = this;
		endDayButton = new FlxButton(10, 35, "End Day", PlayState.instance.endDay);
		PlayState.instance.add(endDayButton);
		
		harvestButton = new FlxButton(10, 60, "Harvest", Player.instance.currentTile.addResource);
		
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

}