package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;

class PlayState extends FlxState{
	override public function create():Void{
		super.create();
		fondo = new FlxSprite(0, 0, "assets/images/background.png");
		personaje = new Personaje(152, 152);
		pelota = new Pelota();
		texto_puntaje = new FlxText(0, 0, 200);

		add(fondo);
		add(personaje);
		add(pelota);
		add(texto_puntaje);
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		FlxG.overlap(personaje, pelota, personajeChocaPelota);

		// actualizar puntaje
		if(personaje.alive){
			puntaje = puntaje + elapsed;
		}

		// actualizar texto con el puntaje
		texto_puntaje.text = "Puntaje: "+Std.int(puntaje);
	}

	private function personajeChocaPelota(personaje: Personaje, pelota: Pelota){
		personaje.kill();
	}

	var personaje: Personaje;
	var pelota: Pelota;
	var fondo: FlxSprite;
	var puntaje: Float = 0;
	var texto_puntaje: FlxText;
}
