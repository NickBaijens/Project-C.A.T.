package;
import openfl.events.Event;

import openfl.Lib;
/**
 * ...
 * @author Dave
 */
class Time
{
	var lastUpdate:Int;
	public var deltaTime : Int;
	public var nightTime : Bool = false;
	public function new() 
	{
		lastUpdate = Lib.getTimer();
	}
	public function updateTime(e:Event):Void
	{
		var now:Int = openfl.Lib.getTimer();
		deltaTime = now - lastUpdate;
		lastUpdate = now;
	}
	
}