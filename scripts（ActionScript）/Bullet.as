package
{
   public class Bullet
   {
       
      
      protected var game:Game;
      
      protected var unit:Unit;
      
      protected var stats:Stats_Guns;
      
      public var remove:Boolean;
      
      protected var rotation:Number;
      
      protected var x:Number;
      
      protected var y:Number;
      
      protected var ox:Number;
      
      protected var oy:Number;
      
      protected var xVel:Number;
      
      protected var yVel:Number;
      
      private var isProjectile:Boolean;
      
      protected var hitType:String;
      
      protected var hitObject;
      
      protected var curDist:Number;
      
      protected var maxDist:Number;
      
      protected var dmgMod:Number;
      
      protected var extra:Object;
      
      public function Bullet(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:uint, param7:Stats_Guns, param8:Boolean, param9:Object = null)
      {
         var _loc10_:uint = 0;
         super();
         this.game = param1;
         this.unit = param2;
         if(!param9)
         {
            this.extra = {};
         }
         else
         {
            this.extra = param9;
         }
         this.dmgMod = !this.extra.dmgMod ? 1 : Number(this.extra.dmgMod);
         this.stats = param7;
         this.isProjectile = param8;
         this.curDist = 0;
         this.maxDist = (!this.extra.range ? this.stats.range : this.extra.range) + UT.irand(-3,3);
         this.maxDist *= 10;
         if(!this.extra.noMove)
         {
            this.rotation = param3;
            if(this.extra.noUnit)
            {
               this.x = param4;
               this.y = param5;
            }
            else
            {
               this.x = param4 + UT.xMoveToRot(this.rotation + 90 * (this.unit.MC.scaleX <= 0 ? -1 : 1),this.stats.yOff * this.unit.scale);
               this.y = param5 + UT.yMoveToRot(this.rotation + 90 * (this.unit.MC.scaleX <= 0 ? -1 : 1),this.stats.yOff * this.unit.scale);
            }
            this.xVel = UT.xMoveToRot(this.rotation,10);
            this.yVel = UT.yMoveToRot(this.rotation,10);
            _loc10_ = 0;
            while(_loc10_ <= param6)
            {
               this.x += this.xVel * 0.5;
               this.y += this.yVel * 0.5;
               if(this.hitObject = this.hitTestAll())
               {
                  break;
               }
               _loc10_++;
            }
         }
         else
         {
            this.xVel = 0;
            this.yVel = 0;
         }
         this.ox = this.x;
         this.oy = this.y;
         if(this.stats.effShoot)
         {
            this.game.createEffect(this.ox,this.oy,this.stats.effShoot);
         }
      }
      
      protected function doHitEffect(param1:Boolean = false) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         if(!this.hitType)
         {
            if(!param1)
            {
               return;
            }
            this.hitType = "wall";
         }
         if(!(Boolean(this.hitType) && Boolean(this.stats.extra.bounceShots)))
         {
            if(this.hitType == "unit")
            {
               if(Math.random() < this.hitObject.unitInfo.reflect)
               {
                  if(!this.extra.reflect)
                  {
                     _loc3_ = UT.rotBounceOff(this.rotation,this.x - this.xVel * 10,this.y - this.yVel * 10,this.hitObject.x,Number(this.hitObject.y) - 20);
                     this.unit.game.bullets.push(new this.stats.cls(this.unit.game,this.hitObject,_loc3_ + UT.rand(-10,10),this.x,this.y,0,this.stats,{"reflect":this.unit}));
                     this.game.playScreenSound(UT.randEl([S_Reflect1,S_Reflect2,S_Reflect3]),this.x,this.y);
                     if(this.isProjectile)
                     {
                        this.removeMe();
                     }
                     this.game.createEffect(this.x,this.y,"bulletspark");
                     return;
                  }
                  return;
               }
               if(Boolean(this.hitObject.status.sReflect) && !this.stats.isMelee)
               {
                  trace("Reflected!");
                  _loc4_ = Number(this.hitObject.aimRoation) - UT.getRotation(this.hitObject.x,this.hitObject.y,this.x,this.y);
                  if(Math.abs(_loc4_) < 100)
                  {
                     if(!this.extra.reflect)
                     {
                        _loc3_ = UT.rotBounceOff(this.rotation,this.x - this.xVel * 10,this.y - this.yVel * 10,this.hitObject.x,Number(this.hitObject.y) - 10);
                        this.unit.game.bullets.push(new this.stats.cls(this.unit.game,this.hitObject,_loc3_ + UT.rand(-10,10),this.x,this.y,0,this.stats,{"reflect":this.unit}));
                        if(this.isProjectile)
                        {
                           this.removeMe();
                        }
                        this.game.playScreenSound(UT.randEl([S_Reflect1,S_Reflect2,S_Reflect3]),this.x,this.y);
                        this.game.createEffect(this.x,this.y,"bulletspark");
                        return;
                     }
                     return;
                  }
               }
               if(!this.hitObject.status.sSpawn && !this.stats.noBlood)
               {
                  if(!(Boolean(this.extra.shielded) || Boolean(this.hitObject.status.arCur)))
                  {
                     if(SD.blood)
                     {
                        this.game.createEffect(this.x,this.y,"bloodmist");
                     }
                  }
                  else
                  {
                     this.game.createEffect(this.x,this.y,"bulletspark");
                  }
               }
               if(!this.isProjectile)
               {
                  this.x -= this.xVel * 0.5;
                  this.y -= this.yVel * 0.5;
               }
               else
               {
                  this.x -= this.xVel;
                  this.y -= this.yVel;
                  if(!this.stats.extra.pierce)
                  {
                     this.removeMe();
                  }
               }
               if(this.stats.effHit)
               {
                  this.game.createEffect(this.x,this.y,this.stats.effHit);
               }
               if(this.stats.splash)
               {
                  this.extra.hitX = this.x;
                  this.extra.hitY = this.y;
               }
               this.hitObject.status.damage(this.stats.dmg * this.dmgMod,this.unit,this.stats,this.extra);
            }
            if(this.hitType == "corpse")
            {
               if(SD.blood)
               {
                  this.game.createEffect(this.x,this.y,"bloodmist");
               }
               if(this.isProjectile)
               {
                  this.x -= this.xVel;
                  this.y -= this.yVel;
                  if(!this.stats.extra.pierce)
                  {
                     this.removeMe();
                  }
               }
               if(this.stats.effHit)
               {
                  this.game.createEffect(this.x,this.y,this.stats.effHit);
               }
               if(this.stats.splash)
               {
                  this.extra.hitX = this.x;
                  this.extra.hitY = this.y;
               }
               this.game.physWorld.hitCorpse(this.hitObject,this.unit,this.stats,this.extra);
            }
            if(this.hitType == "wall")
            {
               if(this.isProjectile)
               {
                  this.x -= this.xVel;
                  this.y -= this.yVel;
                  if(this.stats.extra.burrow)
                  {
                     this.extra.burrowMult = 2;
                     this.yVel -= Number(this.stats.params[2]) * 0.1;
                  }
                  else
                  {
                     this.removeMe();
                  }
               }
               if(this.stats.extra.burrow)
               {
                  this.game.createEffect(this.x,this.y,"mud_splash");
               }
               else if(this.stats.effHit)
               {
                  this.game.createEffect(this.x,this.y,this.stats.effHit);
               }
               var _loc5_:* = this.hitObject;
               loop7:
               switch("" !== _loc5_ ? ("ff0000" !== _loc5_ ? ("ffff20" === _loc5_ ? 2 : ("ffff00" !== _loc5_ ? ("ffff02" !== _loc5_ ? ("00ffff" === _loc5_ ? 5 : ("993300" !== _loc5_ ? ("670067" !== _loc5_ ? ("6699ff" === _loc5_ ? 8 : ("ffffff" !== _loc5_ ? ("006600" === _loc5_ ? 10 : 11) : 9)) : 7) : 6)) : 4) : 3)) : 1) : 0)
               {
                  case 0:
                     break;
                  case 1:
                     break;
                  case 2:
                     ++Stats_Campaign.sn;
                     Stats_Campaign.fc = 0;
                     this.game.arena.changeWallFrame(Stats_Campaign.sn);
                     _loc2_ = 0;
                     while(_loc2_ < UT.irand(3,6))
                     {
                        this.game.createParticle(this.game.player.x + UT.rand(30,45),this.game.player.y - UT.rand(40,55),"spark",5,null,"ember");
                        _loc2_++;
                     }
                     this.game.arena.setShake(1,4);
                     break;
                  case 3:
                     if(this.game.arena.mc_fruit_left.currentFrame != this.game.arena.mc_fruit_left.totalFrames)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < UT.irand(5,15))
                        {
                           this.game.createParticle(this.game.arena.mc_fruit_left.x + UT.rand(-30,30),this.game.arena.mc_fruit_left.y + UT.rand(-30,5),"spark",10,null,"fruit1");
                           _loc2_++;
                        }
                        _loc2_ = 0;
                        while(_loc2_ < UT.irand(5,15))
                        {
                           this.game.createParticle(this.game.arena.mc_fruit_left.x + UT.rand(-30,30),this.game.arena.mc_fruit_left.y + UT.rand(-30,5),"spark",10,null,"fruit2");
                           _loc2_++;
                        }
                        this.game.createEffect(this.game.arena.mc_fruit_left.x + UT.rand(-30,30),this.game.arena.mc_fruit_left.y + UT.rand(-20,10),"fruitmist");
                        this.game.arena.mc_fruit_left.nextFrame();
                        if(this.game.arena.mc_fruit_left.currentFrame % 7 == 0 && this.game.arena.mc_fruit_left.currentFrame < this.game.arena.mc_fruit_left.totalFrames)
                        {
                           this.game.playScreenSound(S_Fruit,this.x,this.y);
                        }
                        if(!(this.game.arena.mc_fruit_left.currentFrame == 140 && this.game.arena.mc_fruit_right.currentFrame == 140))
                        {
                           break;
                        }
                        Stats_Achievements.setAchievement("fruit");
                        break;
                     }
                     break;
                  case 4:
                     if(this.game.arena.mc_fruit_right.currentFrame != this.game.arena.mc_fruit_right.totalFrames)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < UT.irand(5,15))
                        {
                           this.game.createParticle(this.game.arena.mc_fruit_right.x + UT.rand(-30,30),this.game.arena.mc_fruit_right.y + UT.rand(-30,5),"spark",10,null,"fruit1");
                           _loc2_++;
                        }
                        _loc2_ = 0;
                        while(_loc2_ < UT.irand(5,15))
                        {
                           this.game.createParticle(this.game.arena.mc_fruit_right.x + UT.rand(-30,30),this.game.arena.mc_fruit_right.y + UT.rand(-30,5),"spark",10,null,"fruit2");
                           _loc2_++;
                        }
                        this.game.createEffect(this.game.arena.mc_fruit_right.x + UT.rand(-30,30),this.game.arena.mc_fruit_right.y + UT.rand(-20,10),"fruitmist");
                        this.game.arena.mc_fruit_right.nextFrame();
                        if(this.game.arena.mc_fruit_right.currentFrame % 7 == 0 && this.game.arena.mc_fruit_right.currentFrame < this.game.arena.mc_fruit_right.totalFrames)
                        {
                           this.game.playScreenSound(S_Fruit,this.x,this.y);
                        }
                        if(!(this.game.arena.mc_fruit_left.currentFrame == 140 && this.game.arena.mc_fruit_right.currentFrame == 140))
                        {
                           break;
                        }
                        Stats_Achievements.setAchievement("fruit");
                        break;
                     }
                     break;
                  case 5:
                     break;
                  case 6:
                     if(!SD.graphPart)
                     {
                        break;
                     }
                     this.game.createEffect(this.x,this.y,"mud_splash");
                     break;
                  case 7:
                     break;
                  case 8:
                     break;
                  case 9:
                     if(!SD.graphPart)
                     {
                        break;
                     }
                     this.game.createEffect(this.x,this.y,"snowSplash");
                     break;
                  case 10:
                     this.game.createEffect(this.x,this.y,"leaf_splash");
                     _loc2_ = 0;
                     while(true)
                     {
                        if(_loc2_ >= SD.graphPart)
                        {
                           break loop7;
                        }
                        this.game.createParticle(this.x + UT.rand(-10,10),this.y,"leaf",null,"leaves","leaf" + UT.irand(1,4));
                        _loc2_++;
                     }
               }
            }
            if(this.hitType == "killstreak")
            {
               this.game.createEffect(this.x,this.y,"bulletspark");
               if(!this.isProjectile)
               {
                  this.x -= this.xVel * 0.5;
                  this.y -= this.yVel * 0.5;
               }
               else
               {
                  this.x -= this.xVel;
                  this.y -= this.yVel;
                  if(!this.stats.extra.pierce)
                  {
                     this.removeMe();
                  }
               }
               if(this.stats.effHit)
               {
                  this.game.createEffect(this.x,this.y,this.stats.effHit);
               }
               if(this.stats.splash)
               {
                  this.extra.hitX = this.x;
                  this.extra.hitY = this.y;
               }
               this.hitObject.damage(this.stats.dmg * this.dmgMod,this.unit,this.stats,this.extra);
            }
            if(this.stats.hitSound)
            {
               this.unit.game.playScreenSound(this.stats.hitSound,this.x,this.y);
            }
            this.checkSplash();
            return;
         }
         if(this.hitType == "unit")
         {
            this.hitObject.status.damage(this.stats.dmg * this.dmgMod,this.unit,this.stats,this.extra);
         }
         this.x -= this.xVel * 3;
         this.y -= this.yVel * 3;
         _loc2_ = 0;
         while(_loc2_ < this.stats.extra.bounceShots)
         {
            this.unit.game.bullets.push(new Stats_Guns.itemOb["bouncer"].cls(this.unit.game,this.unit,UT.rand(0,360),this.x,this.y,0,"bouncer"));
            _loc2_++;
         }
         if(this.isProjectile)
         {
            this.removeMe();
         }
      }
      
      protected function hitTestAll(param1:Number = 0, param2:Number = 0, param3:Boolean = false) : *
      {
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:uint = 0;
         var _loc4_:uint = this.game.arena.wall.getPixel32(this.x + param1,this.y + param2);
         if(!(!this.unit.status.sWallhack && !param3 && _loc4_ && _loc4_.toString(16).substring(0,2) == "ff"))
         {
            _loc5_ = 0;
            while(true)
            {
               if(_loc5_ < this.game.units.length)
               {
                  if(this.game.units[_loc5_] != this.unit)
                  {
                     if(!this.game.units[_loc5_].dead)
                     {
                        if(!(Boolean(this.unit.team) && this.unit.team == this.game.units[_loc5_].team))
                        {
                           _loc6_ = Number(this.game.units[_loc5_].x) - 13 * Number(this.game.units[_loc5_].scale);
                           _loc7_ = 26 * Number(this.game.units[_loc5_].scale);
                           _loc8_ = 66 * Number(this.game.units[_loc5_].scale);
                           _loc9_ = 44 * Number(this.game.units[_loc5_].scale);
                           _loc10_ = 28 * Number(this.game.units[_loc5_].scale);
                           _loc11_ = 0;
                           if(this.game.units[_loc5_].mov.crouching)
                           {
                              if(!UT.inBox(this.x,this.y,_loc6_,Number(this.game.units[_loc5_].y) - _loc9_,_loc7_,_loc9_))
                              {
                                 continue;
                              }
                              if(!UT.inBox(this.x,this.y,_loc6_,Number(this.game.units[_loc5_].y) - _loc10_,_loc7_,_loc10_))
                              {
                                 _loc11_ = 2;
                              }
                              else
                              {
                                 _loc11_ = 1;
                              }
                           }
                           else
                           {
                              if(!UT.inBox(this.x,this.y,_loc6_,Number(this.game.units[_loc5_].y) - _loc8_,_loc7_,_loc8_))
                              {
                                 continue;
                              }
                              if(!UT.inBox(this.x,this.y,_loc6_,Number(this.game.units[_loc5_].y) - _loc9_,_loc7_,_loc9_))
                              {
                                 _loc11_ = 2;
                              }
                              else
                              {
                                 _loc11_ = 1;
                              }
                           }
                           if(_loc11_ == 1)
                           {
                              break;
                           }
                           if(_loc11_ == 2)
                           {
                              if(UT.getPosNegSign(this.unit.x - Number(this.game.units[_loc5_].x)) != this.game.units[_loc5_].MC.scaleX)
                              {
                                 this.extra.assassin = 1.5;
                              }
                              this.extra.headMult = 1.5;
                              this.hitType = "unit";
                              if(this.stats.splash >= 80)
                              {
                                 this.extra.splashDirect = true;
                              }
                              return this.game.units[_loc5_];
                           }
                        }
                     }
                  }
               }
               else
               {
                  _loc5_ = 0;
                  while(_loc5_ < this.game.physWorld.actors.length)
                  {
                     if(UT.getDist(this.x,this.y,this.game.physWorld.actors[_loc5_].rdBody.GetDefinition().userData.x,this.game.physWorld.actors[_loc5_].rdBody.GetDefinition().userData.y) < 30)
                     {
                        this.hitType = "corpse";
                        return this.game.physWorld.actors[_loc5_];
                     }
                     _loc5_++;
                  }
                  _loc5_ = 0;
                  while(_loc5_ < this.game.killstreaks.length)
                  {
                     if(this.game.killstreaks[_loc5_].shootable)
                     {
                        if(this.game.killstreaks[_loc5_].unit != this.unit)
                        {
                           if(!(Boolean(this.unit.team) && this.game.killstreaks[_loc5_].unit.team == this.unit.team))
                           {
                              if(UT.inBox(this.x,this.y,Number(this.game.killstreaks[_loc5_].x) - 15,Number(this.game.killstreaks[_loc5_].y) - 55,30,55))
                              {
                                 this.hitType = "killstreak";
                                 return this.game.killstreaks[_loc5_];
                              }
                           }
                        }
                     }
                     _loc5_++;
                  }
                  this.hitType = "";
                  return null;
               }
            }
            this.hitType = "unit";
            if(this.stats.splash >= 80)
            {
               this.extra.splashDirect = true;
            }
            return this.game.units[_loc5_];
         }
         this.hitType = "wall";
         return _loc4_.toString(16).substring(2);
      }
      
      protected function hitTestWall(param1:Number = 0, param2:Number = 0) : Boolean
      {
         var _loc3_:uint = this.game.arena.wall.getPixel32(this.x + param1,this.y + param2);
         return Boolean(_loc3_) && _loc3_.toString(16).substring(0,2) == "ff";
      }
      
      protected function checkSplash() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:uint = 0;
         if(this.stats.splash)
         {
            var _loc1_:uint = 0;
            while(_loc1_ < this.game.units.length)
            {
               if(!this.game.units[_loc1_].dead)
               {
                  if(!(this.hitType == "unit" && this.hitObject == this.game.units[_loc1_]))
                  {
                     if(UT.getDist(this.x,this.y,this.game.units[_loc1_].x,Number(this.game.units[_loc1_].y) - 45) < this.stats.splash)
                     {
                        this.cleanExtra();
                        _loc2_ = UT.getRotation(this.x,this.y,this.game.units[_loc1_].x,Number(this.game.units[_loc1_].y) - 45);
                        _loc3_ = this.game.arena.wall.getPixel32(this.x + UT.xMoveToRot(_loc2_,10),this.y + UT.yMoveToRot(_loc2_,10));
                        if(!(Boolean(_loc3_) && _loc3_.toString(16).substring(0,2) == "ff"))
                        {
                           if(Boolean(this.stats.splash) && this.stats.splash < 80)
                           {
                              this.extra.splashIndirect = true;
                           }
                           this.extra.hitX = this.x;
                           this.extra.hitY = this.y;
                           this.extra.splashMult = this.stats.splashMult;
                           this.game.units[_loc1_].status.damage(this.stats.dmg,this.unit,this.stats,this.extra);
                        }
                     }
                  }
               }
               _loc1_++;
            }
            return;
         }
      }
      
      protected function removeMe() : void
      {
         this.remove = true;
      }
      
      protected function cleanExtra() : void
      {
         var _loc1_:* = {};
         _loc1_.corpseStick = this.extra.corpseStick;
         _loc1_.reflect = this.extra.reflect;
         this.extra = _loc1_;
      }
   }
}
