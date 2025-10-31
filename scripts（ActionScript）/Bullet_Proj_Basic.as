package
{
   public class Bullet_Proj_Basic extends Bullet
   {
       
      
      var countDistX:Number;
      
      var countDistY:Number;
      
      public function Bullet_Proj_Basic(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,true,param8);
         doHitEffect();
         xVel *= 0.5;
         yVel *= 0.5;
         this.countDistX = param6 * Math.abs(xVel);
         this.countDistY = param6 * Math.abs(yVel);
      }
      
      public function EnterFrame() : void
      {
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
            this.countDistX += Math.abs(xVel) * 2;
            this.countDistY += Math.abs(yVel) * 2;
            if(hitObject = hitTestAll())
            {
               break;
            }
            _loc1_++;
         }
         doHitEffect();
         if(UT.getPythagorean(this.countDistX,this.countDistY) >= maxDist)
         {
            removeMe();
         }
         if(x < 0 || x > 3000 || y < 0 || y > 3000)
         {
            removeMe();
         }
      }
   }
}
