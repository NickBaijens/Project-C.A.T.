package;
import Resource;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Dave
 */
class Player extends FlxSprite
{
	public var inventory : Array <Resource> = new Array();
	public var actionPoints:Int = 0;
	public function new() 
	{
		super();
		PlayState.instance.add(new FlxButton(5, 80, "Add Water", addResource.bind(0)));
		PlayState.instance.add(new FlxButton(5, 100, "Add Food", addResource.bind(1)));
		PlayState.instance.add(new FlxButton(5, 120, "Add Stone", addResource.bind(2)));
		PlayState.instance.add(new FlxButton(5, 140, "Add Wood", addResource.bind(3)));
		PlayState.instance.add(new FlxButton(5, 160, "Add Iron", addResource.bind(4)));
		PlayState.instance.add(new FlxButton(5, 180, "Add Clay", addResource.bind(5)));
	}
	public function getMapZone()
	{
		
	}
	public function updatePlayerActions()
	{
		
	}
	public function addResource(ID:Int):Void
	{
		Bank.instance.addResource(ID);
	}
}