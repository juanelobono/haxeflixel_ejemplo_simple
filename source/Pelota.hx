package;

import flixel.FlxSprite;
import flixel.FlxG;

class Pelota extends FlxSprite{
    public function new(totalVel: Float = 100){
        super(0, 0, "assets/images/ball.png");
        x = FlxG.random.float(0, 320-width);
        y = FlxG.random.float(0, 200-32-height); // alto - altura del piso - alto del sprite
        
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
}