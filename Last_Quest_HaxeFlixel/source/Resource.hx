package;

/**
 * ...
 * @author Dave
 */
class Resource
{
	public var resourceType : String;
	var resourceTypes : Array <String> = new Array();
	public function new() 
	{
		trace(resourceTypes);
		resourceTypes.push( * ["water", "clay", "iron", "food", "stone", "wood"]);
		trace(resourceTypes);
	}
	public function generateRandomResource()
	{
		
	}
	public function generateResource()
	{
		
	}
}