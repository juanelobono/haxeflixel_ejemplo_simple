package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Pelota extends FlxSprite{
    public function new(_totalVel: Float = 100){
        super(0, 0);
        
        totalVel = _totalVel;

        // otorgar posición al azar
        x = FlxG.random.float(0, 320-width);
        y = FlxG.random.float(0, 200-32-height); // alto - altura del piso - alto del sprite
        
        // no permitir colisiones
        allowCollisions = FlxObject.NONE;

        // cargar spritesheet y reproducir animación
        loadGraphic("assets/images/ball_sheet.png", true, 16, 16);
        animation.add("idle", [0, 1, 2, 3, 4, 5], 8);
        animation.play("idle");

        // animar aparición
        scale.set(0, 0);
        FlxTween.tween(scale, {"x": 1, "y": 1}, 1.2, {ease: FlxEase.quadOut, onComplete: comenzar_movimiento});
    }

    private function comenzar_movimiento(tween: FlxTween){
        allowCollisions = FlxObject.ANY;
        // otorgar velocidad al azar
        var angle = FlxG.random.float(0, 360);
        velocity.x = totalVel * Math.cos(angle);
        velocity.y = totalVel * Math.sin(angle);
    }

    public override function update(elapsed: Float):Void{
        super.update(elapsed);
        // rebotar en los costados
        if(x<0){
            x = 0;
            velocity.x = -velocity.x;
        }
        if(x>320-width){
            x = 320-width;
            velocity.x = -velocity.x;
        }
        // rebotar en arriba y abajo
        if(y<0){
            y = 0;
            velocity.y = -velocity.y;
        }
        if(y>200-32-height){
            y = 200-32-height;
            velocity.y = -velocity.y;
        }
    }

    private var totalVel: Float;
}