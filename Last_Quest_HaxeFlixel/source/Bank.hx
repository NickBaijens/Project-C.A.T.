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
	var image0 = new FlxSprite();
	var text0 = new FlxText(545, 200, "", 15);
	var image1 = new FlxSprite();
	var text1 = new FlxText(545, 240, "", 15);
	var image2 = new FlxSprite();
	var text2 = new FlxText(545, 280, "", 15);
	var image3 = new FlxSprite();
	var text3 = new FlxText(545, 320, "", 15);
	var image4 = new FlxSprite();
	var text4 = new FlxText(545, 360, "", 15);
	var image5 = new FlxSprite();
	var text5 = new FlxText(545, 400, "", 15);
	public function new() 
	{
		instance = this;
		bankInv = [0,0,1,1];
		trace(bankInv);
		bankInv.sort(function(a,b) return a-b);
		trace(bankInv);
		image0.loadGraphic("assets/images/resources/water.png");
		image0.x = 520;
		image0.y = 195;
		PlayState.instance.add(image0);
		PlayState.instance.add(text0);
		image1.loadGraphic("assets/images/resources/food.png");
		image1.x = 510;
		image1.y = 235;
		PlayState.instance.add(image1);
		PlayState.instance.add(text1);
		image2.loadGraphic("assets/images/resources/stone.png");
		image2.x = 510;
		image2.y = 275;
		PlayState.instance.add(image2);
		PlayState.instance.add(text2);
		image3.loadGraphic("assets/images/resources/wood.png");
		image3.x = 510;
		image3.y = 315;
		PlayState.instance.add(image3);
		PlayState.instance.add(text3);
		image4.loadGraphic("assets/images/resources/iron.png");
		image4.x = 510;
		image4.y = 355;
		PlayState.instance.add(image4);
		PlayState.instance.add(text4);
		image5.loadGraphic("assets/images/resources/clay.png");
		image5.x = 510;
		image5.y = 395;
		PlayState.instance.add(image5);
		PlayState.instance.add(text5);
		hide();
	}
	public function hide()
	{
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
		PlayState.instance.add(image0);
		PlayState.instance.add(text0);
		PlayState.instance.add(image1);
		PlayState.instance.add(text1);
		PlayState.instance.add(image2);
		PlayState.instance.add(text2);
		PlayState.instance.add(image3);
		PlayState.instance.add(text3);
		PlayState.instance.add(image4);
		PlayState.instance.add(text4);
		PlayState.instance.add(image5);
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