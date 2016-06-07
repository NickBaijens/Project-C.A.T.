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
	var slots: Array<Int> = new Array<Int>();
	public function new() 
	{
		super();
		
		for (y in 0...3)
		{
			for (x in 0...3)
			{
				var invbttn = new FlxButton(x * 42, y * 42, "", buttonPressed);
				invbttn.loadGraphic("assets/images/UI/inventorySpot.png", false, 42, 42);
				invbttn.x += 50;
				invbttn.y += 100;
				PlayState.instance.add(invbttn);
				inventoryBttns.push(invbttn);
			}
		}
		
		for ( i in 0...Player.instance.playerInv.length)
		{
			trace (i);
			var resourceImage = new FlxSprite();
			var resourceType : String = null;
			var xOffset : Int;
			var yOffset : Int;
			switch Player.instance.playerInv[i]
			{	
				case 0:resourceType = "assets/images/resources/water.png";
				case 1:resourceType = "assets/images/resources/food.png";
				case 2:resourceType = "assets/images/resources/stone.png";
				case 3:resourceType = "assets/images/resources/wood.png";
				case 4:resourceType = "assets/images/resources/iron.png";
				case 5:resourceType = "assets/images/resources/clay.png";
			}
			
			if (i <= 2)
			{
				xOffset = -590;
				yOffset = -250;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + ( i * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}
			if (i <= 5 && i > 2)
			{
				xOffset = -590;
				yOffset = -210;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + ( (i - 3) * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}
			if (i <= 8 && i >5)
			{
				xOffset = -590;
				yOffset = -170;
				resourceImage.x = PlayState.instance.cameraFocus.x + xOffset + (( i - 6) * 40 );
				resourceImage.y	= PlayState.instance.cameraFocus.y + yOffset;
				resourceImage.loadGraphic(resourceType);
				PlayState.instance.add(resourceImage);
			}	
		}
	}
	
	function buttonPressed():Void
	{
		
	}
}