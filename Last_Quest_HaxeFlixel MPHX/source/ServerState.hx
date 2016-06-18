package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import mphx.connection.IConnection;

/**
 * ...
 * @author Nick
 */

class ServerState extends FlxState
{
	var players = new Map<IConnection,PlayerData>();
	
	override public function create():Void
	{
		super.create();
		FlxG.autoPause = false;
		
		var ip = "127.0.0.1";
		var port = 8000;
		//"192.168.178.34"
		if (Sys.args()[0] != null) ip = Sys.args()[0];
		
		var s = new mphx.server.impl.Server(ip, port);
		add(new FlxText(10,10, "Server started on IP: "+ip));
		add(new FlxText(10, 40, "Using port: " + port));
		
		s.events.on("Join",function(data: Dynamic, sender:IConnection){
			
			trace(data);
		});
	}
	
}