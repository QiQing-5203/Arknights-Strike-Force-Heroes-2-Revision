package
{
   import flash.display.MovieClip;
   
   public class UnitMC extends MovieClip
   {
       
      
      public var body:MovieClip;
      
      public var legup2:MovieClip;
      
      public var foot1:MovieClip;
      
      public var headhold:MovieClip;
      
      public var foot2:MovieClip;
      
      public var arm1:MovieClip;
      
      public var head:MovieClip;
      
      public var arm2:MovieClip;
      
      public var rope:MovieClip;
      
      public var arm1hold:MovieClip;
      
      public var leglow1:MovieClip;
      
      public var leglow2:MovieClip;
      
      public var legup1:MovieClip;
      
      private var unit:Unit;
      
      private var curAnim:String;
      
      public var curHead:uint;
      
      public var curBody:uint;
      
      public var curCamo:uint;
      
      public function UnitMC(param1:Unit)
      {
         super();
         addFrameScript(19,this.frame20,41,this.frame42,47,this.frame48,53,this.frame54,71,this.frame72,89,this.frame90,107,this.frame108,125,this.frame126,149,this.frame150,173,this.frame174,197,this.frame198,221,this.frame222,239,this.frame240,295,this.frame296,310,this.frame311,321,this.frame322,325,this.frame326,341,this.frame342,374,this.frame375,407,this.frame408,411,this.frame412,416,this.frame417,428,this.frame429,469,this.frame470);
         this.unit = param1;
         this.curHead = 1;
         this.curBody = 1;
         this.curCamo = 1;
      }
      
      public function EnterFrame() : void
      {
         this.head.x = this.headhold.x;
         this.head.y = this.headhold.y;
         this.arm1.x = this.arm1hold.x;
         this.arm1.y = this.arm1hold.y;
         this.arm2.x = this.arm1hold.x;
         this.arm2.y = this.arm1hold.y;
      }
      
      public function allowRotation() : void
      {
         this.unit.canRotate = true;
      }
      
      public function prepareSpawn(param1:Boolean) : void
      {
         this.headhold.visible = true;
         this.arm1hold.visible = true;
         this.head.visible = false;
         this.arm1.visible = false;
         this.arm2.visible = false;
         if(!param1)
         {
            this.showGuns();
            this.unit.canRotate = true;
         }
         else
         {
            this.unit.status.sSpawn = 1.5 * 30;
            this.goto("spawn",true);
            this.unit.canRotate = false;
         }
      }
      
      public function showGuns() : void
      {
         this.headhold.visible = false;
         this.arm1hold.visible = false;
         this.head.visible = true;
         this.arm1.visible = true;
         this.arm2.visible = true;
      }
      
      public function spawned() : void
      {
         this.unit.status.sSpawn = 0;
      }
      
      public function setWeaponSprite(param1:MovieClip) : void
      {
         param1.gotoAndStop(this.unit.gun.curGun.sprite);
         if(this.unit.gun.curGun == this.unit.gun.primary && !this.unit.gun.noAttachments)
         {
            Stats_Attachments.display(param1,this.unit.unitInfo.primaryAttach);
         }
      }
      
      public function setClip(param1:MovieClip) : void
      {
         param1.visible = false;
         var _loc2_:uint = 0;
         while(_loc2_ < param1.currentLabels.length)
         {
            if(param1.currentLabels[_loc2_].name == this.unit.gun.curGun.sprite)
            {
               param1.visible = true;
               param1.gotoAndStop(this.unit.gun.curGun.sprite);
            }
            _loc2_++;
         }
      }
      
      public function doneShoot() : void
      {
         this.unit.gun.setFrame("idle");
      }
      
      public function doneReload() : void
      {
         this.unit.gun.setFrame("idle");
         this.unit.gun.reloaded();
      }
      
      public function reloadSound() : void
      {
         var _loc1_:* = this.unit.gun.curGun.frameReload;
         switch("pistol" !== _loc1_ ? ("mpistol" === _loc1_ ? 1 : ("magnum2" !== _loc1_ ? ("mpistol2" === _loc1_ ? 3 : ("rifle" !== _loc1_ ? ("smg" !== _loc1_ ? ("top" === _loc1_ ? 6 : ("bottom" !== _loc1_ ? ("shotgun" === _loc1_ ? 8 : ("judgement" !== _loc1_ ? ("sbullpup" === _loc1_ ? 10 : ("heavy" !== _loc1_ ? ("sniper" !== _loc1_ ? ("rocket" === _loc1_ ? 13 : ("launcher" !== _loc1_ ? ("bullpup" !== _loc1_ ? ("magnum" === _loc1_ ? 16 : ("hbullpup" !== _loc1_ ? 18 : 17)) : 15) : 14)) : 12) : 11)) : 9)) : 7)) : 5) : 4)) : 2)) : 0)
         {
            case 0:
               this.unit.game.playScreenSound(S_PistolReload,this.unit.x,this.unit.y,true);
               break;
            case 1:
            case 3:
               this.unit.game.playScreenSound(S_MpistolBReload,this.unit.x,this.unit.y,true);
               break;
            case 2:
            case 16:
               this.unit.game.playScreenSound(S_MagnumReload,this.unit.x,this.unit.y,true);
               break;
            case 4:
               this.unit.game.playScreenSound(S_RifleReload,this.unit.x,this.unit.y,true);
               break;
            case 5:
            case 6:
            case 7:
               this.unit.game.playScreenSound(S_SMGReload,this.unit.x,this.unit.y,true);
               break;
            case 8:
            case 9:
               this.unit.game.playScreenSound(S_ShotgunReload,this.unit.x,this.unit.y,true);
               break;
            case 10:
               this.unit.game.playScreenSound(S_ShotgunBReload,this.unit.x,this.unit.y,true);
               break;
            case 11:
               this.unit.game.playScreenSound(S_HeavyReload,this.unit.x,this.unit.y,true);
               break;
            case 12:
               this.unit.game.playScreenSound(S_SniperReload,this.unit.x,this.unit.y,true);
               break;
            case 13:
               this.unit.game.playScreenSound(S_LauncherReload,this.unit.x,this.unit.y,true);
               break;
            case 14:
               this.unit.game.playScreenSound(S_LauncherReload,this.unit.x,this.unit.y,true);
               break;
            case 15:
               this.unit.game.playScreenSound(S_BulpupReload,this.unit.x,this.unit.y,true);
               break;
            case 17:
               this.unit.game.playScreenSound(S_BulpupBReload,this.unit.x,this.unit.y,true);
         }
      }
      
      public function checkFastReload() : void
      {
         if(this.unit.unitInfo.skill.id == "reload")
         {
            this.unit.gun.setFrame("reload_fast");
         }
      }
      
      public function setUnitVar(param1:String, param2:*) : void
      {
         this.unit[param1] = param2;
      }
      
      public function setUnitObVar(param1:String, param2:String, param3:*) : void
      {
         this.unit[param1][param2] = param3;
      }
      
      public function getWeaponID() : String
      {
         return this.unit.gun.curGun.sprite;
      }
      
      public function goto(param1:String, param2:Boolean = false) : void
      {
         if(param1 == null)
         {
            param1 = "idle";
         }
         if(!param2)
         {
            if(this.curAnim == "spawn")
            {
               return;
            }
            if(this.curAnim == param1)
            {
               return;
            }
            if(this.curAnim == "climbsmall" || this.curAnim == "climbbig")
            {
               return;
            }
            if(this.curAnim == "landhard")
            {
               return;
            }
            if(this.curAnim == "jump" && param1 == "fall")
            {
               return;
            }
            if(this.curAnim == "tuck" && param1 == "fall")
            {
               return;
            }
            if(this.curAnim == "land" && param1 == "idle")
            {
               return;
            }
            if(this.curAnim == "landrun" + this.unit.unitInfo.runType && param1 == "run" + this.unit.unitInfo.runType)
            {
               return;
            }
            if(this.curAnim == "landrunback" + this.unit.unitInfo.runType && param1 == "runback" + this.unit.unitInfo.runType)
            {
               return;
            }
            if(this.curAnim == "duckloop" && param1 == "duck")
            {
               return;
            }
            if(this.curAnim == "duckrun" && param1 == "duck")
            {
               param1 = "duckloop";
            }
            if(this.curAnim == "duckrunback" && param1 == "duck")
            {
               param1 = "duckloop";
            }
            if(this.curAnim == "slide" && param1 == "duck")
            {
               param1 = "duckloop";
            }
            if(this.curAnim == "duck" && param1 == "idle")
            {
               param1 = "getup";
            }
            if((this.curAnim == "run" + this.unit.unitInfo.runType || this.curAnim == "landrun" + this.unit.unitInfo.runType) && param1 == "duckrun")
            {
               param1 = "slide";
            }
            if(this.curAnim == "runback" + this.unit.unitInfo.runType && param1 == "duckrunback")
            {
               param1 = "duck";
            }
            if(this.curAnim == "duckrun" && param1 == "run" + this.unit.unitInfo.runType)
            {
               param1 = "getup";
            }
            if(this.curAnim == "duckrunback" && param1 == "runback" + this.unit.unitInfo.runType)
            {
               param1 = "getup";
            }
            if(this.curAnim == "slide")
            {
               return;
            }
            if(this.curAnim == "duck" && param1 == "duckrun")
            {
               return;
            }
            if(this.curAnim == "duck" && param1 == "duckrunback")
            {
               return;
            }
            if(this.curAnim == "getup" && param1 == "run" + this.unit.unitInfo.runType)
            {
               return;
            }
            if(this.curAnim == "getup" && param1 == "runback" + this.unit.unitInfo.runType)
            {
               return;
            }
            if(this.curAnim == "duckloop" && param1 == "idle")
            {
               param1 = "getup";
            }
            if(this.curAnim == "getup" && param1 == "idle")
            {
               return;
            }
         }
         this.curAnim = param1;
         gotoAndPlay(this.curAnim);
      }
      
      public function setSkin() : void
      {
         this.setPart(this.headhold,this.curHead);
         this.setPart(this.arm1hold.armup1,this.curBody);
         this.setPart(this.arm1hold.armlow1,this.curBody);
         this.setPart(this.arm1hold.hand1,this.curBody);
         this.setPart(this.arm1hold.hand2,this.curBody);
         this.setPart(this.head,this.curHead);
         this.setPart(this.body,this.curBody);
         this.setPart(this.arm2.armup2,this.curBody);
         this.setPart(this.arm2.armlow2,this.curBody);
         this.setPart(this.arm2.hand2,this.curBody);
         this.setPart(this.arm1.armup1,this.curBody);
         this.setPart(this.arm1.armlow1,this.curBody);
         this.setPart(this.arm1.hand1,this.curBody);
         this.setPart(this.legup1,this.curBody);
         this.setPart(this.legup2,this.curBody);
         this.setPart(this.leglow1,this.curBody);
         this.setPart(this.leglow2,this.curBody);
         this.setPart(this.foot1,this.curBody);
         this.setPart(this.foot2,this.curBody);
      }
      
      public function setPart(param1:MovieClip, param2:uint) : void
      {
         param1.gotoAndStop(param2);
         if(param1.camo)
         {
            param1.camo.gotoAndStop(this.curCamo);
         }
      }
      
      function frame20() : *
      {
         this.goto("idle",true);
      }
      
      function frame42() : *
      {
         this.allowRotation();
      }
      
      function frame48() : *
      {
         this.showGuns();
      }
      
      function frame54() : *
      {
         this.spawned();
         this.goto("idle",true);
      }
      
      function frame72() : *
      {
         this.goto("run1",true);
      }
      
      function frame90() : *
      {
         this.goto("run1",true);
      }
      
      function frame108() : *
      {
         this.goto("runback1",true);
      }
      
      function frame126() : *
      {
         this.goto("runback1",true);
      }
      
      function frame150() : *
      {
         this.goto("run2",true);
      }
      
      function frame174() : *
      {
         this.goto("run2",true);
      }
      
      function frame198() : *
      {
         this.goto("runback2",true);
      }
      
      function frame222() : *
      {
         this.goto("runback2",true);
      }
      
      function frame240() : *
      {
         this.goto("fall");
      }
      
      function frame296() : *
      {
         gotoAndPlay("fallloop");
      }
      
      function frame311() : *
      {
         this.goto("idle",true);
      }
      
      function frame322() : *
      {
         this.goto("duckloop",true);
      }
      
      function frame326() : *
      {
         this.goto("duckloop");
      }
      
      function frame342() : *
      {
         this.goto("duckloop",true);
      }
      
      function frame375() : *
      {
         this.goto("duckrun",true);
      }
      
      function frame408() : *
      {
         this.goto("duckrunback",true);
      }
      
      function frame412() : *
      {
         this.goto("idle",true);
      }
      
      function frame417() : *
      {
         this.setUnitObVar("mov","climb",0);
         this.goto("idle",true);
      }
      
      function frame429() : *
      {
         this.setUnitObVar("mov","climb",0);
         this.goto("idle",true);
      }
      
      function frame470() : *
      {
         this.setUnitObVar("mov","landHard",false);
         this.goto("idle",true);
      }
   }
}
