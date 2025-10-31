package
{
   import flash.filters.BevelFilter;
   
   public class Guns
   {
       
      
      private var unit:Unit;
      
      public var shootDelay:uint;
      
      public var shotPressed:Boolean;
      
      private var burstCount:uint;
      
      private var burstTimer:uint;
      
      public var reloading:Boolean;
      
      private var dualFire:Boolean;
      
      public var curFrame:String;
      
      public var dynRecoil:Number;
      
      public var dynRecoilMod:Number;
      
      public var primary:Stats_Guns;
      
      public var secondary:Stats_Guns;
      
      public var curGun:Stats_Guns;
      
      public var otherGun:Stats_Guns;
      
      private var hud:Hud;
      
      private var soundFrames:uint = 0;
      
      private var shotTimer:uint = 0;
      
      public var noAttachments:Boolean = false;
      
      public function Guns(param1:Unit)
      {
         super();
         this.unit = param1;
         if(this.unit.human)
         {
            this.hud = this.unit.game.hud;
         }
      }
      
      public function setGuns(param1:Inventory_Gun, param2:Inventory_Gun) : void
      {
         trace("setGUN",param1.id,param2.id);
         this.primary = param1.createFinalItem();
         this.secondary = param2.createFinalItem();
         if(!this.noAttachments)
         {
            if(this.unit.unitInfo.primaryAttach)
            {
               Stats_Attachments.applyAttachStats(this.primary,this.unit.unitInfo.primaryAttach);
            }
         }
         if(this.unit.unitInfo.skill.id == "steady")
         {
            this.primary.recoilSpread = 0;
            this.secondary.recoilSpread = 0;
         }
         if(this.unit.unitInfo.skill.id == "clip" && this.primary.type == 6 && Boolean(this.primary.clipSpare))
         {
            this.primary.clipSize *= this.primary.clipSpare;
            this.primary.clipSpare = 0;
            this.primary.fire += this.unit.unitInfo.skill.value;
         }
         this.setAmmoAmount(this.primary);
         this.setAmmoAmount(this.secondary);
         if(this.secondary.type == 0)
         {
            this.secondary.spareMax = 999999;
            this.secondary.spareAmmo = 999999;
         }
         this.reset();
      }
      
      public function setAmmoAmount(param1:Stats_Guns) : void
      {
         if(param1.clipSize != 0)
         {
            if(param1.clipSpare != 0)
            {
               param1.ammoTotal = Math.ceil(param1.clipSize * (param1.clipSpare + 1) * this.unit.unitInfo.ammo);
               if(param1.ammoTotal > 999)
               {
                  param1.ammoTotal = 999;
               }
               param1.clipAmmo = param1.clipSize;
               param1.spareAmmo = param1.spareMax = param1.ammoTotal - param1.clipSize;
            }
            else
            {
               param1.extra.noClip = true;
               param1.ammoTotal = Math.ceil(param1.clipSize * (param1.clipSpare + 1) * this.unit.unitInfo.ammo);
               if(param1.ammoTotal > 999)
               {
                  param1.ammoTotal = 999;
               }
               param1.clipAmmo = param1.clipSize = param1.ammoTotal;
               param1.spareAmmo = param1.spareMax = 0;
            }
         }
         else
         {
            param1.extra.noAmmo = true;
            param1.clipAmmo = param1.clipSize = param1.ammoTotal = param1.spareAmmo = param1.spareMax = 0;
         }
      }
      
      public function reset() : void
      {
         this.shootDelay = 0;
         this.curGun = null;
         this.swapGuns();
         if(this.unit.unitInfo.extra.forcePistol)
         {
            this.swapGuns();
         }
      }
      
      public function swapGuns() : void
      {
         this.dualFire = false;
         if(!(this.curGun == this.primary && this.secondary.id == "Empty"))
         {
            if(this.unit.hasFlag)
            {
               this.curGun = this.primary;
            }
            if(this.curGun == this.primary)
            {
               this.curGun = this.secondary;
               this.otherGun = this.primary;
               if(this.hud)
               {
                  this.hud.setGuns(this.secondary,this.primary);
               }
            }
            else
            {
               this.curGun = this.primary;
               this.otherGun = this.secondary;
               if(this.hud)
               {
                  this.hud.setGuns(this.primary,this.secondary);
               }
            }
            this.dynRecoil = this.curGun.recoil;
            this.unit.MC.body.gunside.visible = false;
            this.unit.MC.body.gunback.visible = false;
            this.unit.MC.arm1.gun.gotoAndStop(this.curGun.sprite);
            this.unit.MC.body["gun" + this.otherGun.unequip].visible = true;
            this.unit.MC.body["gun" + this.otherGun.unequip].gotoAndStop(this.otherGun.sprite);
            Stats_Attachments.display(this.unit.MC.arm1.gun);
            if(this.curGun == this.primary)
            {
               if(!this.curGun.defaultTop)
               {
                  if(!this.noAttachments)
                  {
                     Stats_Attachments.display(this.unit.MC.arm1.gun,this.unit.unitInfo.primaryAttach);
                  }
               }
               else
               {
                  Stats_Attachments.display(this.unit.MC.arm1.gun,Stats_Attachments.createBasicItem(this.curGun.defaultTop));
               }
            }
            if(this.otherGun == this.primary)
            {
               if(!this.otherGun.defaultTop)
               {
                  if(!this.noAttachments)
                  {
                     Stats_Attachments.display(this.unit.MC.body["gun" + this.otherGun.unequip],this.unit.unitInfo.primaryAttach);
                  }
               }
               else
               {
                  Stats_Attachments.display(this.unit.MC.body["gun" + this.otherGun.unequip],Stats_Attachments.createBasicItem(this.otherGun.defaultTop));
               }
            }
            this.setFrame("idle");
            if(this.unit.mDown)
            {
               this.shotPressed = true;
            }
            if(this.hud)
            {
               this.unit.game.arena.setFocus(this.unit,true,this.curGun.vision);
               this.hud.setAmmoCount(this.curGun);
            }
            if(this.unit.hasFlag)
            {
               this.unit.MC.body.gunback.visible = true;
               this.unit.MC.body.gunback.gotoAndStop("flag" + this.unit.hasFlag.team);
            }
            this.burstCount = 0;
            this.burstTimer = 0;
            this.reloading = false;
            this.checkReload();
            return;
         }
      }
      
      public function addAmmo(param1:Number, param2:Boolean = true) : void
      {
         if(!this.primary.extra.noClip)
         {
            this.primary.spareAmmo += Math.ceil(this.primary.spareMax * param1);
            if(this.primary.spareAmmo > this.primary.spareMax)
            {
               this.primary.spareAmmo = this.primary.spareMax;
            }
         }
         else
         {
            this.primary.clipAmmo += Math.ceil(this.primary.clipSize * param1);
            if(this.primary.clipAmmo > this.primary.clipSize)
            {
               this.primary.clipAmmo = this.primary.clipSize;
            }
         }
         if(!this.secondary.extra.noClip)
         {
            this.secondary.spareAmmo += Math.ceil(this.secondary.spareMax * param1);
            if(this.secondary.spareAmmo > this.secondary.spareMax)
            {
               this.secondary.spareAmmo = this.secondary.spareMax;
            }
         }
         else
         {
            this.secondary.clipAmmo += Math.ceil(this.secondary.clipSize * param1);
            if(this.secondary.clipAmmo > this.secondary.clipSize)
            {
               this.secondary.clipAmmo = this.secondary.clipSize;
            }
         }
         if(this.hud)
         {
            this.hud.setAmmoCount(this.curGun);
         }
         if(param2)
         {
            this.unit.game.createEffect(this.unit.x,this.unit.y - 40,"ammoPickup");
         }
         this.checkReload();
      }
      
      public function EnterFrame() : void
      {
         if(this.shootDelay)
         {
            --this.shootDelay;
         }
         if(this.unit.unitInfo.skill.id == "auto")
         {
            this.shotPressed = false;
         }
         if(this.burstTimer)
         {
            --this.burstTimer;
            if(this.burstTimer == 0 && Boolean(this.burstCount))
            {
               this.burstTimer = 3;
               --this.burstCount;
               this.shoot(true);
            }
         }
         if(this.dynRecoil > this.curGun.recoil)
         {
            this.dynRecoil -= 0.05;
         }
         if(this.unit.unitInfo.skill.id != "steady")
         {
            if(!this.unit.mov.crouching)
            {
               if(!this.unit.mov.jumping)
               {
                  if(!this.unit.mov.xVel)
                  {
                     this.dynRecoilMod = this.dynRecoil;
                  }
                  else
                  {
                     this.dynRecoilMod = this.dynRecoil * 1.1;
                  }
               }
               else
               {
                  this.dynRecoilMod = this.dynRecoil * 1.2;
               }
            }
            else
            {
               this.dynRecoilMod = this.dynRecoil * 0.6;
            }
         }
         else if(!this.unit.mov.crouching)
         {
            this.dynRecoilMod = this.dynRecoil;
         }
         else
         {
            this.dynRecoilMod = this.dynRecoil * 0.6;
         }
         this.dynRecoilMod *= 2 - this.unit.unitInfo.aim;
         if(!this.unit.status.sMoralBoost)
         {
            if(this.unit.status.sAimBoost)
            {
               this.dynRecoilMod *= 0.5;
            }
         }
         else
         {
            this.dynRecoilMod *= 0.75;
         }
         if(this.soundFrames)
         {
            --this.soundFrames;
         }
      }
      
      public function resetFrame() : void
      {
         this.unit.MC.arm1.gotoAndStop(this.curGun.frameIdle);
         this.unit.MC.arm2.gotoAndStop(this.curGun.frameIdle);
      }
      
      public function setFrame(param1:String) : void
      {
         this.curFrame = param1;
         var _loc2_:* = "";
         var _loc3_:* = param1;
         switch("idle" !== _loc3_ ? ("fire" === _loc3_ ? 1 : ("reload" !== _loc3_ ? ("reload_fast" === _loc3_ ? 3 : 4) : 2)) : 0)
         {
            case 0:
               _loc2_ = this.curGun.frameIdle;
               break;
            case 1:
               _loc2_ = this.curGun.frameFire;
               break;
            case 2:
            case 3:
               _loc2_ = this.curGun.frameReload;
         }
         _loc3_ = param1;
         switch("idle" !== _loc3_ ? ("fire" === _loc3_ ? 1 : ("reload" !== _loc3_ ? ("reload_fast" === _loc3_ ? 3 : 4) : 2)) : 0)
         {
            case 0:
               this.unit.MC.arm1.gotoAndStop(_loc2_);
               this.unit.MC.arm2.gotoAndStop(_loc2_);
               break;
            case 1:
               _loc2_ += "_" + param1;
               if(this.dualFire)
               {
                  _loc2_ += "2";
               }
               this.unit.MC.arm1.gotoAndPlay(_loc2_);
               this.unit.MC.arm2.gotoAndPlay(_loc2_);
               break;
            case 2:
            case 3:
               _loc2_ += "_" + param1;
               this.unit.MC.arm1.gotoAndPlay(_loc2_);
               this.unit.MC.arm2.gotoAndPlay(_loc2_);
         }
      }
      
      public function releaseMouse() : void
      {
         this.shotPressed = false;
      }
      
      public function shoot(param1:Boolean = false) : void
      {
         var _loc2_:uint = 0;
         if(!this.unit.status.sSpawn)
         {
            if((this.shootDelay || this.shotPressed) && !param1 || this.reloading)
            {
               return;
            }
            if(!(!this.curGun.clipAmmo && !this.curGun.extra.noAmmo))
            {
               if(!this.curGun.extra.noShoot)
               {
                  this.unit.status.setStealthDelay(true);
                  this.setFrame("fire");
                  if(this.curGun.fireType == 0 && this.unit.human)
                  {
                     this.shotPressed = true;
                  }
                  if(this.curGun.fireType == 2 && !param1)
                  {
                     if(this.unit.human)
                     {
                        this.shotPressed = true;
                     }
                     this.burstTimer = 3;
                     this.burstCount = this.curGun.burst - 1;
                  }
                  if(this.curGun.fireType == 3)
                  {
                     this.dualFire = !this.dualFire;
                     if(this.unit.human)
                     {
                        this.shotPressed = true;
                     }
                  }
                  if(this.curGun.reflectFrames)
                  {
                     this.unit.status.sReflect = this.curGun.reflectFrames;
                  }
                  this.makeBullet(this.curGun);
                  if(this.curGun.extraShots)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < this.curGun.extraShots)
                     {
                        this.makeBullet(this.curGun);
                        _loc2_++;
                     }
                  }
                  if(this.curGun.shotSound)
                  {
                     if(this.curGun.soundFrames)
                     {
                        if(!this.soundFrames)
                        {
                           this.unit.game.playScreenSound(this.curGun.shotSound,this.unit.x,this.unit.y);
                           this.soundFrames = this.curGun.soundFrames;
                        }
                     }
                     else
                     {
                        this.unit.game.playScreenSound(this.curGun.shotSound,this.unit.x,this.unit.y);
                     }
                  }
                  if(Boolean(this.curGun.effShell) && Boolean(SD.graphPart))
                  {
                     this.unit.game.createParticle(this.unit.x + UT.xMoveToRot(this.unit.aimRoation,28),this.unit.y + this.unit.MC.arm1.y + UT.yMoveToRot(this.unit.aimRoation,28),"shell",0,{
                        "rot":this.unit.aimRoation,
                        "flip":this.unit.MC.scaleX
                     },"shell",this.curGun.effShell);
                  }
                  if(SD.graphPart == 2 || SD.graphPart == 1 && this.unit.human)
                  {
                     this.unit.MCfilters.push(new BevelFilter(7,this.unit.aimRoation + 90,Math.random() >= 0.5 ? 16777113 : 16777164,1,0,0.5,10,10,1,1));
                  }
                  this.shootDelay = this.curGun.shootDelay * 30;
                  if(this.unit.status.sIce)
                  {
                     this.shootDelay *= 1.5;
                  }
                  if(this.unit.status.sAdren)
                  {
                     this.shootDelay *= 0.7;
                  }
                  if(this.unit.unitInfo.skill.id == "auto")
                  {
                     this.shootDelay *= this.unit.unitInfo.skill.value;
                  }
                  if(MatchSettings.useMod != "ammo" && !this.unit.status.sWizard && !this.curGun.extra.noAmmo)
                  {
                     this.curGun.clipAmmo -= this.curGun.consume;
                     if(this.curGun.clipAmmo < 0)
                     {
                        this.curGun.clipAmmo = 0;
                     }
                     if(this.curGun.jam && Math.random() < 0.08)
                     {
                        this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(50,55),"text",0,null,"bigText","jam");
                        this.manualReload(true);
                     }
                  }
                  if(this.hud)
                  {
                     this.hud.setAmmoCount(this.curGun);
                     this.unit.game.arena.setShake(2,2);
                     if(this.dynRecoil < this.curGun.recoil * 1.7)
                     {
                        this.dynRecoil += this.curGun.recoilSpread;
                     }
                  }
                  this.unit.status.sFocus = 0;
                  this.checkReload();
                  return;
               }
               return;
            }
            this.unit.game.playScreenSound(S_GunClick,this.unit.x,this.unit.y);
            return;
         }
      }
      
      public function makeBullet(param1:Stats_Guns) : void
      {
         this.unit.game.bullets.push(new param1.cls(this.unit.game,this.unit,this.unit.aimRoation + UT.rand(-this.dynRecoil,this.dynRecoilMod),this.unit.x + this.unit.MC.rotation * 1.2,this.unit.y + this.unit.MC.arm1.y,int(param1.xOff * this.unit.scale),param1));
      }
      
      public function reloaded() : void
      {
         this.reloading = false;
         this.setFrame("idle");
         var _loc1_:uint = this.curGun.clipSize - this.curGun.clipAmmo;
         if(this.curGun.spareAmmo >= _loc1_)
         {
            this.curGun.clipAmmo = this.curGun.clipSize;
            if(MatchSettings.useMod != "clips")
            {
               this.curGun.spareAmmo -= _loc1_;
            }
         }
         else
         {
            this.curGun.clipAmmo += this.curGun.spareAmmo;
            if(MatchSettings.useMod != "clips")
            {
               this.curGun.spareAmmo = 0;
            }
         }
         if(this.hud)
         {
            this.hud.setAmmoCount(this.curGun);
         }
      }
      
      public function reloadOther() : void
      {
         var _loc1_:uint = this.otherGun.clipSize - this.otherGun.clipAmmo;
         if(this.otherGun.spareAmmo >= _loc1_)
         {
            this.otherGun.clipAmmo = this.otherGun.clipSize;
            if(MatchSettings.useMod != "clips")
            {
               this.otherGun.spareAmmo -= _loc1_;
            }
         }
         else
         {
            this.otherGun.clipAmmo += this.otherGun.spareAmmo;
            if(MatchSettings.useMod != "clips")
            {
               this.otherGun.spareAmmo = 0;
            }
         }
      }
      
      public function manualReload(param1:Boolean = false) : void
      {
         if(this.curGun.clipAmmo == this.curGun.clipSize || !this.curGun.spareAmmo)
         {
            return;
         }
         if(!(this.reloading || this.shootDelay && !param1))
         {
            if(!(Boolean(this.curGun.extra.noShoot) || Boolean(this.curGun.extra.noAmmo)))
            {
               this.checkReload(true);
               return;
            }
            return;
         }
      }
      
      public function checkReload(param1:Boolean = false) : void
      {
         if(!(Boolean(this.curGun.extra.noShoot) || Boolean(this.curGun.extra.noAmmo)))
         {
            if(!this.unit.human && (!this.curGun.clipAmmo && !this.curGun.spareAmmo))
            {
               this.swapGuns();
            }
            if(!(!param1 && (this.curGun.clipAmmo || !this.curGun.spareAmmo)))
            {
               this.setFrame("reload");
               this.reloading = true;
               return;
            }
            return;
         }
      }
   }
}
