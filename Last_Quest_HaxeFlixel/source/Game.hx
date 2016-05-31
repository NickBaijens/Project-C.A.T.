package;
import Resource;
import WorldMap;
import Bank;

/**
 * ...
 * @author Dave
 */
class Game
{
	
	public function new() 
	{
		var map : WorldMap = new WorldMap();
		var bank : Bank = new Bank();
		var resource : Resource = new Resource(); // creates initial instance of Resource Class
		resource.generateRandomResource(200, 200); // testing creation of random resource
		resource.generateResource(1, 300, 300); // testing creation of selected resource
	}
	public function createPlayer()
	{
		
	}
}