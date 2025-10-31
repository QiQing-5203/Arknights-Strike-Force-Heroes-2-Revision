package
{
   public class Bullet_Proj_Frames extends Bullet
   {
       
      
      private var frame:uint = 0;
      
      private var name:String;
      
      private var bitstats:Object;
      
      public function Bullet_Proj_Frames(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,true,param8);
         doHitEffect();
         this.bitstats = BH.getBitAniStats(stats.params[0] + 0,"idle");
         this.name = stats.params[0] + UT.irand(0,this.bitstats.rotAmt - 1);
         this.frame = 1;
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         yVel += Number(stats.params[2]) * 0.1;
         if(this.frame < this.bitstats.frames)
         {
            _loc1_ = 0;
            while(_loc1_ < stats.params[1])
            {
               x += xVel;
               y += yVel;
               game.bitscreen.paint(x + game.arena.x,y + game.arena.y,true,this.name,"idle",this.frame);
               if(this.frame < this.bitstats.frames)
               {
                  ++this.frame;
               }
               x += xVel;
               y += yVel;
               if(SD.graphPart)
               {
                  game.bitscreen.paint(x + game.arena.x,y + game.arena.y,true,this.name,"idle",this.frame);
               }
               if(this.frame < Number(this.bitstats.frames) - Number(stats.params[3]) && (hitObject = hitTestAll()))
               {
                  game.createEffectAtFrame(x,y,stats.params[0],"idle",this.frame);
                  doHitEffect();
                  break;
               }
               _loc1_++;
            }
         }
         else
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
