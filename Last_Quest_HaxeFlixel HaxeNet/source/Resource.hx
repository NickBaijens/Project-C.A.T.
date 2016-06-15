package;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author Dave
 */
class Resource extends FlxSprite
{
	static public var instance : Resource;
	public var resourceName : String;
	public var resourceID : Int;
	public var generatedResource : Int;
	var resourceGenID : Array <Int>;
		
	public function new() 
	{
		instance = this;
		super();
		resourceGenID = [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,]; //array of resources, those that are in here more often have a higher chance of being selected
		//ID 0 = water, 1 = food, 2 = stone, 3 = wood, 4 = iron, 5 = clay, 6 = nothing
	}
	
	public function generateRandomResource() //picks ("generates") a 'random' resource using an array and number generator
	{
		var genResourceID : Int = (Math.floor(Math.random() * resourceGenID.length)); //generates random number
		var genResource : Int = resourceGenID[genResourceID]; //fetches ID with generated number out of the Array
		if (genResource == 0) //creates instance of resource with the fetched ID
		{
			generatedResource = 0;
		} else if (genResource == 1)
		{
			generatedResource = 1;
		} else if (genResource == 2)
		{
			generatedResource = 2;
		} else if (genResource == 3)
		{
			generatedResource = 3;
		} else if (genResource == 4)
		{
			generatedResource = 4;
		} else if (genResource == 5)
		{
			generatedResource = 5;
		} else if (genResource == 6)
		{
			trace("You didn't get anything");
			generatedResource = 6;
		}
	}
}