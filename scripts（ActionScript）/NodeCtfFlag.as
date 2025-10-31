package
{
   import flash.display.MovieClip;
   
   public class NodeCtfFlag extends MovieClip
   {
       
      
      public var rim:MovieClip;
      
      public var flag:MovieClip;
      
      public var id:String;
      
      public var team:uint;
      
      public var unitCaptured;
      
      public function NodeCtfFlag()
      {
         var _loc1_:Array = null;
         super();
         _loc1_ = name.split("__");
         this.id = _loc1_[0];
         this.flag.visible = true;
         this.team = Number(_loc1_[1]);
      }
      
      public function setTeam(param1:uint) : void
      {
         this.team = param1;
         gotoAndStop(param1);
         this.flag.gotoAndStop("flag" + param1);
      }
      
      public function capture(param1:*) : void
      {
         var _loc2_:Number = NaN;
         if(this.team == param1.team)
         {
            if(param1.hasFlag)
            {
               if(param1.human)
               {
                  ++param1.score.flagCap;
                  _loc2_ = Math.min(Stats_Classes.getUnitExp(param1.unitInfo.level + 3),Stats_Classes.getUnitExp(param1.game.enemyLvlAvg));
                  _loc2_ *= Number(param1.game.enemyAmt) * 0.7;
                  param1.game.hud.addExp(int(_loc2_));
                  param1.displayExp(_loc2_);
               }
               param1.game.hud.addCustomFeed(param1,"flag");
               ++param1.pscore;
               param1.gun.resetFrame();
               param1.hasFlag.reset();
               param1.game.matchSettings.updateScores();
            }
         }
         else
         {
            if(this.unitCaptured)
            {
               return;
            }
            this.unitCaptured = param1;
            this.flag.visible = false;
            alpha = 0.7;
            this.rim.stop();
            param1.status.sInvis = 0;
            param1.hasFlag = this;
            param1.gun.resetFrame();
            param1.gun.swapGuns();
         }
      }
      
      public function reset() : void
      {
         var _loc1_:* = this.unitCaptured;
         this.unitCaptured.hasFlag = null;
         this.unitCaptured.gun.swapGuns();
         this.unitCaptured = null;
         this.flag.visible = true;
         alpha = 1;
         this.rim.play();
      }
   }
}
