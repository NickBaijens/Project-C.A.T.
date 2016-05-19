package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/chars/princess.json", "assets/images/chars/princess.json");
			type.set ("assets/images/chars/princess.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/chars/princess.png", "assets/images/chars/princess.png");
			type.set ("assets/images/chars/princess.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/chars/soldier.json", "assets/images/chars/soldier.json");
			type.set ("assets/images/chars/soldier.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/chars/soldier.png", "assets/images/chars/soldier.png");
			type.set ("assets/images/chars/soldier.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/maps/Atlas_0/base_out_atlas.png", "assets/maps/Atlas_0/base_out_atlas.png");
			type.set ("assets/maps/Atlas_0/base_out_atlas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/maps/Atlas_0/terrain_atlas.png", "assets/maps/Atlas_0/terrain_atlas.png");
			type.set ("assets/maps/Atlas_0/terrain_atlas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/maps/test2.tanim", "assets/maps/test2.tanim");
			type.set ("assets/maps/test2.tanim", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/maps/test2.tmx", "assets/maps/test2.tmx");
			type.set ("assets/maps/test2.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/chars/princess.json", "images/chars/princess.json");
			type.set ("images/chars/princess.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("images/chars/princess.png", "images/chars/princess.png");
			type.set ("images/chars/princess.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/chars/soldier.json", "images/chars/soldier.json");
			type.set ("images/chars/soldier.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("images/chars/soldier.png", "images/chars/soldier.png");
			type.set ("images/chars/soldier.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/images-go-here.txt", "images/images-go-here.txt");
			type.set ("images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("maps/Atlas_0/base_out_atlas.png", "maps/Atlas_0/base_out_atlas.png");
			type.set ("maps/Atlas_0/base_out_atlas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("maps/Atlas_0/terrain_atlas.png", "maps/Atlas_0/terrain_atlas.png");
			type.set ("maps/Atlas_0/terrain_atlas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("maps/test2.tanim", "maps/test2.tanim");
			type.set ("maps/test2.tanim", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("maps/test2.tmx", "maps/test2.tmx");
			type.set ("maps/test2.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
