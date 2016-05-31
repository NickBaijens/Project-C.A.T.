package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	public static var instance:FlxState;
	public static var bank : Bank;
	var map : WorldMap;
	var time : Time;
	var resource : Resource; // creates initial instance of Resource Class
	var player : Player;
	override public function create():Void
	{
		instance = this;
		
		super.create();
		
		bank = new Bank();
		map = new WorldMap();
		time = new Time();
		resource = new Resource();
		player = new Player();
		resource.generateRandomResource(200, 200); // testing creation of random resource
		resource.generateResource(1, 300, 300); // testing creation of selected resource
		add(new FlxButton(5, 40, "Menu", showMenu));
		
	}
	
	function showMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		bank.updateBank();
	}
}
