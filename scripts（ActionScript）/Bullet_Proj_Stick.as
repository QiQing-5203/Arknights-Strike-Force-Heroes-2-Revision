package
{
   public class Bullet_Proj_Stick extends Bullet
   {
       
      
      private var fc:uint = 0;
      
      private var xOff:Number = 0;
      
      private var yOff:Number = 0;
      
      public function Bullet_Proj_Stick(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,true,param8);
         xVel *= 0.5;
         yVel *= 0.5;
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         if(hitObject)
         {
            ++this.fc;
            if(hitType == "unit")
            {
               x = hitObject.x + this.xOff;
               y = hitObject.y + this.yOff;
               if(hitObject.dead)
               {
                  hitObject = hitObject.dead;
                  hitType = "corpse";
                  extra.corpseStick = true;
               }
            }
            if(hitType == "corpse")
            {
               x = hitObject.rdBody.GetDefinition().userData.x + this.xOff;
               y = hitObject.rdBody.GetDefinition().userData.y + this.yOff;
            }
            game.createEffect(x,y,stats.params[0]);
            if(this.fc == Number(stats.params[3]) * 30)
            {
               doHitEffect();
            }
         }
         else
         {
            yVel += Number(stats.params[2]) * 0.1;
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
               if(hitObject = hitTestAll())
               {
                  if(hitType == "unit")
                  {
                     this.xOff = x - Number(hitObject.x);
                     this.yOff = y - Number(hitObject.y);
                  }
                  if(hitType != "corpse")
                  {
                     break;
                  }
                  this.xOff = x - Number(hitObject.rdBody.GetDefinition().userData.x);
                  this.yOff = y - Number(hitObject.rdBody.GetDefinition().userData.y);
                  extra.corpseStick = true;
                  break;
               }
               _loc1_++;
            }
         }
         if(x < 0 || x > 3000 || y < 0 || y > 3000)
         {
            removeMe();
         }
      }
   }
}
