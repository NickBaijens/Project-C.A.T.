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
	override public function create():Void
	{
		instance = this;
		add(new FlxButton(5, 40, "Menu", showMenu));
		super.create();
		
		var game : Game = new Game();
		var testmap: WorldMap = new WorldMap();
	}
	
	function showMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
