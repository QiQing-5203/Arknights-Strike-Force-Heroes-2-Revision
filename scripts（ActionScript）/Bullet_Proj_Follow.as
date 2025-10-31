package
{
   public class Bullet_Proj_Follow extends Bullet
   {
       
      
      var countDistX:Number;
      
      var countDistY:Number;
      
      public function Bullet_Proj_Follow(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
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
         var _loc1_:uint = 0;
         yVel += Number(stats.params[2]) * 0.1;
         rotation = UT.getRotation(x,y,x + xVel,y + yVel);
         _loc1_ = 0;
         while(_loc1_ < game.units.length)
         {
            if(game.units[_loc1_] != unit)
            {
               if(!game.units[_loc1_].dead)
               {
                  if(!(Boolean(unit.team) && unit.team == game.units[_loc1_].team))
                  {
                     if(UT.getDist(x,y,game.units[_loc1_].x,Number(game.units[_loc1_].y) - 40) < stats.params[3])
                     {
                        rotation += UT.rotateDirection(rotation,UT.getRotation(x,y,game.units[_loc1_].x,Number(game.units[_loc1_].y) - 40)) * Number(stats.params[4]);
                     }
                  }
               }
            }
            _loc1_++;
         }
         xVel = UT.xMoveToRot(rotation,5);
         yVel = UT.yMoveToRot(rotation,5);
         _loc1_ = 0;
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
