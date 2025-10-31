package
{
   import flash.events.KeyboardEvent;
   import flash.system.System;
   
   public class Player extends Unit
   {
       
      
      private var pressedUp:Boolean;
      
      private var sniperMode:Boolean;
      
      public function Player(param1:Game, param2:Stats_Classes)
      {
         super(param1,true,param2);
         MC.goto("idle");
         game.aimer.gotoAndStop(!this.sniperMode ? 1 : 2);
      }
      
      override public function spawn(param1:Number = 0, param2:Number = 0, param3:String = "", param4:Boolean = true) : void
      {
         game.hud.reset();
         unitSpawn(param1,param2,param3,param4);
         aimX = x + 200;
         aimY = y - 50;
         game.aimer.x = game.mouseX;
         game.aimer.y = game.mouseY;
         game.hud.setClassChange(false);
      }
      
      public function EnterFrame() : void
      {
         if(!dead)
         {
            MCfilters = [];
            if(!unitInfo.extra.noAim)
            {
               aimX += (game.arena.mouseX - aimX) * 0.5;
               aimY += (game.arena.mouseY - aimY) * 0.5;
            }
            if(mDown)
            {
               gun.shoot();
            }
            var _loc1_:Number = UT.getDist(x + MC.arm1.x,y + MC.arm1.y,game.arena.mouseX,game.arena.mouseY);
            _loc1_ *= _loc1_;
            _loc1_ *= 2;
            var _loc2_:Number = Math.sqrt(_loc1_ - _loc1_ * Math.cos(gun.dynRecoilMod * Math.PI / 180));
            if(!this.sniperMode)
            {
               game.aimer.line1.y = -_loc2_;
               game.aimer.line2.x = _loc2_;
               game.aimer.line3.y = _loc2_;
               game.aimer.line4.x = -_loc2_;
               game.aimer.circle.width = game.aimer.circle.height = _loc2_ * 2;
            }
            if(!unitInfo.extra.noAim)
            {
               game.aimer.x = game.mouseX;
               game.aimer.y = game.mouseY;
            }
            else
            {
               game.aimer.x = -1000;
               game.aimer.y = -1000;
            }
            UnitEnterFrame();
            return;
         }
         if(respawnTimer)
         {
            if(respawnTimer < 3 * 30)
            {
               game.hud.setRespawnText("再部署时间 " + Math.ceil(respawnTimer / 30));
            }
            --respawnTimer;
         }
         else
         {
            this.spawn();
         }
      }
      
      public function MouseDown() : void
      {
         if(!(!game.gameStarted || unitInfo.extra.noShoot || game.paused))
         {
            if(!(MatchSettings.isCampaign && MatchSettings.caStage == 1 && MatchSettings.caType == 0 && Stats_Campaign.sn < 6))
            {
               mDown = true;
            }
            return;
         }
      }
      
      public function RightMouseDown() : void
      {
         var _loc1_:* = SD.rightclick;
         switch(0 !== _loc1_ ? (1 !== _loc1_ ? (2 !== _loc1_ ? 3 : 2) : 1) : 0)
         {
            case 0:
               this.doKey(82);
               break;
            case 1:
               this.doKey(69);
               break;
            case 2:
               this.doKey(81);
         }
      }
      
      public function MouseUp() : void
      {
         mDown = false;
         gun.releaseMouse();
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
         this.doKey(param1.keyCode);
      }
      
      private function doKey(param1:uint) : void
      {
         var _loc2_:* = false;
         var _loc3_:uint = 0;
         if(!(!game.gameStarted || Boolean(status.sSpawn)))
         {
            var _loc4_:* = param1;
            switch(27 !== _loc4_ ? (80 !== _loc4_ ? (69 === _loc4_ ? 2 : (17 !== _loc4_ ? (67 !== _loc4_ ? (79 === _loc4_ ? 5 : (72 !== _loc4_ ? (76 !== _loc4_ ? (82 === _loc4_ ? 8 : (16 !== _loc4_ ? (81 !== _loc4_ ? (40 !== _loc4_ ? (83 === _loc4_ ? 12 : (37 !== _loc4_ ? (65 === _loc4_ ? 14 : (39 !== _loc4_ ? (68 === _loc4_ ? 16 : (38 !== _loc4_ ? (87 !== _loc4_ ? (32 === _loc4_ ? 19 : (49 !== _loc4_ ? (50 !== _loc4_ ? (187 === _loc4_ ? 22 : 23) : 21) : 20)) : 18) : 17)) : 15)) : 13)) : 11) : 10) : 9)) : 7) : 6)) : 4) : 3)) : 1) : 0)
            {
               case 0:
               case 1:
                  game.togglePause();
                  break;
               case 2:
               case 3:
                  if(dead)
                  {
                     break;
                  }
                  if(!game.paused)
                  {
                     useKillstreak();
                     break;
                  }
                  break;
               case 4:
                  if(Main.DEBUGMODE)
                  {
                     System.setClipboard(game.arena.mouseX + ", " + game.arena.mouseY);
                     break;
                  }
                  break;
               case 5:
                  game.hud.debug.y = game.hud.debug.y == -200 ? 0 : -200;
                  if(Main.DEBUGMODE)
                  {
                     _loc2_ = !game.arena.wallMC.visible;
                     game.arena.wallMC.visible = _loc2_;
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.spawns.length)
                     {
                        game.arena.spawns[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.spawnsT1.length)
                     {
                        game.arena.spawnsT1[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.spawnsT2.length)
                     {
                        game.arena.spawnsT2[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.waypoints.length)
                     {
                        game.arena.waypoints[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.waypoints.length)
                     {
                        game.arena.waypoints[_loc3_].showConnectors(_loc2_);
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.aiactions.length)
                     {
                        game.arena.aiactions[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     _loc3_ = 0;
                     while(_loc3_ < game.arena.physboxes.length)
                     {
                        game.arena.physboxes[_loc3_].visible = _loc2_;
                        _loc3_++;
                     }
                     game.hud.debug.y = _loc2_ ? 0 : -200;
                     break;
                  }
                  break;
               case 6:
                  if(Main.DEBUGMODE)
                  {
                     game.hud.visible = !game.hud.visible;
                     break;
                  }
                  break;
               case 7:
                  if(Main.DEBUGMODE)
                  {
                     SD.graphLights = !SD.graphLights;
                     game.arena.toggleLights();
                     break;
                  }
                  break;
               case 8:
                  if(!dead)
                  {
                     if(!game.paused)
                     {
                        gun.manualReload();
                        break;
                     }
                     break;
                  }
                  break;
               case 9:
               case 10:
                  if(!dead)
                  {
                     if(game.paused)
                     {
                        break;
                     }
                     if(MatchSettings.isCampaign && MatchSettings.caStage == 1 && MatchSettings.caType == 0)
                     {
                        if(Stats_Campaign.sn < 17)
                        {
                           break;
                        }
                        gun.swapGuns();
                        if(Stats_Campaign.sn == 17)
                        {
                           game.hud.gotoAndStop("idle");
                           ++Stats_Campaign.sn;
                           game.arena.changeWallFrame(Stats_Campaign.sn);
                           game.arena.mc_door3.gotoAndPlay("open");
                           break;
                        }
                        break;
                     }
                     gun.swapGuns();
                     break;
                  }
                  break;
               case 11:
               case 12:
                  keys |= DOWN;
                  break;
               case 13:
               case 14:
                  keys |= LEFT;
                  break;
               case 15:
               case 16:
                  keys |= RIGHT;
                  break;
               case 17:
               case 18:
               case 19:
                  if(!this.pressedUp)
                  {
                     if(game.paused)
                     {
                        break;
                     }
                     keys |= UP;
                     mov.doJump();
                     this.pressedUp = true;
                     break;
                  }
                  break;
               case 20:
                  if(Main.DEBUGMODE)
                  {
                     game.hud.addExp(Stats_Classes.getNextExp(SD.classSaves[SD.selClass].level));
                     break;
                  }
                  break;
               case 21:
                  if(Main.DEBUGMODE)
                  {
                     useKillstreak("",true);
                     break;
                  }
                  break;
               case 22:
                  if(Main.DEBUGMODE)
                  {
                     game.endGame(true);
                     break;
                  }
            }
            return;
         }
      }
      
      public function KeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:* = param1.keyCode;
         switch(38 !== _loc2_ ? (87 !== _loc2_ ? (32 !== _loc2_ ? (40 !== _loc2_ ? (83 !== _loc2_ ? (37 === _loc2_ ? 5 : (65 !== _loc2_ ? (39 === _loc2_ ? 7 : (68 !== _loc2_ ? 9 : 8)) : 6)) : 4) : 3) : 2) : 1) : 0)
         {
            case 0:
            case 1:
            case 2:
               if(!(keys & UP))
               {
                  break;
               }
               keys ^= UP;
               this.pressedUp = false;
               break;
            case 3:
            case 4:
               if(!(keys & DOWN))
               {
                  break;
               }
               keys ^= DOWN;
               break;
            case 5:
            case 6:
               if(!(keys & LEFT))
               {
                  break;
               }
               keys ^= LEFT;
               break;
            case 7:
            case 8:
               if(!(keys & RIGHT))
               {
                  break;
               }
               keys ^= RIGHT;
               break;
         }
      }
      
      public function releaseKeys() : void
      {
         if(keys & DOWN)
         {
            keys ^= DOWN;
         }
         if(keys & LEFT)
         {
            keys ^= LEFT;
         }
         if(keys & RIGHT)
         {
            keys ^= RIGHT;
         }
      }
   }
}
