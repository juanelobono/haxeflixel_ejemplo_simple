package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState{
	override public function create():Void{
		super.create();
		personaje = new FlxSprite(10, 10, "assets/images/char_wbg.png");
		add(personaje);
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}

	var personaje: FlxSprite;
}
