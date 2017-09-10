package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Personaje extends FlxSprite{
    public function new(X: Float, Y: Float){
        super(X, Y);
        // cargar spritesheet y agregar animaciones
        loadGraphic("assets/images/char_sheet.png", true, 16, 16);
        animation.add("idle", [0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3], 2);
        animation.add("walk", [5, 6, 7], 7);
        animation.add("jump", [8], 1);
        animation.add("fall", [9], 1);
        animation.add("hit", [4], 1);
        animation.play("idle");

        // agregar gravedad
        acceleration.y = 400;

        // ajustar AABB del personaje
        width = 10;
        offset.x = 3;
        height = 13;
        offset.y = 3;
    }

    public override function update(elapsed: Float):Void{
        super.update(elapsed);
        if(!esta_vivo){
            return;
        }

        // mover al personaje con las teclas
		if(FlxG.keys.pressed.A){
			velocity.x = -100;
            animation.play("walk");
            flipX = true;
		}else if(FlxG.keys.pressed.D){
			velocity.x = 100;
            animation.play("walk");
            flipX = false;
		}else{
			velocity.x = 0;
            animation.play("idle");
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

        // acción de saltar
        var linea_piso = 200-32-height; 
        if(y >= linea_piso){
            y = linea_piso;
            velocity.y = 0;
        }

        if(FlxG.keys.pressed.W && y == linea_piso){
            velocity.y = -200;
        }

        // animación del salto
        if(y < linea_piso){
            if(velocity.y < 0){
                animation.play("jump");
            }else{
                animation.play("fall");
            }
        }
    }


    public override function kill(){
        esta_vivo = false;
        allowCollisions = FlxObject.NONE;
        velocity.y = -100;
        velocity.x = 0;
        animation.play("hit");
        angularVelocity = 10;
    }

    public var esta_vivo(default, null): Bool = true;
}