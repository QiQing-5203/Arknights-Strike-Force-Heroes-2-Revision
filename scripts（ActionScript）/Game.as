package
{
   import Playtomic.Log;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   
   public class Game extends Sprite
   {
       
      
      private var main:Main;
      
      public var bg2:Bg;
      
      public var bg1:Bg;
      
      public var bgSky:BgSky;
      
      public var arena:Arena;
      
      private var mapParticles:Stats_MapParticles;
      
      public var physWorld:PhysWorld;
      
      public var hud:Hud;
      
      public var player:Player;
      
      public var units:Array;
      
      public var unitCont:Sprite;
      
      public var lineCont:Shape;
      
      public var killstreaks:Array;
      
      public var effects:Array;
      
      public var bullets:Array;
      
      public var matchSettings:MatchSettings;
      
      public var bitscreen:BitScreen;
      
      private var fc:uint = 0;
      
      public var aimer:Aimer;
      
      public var radar:Radar;
      
      public var water:Water;
      
      public var gameStarted:Boolean;
      
      public var gameEnded:Boolean;
      
      public var paused:Boolean;
      
      private var lvlOb:Object;
      
      public var mapExtra:String;
      
      public var enemyLvlAvg:uint;
      
      public var enemyAmt:uint;
      
      private var destroyed:Boolean;
      
      public function Game(param1:Main, param2:Object)
      {
         super();
         this.main = param1;
         Stats_Misc.setRandomGunGame();
         this.bgSky = new BgSky();
         addChild(this.bgSky);
         this.bg2 = new Bg();
         addChild(this.bg2);
         this.bg1 = new Bg();
         addChild(this.bg1);
         this.matchSettings = new MatchSettings(this);
         this.mapParticles = new Stats_MapParticles(this,MatchSettings.useMap.particles);
         this.physWorld = new PhysWorld(this);
         this.water = new Water(this);
         this.arena = new Arena(this);
         if(MatchSettings.useMap.song)
         {
            SH.playMusic(MatchSettings.useMap.song);
         }
         UT.forceGarbageCollection();
      }
      
      public function InitGame(param1:*) : void
      {
         var _loc2_:uint = 0;
         this.arena = param1;
         addChild(this.arena);
         this.aimer = new Aimer();
         this.bitscreen = new BitScreen(this);
         addChild(this.bitscreen);
         this.unitCont = new Sprite();
         this.lineCont = new Shape();
         this.arena.midCont.addChild(this.unitCont);
         this.arena.midCont.addChild(this.lineCont);
         this.arena.midCont.addChild(this.physWorld);
         this.arena.midCont.addChild(this.water);
         this.effects = new Array();
         this.bullets = new Array();
         this.units = new Array();
         this.killstreaks = new Array();
         this.radar = new Radar(this,this.arena.wallMC);
         this.hud = new Hud(this);
         addChild(this.hud);
         this.hud.addChild(this.radar);
         this.player = new Player(this,MatchSettings.usePlayer);
         this.createUnit(this.player);
         _loc2_ = 0;
         while(_loc2_ < MatchSettings.useBots.length)
         {
            this.createUnit(new AI(this,MatchSettings.useBots[_loc2_]));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.units.length)
         {
            if(this.units[_loc2_] != this.player)
            {
               if(this.units[_loc2_].team == 0 || this.units[_loc2_].team == 2)
               {
                  this.enemyLvlAvg += this.units[_loc2_].unitInfo.level;
                  ++this.enemyAmt;
               }
            }
            _loc2_++;
         }
         this.enemyLvlAvg /= this.enemyAmt;
         trace("Enemy average level:",this.enemyLvlAvg,"with enemy #:",this.enemyAmt);
         this.hud.addExp();
         if(MatchSettings.useMode == "jug")
         {
            UT.randEl(this.units).setJug();
         }
         addChild(this.aimer);
         this.matchSettings.Init();
         this.mapParticles.mapInit();
         this.setMapExtra(MatchSettings.useMap.extra);
         Main.STAGE.quality = UT.getEl(SD.graphQual,["low","medium","high"]);
      }
      
      public function setMapExtra(param1:String) : void
      {
         this.mapExtra = param1;
         this.lvlOb = {};
         var _loc2_:* = this.mapExtra;
         switch("space" !== _loc2_ ? ("mech" !== _loc2_ ? ("factoryMech" !== _loc2_ ? ("doubleMech" === _loc2_ ? 3 : 4) : 2) : 1) : 0)
         {
            case 0:
               this.lvlOb.bgRot1 = UT.rand(0,360);
               this.lvlOb.bgRot2 = UT.rand(0,360);
               if(!(MatchSettings.isCampaign && MatchSettings.caStage == 1 && MatchSettings.caType == 0))
               {
                  this.arena.mc_door2.visible = false;
                  this.arena.mc_door3.visible = false;
                  this.arena.mc_destroyed.visible = false;
                  this.arena.mc_lights.visible = false;
                  break;
               }
               break;
            case 1:
               this.lvlOb.hazardTimeLimit = UT.irand(10,20);
               this.lvlOb.hazardTimer = 0;
               this.lvlOb.hazardType = 0;
               this.lvlOb.activeTimer = 0;
               this.lvlOb.rocket = Stats_Guns.createBasicItem("mechrocket",this.units[1].unitInfo.level);
               break;
            case 2:
               this.lvlOb.mechTimeLimit = UT.irand(10,20);
               this.lvlOb.mechTimer = 0;
               this.lvlOb.mechType = 0;
               break;
            case 3:
               this.lvlOb.hazardTimeLimit = UT.irand(10,20);
               this.lvlOb.hazardTimer = 0;
               this.lvlOb.hazardType = 0;
               this.lvlOb.activeTimer = 0;
               this.lvlOb.rocket = Stats_Guns.createBasicItem("mechrocket",this.units[1].unitInfo.level);
               this.lvlOb.mechTimeLimit = UT.irand(10,20);
               this.lvlOb.mechTimer = 0;
               this.lvlOb.mechType = 0;
               this.bg1.mc_darkness.visible = false;
               this.bg1.mc_mech.play();
         }
      }
      
      public function startGame() : void
      {
         this.gameStarted = true;
         this.paused = false;
      }
      
      public function endGame(param1:Boolean) : void
      {
         if(!this.gameEnded)
         {
            this.gameEnded = true;
            this.hud.won = param1;
            this.hud.gotoAndPlay("end");
            Shop.resetShops();
            if(!MatchSettings.isCampaign)
            {
               Log.CustomMetric("Quickmatches Played","Matches");
            }
            else
            {
               Log.CustomMetric((MatchSettings.caType != 0 ? "Challenges" : "Campaigns") + " Played","Matches");
            }
            Log.CustomMetric(Stats_Classes.getClass(this.player.unitInfo.classNum).name + " Matches","Soldiers");
            return;
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(!this.paused)
         {
            ++this.fc;
            this.lineCont.graphics.clear();
            this.bitscreen.EnterFrame();
            if(Boolean(MatchSettings.useExtra.randomTeam) && this.fc % Number(MatchSettings.useExtra.randomTeam) == 0)
            {
               _loc1_ = 0;
               while(_loc1_ < 20)
               {
                  _loc3_ = UT.irand(1,this.units.length - 1);
                  _loc4_ = UT.irand(1,this.units.length - 1);
                  _loc5_ = this.units[_loc3_];
                  _loc6_ = this.units[_loc4_];
                  this.units[_loc3_] = _loc6_;
                  this.units[_loc4_] = _loc5_;
                  _loc1_++;
               }
               _loc2_ = this.units.length * 0.5;
               _loc1_ = 1;
               while(_loc1_ < _loc2_)
               {
                  this.units[_loc1_].changeTeam(1);
                  _loc1_++;
               }
               _loc1_ = _loc2_;
               while(_loc1_ < this.units.length)
               {
                  this.units[_loc1_].changeTeam(2);
                  _loc1_++;
               }
               this.hud.setMsg(this.player,"队伍发生变更！");
            }
            if(MatchSettings.isCampaign)
            {
               Stats_Campaign.runScripts(this);
            }
            var _loc7_:* = this.mapExtra;
            loop11:
            switch("convoy" !== _loc7_ ? ("base" !== _loc7_ ? ("space" === _loc7_ ? 2 : ("mech" !== _loc7_ ? ("factoryMech" === _loc7_ ? 4 : ("doubleMech" !== _loc7_ ? 6 : 5)) : 3)) : 1) : 0)
            {
               case 0:
                  if(this.fc % 13 == 0)
                  {
                     this.arena.setShake(0,1);
                  }
                  if(this.fc % (30 * 2) != 0)
                  {
                     break;
                  }
                  this.arena.setShake(0,3);
                  break;
               case 1:
                  if(this.lvlOb.tesla)
                  {
                     break;
                  }
                  this.arena.mc_tv.alpha = Math.random() * 0.08;
                  this.arena.mc_tv.gotoAndStop(1);
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= this.killstreaks.length)
                     {
                        break loop11;
                     }
                     if(this.killstreaks[_loc1_] is Killstreak_Tesla && this.killstreaks[_loc1_].unit == this.player && this.killstreaks[_loc1_].fc > 35 && UT.inBox(this.killstreaks[_loc1_].x,this.killstreaks[_loc1_].y,1060,1060,200,30))
                     {
                        this.arena.mc_tv.alpha = 1;
                        this.arena.mc_tv.gotoAndStop(2);
                        Stats_Achievements.setAchievement("tesla");
                        this.lvlOb.tesla = true;
                     }
                     _loc1_++;
                  }
                  break;
               case 2:
                  this.lvlOb.bgRot1 += 0.2;
                  this.lvlOb.bgRot2 += 0.3;
                  this.bg2.mc_space.x = UT.xMoveToRot(this.lvlOb.bgRot1,40);
                  this.bg2.mc_space.y = UT.yMoveToRot(this.lvlOb.bgRot2,30);
                  break;
               case 3:
                  if(this.fc % 13 == 0)
                  {
                     this.arena.setShake(0,1);
                  }
                  if(this.fc % (30 * 2) == 0)
                  {
                     this.arena.setShake(0,3);
                  }
                  if(!this.gameEnded)
                  {
                     ++this.lvlOb.hazardTimer;
                     if(this.lvlOb.hazardTimer < Number(this.lvlOb.hazardTimeLimit) * 30)
                     {
                        break;
                     }
                     if(this.lvlOb.activeTimer == 0)
                     {
                        this.lvlOb.hazardType = UT.irand(1,3);
                        this.lvlOb.activeTimer = 6 * 30;
                        SH.playSound(S_Hazard);
                        if(this.lvlOb.hazardType > 2)
                        {
                           this.hud.gotoFrame("hazard3");
                           this.arena.mc_laser.play();
                        }
                        else
                        {
                           this.hud.gotoFrame("hazard" + this.lvlOb.hazardType);
                           this.arena["mc_missile" + this.lvlOb.hazardType].play();
                        }
                     }
                     --this.lvlOb.activeTimer;
                     if(this.lvlOb.activeTimer < 4 * 30)
                     {
                        _loc7_ = this.lvlOb.hazardType;
                        switch(1 !== _loc7_ ? (2 !== _loc7_ ? 2 : 1) : 0)
                        {
                           case 0:
                              if(this.fc % 60 == 0)
                              {
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,922,911);
                                 this.createArenaBullet(922,911,-20,30,this.lvlOb.rocket);
                              }
                              if(this.fc % 60 == 5)
                              {
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,857,896);
                                 this.createArenaBullet(857,896,-20,30,this.lvlOb.rocket);
                              }
                              if(this.fc % 60 != 10)
                              {
                                 break;
                              }
                              this.playScreenSound(this.lvlOb.rocket.shotSound,790,881);
                              this.createArenaBullet(790,881,-20,30,this.lvlOb.rocket);
                              break;
                           case 1:
                              if(this.fc % 60 == 0)
                              {
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,1959,910);
                                 this.createArenaBullet(1959,910,-30,20,this.lvlOb.rocket);
                              }
                              if(this.fc % 60 == 5)
                              {
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,2019,896);
                                 this.createArenaBullet(2019,896,-30,20,this.lvlOb.rocket);
                              }
                              if(this.fc % 60 != 10)
                              {
                                 break;
                              }
                              this.playScreenSound(this.lvlOb.rocket.shotSound,2085,880);
                              this.createArenaBullet(2085,880,-30,20,this.lvlOb.rocket);
                              break;
                        }
                     }
                     if(this.lvlOb.activeTimer != 1)
                     {
                        break;
                     }
                     this.hud.gotoFrame("idle");
                     this.lvlOb.activeTimer = 0;
                     this.lvlOb.hazardTimer = 0;
                     this.lvlOb.hazardTimeLimit = UT.irand(10,20);
                     break;
                  }
                  break;
               case 4:
                  if(!this.gameEnded)
                  {
                     ++this.lvlOb.mechTimer;
                     if(this.lvlOb.mechTimer >= Number(this.lvlOb.mechTimeLimit) * 30)
                     {
                        this.lvlOb.mechType = UT.irand(1,3);
                        SH.playSound(S_Hazard);
                        _loc7_ = this.lvlOb.mechType;
                        switch(1 !== _loc7_ ? (2 !== _loc7_ ? (3 !== _loc7_ ? 3 : 2) : 1) : 0)
                        {
                           case 0:
                              this.hud.gotoFrame("mechStomp");
                              this.bg1.mc_mech.gotoAndPlay("stomp");
                              break;
                           case 1:
                              this.hud.gotoFrame("mechLaser");
                              this.bg1.mc_mech.gotoAndPlay("laser");
                              break;
                           case 2:
                              this.hud.gotoFrame("mechGun");
                              this.bg1.mc_mech.gotoAndPlay("gun");
                        }
                        this.lvlOb.mechTimer = 0;
                        this.lvlOb.mechTimeLimit = UT.irand(13,20);
                     }
                     if(this.lvlOb.useLaser)
                     {
                        this.lvlOb.laserX += (this.player.x - Number(this.lvlOb.laserX)) * 0.045;
                        this.lvlOb.laserY += (this.player.y - Number(this.lvlOb.laserY)) * 0.045;
                        if(this.fc % 2 == 0)
                        {
                           this.createEffect(this.lvlOb.laserX,this.lvlOb.laserY,"mechLaser");
                        }
                        if(this.fc % 5 == 0 && UT.getDist(this.lvlOb.laserX,this.lvlOb.laserY,this.player.x,this.player.y - 40) < 60)
                        {
                           this.player.status.damage(Stats_Guns.getDamageAtLevel("mechlaser",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechlaser"],{},true);
                        }
                     }
                     if(!this.lvlOb.useGun)
                     {
                        break;
                     }
                     this.lvlOb.gun1X += UT.xMoveToRot(this.lvlOb.gun1Rot,7);
                     this.lvlOb.gun1Y += UT.yMoveToRot(this.lvlOb.gun1Rot,7);
                     this.lvlOb.gun2X += UT.xMoveToRot(this.lvlOb.gun2Rot,7);
                     this.lvlOb.gun2Y += UT.yMoveToRot(this.lvlOb.gun2Rot,7);
                     this.bitscreen.paint(this.lvlOb.gun1X + this.arena.x,this.lvlOb.gun1Y + this.arena.y,true,"aimer0");
                     this.bitscreen.paint(this.lvlOb.gun2X + this.arena.x,this.lvlOb.gun2Y + this.arena.y,true,"aimer0");
                     if(this.fc % 5 == 0)
                     {
                        this.createEffect(this.lvlOb.gun1X,this.lvlOb.gun1Y,"explosionSmall");
                        this.createEffect(this.lvlOb.gun2X,this.lvlOb.gun2Y,"explosionSmall");
                        SH.playSound(UT.randEl([S_magnum1,S_magnum2,S_magnum3]));
                     }
                     if(this.fc % 10 != 0)
                     {
                        break;
                     }
                     if(UT.getDist(this.lvlOb.gun1X,this.lvlOb.gun1Y,this.player.x,this.player.y - 40) < 75)
                     {
                        this.player.status.damage(Stats_Guns.getDamageAtLevel("mechgun",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechgun"],{},true);
                     }
                     if(UT.getDist(this.lvlOb.gun2X,this.lvlOb.gun2Y,this.player.x,this.player.y - 40) >= 75)
                     {
                        break;
                     }
                     this.player.status.damage(Stats_Guns.getDamageAtLevel("mechgun",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechgun"],{},true);
                     break;
                  }
                  break;
               case 5:
                  if(this.fc % 13 == 0)
                  {
                     this.arena.setShake(0,1);
                  }
                  if(this.fc % (30 * 2) == 0)
                  {
                     this.arena.setShake(0,3);
                  }
                  if(!this.gameEnded)
                  {
                     this.bg1.mc_darkness.visible = false;
                     ++this.lvlOb.hazardTimer;
                     if(this.lvlOb.hazardTimer >= Number(this.lvlOb.hazardTimeLimit) * 30)
                     {
                        if(this.lvlOb.activeTimer == 0)
                        {
                           this.lvlOb.hazardType = UT.irand(1,3);
                           this.lvlOb.activeTimer = 6 * 30;
                           SH.playSound(S_Hazard);
                           if(this.lvlOb.hazardType > 2)
                           {
                              this.hud.gotoFrame("hazard3");
                              this.arena.mc_laser.play();
                              SH.playSound(S_Laser);
                           }
                           else
                           {
                              this.hud.gotoFrame("hazard" + this.lvlOb.hazardType);
                              this.arena["mc_missile" + this.lvlOb.hazardType].play();
                           }
                        }
                        --this.lvlOb.activeTimer;
                        if(this.lvlOb.activeTimer < 4 * 30)
                        {
                           _loc7_ = this.lvlOb.hazardType;
                           switch(1 !== _loc7_ ? (2 !== _loc7_ ? 2 : 1) : 0)
                           {
                              case 0:
                                 if(this.fc % 60 == 0)
                                 {
                                    this.playScreenSound(this.lvlOb.rocket.shotSound,922,911);
                                    this.createArenaBullet(922,911,-20,30,this.lvlOb.rocket);
                                 }
                                 if(this.fc % 60 == 5)
                                 {
                                    this.playScreenSound(this.lvlOb.rocket.shotSound,857,896);
                                    this.createArenaBullet(857,896,-20,30,this.lvlOb.rocket);
                                 }
                                 if(this.fc % 60 != 10)
                                 {
                                    break;
                                 }
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,790,881);
                                 this.createArenaBullet(790,881,-20,30,this.lvlOb.rocket);
                                 break;
                              case 1:
                                 if(this.fc % 60 == 0)
                                 {
                                    this.playScreenSound(this.lvlOb.rocket.shotSound,1959,910);
                                    this.createArenaBullet(1959,910,-30,20,this.lvlOb.rocket);
                                 }
                                 if(this.fc % 60 == 5)
                                 {
                                    this.playScreenSound(this.lvlOb.rocket.shotSound,2019,896);
                                    this.createArenaBullet(2019,896,-30,20,this.lvlOb.rocket);
                                 }
                                 if(this.fc % 60 != 10)
                                 {
                                    break;
                                 }
                                 this.playScreenSound(this.lvlOb.rocket.shotSound,2085,880);
                                 this.createArenaBullet(2085,880,-30,20,this.lvlOb.rocket);
                                 break;
                           }
                        }
                        if(this.lvlOb.activeTimer == 1)
                        {
                           this.hud.gotoFrame("idle");
                           this.lvlOb.activeTimer = 0;
                           this.lvlOb.hazardTimer = 0;
                           this.lvlOb.hazardTimeLimit = UT.irand(10,20);
                        }
                     }
                     ++this.lvlOb.mechTimer;
                     if(this.lvlOb.mechTimer >= Number(this.lvlOb.mechTimeLimit) * 30)
                     {
                        this.lvlOb.mechType = UT.irand(1,3);
                        SH.playSound(S_Hazard);
                        _loc7_ = this.lvlOb.mechType;
                        switch(1 !== _loc7_ ? (2 === _loc7_ ? 1 : (3 !== _loc7_ ? 3 : 2)) : 0)
                        {
                           case 0:
                              this.hud.gotoFrame("mechStomp");
                              this.bg1.mc_mech.gotoAndPlay("stomp");
                              break;
                           case 1:
                              this.hud.gotoFrame("mechLaser");
                              this.bg1.mc_mech.gotoAndPlay("laser");
                              break;
                           case 2:
                              this.hud.gotoFrame("mechGun");
                              this.bg1.mc_mech.gotoAndPlay("gun");
                        }
                        this.lvlOb.mechTimer = 0;
                        this.lvlOb.mechTimeLimit = UT.irand(13,20);
                     }
                     if(this.lvlOb.useLaser)
                     {
                        this.lvlOb.laserX += (this.player.x - Number(this.lvlOb.laserX)) * 0.045;
                        this.lvlOb.laserY += (this.player.y - Number(this.lvlOb.laserY)) * 0.045;
                        if(this.fc % 2 == 0)
                        {
                           this.createEffect(this.lvlOb.laserX,this.lvlOb.laserY,"mechLaser");
                        }
                        if(this.fc % 5 == 0 && UT.getDist(this.lvlOb.laserX,this.lvlOb.laserY,this.player.x,this.player.y - 40) < 60)
                        {
                           this.player.status.damage(Stats_Guns.getDamageAtLevel("mechlaser",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechlaser"],{},true);
                        }
                     }
                     if(!this.lvlOb.useGun)
                     {
                        break;
                     }
                     this.lvlOb.gun1X += UT.xMoveToRot(this.lvlOb.gun1Rot,7);
                     this.lvlOb.gun1Y += UT.yMoveToRot(this.lvlOb.gun1Rot,7);
                     this.lvlOb.gun2X += UT.xMoveToRot(this.lvlOb.gun2Rot,7);
                     this.lvlOb.gun2Y += UT.yMoveToRot(this.lvlOb.gun2Rot,7);
                     this.bitscreen.paint(this.lvlOb.gun1X + this.arena.x,this.lvlOb.gun1Y + this.arena.y,true,"aimer0");
                     this.bitscreen.paint(this.lvlOb.gun2X + this.arena.x,this.lvlOb.gun2Y + this.arena.y,true,"aimer0");
                     if(this.fc % 5 == 0)
                     {
                        this.createEffect(this.lvlOb.gun1X,this.lvlOb.gun1Y,"explosionSmall");
                        this.createEffect(this.lvlOb.gun2X,this.lvlOb.gun2Y,"explosionSmall");
                        SH.playSound(UT.randEl([S_magnum1,S_magnum2,S_magnum3]));
                     }
                     if(this.fc % 10 != 0)
                     {
                        break;
                     }
                     if(UT.getDist(this.lvlOb.gun1X,this.lvlOb.gun1Y,this.player.x,this.player.y - 40) < 75)
                     {
                        this.player.status.damage(Stats_Guns.getDamageAtLevel("mechgun",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechgun"],{},true);
                     }
                     if(UT.getDist(this.lvlOb.gun2X,this.lvlOb.gun2Y,this.player.x,this.player.y - 40) >= 75)
                     {
                        break;
                     }
                     this.player.status.damage(Stats_Guns.getDamageAtLevel("mechgun",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["mechgun"],{},true);
                     break;
                  }
            }
            this.mapParticles.EnterFrame();
            this.arena.EnterFrame();
            this.physWorld.EnterFrame();
            _loc1_ = 0;
            while(_loc1_ < this.killstreaks.length)
            {
               this.killstreaks[_loc1_].EnterFrame();
               _loc1_++;
            }
            this.hud.EnterFrame();
            _loc1_ = 0;
            while(_loc1_ < this.units.length)
            {
               this.units[_loc1_].EnterFrame();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this.arena.pickups.length)
            {
               this.arena.pickups[_loc1_].EnterFrame();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this.bullets.length)
            {
               this.bullets[_loc1_].EnterFrame();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this.bullets.length)
            {
               if(this.bullets[_loc1_].remove)
               {
                  this.bullets.splice(_loc1_,1);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this.effects.length)
            {
               this.effects[_loc1_].EnterFrame();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this.effects.length)
            {
               if(this.effects[_loc1_].remove)
               {
                  this.effects.splice(_loc1_,1);
               }
               _loc1_++;
            }
            this.matchSettings.EnterFrame();
            this.radar.EnterFrame();
            this.water.EnterFrame();
            return;
         }
         this.hud.EnterFrame();
      }
      
      public function mechAction(param1:String) : void
      {
         var _loc2_:Number = NaN;
         if(!(!this.gameStarted || this.gameEnded || this.destroyed))
         {
            var _loc3_:* = param1;
            switch("spaceLaser" !== _loc3_ ? ("stomp" !== _loc3_ ? ("laserStart" === _loc3_ ? 2 : ("laserEnd" !== _loc3_ ? ("gunStart" !== _loc3_ ? ("gunEnd" === _loc3_ ? 5 : ("bgStomp" !== _loc3_ ? 7 : 6)) : 4) : 3)) : 1) : 0)
            {
               case 0:
                  this.playScreenSound(S_Laser,1550,1100);
                  break;
               case 1:
                  this.hud.gotoFrame("idle");
                  this.arena.setShake(5,10);
                  if(!this.player.mov.jumping)
                  {
                     this.player.status.damage(Stats_Guns.getDamageAtLevel("stomp",this.units[2].unitInfo.level),this.units[1],Stats_Guns.itemOb["stomp"],{
                        "hitX":this.player.x,
                        "hitY":this.player.y - 15
                     },false);
                  }
                  SH.playSound(S_rocketExplode);
                  SH.playSound(S_Mine1);
                  break;
               case 2:
                  this.lvlOb.useLaser = true;
                  this.lvlOb.laserX = this.player.x + UT.irand(-200,200);
                  this.lvlOb.laserY = this.player.y + UT.irand(-200,200);
                  SH.playSound(S_Laser);
                  break;
               case 3:
                  this.hud.gotoFrame("idle");
                  this.lvlOb.useLaser = false;
                  break;
               case 4:
                  this.lvlOb.useGun = true;
                  this.lvlOb.gun1X = this.player.x - 300;
                  _loc2_ = UT.irand(-250,250);
                  this.lvlOb.gun1Y = this.player.y + _loc2_ - 40;
                  this.lvlOb.gun2X = this.player.x + 300;
                  this.lvlOb.gun2Y = this.player.y - _loc2_ - 40;
                  this.lvlOb.gun1Rot = UT.getRotation(this.lvlOb.gun1X,this.lvlOb.gun1Y,this.lvlOb.gun2X,this.lvlOb.gun2Y);
                  this.lvlOb.gun2Rot = UT.getRotation(this.lvlOb.gun2X,this.lvlOb.gun2Y,this.lvlOb.gun1X,this.lvlOb.gun1Y);
                  break;
               case 5:
                  this.hud.gotoFrame("idle");
                  this.lvlOb.useGun = false;
                  break;
               case 6:
                  SH.playSound(S_Stomp);
                  this.arena.setShake(1,3);
            }
            return;
         }
      }
      
      private function createArenaBullet(param1:Number, param2:Number, param3:Number, param4:Number, param5:Stats_Guns) : void
      {
         this.createEffect(param1,param2,param5.effShoot);
         this.bullets.push(new param5.cls(this,this.units[1],UT.rand(param3,param4),param1,param2,0,param5));
      }
      
      public function onScreen(param1:Number, param2:Number, param3:uint = 0) : Boolean
      {
         var _loc4_:Number = param1 + this.arena.x;
         var _loc5_:Number = param2 + this.arena.y;
         return _loc4_ > 0 - param3 && _loc4_ < Main.WIDTH + param3 && _loc5_ > 0 - param3 && _loc5_ < Main.HEIGHT + param3;
      }
      
      public function playScreenSound(param1:*, param2:Number, param3:Number, param4:Boolean = false) : void
      {
         if(this.onScreen(param2,param3))
         {
            SH.playSound(param1,param4);
         }
      }
      
      public function createEffect(param1:Number, param2:Number, param3:String, param4:String = "idle", param5:Boolean = false) : void
      {
         if(!(!param5 && !this.onScreen(param1,param2,80)))
         {
            this.effects.push(new Effect(this,param1,param2,param3,param4,1));
            return;
         }
      }
      
      public function createEffectAtFrame(param1:Number, param2:Number, param3:String, param4:String = "idle", param5:uint = 1, param6:Boolean = false) : void
      {
         if(!(!param6 && !this.onScreen(param1,param2,80)))
         {
            this.effects.push(new Effect(this,param1,param2,param3,param4,param5));
            return;
         }
      }
      
      public function createParticle(param1:Number, param2:Number, param3:String, param4:uint, param5:Object, param6:String, param7:String = "idle", param8:uint = 0, param9:Boolean = false) : void
      {
         if(!(!param9 && !this.onScreen(param1,param2,300)))
         {
            this.effects.push(new Particle(this,param1,param2,param3,param4,param5,param6,param7,param8));
            return;
         }
      }
      
      public function createUnit(param1:*, param2:Number = 0, param3:Number = 0) : void
      {
         if(param2)
         {
            param1.x = param2;
         }
         if(param3)
         {
            param1.y = param3;
         }
         this.unitCont.addChild(param1);
         this.units.push(param1);
      }
      
      public function MouseDown() : void
      {
         this.player.MouseDown();
         this.hud.MouseDown();
      }
      
      public function RightMouseDown() : void
      {
         this.player.RightMouseDown();
      }
      
      public function MouseUp() : void
      {
         this.player.MouseUp();
         this.hud.MouseUp();
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
         this.player.KeyDown(param1);
      }
      
      public function KeyUp(param1:KeyboardEvent) : void
      {
         this.player.KeyUp(param1);
      }
      
      public function flashActivate() : void
      {
      }
      
      public function flashDeactivate() : void
      {
         if(!this.paused)
         {
            this.togglePause();
         }
         this.player.releaseKeys();
      }
      
      public function togglePause() : void
      {
         var _loc1_:uint = 0;
         if(!this.destroyed)
         {
            if(this.paused)
            {
               Main.STAGE.focus = Main.STAGE;
               this.paused = false;
               this.aimer.visible = true;
               _loc1_ = 0;
               while(_loc1_ < this.units.length)
               {
                  this.units[_loc1_].MC.play();
                  if(this.units[_loc1_].gun.curFrame != "idle")
                  {
                     this.units[_loc1_].MC.arm1.play();
                  }
                  _loc1_++;
               }
               this.hud.gotoFrame("idle");
            }
            else
            {
               this.paused = true;
               this.aimer.visible = false;
               _loc1_ = 0;
               while(_loc1_ < this.units.length)
               {
                  this.units[_loc1_].MC.stop();
                  this.units[_loc1_].MC.arm1.stop();
                  _loc1_++;
               }
               this.hud.gotoFrame("pause");
            }
            SD.saveGame();
            return;
         }
      }
      
      public function MouseWheel(param1:MouseEvent) : void
      {
         this.player.gun.swapGuns();
      }
      
      public function destroy() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         this.arena.destroy();
         this.physWorld.destroy();
         this.bitscreen.destroy();
         this.destroyed = true;
         if(this.hud.won)
         {
            if(MatchSettings.isCampaign && this.player.score.deaths == 0)
            {
               AGI.submitQuest("campaign_no_die");
            }
            if(MatchSettings.isCampaign && MatchSettings.caType == 1 && MatchSettings.caStage == 15)
            {
               Stats_Achievements.setAchievement("challenges");
            }
            if(SD.completeCamp.length >= 15 && SD.completeChal.length >= 15)
            {
               _loc1_ = 99;
               _loc2_ = 0;
               while(_loc2_ < 15)
               {
                  _loc1_ = Math.min(_loc1_,SD.completeCamp[_loc2_]);
                  _loc1_ = Math.min(_loc1_,SD.completeChal[_loc2_]);
                  _loc2_++;
               }
               if(_loc1_ == 2)
               {
                  AGI.submitQuest("all_missions_hard");
                  Stats_Achievements.setAchievement("hard");
               }
               if(_loc1_ == 3)
               {
                  Stats_Achievements.setAchievement("insane");
               }
            }
         }
         if(!(this.hud.won && MatchSettings.postCutFrames && Boolean(MatchSettings.postCutFrames.length)))
         {
            this.main.startClass(Menu);
         }
         else
         {
            this.main.startClass(Cutscene,{"type":"post"});
         }
      }
   }
}
