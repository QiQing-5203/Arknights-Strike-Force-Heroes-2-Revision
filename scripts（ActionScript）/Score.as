package
{
   public class Score
   {
       
      
      private var unit:Unit;
      
      public var headshots:uint = 0;
      
      public var killed1:uint = 0;
      
      public var killed2:uint = 0;
      
      public var killed3:uint = 0;
      
      public var killed4:uint = 0;
      
      public var killed5:uint = 0;
      
      public var bulletsFired:uint = 0;
      
      public var bulletsHit:uint = 0;
      
      public var flagCap:uint = 0;
      
      public var domCap:uint = 0;
      
      public var jugKill:uint = 0;
      
      public var lives:int = 0;
      
      public var kills:uint = 0;
      
      public var deaths:uint = 0;
      
      public var suicides:uint = 0;
      
      public var betrayals:uint = 0;
      
      public var killtimer:uint = 0;
      
      public var multikill:uint = 0;
      
      public var spree:uint = 0;
      
      public var streak:Number = 0;
      
      public var streakKills:Number = 0;
      
      public function Score(param1:Unit)
      {
         super();
         this.unit = param1;
         if(MatchSettings.useMode == "elim" || MatchSettings.useMode == "telim")
         {
            this.lives = MatchSettings.useScore;
            this.updateScore();
         }
      }
      
      public function setKills(param1:uint) : void
      {
         this.kills = param1;
         this.updateScore();
      }
      
      public function EnterFrame() : void
      {
         if(!this.killtimer)
         {
            this.multikill = 0;
         }
         else
         {
            --this.killtimer;
         }
      }
      
      public function addStreak(param1:Number) : void
      {
         if(Boolean(this.unit.unitInfo.streak.kills) && !this.streakReady())
         {
            this.streak += param1;
            this.unit.setKillstreakNum(this.streak);
            if(this.streakReady())
            {
               this.unit.startKillstreak();
            }
         }
      }
      
      public function streakReady() : Boolean
      {
         if(this.unit.unitInfo.streak.kills)
         {
            return (this.streak >= this.unit.unitInfo.streak.kills || this.unit.unitInfo.skill.id == "efficiency" && this.streak >= this.unit.unitInfo.streak.kills - 1) && !this.unit.streakInProgress && !this.unit.dead;
         }
         return false;
      }
      
      public function addKill() : void
      {
         ++this.multikill;
         ++this.spree;
         ++this.kills;
         this.killtimer = 3.5 * 30;
         this.addStreak(1);
         if(Boolean(this.unit.streakInProgress) && this.unit.human)
         {
            ++this.streakKills;
            if(this.streakKills >= 3)
            {
               AGI.submitQuest("streak_3_kills");
            }
         }
         if(this.unit.human)
         {
            this.unit.game.hud.debug.debug1.text = "Streak: " + this.streak;
         }
         this.updateScore();
      }
      
      public function addDeath() : void
      {
         this.spree = 0;
         ++this.deaths;
         --this.lives;
         if(MatchSettings.useMode == "elim" || MatchSettings.useMode == "telim" && this.lives <= 0)
         {
            this.unit.unitInfo.extra.noSpawn = true;
         }
         this.streak = 0;
      }
      
      public function addSuicide() : void
      {
         ++this.suicides;
         this.updateScore();
      }
      
      public function addBetrayal() : void
      {
         ++this.betrayals;
         this.updateScore();
      }
      
      public function updateScore() : void
      {
         var _loc1_:* = MatchSettings.useMode;
         switch("dm" !== _loc1_ ? ("gun" !== _loc1_ ? ("tgun" === _loc1_ ? 2 : ("tdm" !== _loc1_ ? ("jug" === _loc1_ ? 4 : ("zom" !== _loc1_ ? ("elim" === _loc1_ ? 6 : 7) : 5)) : 3)) : 1) : 0)
         {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               this.unit.pscore = this.kills - this.suicides - this.betrayals;
               break;
            case 6:
               this.unit.pscore = this.lives;
         }
         this.unit.game.matchSettings.updateScores();
         if(MatchSettings.useMode == "gun" || MatchSettings.useMode == "tgun")
         {
            this.unit.setGunGameWeapon();
         }
      }
   }
}
