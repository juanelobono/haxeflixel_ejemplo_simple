package;

import flixel.FlxSprite;
import flixel.FlxG;

class Personaje extends FlxSprite{
    public function new(X: Float, Y: Float){
        super(X, Y, "assets/images/char.png");
    }

    public override function update(elapsed: Float):Void{
        super.update(elapsed);
        // mover al personaje con las teclas
		if(FlxG.keys.pressed.A){
			velocity.x = -100;
		}else if(FlxG.keys.pressed.D){
			velocity.x = 100;
		}else{
			velocity.x = 0;
		}

		// comprobar que no se salga de la pantalla
		if(x < 0){
			x = 0;
			velocity.x = 0;
		}
		if(x > 304){
			x = 304;
			velocity.x = 0;
		}
    }
}