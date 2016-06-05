package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.input.mouse.FlxMouseEventManager;


class PlayState extends FlxState
{
	public static var instance : PlayState;
	
	private var cameraFollow:FlxCamera;
	public var cameraFocus:FlxSprite;
	
	public static var bank : Bank;
	public var map : WorldMap;
	var time : Time;
	var resource : Resource; // creates initial instance of Resource Class
	public var player : Player;
	
	override public function create():Void
	{
		instance = this;
		
		cameraFocus = new FlxSprite();
		cameraFocus.makeGraphic(1, 1, FlxColor.TRANSPARENT);
		add(cameraFocus);
		
		cameraFollow = FlxG.camera;
		cameraFollow.follow(cameraFocus, FlxCameraFollowStyle.LOCKON);
		
		super.create();
		
		FlxG.plugins.add(new FlxMouseEventManager());	
		map = new WorldMap();
		bank = new Bank();
		player = new Player(map.tiles[153]); //is there a better way for the initial spawn of the player?
		//later we will get the tile from the database (I guess) but finding the town tiles is a bit tedious.
		time = new Time();
		resource = new Resource();		
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
