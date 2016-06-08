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
	public var day: Int = 1;
	public static var instance : PlayState;
	
	private var cameraFollow:FlxCamera;
	public var cameraFocus:FlxSprite;
	
	public var map : WorldMap;
	var time : Time;
	var resource : Resource; // creates initial instance of Resource Class
	public var player : Player;
	public var playerMenu : PlayerMenu;
	
	override public function create():Void
	{
		instance = this;
		super.create();
		
		cameraFocus = new FlxSprite();
		cameraFocus.makeGraphic(1, 1, FlxColor.TRANSPARENT);
		add(cameraFocus);
		
		cameraFollow = FlxG.camera;
		cameraFollow.follow(cameraFocus, FlxCameraFollowStyle.LOCKON);
		
		FlxG.plugins.add(new FlxMouseEventManager());	
		map = new WorldMap();
		player = new Player(map.tiles[946]);
		
		playerMenu = new PlayerMenu();
		time = new Time();
		resource = new Resource();		
		add(new FlxButton(10, 85, "Menu", showMenu));
	}
	
	function showMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Player.instance.currentTile.harvestResourceBttnTextUpdate();
		PlayerMenu.instance.currentAP.text = "AP:  " + Player.instance.actionPoints;	
	}
	
	public function endDay():Void
	{
		//todo check if defences held...
		
		
		day += 1;
		player.updatePlayerActions(6);
		trace("Day: " + day);
	}
}
