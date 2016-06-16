package;

import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Dave
 */
class Water extends Resource
{

	public function new(x:Int, y:Int) //creates new resource (and image) with x and y position
	{
		super();
		resourceName = "water";
		resourceID = 0;
		trace("received " + resourceName);
		var image = new FlxSprite();
		image.loadGraphic("assets/images/resources/water.png");
		image.x = x;
		image.y = y;
		PlayState.instance.add(image);	
	}
}