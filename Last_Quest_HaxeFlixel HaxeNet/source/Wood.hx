package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Wood extends Resource
{
	
	public function new(x:Int, y:Int) 
	{
		super();
		resourceName = "wood";
		resourceID = 3;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/wood.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);
	}
}