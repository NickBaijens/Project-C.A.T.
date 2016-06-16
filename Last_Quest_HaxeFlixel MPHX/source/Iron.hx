package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Iron extends Resource
{

	public function new(x:Int, y:Int) 
	{
		super();
		resourceName = "iron";
		resourceID = 4;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/iron.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);
	}
}