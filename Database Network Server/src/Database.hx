package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.Lib;
import sys.db.Sqlite;
/**
 * ...
 * @author Dave
 */
class Database extends Sprite
{

	var playerNameScore:String;
	var connection = Sqlite.open("data/Database/QuizGame.db");

	public function new() 
	{
		super();
		showHighscore();
	}
	
	public function getData(msg:String)
	{
		playerNameScore = msg;
		var insertQuery = "INSERT INTO Highscores(name,score) VALUES ("+playerNameScore+")";
		trace(insertQuery);
		
		connection.request(insertQuery);
		trace("connection requested");
		showHighscore();
	}
	
	public function showHighscore()
	{
		var resultset = connection.request("SELECT * FROM Highscores WHERE score != 0 ORDER BY score DESC LIMIT 10");
		
		var tf:TextField = new TextField();
		for (row in resultset)
		{
			trace( row.name + " " + row.score );
			tf.appendText(row.name + " " + row.score);
		}
	}
}