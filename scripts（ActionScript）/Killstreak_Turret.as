package
{
   public class Killstreak_Turret extends Killstreak
   {
       
      
      private var sub:String;
      
      private var followSpd:Number;
      
      private var rot:Number;
      
      public var mov:Movement;
      
      private var yVel:Number = 0;
      
      private var active:Boolean;
      
      private var laserX:Number;
      
      private var laserY:Number;
      
      public function Killstreak_Turret(param1:Game, param2:*, param3:uint, param4:String)
      {
         super(param1,param2,param3,param4,true);
         if(unit.unitInfo.extra.permaStreak)
         {
            timer = 9999999;
         }
         if(param4 == "turret")
         {
            MC = new Turret();
         }
         if(param4 == "sentry")
         {
            MC = new Sentry();
         }
         game.unitCont.addChild(MC);
         MC.x = x = unit.x;
         MC.y = y = unit.y;
         setText(MC);
         this.followSpd = UT.rand(0.2,0.4);
         shootTimer = UT.irand(0,25);
         this.rot = 0;
         this.mov = new Movement(null);
         this.active = false;
         this.laserX = x;
         this.laserY = y - 40;
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:Array = null;
         var _loc2_:uint = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         if(this.active)
         {
            ++fc;
            if(fc >= 30)
            {
               ++shootTimer;
               if(fc % 20 == 0)
               {
                  _loc1_ = [];
                  _loc2_ = 0;
                  while(_loc2_ < game.units.length)
                  {
                     if(game.units[_loc2_] != unit)
                     {
                        if(!game.units[_loc2_].dead)
                        {
                           if(!(Boolean(unit.team) && unit.team == game.units[_loc2_].team))
                           {
                              if(game.units[_loc2_].status.sInvis != 1)
                              {
                                 if(!game.units[_loc2_].status.sSpawn)
                                 {
                                    if((_loc4_ = UT.getDist(x,y,game.units[_loc2_].x,game.units[_loc2_].y)) < gun.range * 10)
                                    {
                                       _loc1_.push({
                                          "dist":_loc4_,
                                          "unit":game.units[_loc2_],
                                          "rot":UT.getRotation(x,y,game.units[_loc2_].x,game.units[_loc2_].y)
                                       });
                                    }
                                 }
                              }
                           }
                        }
                     }
                     _loc2_++;
                  }
                  var _loc7_:uint = 0;
                  while(_loc7_ < game.killstreaks.length)
                  {
                     var enemyTurret:Killstreak_Turret = game.killstreaks[_loc7_] as Killstreak_Turret;
                     if(enemyTurret)
                     {
                        if(enemyTurret != this)
                        {
                           if(!enemyTurret.dead)
                           {
                              if(enemyTurret.active)
                              {
                                 if(unit.team != enemyTurret.unit.team)
                                 {
                                    _loc4_ = UT.getDist(x,y,enemyTurret.x,enemyTurret.y);
                                    if(_loc4_ <= gun.range * 10)
                                    {
                                       _loc1_.push({
                                          "dist":_loc4_,
                                          "unit":enemyTurret,
                                          "rot":UT.getRotation(x,y,enemyTurret.x,enemyTurret.y)
                                       });
                                    }
                                 }
                              }
                           }
                        }
                     }
                     _loc7_++;
                  }
                  _loc2_ = 0;
                  while(_loc2_ < _loc1_.length)
                  {
                     _loc3_ = true;
                     _loc5_ = 0;
                     while(_loc3_ && _loc5_ < _loc1_[_loc2_].dist)
                     {
                        if(hitTestWall(UT.xMoveToRot(_loc1_[_loc2_].rot,_loc5_),UT.yMoveToRot(_loc1_[_loc2_].rot,_loc5_) - 40))
                        {
                           _loc3_ = false;
                        }
                        _loc5_ += 20;
                     }
                     if(!_loc3_)
                     {
                        _loc1_.splice(_loc2_,1);
                        _loc2_--;
                     }
                     _loc2_++;
                  }
                  if(_loc1_.length)
                  {
                     _loc1_.sortOn("dist",Array.NUMERIC);
                     target = _loc1_[0].unit;
                  }
                  else
                  {
                     target = null;
                     this.laserX = x;
                     this.laserY = y - 40;
                  }
               }
               if(!target)
               {
                  this.laserX += (x - this.laserX) * 0.7;
                  this.laserY += (y - 40 - this.laserY) * 0.7;
               }
               else
               {
                  this.laserX += (Number(target.x) - this.laserX) * 0.5;
                  this.laserY += (Number(target.y) - 40 - this.laserY) * 0.5;
                  game.lineCont.graphics.lineStyle(1,16711680,0.5);
                  game.lineCont.graphics.moveTo(x,y - 40);
                  game.lineCont.graphics.lineTo(this.laserX,this.laserY);
                  _loc6_ = UT.getRotation(x,y - 40,target.x,Number(target.y) - 35);
                  if(Math.abs(this.rot - _loc6_) <= 5)
                  {
                     this.rot = _loc6_;
                  }
                  else
                  {
                     this.rot += UT.rotateDirection(this.rot,_loc6_) * 4;
                  }
                  if(Boolean(target.dead) || UT.getDist(x,y,target.x,target.y) > gun.range * 10)
                  {
                     target = null;
                  }
               }
               MC.head.rotation = this.rot;
               if(target && shootTimer > gun.shootDelay * 13)
               {
                  shootTimer = 0;
                  game.playScreenSound(gun.shotSound,x,y);
                  game.bullets.push(new gun.cls(game,unit,this.rot + UT.rand(-5,5),x,y - 40,5,gun,{"noUnit":true}));
                  MC.head.gotoAndPlay(2);
                  unit.game.createParticle(x,y + MC.head.y,"shell",0,{
                     "rot":Number(MC.head.rotation) - 90,
                     "flip":false
                  },"shell",gun.effShell);
               }
               if(Boolean(unit.dead) || fc >= timer)
               {
                  this.end();
               }
               return;
            }
            return;
         }
         this.yVel += 1;
         if(this.yVel > 25)
         {
            this.yVel = 25;
         }
         y += this.yVel;
         if(hitTestWall(0,2))
         {
            while(hitTestWall(0,2))
            {
               y = y - 1;
            }
            this.active = true;
            MC.play();
            game.playScreenSound(S_Deploy,x,y);
         }
         MC.y = y;
      }
      
      override public function end(param1:Boolean = true) : void
      {
         if(param1)
         {
            unit.endKillstreak();
         }
         if(MC)
         {
            game.unitCont.removeChild(MC);
         }
         game.killstreaks.splice(game.killstreaks.indexOf(this),1);
         game.createEffect(x,y - 20,"explosionSmall");
         game.playScreenSound(S_rocketExplode,x,y);
      }
   }
}
