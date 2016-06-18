package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;


class MenuState extends FlxState
{
	
	
	override public function create():Void
	{
		super.create();
		add(new FlxButton(5, 0, "Start Game", startGame));
		add(new FlxButton(5, 20, "Start Server", startServer));
		add(new FlxButton(5, 40, "Options", showOptions));
		add(new FlxButton(5, 60, "Exit", exitGame));
	}
	
	function startServer():Void
	{
		FlxG.switchState(new ServerState());
	}
	
	function exitGame():Void
	{
		Sys.exit(0);
	}
	
	function showOptions():Void
	{
		FlxG.switchState(new OptionsState());
	}
	
	function startGame():Void
	{
		FlxG.switchState(new PlayState());
		trace("started game state");
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}
