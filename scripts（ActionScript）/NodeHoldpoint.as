package
{
   import flash.display.MovieClip;
   
   public class NodeHoldpoint extends MovieClip
   {
       
      
      public var flag:MovieClip;
      
      public var curTeam:uint;
      
      public var unitCaptured;
      
      private var flagPos:Number;
      
      private var flagSpd:Number;
      
      public var letter:String = "X";
      
      public function NodeHoldpoint()
      {
         super();
         this.curTeam = 0;
         this.flagPos = -65;
         this.flagSpd = 1;
         this.flag.y = this.flagPos;
         gotoAndStop(this.curTeam + 1);
         this.flag.gotoAndStop(this.curTeam + 1);
      }
      
      public function capture(param1:*) : void
      {
         var _loc2_:Number = NaN;
         if(param1.team == this.curTeam)
         {
            this.flagPos -= this.flagSpd;
            if(this.flagPos < -65)
            {
               this.flagPos = -65;
            }
         }
         else
         {
            this.flagPos += this.flagSpd;
            if(this.flagPos >= -10)
            {
               this.curTeam = param1.team;
               gotoAndStop(this.curTeam + 1);
               this.flag.gotoAndStop(this.curTeam + 1);
               this.unitCaptured = param1;
               param1.game.hud.addCustomFeed(param1,"holdpoint");
               if(param1.human)
               {
                  ++param1.score.domCap;
                  _loc2_ = Math.min(Stats_Classes.getUnitExp(param1.unitInfo.level + 3),Stats_Classes.getUnitExp(param1.game.enemyLvlAvg));
                  _loc2_ *= Number(param1.game.enemyAmt) * 0.4;
                  param1.game.hud.addExp(int(_loc2_));
                  param1.displayExp(_loc2_);
               }
               this.flagPos = -15;
            }
         }
         this.flag.y = this.flagPos;
      }
   }
}
