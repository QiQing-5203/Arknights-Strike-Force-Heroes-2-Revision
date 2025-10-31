package
{
   import flash.display.MovieClip;
   
   public class NodePickup extends MovieClip
   {
       
      
      public var rim:MovieClip;
      
      public var game:Game;
      
      public var id:String;
      
      private var spawnTime:uint;
      
      public var taken:uint = 0;
      
      private var yRot:uint = 0;
      
      public function NodePickup()
      {
         super();
         var _loc1_:Array = name.split("_");
         this.id = _loc1_[0];
         this.spawnTime = Number(_loc1_[1]);
         var _loc2_:* = this.id;
         switch("ammo" !== _loc2_ ? ("ammobig" === _loc2_ ? 1 : ("armor" !== _loc2_ ? ("armorbig" === _loc2_ ? 3 : ("health" !== _loc2_ ? ("healthbig" !== _loc2_ ? 6 : 5) : 4)) : 2)) : 0)
         {
            case 0:
            case 1:
               gotoAndStop("yellow");
               break;
            case 2:
            case 3:
               gotoAndStop("white");
               break;
            case 4:
            case 5:
               gotoAndStop("green");
               break;
            default:
               this.id = this.id.substring(1);
               gotoAndStop("none");
         }
      }
      
      public function EnterFrame() : void
      {
         if(this.taken)
         {
            --this.taken;
            alpha = 0.5;
            if(this.rim)
            {
               this.rim.stop();
            }
         }
         else
         {
            this.yRot += 5;
            this.game.bitscreen.paint(x + this.game.arena.x + rotation * 0.5,y + this.game.arena.y - 30 - UT.yMoveToRot(this.yRot,4),true,"pickups0",this.id);
            alpha = 1;
            if(this.rim)
            {
               this.rim.play();
            }
         }
      }
      
      public function getPickup(param1:Unit) : void
      {
         var _loc2_:* = this.id;
         switch("health" !== _loc2_ ? ("healthbig" !== _loc2_ ? ("armor" === _loc2_ ? 2 : ("armorbig" !== _loc2_ ? ("ammo" === _loc2_ ? 4 : ("ammobig" !== _loc2_ ? 6 : 5)) : 3)) : 1) : 0)
         {
            case 0:
               if(param1.human)
               {
                  SH.playSound(S_Heal);
               }
               if(param1.human && param1.status.hpCur / param1.status.hpMax <= 0.25)
               {
                  Stats_Achievements.checkAchVariable("health",1);
               }
               param1.status.heal(param1.status.hpMax * 0.5);
               break;
            case 1:
               if(param1.human)
               {
                  SH.playSound(S_Heal);
               }
               if(param1.human && param1.status.hpCur / param1.status.hpMax <= 0.25)
               {
                  Stats_Achievements.checkAchVariable("health",1);
               }
               param1.status.heal(param1.status.hpMax);
               break;
            case 2:
               if(param1.human)
               {
                  SH.playSound(S_Equip);
               }
               if(param1.human && param1.status.arCur == 0)
               {
                  Stats_Achievements.checkAchVariable("armor",1);
               }
               param1.status.repair(param1.status.arMax);
               break;
            case 3:
               if(param1.human)
               {
                  SH.playSound(S_Equip);
               }
               if(param1.human && param1.status.arCur == 0)
               {
                  Stats_Achievements.checkAchVariable("armor",1);
               }
               param1.status.repair(param1.status.arMax);
               break;
            case 4:
               if(param1.human)
               {
                  SH.playSound(S_Equip);
               }
               if(param1.human && param1.gun.curGun.spareAmmo / param1.gun.curGun.spareMax <= 0.25)
               {
                  Stats_Achievements.checkAchVariable("ammo",1);
               }
               param1.gun.addAmmo(0.5);
               break;
            case 5:
               if(param1.human)
               {
                  SH.playSound(S_Equip);
               }
               if(param1.human && param1.gun.curGun.spareAmmo / param1.gun.curGun.spareMax <= 0.25)
               {
                  Stats_Achievements.checkAchVariable("ammo",1);
               }
               param1.gun.addAmmo(1);
         }
         this.taken = this.spawnTime * 5;
      }
   }
}
