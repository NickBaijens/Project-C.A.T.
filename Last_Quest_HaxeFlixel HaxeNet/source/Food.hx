package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Food extends Resource
{

	public function new(x:Int, y:Int) 
	{
		super();
		resourceName = "food";
		resourceID = 1;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/food.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);
	}
}