package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		
		
		add(new FlxText(5, 0, "GAME IS GOING TO BE HERE", 30));
		add(new FlxButton(5, 40, "Menu", showMenu));
		super.create();
		var game = new Game();
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
