package;
import Resource;
import openfl.events.Event;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
/**
 * ...
 * @author Dave
 */
class Bank
{
	public static var instance:Bank;
	public var bankInv : Array <Int> = new Array();
	public var water : Int = 0;//0
	public var food : Int = 0;//1
	public var stone : Int = 0;//2
	public var wood : Int = 0;//3
	public var iron : Int = 0;//4
	public var clay : Int = 0;//5
	var uiBG = new FlxSprite(390,210,"assets/images/UI/test.png");
	var image0 = new FlxSprite(0,0,"assets/images/resources/water.png");
	var text0 = new FlxText(545, 200, "", 15);
	var image1 = new FlxSprite(0, 0,"assets/images/resources/food.png");
	var text1 = new FlxText(545, 240, "", 15);
	var image2 = new FlxSprite(0,0,"assets/images/resources/stone.png");
	var text2 = new FlxText(545, 280, "", 15);
	var image3 = new FlxSprite(0,0,"assets/images/resources/wood.png");
	var text3 = new FlxText(545, 320, "", 15);
	var image4 = new FlxSprite(0,0,"assets/images/resources/iron.png");
	var text4 = new FlxText(545, 360, "", 15);
	var image5 = new FlxSprite(0,0,"assets/images/resources/clay.png");
	var text5 = new FlxText(545, 400, "", 15);
	public function new() 
	{
		instance = this;
		
		bankInv = [0,0,1,1];
		trace(bankInv);
		bankInv.sort(function(a,b) return a-b);
		trace(bankInv);
		show();
		hide();
		//
		//test buttons
		//PlayState.instance.add(new FlxButton(5, 80, "Add Water", addResource.bind(0)));
		//PlayState.instance.add(new FlxButton(5, 100, "Add Food", addResource.bind(1)));
		//PlayState.instance.add(new FlxButton(5, 120, "Add Stone", addResource.bind(2)));
		//PlayState.instance.add(new FlxButton(5, 140, "Add Wood", addResource.bind(3)));
		//PlayState.instance.add(new FlxButton(5, 160, "Add Iron", addResource.bind(4)));
		//PlayState.instance.add(new FlxButton(5, 180, "Add Clay", addResource.bind(5)));
		//
	}
	public function hide()
	{
		PlayState.instance.remove(uiBG);
		PlayState.instance.remove(image0);
		PlayState.instance.remove(text0);
		PlayState.instance.remove(image1);
		PlayState.instance.remove(text1);
		PlayState.instance.remove(image2);
		PlayState.instance.remove(text2);
		PlayState.instance.remove(image3);
		PlayState.instance.remove(text3);
		PlayState.instance.remove(image4);
		PlayState.instance.remove(text4);
		PlayState.instance.remove(image5);
		PlayState.instance.remove(text5);
	
	}
	public function show()
	{
		uiBG.x = PlayState.instance.cameraFocus.x + 390;
		uiBG.y = PlayState.instance.cameraFocus.y + -210;
		PlayState.instance.add(uiBG);
		image0.x = PlayState.instance.cameraFocus.x + 410;
		image0.y = PlayState.instance.cameraFocus.y + -200;
		PlayState.instance.add(image0);
		text0.x = image0.x + 35;
		text0.y = image0.y;
		PlayState.instance.add(text0);
		image1.x = PlayState.instance.cameraFocus.x + 400;
		image1.y = PlayState.instance.cameraFocus.y + -160;
		PlayState.instance.add(image1);
		text1.x = image1.x + 45;
		text1.y = image1.y;
		PlayState.instance.add(text1);
		image2.x = PlayState.instance.cameraFocus.x + 400;
		image2.y = PlayState.instance.cameraFocus.y + -120;
		PlayState.instance.add(image2);
		text2.x = image2.x + 45;
		text2.y = image2.y;
		PlayState.instance.add(text2);
		image3.x = PlayState.instance.cameraFocus.x + 400;
		image3.y = PlayState.instance.cameraFocus.y + -80;
		PlayState.instance.add(image3);
		text3.x = image3.x + 45;
		text3.y = image3.y;
		PlayState.instance.add(text3);
		image4.x = PlayState.instance.cameraFocus.x + 400;
		image4.y = PlayState.instance.cameraFocus.y + -40;
		PlayState.instance.add(image4);
		text4.x = image4.x + 45;
		text4.y = image4.y;
		PlayState.instance.add(text4);
		image5.x = PlayState.instance.cameraFocus.x + 400;
		image5.y = PlayState.instance.cameraFocus.y + -0;
		PlayState.instance.add(image5);
		text5.x = image5.x + 45;
		text5.y = image5.y;
		PlayState.instance.add(text5);

	}
	
	public function updateBank()
    {
		water = 0;
		food = 0;
		stone = 0;
		wood = 0;
		iron = 0;
		clay = 0;
		bankInv.sort(function(a,b) return a-b);
		for (i in 0 ... bankInv.length)
		{
			switch bankInv[i]
			{	
				case 0:water 	+= 1;
				case 1:food 	+= 1;
				case 2:stone 	+= 1;
				case 3:wood 	+= 1;
				case 4:iron 	+= 1;
				case 5:clay 	+= 1;
			}
		}
		
		
		text0.text = "x" + water;
		text1.text = "x" + food;
		text2.text = "x" + stone;
		text3.text = "x" + wood;
		text4.text = "x" + iron;
		text5.text = "x" + clay;
		
    }
	public function addResource(ID:Int):Void
	{
		bankInv.push(ID);
	}
}