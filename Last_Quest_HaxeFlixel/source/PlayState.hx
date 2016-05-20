package;

import entities.Character;
import map.Level;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var level:Level;
	var player:Character;
	
	override public function create():Void
	{
		//////////////////////////////////////////////////////////////////////////////
		////__________________________________________________Demo Code START_____////
		//////////////////////////////////////////////////////////////////////////////
		
		//FlxG.mouse.visible = false;
		
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		level = new Level("maps/test2.tmx", "maps/test2.tanim");
		
		add(level.backgroundGroup);
		add(level.characterGroup);
		add(level.foregroundGroup);
		
		add(level.collisionGroup);
		
		FlxG.camera.setScrollBoundsRect(level.bounds.x, level.bounds.y, level.bounds.width, level.bounds.height);
		FlxG.worldBounds.copyFrom(level.bounds);
		
		//////////////////////////////////////////////////////////////////////////////
		////__________________________________________________Demo Code END_______////
		//////////////////////////////////////////////////////////////////////////////
		
		
		add(new FlxText(5, 0, "GAME IS GOING TO BE HERE", 30));
		add(new FlxButton(5, 40, "Menu", showMenu));
		super.create();
	}
	
	function showMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float):Void
	{
		//////////////////////////////////////////////////////////////////////////////
		////__________________________________________________Demo Code START_____////
		//////////////////////////////////////////////////////////////////////////////
		level.update(elapsed);
		//////////////////////////////////////////////////////////////////////////////
		////__________________________________________________Demo Code END_______////
		//////////////////////////////////////////////////////////////////////////////
		super.update(elapsed);
	}
}
