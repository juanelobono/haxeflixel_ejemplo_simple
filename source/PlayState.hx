package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState{
	override public function create():Void{
		super.create();
		personaje = new FlxSprite(152, 152, "assets/images/char_wbg.png");
		add(personaje);
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);

		// mover al personaje con las teclas
		if(FlxG.keys.pressed.A){
			personaje.velocity.x = -100;
		}else if(FlxG.keys.pressed.D){
			personaje.velocity.x = 100;
		}else{
			personaje.velocity.x = 0;
		}

		// comprobar que no se salga de la pantalla
		if(personaje.x < 0){
			personaje.x = 0;
			personaje.velocity.x = 0;
		}
		if(personaje.x > 304){
			personaje.x = 304;
			personaje.velocity.x = 0;
		}


	}

	var personaje: FlxSprite;
}
