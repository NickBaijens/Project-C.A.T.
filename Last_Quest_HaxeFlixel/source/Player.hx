package;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import openfl.geom.Point;
/**
 * ...
 * @author Dave
 */
class Player extends FlxSprite
{
	public var inventory : Array <Resource> = new Array();
	public var actionPoints:Int = 0;
	
	public function new(pos: Tile) 
	{
		super();
		PlayState.instance.add(new FlxButton(5, 80, "Add Water", addResource.bind(0)));
		PlayState.instance.add(new FlxButton(5, 100, "Add Food", addResource.bind(1)));
		PlayState.instance.add(new FlxButton(5, 120, "Add Stone", addResource.bind(2)));
		PlayState.instance.add(new FlxButton(5, 140, "Add Wood", addResource.bind(3)));
		PlayState.instance.add(new FlxButton(5, 160, "Add Iron", addResource.bind(4)));
		PlayState.instance.add(new FlxButton(5, 180, "Add Clay", addResource.bind(5)));
		
		makeGraphic(16, 16, FlxColor.BLUE);
		this.x = pos.x+24;
		this.y = pos.y+24;
		PlayState.instance.add(this);
	}
	public function moveTo(tile: Tile)
	{
		this.x = tile.x+24;
		this.y = tile.y+24;
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
