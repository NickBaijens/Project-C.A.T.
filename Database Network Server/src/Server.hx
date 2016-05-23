package;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Dave
 */
class Server extends Sprite
{
	var server:anette.Server;
	var database = new Database();
	public function new()
    {
		super();
		
		
		
        this.server = new anette.Server("localhost", 32000);
        this.server.onData = onData;
        this.server.onConnection = onConnection;
        this.server.onDisconnection = onDisconnection;
        this.server.protocol = new anette.Protocol.Prefixed();
        this.server.timeout = 300;

        // DIFFERENT TARGETS, DIFFERENT LOOPS
        #if js
        var timer = new haxe.Timer(Std.int(1000 / 60));
        timer.run = loop;
        #else
        while(true) {loop(); Sys.sleep(1/60);}
        #end
    }

    function loop()
    {
        server.pump();
        server.flush();
    }

    /*function onData(connection:anette.Connection)
    {
        trace("onData " + connection.input.readInt16());

        var msgLength = connection.input.readInt8();
        var msg = connection.input.readString(msgLength);
        trace("onData " + msg);
    }*/

	function onData(connection:anette.Connection)
    {
        trace("onData " + connection.input.readInt16());

        var msgLength = connection.input.readInt8();
        var msg = connection.input.readString(msgLength);
        trace("onData " + msg);
		database.getData(msg);
    }
	
    function onConnection(connection:anette.Connection)
    {
        trace("CONNNECTION");

        connection.output.writeInt16(42);

        var msg = "Hello Client";
        connection.output.writeInt8(msg.length);
        connection.output.writeString(msg);
    }

    function onDisconnection(connection:anette.Connection)
    {
        trace("DISCONNECTION");
    }

    static function main()
    {
        new Server();
    }
	
}