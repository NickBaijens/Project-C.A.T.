package;

import Inventory;
import Give;
import Pickup;
import Stats;
/**
 * ...
 * @author Dave
 */
class PlayerMenu
{

	public function new() 
	{
		var invButton : Inventory = new Inventory();
		var giveButton : Give = new Give();
		var pickupButton : Pickup = new Pickup();
		var statDisplay : Stats = new Stats();
	}
	public function updatePlayerMenu()
	{
		
	}

}