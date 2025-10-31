package
{
   public class AI extends Unit
   {
       
      
      private var curWp:NodeWaypoint;
      
      private var nextWp:NodeWaypoint;
      
      private var wpTimer:uint;
      
      private var focusX:Number;
      
      private var focusY:Number;
      
      private var path:String;
      
      private var getTargetTimer:uint;
      
      private var getTargetEvent:uint;
      
      private var wait:uint;
      
      private var nowait:uint;
      
      public var crouch:uint;
      
      public var nocrouch:uint;
      
      private var shootSpd:Number;
      
      private var waitNormal:Number;
      
      private var waitTarget:Number;
      
      private var crouchNormal:Number;
      
      private var crouchTarget:Number;
      
      private var waitFlag:Number;
      
      private var shotChance:Number;
      
      private var aimSpeed:Number;
      
      private var aimRange:Number;
      
      private var diffRev:uint;
      
      public function AI(param1:Game, param2:*)
      {
         super(param1,false,param2);
         MC.goto("idle");
         this.path = "@@";
         this.getTargetEvent = UT.irand(1,12);
      }
      
      override public function setDiffStats(param1:Number = -99, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(param1 == -99)
         {
            param1 = odiff;
         }
         if(param3)
         {
            if(param1 < 0)
            {
               param1 = 0;
            }
         }
         else if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 15)
         {
            param1 = 15;
         }
         diff = param1;
         if(param2)
         {
            odiff = param1;
         }
         this.diffRev = 15 - diff;
         this.waitNormal = UT.getLinearRange(diff,15,0.05,0.001);
         this.waitTarget = UT.getLinearRange(diff,15,0.08,0.02);
         this.crouchNormal = UT.getLinearRange(diff,15,0.06,0.01);
         this.crouchTarget = UT.getLinearRange(diff,15,0.1,0.03);
         this.waitFlag = UT.getLinearRange(diff,15,0.01,0.001);
         this.shotChance = UT.getLinearRange(diff,15,0.7,3);
         this.aimSpeed = UT.getLinearRange(diff,15,0.06,0.9);
         this.aimRange = UT.getLinearRange(diff,15,400,650);
         if(gun.curGun.vision > 0.5)
         {
            this.aimRange *= 1.3;
         }
      }
      
      override public function spawn(param1:Number = 0, param2:Number = 0, param3:String = "", param4:Boolean = true) : void
      {
         unitSpawn(param1,param2,param3,param4);
         aimX = x + 100;
         aimY = y - 50;
         if(unitInfo.extra.aimReverse)
         {
            trace("reverse");
            aimX = y - 100;
            MC.scaleX = -1;
         }
      }
      
      override protected function setAiSpawnNode(param1:NodeSpawn) : void
      {
         this.getNextWaypoint(param1.waypoint,true);
      }
      
      private function moveToObjective() : void
      {
         if(hasFlag)
         {
            this.path = this.pathFind(game.arena["flag" + team].id,5);
            trace("SET PATH TO HOME FLAG",this.path);
         }
         else if(Math.random() < 0.3 && !game.arena["flag" + (team != 1 ? 1 : 2)].unitCaptured)
         {
            this.path = this.pathFind(game.arena["flag" + (team != 1 ? 1 : 2)].id,5);
            trace("SET PATH TO ENEMY FLAG",this.path);
         }
      }
      
      override public function getNextWaypoint(param1:NodeWaypoint = null, param2:Boolean = false) : void
      {
         this.wpTimer = 0;
         if(!(!param2 && mov.jumping && Math.abs(y - this.nextWp.y) > 30))
         {
            if(param1)
            {
               this.curWp = this.nextWp;
               this.nextWp = param1;
            }
            else
            {
               this.curWp = this.nextWp;
               if(MatchSettings.useMode == "ctf" && !this.path && this.path.charAt(0) != "@")
               {
                  this.moveToObjective();
               }
               if(Math.abs(y - this.curWp.y) <= 50)
               {
                  if(Math.abs(y - this.curWp.y) < 50)
                  {
                     if(!(Boolean(this.path) && this.path.charAt(0) != "@"))
                     {
                        this.nextWp = UT.randEl(this.curWp.connects);
                        if(this.path.charAt(0) == "@")
                        {
                           this.path = this.path.substring(1);
                        }
                     }
                     else
                     {
                        this.nextWp = game.arena.wpOb[this.path.charAt(0)];
                        this.path = this.path.substring(1);
                        if(this.path == "")
                        {
                           this.path = "@";
                        }
                        trace(this.path);
                     }
                  }
               }
               else
               {
                  this.getClosestWp();
               }
            }
            if(Main.DEBUGMODE)
            {
            }
            return;
         }
      }
      
      public function getClosestWp() : void
      {
         if(diff)
         {
            this.wpTimer = 0;
            this.path = "@";
            var _loc1_:Array = new Array();
            var _loc2_:uint = 0;
            while(_loc2_ < game.arena.waypoints.length)
            {
               if(Math.abs(y - Number(game.arena.waypoints[_loc2_].y)) < 100)
               {
                  _loc1_.push({
                     "dist":Math.abs(x - Number(game.arena.waypoints[_loc2_].x)),
                     "wp":game.arena.waypoints[_loc2_]
                  });
               }
               _loc2_++;
            }
            if(_loc1_.length)
            {
               _loc1_.sortOn("dist",Array.NUMERIC);
               this.nextWp = _loc1_[0].wp;
            }
            else
            {
               this.nextWp = UT.randEl(this.curWp.connects);
            }
            return;
         }
      }
      
      public function pathFind(param1:String, param2:uint = 0) : String
      {
         var _loc3_:Array = [];
         var _loc4_:uint = 0;
         while(_loc4_ < this.curWp.connects.length)
         {
            this.searchNode(this.curWp.connects[_loc4_].id,param1,this.curWp.id,_loc3_);
            _loc4_++;
         }
         _loc3_.sortOn("dist",Array.NUMERIC);
         if(param2 > _loc3_.length - 1)
         {
            param2 = _loc3_.length - 1;
         }
         return _loc3_[UT.irand(0,param2)].path.substring(1);
      }
      
      private function searchNode(param1:String, param2:String, param3:String, param4:Array) : void
      {
         var _loc6_:String = null;
         param3 += param1;
         if(param1 == param2)
         {
            param4.push(new NodeWaypointPath(param3,game.arena.wpOb));
         }
         var _loc5_:uint = 0;
         while(_loc5_ < game.arena.wpOb[param1].connects.length)
         {
            _loc6_ = game.arena.wpOb[param1].connects[_loc5_].id;
            if(param3.indexOf(_loc6_) == -1)
            {
               this.searchNode(_loc6_,param2,param3,param4);
            }
            _loc5_++;
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:uint = 0;
         var _loc6_:* = undefined;
         if(!unitInfo.extra.noSpawn)
         {
            if(!mov.jumping && !this.wait && !this.crouch)
            {
               ++this.wpTimer;
            }
            if(this.wpTimer >= 30 * 4)
            {
               this.getClosestWp();
            }
            if(!dead)
            {
               MCfilters = [];
               keys = 0;
               if(mov.dontStop || Boolean(unitInfo.extra.dontStop))
               {
                  this.wait = 0;
                  this.crouch = 0;
               }
               if(diff)
               {
                  if(!(this.nextWp.x > x - 30 && this.nextWp.x < x + 30))
                  {
                     if(!(!this.wait && this.nextWp.x > x))
                     {
                        if(!this.wait && this.nextWp.x < x)
                        {
                           keys |= LEFT;
                        }
                     }
                     else
                     {
                        keys |= RIGHT;
                     }
                  }
                  else
                  {
                     this.getNextWaypoint();
                  }
               }
               if(MatchSettings.useMode == "dom")
               {
                  _loc1_ = 0;
                  while(_loc1_ < game.arena.holdpoints.length)
                  {
                     if(UT.inBox(x,y,Number(game.arena.holdpoints[_loc1_].x) - 120,Number(game.arena.holdpoints[_loc1_].y) - 150,240,200))
                     {
                        if(!this.wait && !this.nowait && (team != game.arena.holdpoints[_loc1_].curTeam || game.arena.holdpoints[_loc1_].flag > -50))
                        {
                           if(Math.random() >= 0.5)
                           {
                              this.crouch = UT.irand(1,8) * 30;
                           }
                           else
                           {
                              this.wait = UT.irand(1,8) * 30;
                           }
                           this.nowait = 0;
                        }
                     }
                     _loc1_++;
                  }
               }
               if(MatchSettings.useMode == "ctf")
               {
                  if(!game.arena["flag" + team].unitCaptured && UT.inBox(x,y,Number(game.arena["flag" + team].x) - 100,Number(game.arena["flag" + team].y) - 40,200,100))
                  {
                     if(!this.wait && !this.nowait && !hasFlag)
                     {
                        defendingFlag = true;
                        if(Math.random() >= 0.5)
                        {
                           this.crouch = UT.irand(1,8) * 30;
                        }
                        else
                        {
                           this.wait = UT.irand(1,8) * 30;
                        }
                        this.nowait = this.wait + UT.irand(1,3) * 30;
                     }
                  }
                  if(!this.wait && !this.nowait)
                  {
                     defendingFlag = false;
                  }
               }
               if(!this.wait && !this.nowait && !mov.jumping && Math.random() < (!target ? this.waitNormal : this.waitTarget) && !status.sSpawn)
               {
                  this.wait = UT.irand(2,6) * (this.diffRev * 0.1) * 30;
                  this.nowait = this.wait + UT.irand(2,6) * (diff * 0.1) * 30;
                  if(hasFlag)
                  {
                     this.wait *= 0.2;
                  }
               }
               if(!this.crouch && Math.random() < (!!target ? this.crouchTarget : 0) && !status.sSpawn && !this.nocrouch)
               {
                  this.crouch = UT.irand(2,4) * (this.diffRev * 0.1) * 30;
                  this.nocrouch = this.crouch + UT.irand(0,2) * 30;
               }
               if(this.wait)
               {
                  --this.wait;
               }
               if(this.nowait)
               {
                  --this.nowait;
               }
               if(mov.dontStop || Boolean(unitInfo.extra.dontStop))
               {
                  this.wait = 0;
                  this.crouch = 0;
               }
               if(this.crouch && keys & LEFT && Boolean(mov.hitTest(-19,-20)))
               {
                  this.crouch = 0;
               }
               if(this.crouch && keys & RIGHT && Boolean(mov.hitTest(19,-20)))
               {
                  this.crouch = 0;
               }
               if(Boolean(this.crouch) && Boolean(diff))
               {
                  keys |= DOWN;
                  --this.crouch;
               }
               if(this.nocrouch)
               {
                  --this.nocrouch;
               }
               ++this.getTargetTimer;
               if(this.getTargetTimer > 12)
               {
                  this.getTargetTimer = 0;
               }
               if(this.getTargetTimer == this.getTargetEvent)
               {
                  _loc2_ = [];
                  _loc1_ = 0;
                  while(_loc1_ < game.units.length)
                  {
                     if(game.units[_loc1_] != this)
                     {
                        if(!game.units[_loc1_].dead)
                        {
                           if(!(Boolean(team) && team == game.units[_loc1_].team))
                           {
                              if(game.units[_loc1_].status.sInvis != 1)
                              {
                                 if(!game.units[_loc1_].status.sSpawn)
                                 {
                                    _loc3_ = UT.getDist(x,y,game.units[_loc1_].x,game.units[_loc1_].y);
                                    if(_loc3_ < Math.min(gun.curGun.range * 10,this.aimRange))
                                    {
                                       _loc2_.push({
                                          "dist":_loc3_,
                                          "unit":game.units[_loc1_],
                                          "rot":UT.getRotation(x,y,game.units[_loc1_].x,game.units[_loc1_].y)
                                       });
                                    }
                                 }
                              }
                           }
                        }
                     }
                     _loc1_++;
                  }
                  if(!status.sWallhack)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < _loc2_.length)
                     {
                        _loc4_ = true;
                        _loc5_ = 0;
                        while(_loc4_ && _loc5_ < _loc2_[_loc1_].dist)
                        {
                           if(mov.hitTest(UT.xMoveToRot(_loc2_[_loc1_].rot,_loc5_),UT.yMoveToRot(_loc2_[_loc1_].rot,_loc5_) - (!mov.crouching ? 50 : 20)))
                           {
                              _loc4_ = false;
                           }
                           _loc5_ += 20;
                        }
                        if(!_loc4_)
                        {
                           _loc2_.splice(_loc1_,1);
                           _loc1_--;
                        }
                        _loc1_++;
                     }
                  }
                  if(!_loc2_.length)
                  {
                     target = null;
                  }
                  else
                  {
                     _loc2_.sortOn("dist",Array.NUMERIC);
                     target = _loc2_[0].unit;
                  }
                  if(!target)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < game.killstreaks.length)
                     {
                        if(game.killstreaks[_loc1_].shootable)
                        {
                           if(game.killstreaks[_loc1_].unit != this)
                           {
                              if(!(Boolean(team) && team == game.killstreaks[_loc1_].unit.team))
                              {
                                 _loc3_ = UT.getDist(x,y,game.killstreaks[_loc1_].x,game.killstreaks[_loc1_].y);
                                 if(_loc3_ < Math.min(gun.curGun.range * 10,this.aimRange))
                                 {
                                    _loc4_ = true;
                                    _loc6_ = UT.getRotation(x,y,game.killstreaks[_loc1_].x,game.killstreaks[_loc1_].y);
                                    _loc5_ = 0;
                                    while(_loc4_ && _loc5_ < _loc3_)
                                    {
                                       if(mov.hitTest(UT.xMoveToRot(_loc6_,_loc5_),UT.yMoveToRot(_loc6_,_loc5_) - (!mov.crouching ? 50 : 20)))
                                       {
                                          _loc4_ = false;
                                       }
                                       _loc5_ += 20;
                                    }
                                    if(_loc4_)
                                    {
                                       target = game.killstreaks[_loc1_];
                                    }
                                 }
                              }
                           }
                        }
                        _loc1_++;
                     }
                  }
               }
               if(!diff && Boolean(unitInfo.extra.aimReverse))
               {
                  MC.scaleX = -1;
               }
               if(target)
               {
                  this.focusX = !!target.dead ? Number(target.dead.rdBody.GetDefinition().userData.x) : Number(target.x);
                  this.focusY = !!target.dead ? target.dead.rdBody.GetDefinition().userData.y + 10 : target.y - (!target.mov.crouching ? 40 : 20);
                  aimX += (this.focusX - aimX) * this.aimSpeed;
                  aimY += (this.focusY - aimY) * this.aimSpeed;
               }
               else
               {
                  this.focusX = x + MC.scaleX * 50 + mov.xVel * 10;
                  this.focusY = y - 40 + mov.yVel * 8;
                  aimX += (this.focusX - aimX) * 0.4;
                  aimY += (this.focusY - aimY) * 0.3;
               }
               if(gun.secondary.isMelee)
               {
                  if(!(target && UT.getDist(x,y,target.x,target.y) < gun.secondary.range * 10 + 30))
                  {
                     if(gun.curGun != gun.primary && !gun.shootDelay)
                     {
                        gun.swapGuns();
                     }
                  }
                  else if(gun.curGun != gun.secondary && !gun.shootDelay)
                  {
                     gun.swapGuns();
                  }
               }
               if(game.gameStarted && target && diff && !status.sSpawn)
               {
                  this.shootSpd = 0.05 + (1 - (gun.curGun.shootDelay > 0.9 ? 0.9 : gun.curGun.shootDelay)) * 0.2;
                  this.shootSpd *= this.shotChance;
                  if(gun.curGun.type == 9)
                  {
                     this.shootSpd = 1;
                  }
                  if(Math.random() < this.shootSpd)
                  {
                     gun.shoot();
                  }
               }
               if(score.streakReady())
               {
                  useKillstreak();
               }
               _loc1_ = 0;
               for(; _loc1_ < this.nextWp.actionBoxes.length; _loc1_++)
               {
                  if(!UT.inBox(x,y,this.nextWp.actionBoxes[_loc1_].x,this.nextWp.actionBoxes[_loc1_].y,this.nextWp.actionBoxes[_loc1_].width,this.nextWp.actionBoxes[_loc1_].height))
                  {
                     continue;
                  }
                  if(keys & DOWN)
                  {
                     keys ^= DOWN;
                  }
                  var _loc7_:* = this.nextWp.actionBoxes[_loc1_].action;
                  switch("j" !== _loc7_ ? ("c" === _loc7_ ? 1 : ("fc" !== _loc7_ ? ("fp" !== _loc7_ ? ("fd" === _loc7_ ? 4 : ("fx" !== _loc7_ ? 6 : 5)) : 3) : 2)) : 0)
                  {
                     case 0:
                        if(!capturing)
                        {
                           this.wait = 0;
                           this.nowait = 30;
                           if(!mov.jumping)
                           {
                              mov.doJump();
                           }
                        }
                        break;
                     case 1:
                        keys |= DOWN;
                        break;
                     case 2:
                        this.getNextWaypoint(game.arena.wpOb["c"],true);
                        break;
                     case 3:
                        this.getNextWaypoint(game.arena.wpOb["p"],true);
                        break;
                     case 4:
                        this.getNextWaypoint(game.arena.wpOb["d"],true);
                        break;
                     case 5:
                        if(this.nextWp.id != "m" && this.nextWp.id != "l")
                        {
                           this.getNextWaypoint(game.arena.wpOb[UT.coinFlip("m","l")],true);
                        }
                        break;
                  }
               }
               UnitEnterFrame();
               return;
            }
            if(respawnTimer)
            {
               --respawnTimer;
            }
            else
            {
               this.spawn();
            }
            return;
         }
      }
   }
}
