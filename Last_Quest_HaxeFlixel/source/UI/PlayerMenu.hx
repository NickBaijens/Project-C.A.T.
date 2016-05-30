package UI;

import UI.PlayerMenu.Inventory;
import UI.PlayerMenu.Give;
import UI.PlayerMenu.Pickup;
import UI.PlayerMenu.Stats;
/**
 * ...
 * @author Dave
 */
class PlayerMenu
{

	public function new() 
	{
		var invButton : UI.PlayerMenu.Inventory = new UI.PlayerMenu.Inventory();
		var giveButton : UI.PlayerMenu.Give = new UI.PlayerMenu.Give();
		var pickupButton : UI.PlayerMenu.Pickup = new UI.PlayerMenu.Pickup();
		var statDisplay : UI.PlayerMenu.Stats = new UI.PlayerMenu.Stats();
	}
	public function updatePlayerMenu()
	{
		
	}

}