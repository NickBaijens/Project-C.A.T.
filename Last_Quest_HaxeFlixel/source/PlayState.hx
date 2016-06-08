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
	public var upgrades : Upgrades;
	
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
		upgrades = new Upgrades();
		time = new Time();
		resource = new Resource();		
		add(new FlxButton(10, 85, "Menu", showMenu));
		PlayState.instance.map.tiles[945].tileInv = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5];
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
		Upgrades.instance.updateDisplays();
		getUpgradeRequirements();
	}
	
	public function endDay():Void
	{
		//todo check if defences held...
		if (Upgrades.instance.attackValue > Upgrades.instance.defenceValue)
		{
			trace("game over... you survived until day " + day + "...");
			showMenu();
		}
		else
		{
			day += 1;
			Upgrades.instance.attackValue += Math.floor(10 + (10 * day));
			player.updatePlayerActions(6);
			trace("Day: " + day);
			PlayerMenu.instance.eatButton.text = "Eat";
			PlayerMenu.instance.drinkButton.text = "Drink";
		}
	}
	
	
	public function getUpgradeRequirements() //quick and dirty way to generate requirements
	{
		Upgrades.instance.reqWater = Math.floor(0.2 * Upgrades.instance.currentlevel);
		Upgrades.instance.reqFood = Math.floor(0.3 * Upgrades.instance.currentlevel);
		Upgrades.instance.reqStone = Math.floor(0.5 * Upgrades.instance.currentlevel);
		Upgrades.instance.reqWood = Math.floor(3 * Upgrades.instance.currentlevel);
		Upgrades.instance.reqIron = Math.floor(0.1 * Upgrades.instance.currentlevel);
		Upgrades.instance.reqClay = Math.floor(0.2 * Upgrades.instance.currentlevel);
	}
}
