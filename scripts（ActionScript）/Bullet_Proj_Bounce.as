package
{
   public class Bullet_Proj_Bounce extends Bullet
   {
       
      
      private var fc = 0;
      
      public function Bullet_Proj_Bounce(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,true,param8);
         extra.bounce = 0;
         doHitEffect();
         xVel *= 0.5;
         yVel *= 0.5;
      }
      
      public function EnterFrame() : void
      {
         ++this.fc;
         yVel += Number(stats.params[2]) * 0.1;
         var _loc1_:uint = 0;
         while(_loc1_ < stats.params[1])
         {
            game.createEffect(x,y,stats.params[0]);
            x += xVel;
            y += yVel;
            if(SD.graphPart)
            {
               game.createEffect(x,y,stats.params[0]);
            }
            x += xVel;
            y += yVel;
            if(hitObject = hitTestAll(0,0,true))
            {
               break;
            }
            if(hitTestWall(0,0))
            {
               if(hitTestWall(0,15))
               {
                  ++extra.bounce;
                  y -= yVel * 4;
                  yVel *= -0.5;
                  xVel *= 0.8;
               }
               if(hitTestWall(0,-15))
               {
                  ++extra.bounce;
                  y -= yVel * 4;
                  yVel *= -0.5;
                  xVel *= 0.8;
               }
               if(hitTestWall(10,-10))
               {
                  ++extra.bounce;
                  x -= xVel * 2;
                  xVel *= -0.6;
                  yVel *= 0.7;
               }
               if(hitTestWall(-10,-10))
               {
                  ++extra.bounce;
                  x -= xVel * 2;
                  xVel *= -0.6;
                  yVel *= 0.7;
               }
            }
            _loc1_++;
         }
         doHitEffect();
         if(this.fc == Number(stats.params[3]) * 30)
         {
            doHitEffect(true);
         }
         if(x < 0 || x > 3000 || y < 0 || y > 3000)
         {
            removeMe();
         }
      }
   }
}
