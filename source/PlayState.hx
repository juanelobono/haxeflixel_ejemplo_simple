package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState{
	override public function create():Void{
		super.create();
		fondo = new FlxSprite(0, 0, "assets/images/background.png");
		personaje = new Personaje(152, 152);
		pelota = new Pelota();

		add(fondo);
		add(personaje);
		add(pelota);
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}

	var personaje: Personaje;
	var pelota: Pelota;
	var fondo: FlxSprite;
}
