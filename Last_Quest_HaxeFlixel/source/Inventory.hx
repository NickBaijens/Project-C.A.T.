package;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
/**
 * ...
 * @author Dave
 */
class Inventory extends FlxSprite
{
	
	var inventoryBttns: Array<FlxButton> = new Array<FlxButton>();
	var slots: Array<Int> = new Array<Int>(9);
	public function new() 
	{
		super();
		
		for (y in 0...3)
		{
			for (x in 0...3)
			{
				var invbttn = new FlxButton(x * 80, y * 20, "", buttonPressed);
				invbttn.x += 50;
				invbttn.y += 50;
				PlayState.instance.add(invbttn);
				inventoryBttns.push(invbttn);
			}
		}
	}
	
	function buttonPressed():Void
	{
		
	}
}