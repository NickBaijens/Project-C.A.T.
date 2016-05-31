package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Clay extends Resource
{

	public function new(x:Int, y:Int) 
	{
		super();
		resourceName = "clay";
		resourceID = 5;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/clay.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);
	}
}