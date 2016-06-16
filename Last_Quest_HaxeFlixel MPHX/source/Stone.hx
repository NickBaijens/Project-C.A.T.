package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Stone extends Resource
{

	public function new(x:Int, y:Int)
	{
		super();
		resourceName = "stone";
		resourceID = 2;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/stone.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);
	}
}