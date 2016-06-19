package;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Dave
 */
class Upgrades
{
	static public var instance : Upgrades;
	
	public var currentlevel:Int = 1;
	var upgradeBttn:FlxButton;
	public var defenceValue:Int;
	public var attackValue:Int;
	var defenceValueDisplay:FlxButton;
	var attackValueDisplay:FlxButton;
	var requirementsDisplay:FlxButton;
	
	var water:Int;
	var food:Int;
	var stone:Int;
	var wood:Int;
	var iron:Int;
	var clay:Int;
	public var reqWater:Int;
	public var reqFood:Int;
	public var reqStone:Int;
	public var reqWood:Int;
	public var reqIron:Int;
	public var reqClay:Int;
	
	public function new() 
	{
		instance = this;
		
		water = 0;
		food = 0;
		stone = 0;
		wood = 0;
		iron = 0;
		clay = 0;
		reqWater = 0;
		reqFood = 0;
		reqStone = 0;
		reqWood = 0;
		reqIron = 0;
		reqClay = 0;
		
		defenceValue = 0;
		attackValue = 0;
		upgradeBttn = new FlxButton(190, 0, "\nBuild Upgrade", setResources);
		upgradeBttn.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		defenceValueDisplay = new FlxButton(190, 35, "");
		defenceValueDisplay.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		attackValueDisplay = new FlxButton(190, 70, "");
		attackValueDisplay.loadGraphic("assets/images/UI/baseButtonS.png", false, 80, 33);
		requirementsDisplay = new FlxButton(280, 10, "");
		requirementsDisplay.loadGraphic("assets/images/UI/upgradeRequirements.png", false, 100, 240);
		
		PlayState.instance.add(Upgrades.instance.upgradeBttn);
		PlayState.instance.add(defenceValueDisplay);
		PlayState.instance.add(attackValueDisplay);
		PlayState.instance.add(requirementsDisplay);
	}
	public function setResources():Void
	{
		
		water = 0;
		food = 0;
		stone = 0;
		wood = 0;
		iron = 0;
		clay = 0;
		for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
		{
			var x = PlayState.instance.map.tiles[945].tileInv[i];
			switch x
			{
				case 0: water += 1;
				case 1: food += 1;
				case 2: stone += 1;
				case 3: wood += 1;
				case 4: iron += 1;
				case 5: clay += 1;
			}
		}
		
		//trace("resources in bank: water: " + water + " food: " + food + " stone: " + stone + " wood: " + wood  + " iron: " + iron + " clay: " + clay);
		checkResources();
	}
	public function checkResources()
	{
		//trace("required resources: water: " + reqWater + " food: " + reqFood + " stone: " + reqStone + " wood: " + reqWood  + " iron: " + reqIron + " clay: " + reqClay);
		if (water >= reqWater && food >= reqFood && stone >= reqStone && wood >= reqWood && iron >= reqIron && clay >= reqClay)
		{
			buildUpgrade();
		}
	}
	public function buildUpgrade()
	{
		defenceValue += 50 + (50 * currentlevel);
		currentlevel += 1;
		var reqWaterRemove:Int = reqWater;
		var reqFoodRemove:Int = reqFood;
		var reqStoneRemove:Int = reqStone;
		var reqWoodRemove:Int = reqWood;
		var reqIronRemove:Int = reqIron;
		var reqClayRemove:Int = reqClay;
		//trace(PlayState.instance.map.tiles[945].tileInv);
		
		while(reqWaterRemove > 0) // remove water from bank
		{
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 0)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					reqWaterRemove -= 1;
					break;
				}
			}
		}
		
		while(reqFoodRemove > 0) // remove food from bank
		{
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 1)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					reqFoodRemove -= 1;
					break;
				}
			}
		}
		
		while(reqStoneRemove > 0) // remove stone from bank
		{
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 2)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					reqStoneRemove -= 1;
					break;
				}
			}
		}
		
		while(reqWoodRemove > 0) // remove wood from bank
		{
			//trace("wood removing");
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 3)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					//trace(PlayState.instance.map.tiles[945].tileInv);
					reqWoodRemove -= 1;
					//trace("wood removed");
					break;
				}
			}
		}
		
		while(reqIronRemove > 0) // remove iron from bank
		{
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 4)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					reqIronRemove -= 1;
					break;
				}
			}
		}
		
		while(reqClayRemove > 0) // remove clay from bank
		{
			for (i in 0...PlayState.instance.map.tiles[945].tileInv.length)
			{
				var x = PlayState.instance.map.tiles[945].tileInv[i];
				if (x == 5)
				{
					PlayState.instance.map.tiles[945].tileInv.splice(i, 1);
					reqClayRemove -= 1;
					break;
				}
			}
		}
		
	}
	
	
	public function updateDisplays()
	{
		if (Player.instance.currentTile == PlayState.instance.map.tiles[990])
		{
			upgradeBttn.text = "\nBuild Upgrade";
			PlayState.instance.add(Upgrades.instance.upgradeBttn);
			requirementsDisplay.text = "Upgrade Requirements:\n" + "Water: x" + reqWater + "\n"
			+ "Food: x" + reqFood + "\n"
			+ "Stone: x" + reqStone + "\n"
			+ "Wood: x" + reqWood + "\n"
			+ "Iron: x" + reqIron + "\n"
			+ "Clay: x" + reqClay + "\n";
			PlayState.instance.add(Upgrades.instance.requirementsDisplay);
		}
		else
		{
			PlayState.instance.remove(Upgrades.instance.upgradeBttn);
			PlayState.instance.remove(Upgrades.instance.requirementsDisplay);
		}
		defenceValueDisplay.text = "\nDefence: " + defenceValue;
		attackValueDisplay.text = "\nAttack: " + attackValue;
		
	}
	
}