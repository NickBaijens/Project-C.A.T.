package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class OptionsState extends FlxState
{
	override public function create():Void
	{
		super.create();
		add(new FlxText(5, 0, "OPTIONS BE HERE", 30));
		add(new FlxButton(5, 40, "Menu", showMainMenu));
	}
	
	function showMainMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
