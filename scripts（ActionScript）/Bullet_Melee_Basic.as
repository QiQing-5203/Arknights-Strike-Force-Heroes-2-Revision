package
{
   public class Bullet_Melee_Basic extends Bullet
   {
       
      
      public function Bullet_Melee_Basic(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,true,param8);
         var _loc9_:uint = 0;
         while(_loc9_ < uint(maxDist / 10))
         {
            x += xVel;
            y += yVel;
            if(hitObject = hitTestAll())
            {
               break;
            }
            _loc9_++;
         }
         doHitEffect();
         removeMe();
      }
      
      public function EnterFrame() : void
      {
      }
   }
}
