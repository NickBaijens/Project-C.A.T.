package;
import Resource;
import flash.events.Event;
/**
 * ...
 * @author Dave
 */
class Bank
{
	public var bankInv : Array <Int> = new Array();
	public var water : Int = 0;//0
	public var food : Int = 0;//1
	public var stone : Int = 0;//2
	public var wood : Int = 0;//3
	public var iron : Int = 0;//4
	public var clay : Int = 0;//5
	public function new() 
	{
		bankInv = [0, 0, 5, 5, 4, 3, 2, 1, 0, 0];
		trace(bankInv);
		bankInv.sort(function(a,b) return a-b);
		trace(bankInv);
		for (i in bankInv)
		{
			trace(bankInv[i]);
			switch bankInv[i]{	
				
				case 0:water += 1;
				case 1:food += 1;
				case 2:stone += 1;
				case 3:wood += 1;
				case 4:iron += 1;
				case 5:clay += 1;
			}
		}
		trace(water);
		trace(food);
		trace(stone);
		trace(wood);
		trace(iron);
		trace(clay);
	}
	public function updateBank(e:Event):Void
	{
		
	}
}