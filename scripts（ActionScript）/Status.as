package
{
   import flash.filters.GlowFilter;
   
   public class Status
   {
       
      
      private var unit:Unit;
      
      public var hpCur:Number;
      
      public var hpMax:Number;
      
      public var arCur:Number;
      
      public var arMax:Number;
      
      private var hpBarDist:Number;
      
      private var healthBar:Range;
      
      private var hurtBar:Range;
      
      private var armorBar:Range;
      
      private var regenDelay:uint;
      
      public var stealthDelay:uint;
      
      public var sFireUnit:Unit;
      
      public var sAcidUnit:Unit;
      
      public var sSpawn:uint = 0;
      
      public var sFire:Number = 0;
      
      public var sIce:Number = 0;
      
      public var sZap:Number = 0;
      
      public var sAcid:Number = 0;
      
      public var sCrap:Number = 0;
      
      public var sScan:Number = 0;
      
      public var sAdren:Number = 0;
      
      public var sFocus:Number = 0;
      
      public var sReflect:Number = 0;
      
      public var sInvis:Number = 0;
      
      public var sSurge:Number = 0;
      
      public var sRegenBoost:Number = 0;
      
      public var sCritBoost:Number = 0;
      
      public var sAimBoost:Number = 0;
      
      public var sMoralBoost:Number = 0;
      
      public var kFire:Number = 0;
      
      public var kIce:Number = 0;
      
      public var kZap:Number = 0;
      
      public var kAcid:Number = 0;
      
      public var sWallhack:Number = 0;
      
      public var sAimbot:Number = 0;
      
      public var sStealth:Number = 0;
      
      public var sBloodthirst:Number = 0;
      
      public var sRage:Number = 0;
      
      public var sWizard:Number = 0;
      
      public var overkill:Number = 0;
      
      public var usedTrap:Boolean;
      
      private var fc:uint = 0;
      
      public var healthColor:uint;
      
      public function Status(param1:Unit)
      {
         super();
         this.unit = param1;
         this.stealthDelay = 60;
      }
      
      public function reset() : void
      {
         this.hpMax = this.unit.unitInfo.hp;
         if(this.unit.unitInfo.extra.hpMod)
         {
            this.hpMax *= this.unit.unitInfo.extra.hpMod;
         }
         this.hpCur = this.hpMax;
         this.arMax = this.unit.unitInfo.armor.armor;
         if(this.unit.unitInfo.skill.id == "armor")
         {
            this.arMax *= this.unit.unitInfo.skill.value;
         }
         this.arCur = this.arMax;
         this.sFire = 0;
         this.sIce = 0;
         this.sZap = 0;
         this.sAcid = 0;
         this.sCrap = 0;
         this.sAdren = 0;
         this.sFocus = 0;
         this.sReflect = 0;
         this.sInvis = 0;
         this.sSurge = 0;
         this.sRegenBoost = 0;
         this.sCritBoost = 0;
         this.sAimBoost = 0;
         this.sMoralBoost = 0;
         this.kFire = 0;
         this.kIce = 0;
         this.kZap = 0;
         this.kAcid = 0;
         this.sWallhack = 0;
         this.sAimbot = 0;
         this.sStealth = 0;
         this.sBloodthirst = 0;
         this.sRage = 0;
         this.sWizard = 0;
         this.overkill = 0;
         this.usedTrap = false;
         this.healthBar = new Range(0,30 + this.hpMax * 0.07);
         this.healthBar.cur = this.healthBar.max;
         this.armorBar = new Range(0,this.arMax * 0.1);
         this.armorBar.cur = this.armorBar.max;
         this.hurtBar = new Range(0,0,0);
         this.hpBarDist = this.hpMax / 25;
         this.hpBarDist = this.healthBar.max / this.hpBarDist;
         this.heal(this.hpMax,false,true);
         if(this.unit.human)
         {
            this.unit.game.hud.bloodyscreen.alpha = 0;
            this.unit.game.hud.bloodyscreen.scaleX = UT.coinFlip(1,-1);
            this.unit.game.hud.bloodyscreen.scaleY = UT.coinFlip(1,-1);
            this.unit.game.hud.bloodyscreen.gotoAndStop(!SD.screenBlood ? 2 : 1);
         }
      }
      
      public function heal(param1:Number, param2:Boolean = true, param3:Boolean = false) : void
      {
         if(Boolean(this.unit.dead) && !param3)
         {
            return;
         }
         this.hpCur += param1;
         if(this.hpCur > this.hpMax)
         {
            this.hpCur = this.hpMax;
         }
         if(param2)
         {
            this.unit.game.createEffect(this.unit.x,this.unit.y - 40,"healthPickup");
         }
         this.setBars();
      }
      
      public function repair(param1:Number, param2:Boolean = true, param3:Boolean = false) : void
      {
         if(!(Boolean(this.unit.dead) && !param3))
         {
            this.arCur += param1;
            if(this.arCur > this.arMax)
            {
               this.arCur = this.arMax;
            }
            if(param2)
            {
               this.unit.game.createEffect(this.unit.x,this.unit.y - 40,"armorPickup");
            }
            this.setBars();
            return;
         }
      }
      
      public function setFire(param1:Unit, param2:uint) : void
      {
         this.sFireUnit = param1;
         if(param2 >= this.sFire)
         {
            this.sFire = param2;
            return;
         }
      }
      
      public function setAcid(param1:Unit, param2:uint) : void
      {
         this.sAcidUnit = param1;
         if(param2 >= this.sAcid)
         {
            this.sAcid = param2;
            return;
         }
      }
      
      public function damage(param1:Number, param2:Unit, param3:Stats_Guns, param4:Object, param5:Boolean = false) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(!this.unit.dead)
         {
            if(!(Boolean(this.sSpawn) && !param5))
            {
               if(this.sScan)
               {
                  param1 *= 1.3;
               }
               if(param2.status.sSurge)
               {
                  param1 *= 1.25;
               }
               if(this.kFire)
               {
                  param1 *= 0.8;
               }
               if(this.kZap)
               {
                  param1 *= 0.65;
               }
               if(this.kIce)
               {
                  param1 *= 0.65;
               }
               if(this.kAcid)
               {
                  param1 *= 0.8;
               }
               if(this.unit.unitInfo.skill.id == "adren")
               {
                  if(this.sAdren == 0)
                  {
                     this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(50,55),"text",0,null,"bigText","adren");
                  }
                  this.sAdren = 15;
               }
               if(param2.unitInfo.skill.id == "sacrifice")
               {
                  param1 *= param2.unitInfo.skill.value;
               }
               if(param2.unitInfo.skill.id == "killsteal" && this.unit.target != param2 && !this.unit.human)
               {
                  this.unit.game.createParticle(param2.x + UT.rand(-5,5),param2.y - UT.rand(50,55),"text",0,null,"bigText","killsteal");
                  param1 *= param2.unitInfo.skill.value;
               }
               if(param2.unitInfo.skill.id == "focus" && param2.status.sFocus > 1 * 30)
               {
                  param1 *= param2.unitInfo.skill.value;
               }
               if(this.unit != param2)
               {
                  if(!this.unit.human)
                  {
                     if(MatchSettings.isCampaign && !this.unit.human && !param2.human)
                     {
                        param1 *= 0.4 + param2.diff * 0.03;
                     }
                     else if(!this.unit.human && !param2.human)
                     {
                        param1 *= 0.6 + param2.diff * 0.04;
                     }
                  }
                  else
                  {
                     param1 *= 0.3 + param2.diff * 0.07;
                  }
               }
               else
               {
                  param1 *= param3.selfDmg;
                  if(this.unit.unitInfo.extra.selfDmg is Number)
                  {
                     param1 *= this.unit.unitInfo.extra.selfDmg;
                  }
               }
               if(this.unit.isJug)
               {
                  param1 *= 0.7;
               }
               if(this.sRage)
               {
                  param1 *= 0.1;
               }
               if(param2.status.sRage)
               {
                  param1 *= 1.5;
               }
               if(this.unit.team && this.unit.team == param2.team && this.unit != param2)
               {
                  param1 *= 0.3;
                  param4.teamkill = true;
               }
               if(Math.random() <= param3.fire)
               {
                  this.setFire(param2,2 * 30);
               }
               if(Math.random() <= param3.acid)
               {
                  this.setAcid(param2,10 * 30);
               }
               if(Math.random() <= param3.ice)
               {
                  this.sIce = 2 * 30;
               }
               if(Math.random() <= param3.zap)
               {
                  this.sZap = 2 * 30;
               }
               if(Math.random() <= param3.crap)
               {
                  this.sCrap = 3 * 30;
               }
               if(param2.status.sIce)
               {
                  param1 *= 0.8;
               }
               param1 *= this.unit.gun.curGun.reduce;
               if(Boolean(this.sAimbot) && Math.random() < 0.75)
               {
                  param4.headMult = 1;
               }
               var _loc6_:Number = param2.unitInfo.crit + param3.crit;
               if(!param2.status.sMoralBoost)
               {
                  if(param2.status.sCritBoost)
                  {
                     _loc6_ += 0.5;
                  }
               }
               else
               {
                  _loc6_ += 0.25;
               }
               if(!(param4.headMult && !param3.noHead && this.unit != param2))
               {
                  if(Math.random() <= _loc6_ && !param3.noCrit && this.unit != param2)
                  {
                     param4.critMult = true;
                     _loc9_ = param2.unitInfo.critDmg + param3.critDmg;
                     param1 *= _loc9_;
                     this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(25,50),"text",0,null,"bigText","critical");
                  }
               }
               else
               {
                  _loc8_ = param2.unitInfo.headDmg + param3.headDmg;
                  param1 *= _loc8_;
                  this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(50,55),"text",0,null,"bigText","headshot");
               }
               if(param4.splashMult)
               {
                  param1 *= param4.splashMult;
               }
               if(param2.gun.curGun.isExplosive)
               {
                  param1 *= this.unit.unitInfo.explosiveRes;
               }
               if(param2.gun.curGun.isMelee)
               {
                  param1 *= param2.unitInfo.armor.meleeMod;
               }
               if(param2.status.sBloodthirst)
               {
                  param2.status.heal(param1);
               }
               if(param2.unitInfo.skill.id == "pierce")
               {
                  this.hpCur -= param1 * param2.unitInfo.skill.value;
                  param1 *= 1 - param2.unitInfo.skill.value;
               }
               if(param2.unitInfo.skill.id == "overkill")
               {
                  param1 += param2.status.overkill;
                  this.overkill = 0;
               }
               if(this.unit.human && this.unit.unitInfo.classNum == 5)
               {
                  Stats_Achievements.checkAchVariable("jugg",param1);
               }
               var _loc7_:Boolean = false;
               if(Boolean(this.arCur) && !param5)
               {
                  _loc7_ = true;
                  param1 *= param2.unitInfo.armorDmg + param3.armorDmg;
                  this.arCur -= param1;
                  if(this.arCur > 0)
                  {
                     param1 = 0;
                  }
                  else
                  {
                     param1 = -this.arCur;
                     this.arCur = 0;
                     if(this.unit.unitInfo.skill.id == "boobytrap" && !this.usedTrap)
                     {
                        this.usedTrap = true;
                        this.unit.gun.makeBullet(Stats_Guns.createBasicItem("boobytrap",this.unit.unitInfo.level));
                        this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(25,55),"text",0,null,"bigText","surprise");
                        this.unit.game.playScreenSound(S_rocketExplode,this.unit.x,this.unit.y);
                     }
                  }
               }
               if(!_loc7_)
               {
                  param1 *= param2.unitInfo.fleshDmg + param3.fleshDmg;
               }
               this.hpCur -= param1;
               if(this.hpCur <= 0)
               {
                  if(param2.unitInfo.skill.id == "overkill" && -this.hpCur > this.hpMax * 0.1)
                  {
                     this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(50,55),"text",0,null,"bigText","overkill");
                     param2.status.overkill = -this.hpCur;
                  }
                  this.hpCur = 0;
                  this.unit.die(param2,param3,param4);
                  if(this.unit.human)
                  {
                     this.unit.game.hud.bloodyscreen.alpha = 1;
                  }
               }
               this.setStealthDelay();
               this.regenDelay = 30 * 3;
               this.setBars();
               return;
            }
            return;
         }
      }
      
      public function setBars() : void
      {
         this.healthBar.old = this.healthBar.cur;
         this.healthBar.cur = this.hpCur / this.hpMax * this.healthBar.max;
         this.armorBar.old = this.armorBar.cur;
         this.armorBar.cur = this.arCur / this.arMax * this.armorBar.max;
         if(!(this.healthBar.old - this.healthBar.cur <= 0 && this.armorBar.old - this.armorBar.cur <= 0))
         {
            this.hurtBar.cur += this.healthBar.old - this.healthBar.cur + (this.armorBar.old - this.armorBar.cur);
         }
         else
         {
            this.hurtBar.cur = 0;
         }
         this.drawHpBars();
         if(this.unit.human)
         {
            this.unit.game.hud.txt_ar.text = "" + Math.ceil(this.arCur);
         }
         if(this.unit.human)
         {
            this.unit.game.hud.txt_hp.text = "" + Math.ceil(this.hpCur);
         }
      }
      
      public function drawHpBars() : void
      {
         var _loc3_:Number = NaN;
         this.hurtBar.cur += (0 - this.hurtBar.cur) * 0.1;
         this.unit.mc_hp.graphics.clear();
         this.unit.mc_hp.graphics.beginFill(this.healthColor,1);
         this.unit.mc_hp.graphics.drawRect(this.healthBar.min,0,this.healthBar.cur,3);
         this.unit.mc_hp.graphics.endFill();
         this.unit.mc_hp.graphics.beginFill(16777215,1);
         this.unit.mc_hp.graphics.drawRect(this.healthBar.cur,0,this.armorBar.cur,3);
         this.unit.mc_hp.graphics.endFill();
         this.unit.mc_hp.graphics.beginFill(16711680,0.5);
         this.unit.mc_hp.graphics.drawRect(this.healthBar.cur + this.armorBar.cur,0,this.hurtBar.cur,3);
         this.unit.mc_hp.graphics.endFill();
         var _loc1_:* = true;
         var _loc2_:uint = this.hpBarDist;
         while(_loc2_ < this.healthBar.cur)
         {
            if(_loc1_)
            {
               _loc3_ = this.hpBarDist;
               if(_loc2_ + this.hpBarDist > this.healthBar.cur)
               {
                  _loc3_ = this.healthBar.cur - _loc2_;
               }
               this.unit.mc_hp.graphics.beginFill(0,0.2);
               this.unit.mc_hp.graphics.drawRect(_loc2_,0,_loc3_,3);
               this.unit.mc_hp.graphics.endFill();
            }
            _loc1_ = !_loc1_;
            _loc2_ += this.hpBarDist;
         }
      }
      
      public function setStealthDelay(param1:Boolean = false) : void
      {
         this.stealthDelay = 10;
         if(this.unit.unitInfo.skill.id == "invis" && !param1)
         {
            this.stealthDelay = 0;
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Number = NaN;
         ++this.fc;
         if(this.unit.unitInfo.extra.permaSurge)
         {
            this.sSurge = 99;
         }
         if(this.sBloodthirst)
         {
            --this.sBloodthirst;
         }
         if(this.sAdren)
         {
            --this.sAdren;
         }
         if(this.sReflect)
         {
            --this.sReflect;
         }
         if(this.unit.unitInfo.skill.id == "resistance")
         {
            this.sIce = this.sFire = this.sZap = this.sAcid = 0;
         }
         ++this.sFocus;
         if(this.unit.unitInfo.skill.id == "focus" && this.sFocus == 1 * 30)
         {
            this.unit.game.createParticle(this.unit.x + UT.rand(-5,5),this.unit.y - UT.rand(50,55),"text",0,null,"bigText","focus");
         }
         if(this.sWizard)
         {
            if(this.sWizard > 10 || this.sWizard % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"lightningPurple0","idle",this.fc % 6 + 1);
            }
            --this.sWizard;
         }
         if(this.sWallhack)
         {
            if(this.sWallhack > 10 || this.sWallhack % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"lightningGreen0","idle",this.fc % 6 + 1);
            }
            --this.sWallhack;
         }
         if(this.sAimbot)
         {
            if(this.sAimbot > 10 || this.sAimbot % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"lightningYellow0","idle",this.fc % 6 + 1);
            }
            --this.sAimbot;
         }
         if(this.sSurge)
         {
            if(this.sSurge > 10 || this.sSurge % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"lightningRed0","idle",this.fc % 6 + 1);
            }
            --this.sSurge;
         }
         if(this.sScan)
         {
            this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"scan0");
            --this.sScan;
         }
         if(this.sRage)
         {
            if(this.sRage > 10 || this.sRage % 2 != 0)
            {
               if(SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(16711680,1,20,20,1.5,1,true,false),new GlowFilter(16711680,1,5,5,1));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(16711680,1,10,10,1.5));
               }
            }
            --this.sRage;
         }
         if(this.kFire)
         {
            if(this.kFire > 10 || this.kFire % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"tankFire0","idle",this.fc % 2 + 1);
            }
            if(this.fc % 20)
            {
               _loc1_ = 0;
               while(_loc1_ < this.unit.game.units.length)
               {
                  if(this.unit.game.units[_loc1_] != this.unit)
                  {
                     if(!this.unit.game.units[_loc1_].dead)
                     {
                        if(!this.unit.game.units[_loc1_].status.sSpawn)
                        {
                           if(!(Boolean(this.unit.team) && this.unit.game.units[_loc1_].team == this.unit.team))
                           {
                              if(UT.getDist(this.unit.x,this.unit.y,this.unit.game.units[_loc1_].x,this.unit.game.units[_loc1_].y) < 125)
                              {
                                 this.unit.game.units[_loc1_].status.setFire(this.unit,30);
                              }
                           }
                        }
                     }
                  }
                  _loc1_++;
               }
            }
            --this.kFire;
         }
         if(this.kIce)
         {
            if(this.kIce > 10 || this.kIce % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"tankIce0","idle",this.fc % 2 + 1);
            }
            if(this.fc % 20)
            {
               _loc1_ = 0;
               while(_loc1_ < this.unit.game.units.length)
               {
                  if(this.unit.game.units[_loc1_] != this.unit)
                  {
                     if(!this.unit.game.units[_loc1_].dead)
                     {
                        if(!this.unit.game.units[_loc1_].status.sSpawn)
                        {
                           if(!(Boolean(this.unit.team) && this.unit.game.units[_loc1_].team == this.unit.team))
                           {
                              if(UT.getDist(this.unit.x,this.unit.y,this.unit.game.units[_loc1_].x,this.unit.game.units[_loc1_].y) < 150)
                              {
                                 this.unit.game.units[_loc1_].status.sIce = 30;
                              }
                           }
                        }
                     }
                  }
                  _loc1_++;
               }
            }
            --this.kIce;
         }
         if(this.kZap)
         {
            if(this.kZap > 10 || this.kZap % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"tankZap0","idle",this.fc % 2 + 1);
            }
            if(this.fc % 20)
            {
               _loc1_ = 0;
               while(_loc1_ < this.unit.game.units.length)
               {
                  if(this.unit.game.units[_loc1_] != this.unit)
                  {
                     if(!this.unit.game.units[_loc1_].dead)
                     {
                        if(!this.unit.game.units[_loc1_].status.sSpawn)
                        {
                           if(!(Boolean(this.unit.team) && this.unit.game.units[_loc1_].team == this.unit.team))
                           {
                              if(UT.getDist(this.unit.x,this.unit.y,this.unit.game.units[_loc1_].x,this.unit.game.units[_loc1_].y) < 150)
                              {
                                 this.unit.game.units[_loc1_].status.sZap = 30;
                              }
                           }
                        }
                     }
                  }
                  _loc1_++;
               }
            }
            --this.kZap;
         }
         if(this.kAcid)
         {
            if(this.kAcid > 10 || this.kAcid % 2 != 0)
            {
               this.unit.game.bitscreen.paint(this.unit.x + this.unit.game.arena.x,this.unit.y + this.unit.game.arena.y - 30,true,"tankAcid0","idle",this.fc % 2 + 1);
            }
            if(this.fc % 20)
            {
               _loc1_ = 0;
               while(_loc1_ < this.unit.game.units.length)
               {
                  if(this.unit.game.units[_loc1_] != this.unit)
                  {
                     if(!this.unit.game.units[_loc1_].dead)
                     {
                        if(!this.unit.game.units[_loc1_].status.sSpawn)
                        {
                           if(!(Boolean(this.unit.team) && this.unit.game.units[_loc1_].team == this.unit.team))
                           {
                              if(UT.getDist(this.unit.x,this.unit.y,this.unit.game.units[_loc1_].x,this.unit.game.units[_loc1_].y) < 125)
                              {
                                 this.unit.game.units[_loc1_].status.setAcid(this.unit,30 * 10);
                              }
                           }
                        }
                     }
                  }
                  _loc1_++;
               }
            }
            --this.kAcid;
         }
         if(this.sFire)
         {
            if(this.sFire > 10 || this.sFire % 2 != 0)
            {
               if(!SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(16758272,1,10,10,1.5));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(16758272,1,20,20,1.5,1,true,false),new GlowFilter(16758272,1,5,5,1));
               }
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-55,-10),"flame");
            }
            if(this.fc % 10 == 0)
            {
               this.damage(Stats_Guns.getDamageAtLevel("fire",this.sFireUnit.unitInfo.level),this.sFireUnit,Stats_Guns.itemOb["fire"],{});
            }
            --this.sFire;
         }
         if(this.sAcid)
         {
            if(this.sAcid > 10 || this.sAcid % 2 != 0)
            {
               if(SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(11324416,1,20,20,1.5,1,true,false),new GlowFilter(11324416,1,5,5,1));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(11324416,1,10,10,1.5));
               }
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-55,-10),"bubble");
            }
            if(this.fc % 10 == 0)
            {
               this.damage(Stats_Guns.getDamageAtLevel("acid",this.sAcidUnit.unitInfo.level),this.sAcidUnit,Stats_Guns.itemOb["acid"],{});
            }
            --this.sAcid;
         }
         if(this.sIce)
         {
            if(this.sIce > 10 || this.sIce % 2 != 0)
            {
               if(SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(13434879,1,20,20,1.5,1,true,false),new GlowFilter(13434879,1,5,5,1));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(13434879,1,10,10,1.5));
               }
            }
            --this.sIce;
         }
         if(this.sZap)
         {
            if(this.sZap > 10 || this.sZap % 2 != 0)
            {
               if(SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(6711039,1,20,20,1.5,1,true,false),new GlowFilter(6711039,1,5,5,1));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(6711039,1,10,10,1.5));
               }
            }
            --this.sZap;
         }
         if(this.sCrap)
         {
            if(this.sCrap > 10 || this.sCrap % 2 != 0)
            {
               if(SD.graphGlow)
               {
                  this.unit.MCfilters.push(new GlowFilter(10053120,1,20,20,1.5,1,true,false),new GlowFilter(10053120,1,5,5,1));
               }
               else
               {
                  this.unit.MCfilters.push(new GlowFilter(10053120,1,10,10,1.5));
               }
            }
            --this.sCrap;
         }
         if(this.unit.isJug)
         {
            this.unit.MCfilters.push(new GlowFilter(16711680,1,8,8,2));
         }
         this.drawHpBars();
         if(!this.sInvis)
         {
            this.unit.alpha = 1;
            this.unit.MC.alpha = 1;
         }
         else if(!(this.unit.human || this.unit.team == 1))
         {
            this.unit.alpha = 1 - this.sInvis;
         }
         else
         {
            this.unit.MC.alpha = 1 - this.sInvis * 0.8;
         }
         if(!this.sStealth)
         {
            if(this.sInvis > 0)
            {
               this.sInvis -= 0.1;
               if(this.sInvis < 0)
               {
                  this.sInvis = 0;
               }
            }
         }
         else
         {
            if(this.unit.hasFlag)
            {
               this.stealthDelay = 60;
            }
            if(!this.stealthDelay)
            {
               this.sInvis += 0.1;
               if(this.sInvis > 1)
               {
                  this.sInvis = 1;
               }
            }
            else
            {
               --this.stealthDelay;
               this.sInvis -= 0.1;
               if(this.sInvis < 0)
               {
                  this.sInvis = 0;
               }
            }
            --this.sStealth;
         }
         if(this.sMoralBoost)
         {
            this.heal(this.hpMax * 0.002,false);
            if(this.fc % 3 == 0)
            {
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"moralBoost");
            }
            if(this.sMoralBoost > 10 || this.sMoralBoost % 2 != 0)
            {
               this.unit.MCfilters.push(new GlowFilter(13434879,0.8,10,10,1,1,true));
            }
            --this.sMoralBoost;
         }
         if(Boolean(this.sCritBoost) && !this.sMoralBoost)
         {
            if(this.fc % 3 == 0)
            {
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"critBoost");
            }
            if(this.sCritBoost > 10 || this.sCritBoost % 2 != 0)
            {
               this.unit.MCfilters.push(new GlowFilter(16711680,0.8,10,10,1,1,true));
            }
            --this.sCritBoost;
         }
         if(Boolean(this.sAimBoost) && !this.sMoralBoost)
         {
            if(this.fc % 3 == 0)
            {
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"aimBoost");
            }
            if(this.sAimBoost > 10 || this.sAimBoost % 2 != 0)
            {
               this.unit.MCfilters.push(new GlowFilter(16776960,0.8,10,10,1,1,true));
            }
            --this.sAimBoost;
         }
         if(Boolean(this.sRegenBoost) && !this.sMoralBoost)
         {
            this.heal(this.hpMax * 0.003,false);
            if(this.fc % 3 == 0)
            {
               this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"healthRegen");
            }
            if(this.sRegenBoost > 10 || this.sRegenBoost % 2 != 0)
            {
               this.unit.MCfilters.push(new GlowFilter(65280,0.8,10,10,1,1,true));
            }
            --this.sRegenBoost;
         }
         else if(!this.regenDelay)
         {
            this.heal(this.unit.unitInfo.regen,false);
            this.repair(this.unit.unitInfo.regenArmor,false);
            if(this.hpCur < this.hpMax)
            {
               if(this.unit.unitInfo.skill.id != "regen")
               {
                  if(this.fc % 10 == 0)
                  {
                     this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"healthRegen");
                  }
               }
               else if(this.fc % 3 == 0)
               {
                  this.unit.game.createEffect(this.unit.x + UT.rand(-10,10),this.unit.y + UT.rand(-45,-10),"healthRegen");
               }
            }
         }
         else
         {
            --this.regenDelay;
         }
         if(this.unit.human)
         {
            _loc2_ = this.hpCur / this.hpMax;
            if(_loc2_ <= 0.5)
            {
               this.unit.game.hud.bloodyscreen.alpha = 1 - _loc2_ * 1.8;
            }
            else
            {
               this.unit.game.hud.bloodyscreen.alpha = 0;
            }
         }
      }
   }
}
