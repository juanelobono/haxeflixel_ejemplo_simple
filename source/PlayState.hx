package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.FlxG;


class PlayState extends FlxState{
	override public function create():Void{
		super.create();
		fondo = new FlxSprite(0, 0, "assets/images/background.png");
		personaje = new Personaje(152, 152);
		pelotas = new FlxGroup();
		texto_puntaje = new FlxText(0, 0, 200);

		add(fondo);
		add(personaje);
		add(pelotas);
		add(texto_puntaje);


	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		FlxG.overlap(personaje, pelotas, personajeChocaPelota);

		// actualizar puntaje
		if(personaje.alive){
			puntaje = puntaje + elapsed;

			// actualizar texto con el puntaje
			texto_puntaje.text = "Puntaje: "+Std.int(puntaje);

			// agrega una nueva pelota cada 3 segundos
			tiempoNuevaPelota = tiempoNuevaPelota + elapsed;
			if(tiempoNuevaPelota >= 3){
				agregarPelota();
				tiempoNuevaPelota = 0;
			}
		}

		
	}

	private function agregarPelota(){
		var p = new Pelota();
		pelotas.add(p);
	}

	private function personajeChocaPelota(personaje: Personaje, pelota: Pelota){
		personaje.kill();
	}

	var personaje: Personaje;
	var fondo: FlxSprite;
	var puntaje: Float = 0;
	var texto_puntaje: FlxText;

	var pelotas: FlxGroup;
	var tiempoNuevaPelota: Float = 0;
}
