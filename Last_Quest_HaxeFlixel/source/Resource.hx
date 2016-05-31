package;
import flixel.FlxSprite;
import flixel.FlxG;


/**
 * ...
 * @author Dave
 */
class Resource extends FlxSprite
{
	public var resourceName : String;
	public var resourceID : Int;
	var resourceGenID : Array <Int>;
	
	
	public function new() 
	{
		super();
		resourceGenID = [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 5, 5]; //array of resources, those that are in here more often have a higher chance of being selected
		//ID 0 = water, 1 = food, 2 = stone, 3 = wood, 4 = iron, 5 = clay, 6 = nothing
	}
	public function generateRandomResource(x:Int, y:Int) //picks ("generates") a 'random' resource using an array and number generator
	{
		var posX = x; //saves the position
		var posY = y; 
		var genResourceID : Int = (Math.floor(Math.random() * resourceGenID.length)); //generates random number
		var genResource : Int = resourceGenID[genResourceID]; //fetches ID with generated number out of the Array
		if (genResource == 0) //creates instance of resource with the fetched ID
		{
			var water : Water = new Water(posX, posY);
		} else if (genResource == 1)
		{
			var food : Food = new Food(posX, posY);
		} else if (genResource == 2)
		{
			var stone : Stone = new Stone(posX, posY);
		} else if (genResource == 3)
		{
			var wood : Wood = new Wood(posX, posY);
		} else if (genResource == 4)
		{
			var iron : Iron = new Iron(posX, posY);
		} else if (genResource == 5)
		{
			var clay : Clay = new Clay(posX, posY);
		} else if (genResource == 6)
		{
			trace("You didn't get anything");
		}
	}
	public function generateResource(ID:Int, x:Int, y:Int)//ID 0 = water, 1 = food, 2 = stone, 3 = wood, 4 = iron, 5 = clay
	{
		var genResource = ID;
		var posX = x;
		var posY = y;
		if (genResource == 0) //creates instance of resource with the fetched ID
		{
			var water : Water = new Water(posX, posY);
		} else if (genResource == 1)
		{
			var food : Food = new Food(posX, posY);
		} else if (genResource == 2)
		{
			var stone : Stone = new Stone(posX, posY);
		} else if (genResource == 3)
		{
			var wood : Wood = new Wood(posX, posY);
		} else if (genResource == 4)
		{
			var iron : Iron = new Iron(posX, posY);
		} else if (genResource == 5)
		{
			var clay : Clay = new Clay(posX, posY);
		}
	}
}