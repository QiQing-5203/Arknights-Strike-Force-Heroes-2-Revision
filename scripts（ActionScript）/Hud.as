package
{
   import fl.controls.CheckBox;
   import fl.controls.RadioButton;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class Hud extends MovieClip
   {
       
      
      public var cc1:MovieClip;
      
      public var rd_qualM:RadioButton;
      
      public var cc2:MovieClip;
      
      public var txt_changeclass:TextField;
      
      public var txt_respawn:TextField;
      
      public var txt_flags:TextField;
      
      public var txt_nextsong:TextField;
      
      public var cb_voices:CheckBox;
      
      public var rd_bloodH:RadioButton;
      
      public var rd_qualL:RadioButton;
      
      public var logo1:Logo_LogoBox;
      
      public var debug:MovieClip;
      
      public var cc3:MovieClip;
      
      public var txt_streakready:TextField;
      
      public var txt_classname:TextField;
      
      public var txt_spare:TextField;
      
      public var logo2:Logo_LogoBox;
      
      public var cc4:MovieClip;
      
      public var mc_streak:MovieClip;
      
      public var rd_partM:RadioButton;
      
      public var cc5:MovieClip;
      
      public var txt_ammo:TextField;
      
      public var cb_sound:CheckBox;
      
      public var txt_quit:TextField;
      
      public var rd_partL:RadioButton;
      
      public var flag1:MovieClip;
      
      public var hud_bg:MovieClip;
      
      public var rd_qualH:RadioButton;
      
      public var txt_ar:TextField;
      
      public var flag2:MovieClip;
      
      public var txt_feed:TextField;
      
      public var bloodyscreen:MovieClip;
      
      public var flag3:MovieClip;
      
      public var txt_win:TextField;
      
      public var expholder:MovieClip;
      
      public var rd_partH:RadioButton;
      
      public var mc_streakarrow:DownArrow;
      
      public var rd_rightclick2:RadioButton;
      
      public var cb_light:CheckBox;
      
      public var mc_song:MovieClip;
      
      public var mc_speak:MovieClip;
      
      public var txt_curgun:TextField;
      
      public var rd_rightclick0:RadioButton;
      
      public var txt_hp:TextField;
      
      public var rd_rightclick1:RadioButton;
      
      public var cb_music:CheckBox;
      
      public var txt_funds:TextField;
      
      public var scorebar:MovieClip;
      
      public var txt_level:TextField;
      
      public var barCont:MovieClip;
      
      public var txt_song:TextField;
      
      public var txt_resume:TextField;
      
      public var cb_bloody:CheckBox;
      
      public var rd_bloodL:RadioButton;
      
      public var cb_shake:CheckBox;
      
      public var rd_bloodM:RadioButton;
      
      public var __setPropDict:Dictionary;
      
      private var game:Game;
      
      private var classChange:Boolean;
      
      private var pauseButs:Array;
      
      public var won:Boolean;
      
      public var msgForce:Boolean;
      
      public var msgTimer:Number;
      
      public var respawnTimer:uint;
      
      private var feeds:Array;
      
      private var txtFmt:TextFormat;
      
      private var curSong;
      
      public function Hud(param1:Game)
      {
         this.__setPropDict = new Dictionary(true);
         super();
         addFrameScript(17,this.frame18,76,this.frame77,106,this.frame107,107,this.frame108,257,this.frame258);
         this.game = param1;
         var _loc2_:uint = 1;
         while(_loc2_ <= 5)
         {
            this["cc" + _loc2_].gotoAndStop(Stats_Classes.getClass(_loc2_).icon);
            _loc2_++;
         }
         gotoAndPlay("start");
         this.reset();
         this.scorebar.modetxt.text = Stats_Misc.getGameMode(MatchSettings.useMode).name;
         this.feeds = [];
         this.txtFmt = new TextFormat();
         this.processFeed();
         if(MatchSettings.useMode != "dom")
         {
            if(MatchSettings.useMode != "ctf")
            {
               this.flag1.visible = false;
               this.flag2.visible = false;
               this.flag3.visible = false;
            }
            else
            {
               this.flag2.visible = false;
               this.flag1.gotoAndStop(this.game.arena.flag1.team * 5);
               this.flag3.gotoAndStop(this.game.arena.flag2.team * 5);
               this.flag1.txt_letter.text = "";
               this.flag3.txt_letter.text = "";
            }
         }
         else
         {
            this.flag1.txt_letter.text = "A";
            this.flag2.txt_letter.text = "B";
            this.flag3.txt_letter.text = "C";
         }
         this.txt_flags.text = "";
         if(!MatchSettings.isCampaign && Boolean(SH.songList.length))
         {
            this.curSong = UT.randEl(SH.songList);
            SH.playMusic(this.curSong);
         }
         if(MatchSettings.isCampaign && MatchSettings.useSong)
         {
            SH.playMusic(MatchSettings.useSong);
         }
         this.mc_streakarrow.visible = false;
      }
      
      public function reset() : void
      {
         this.txt_respawn.text = "";
         this.setClassChange();
      }
      
      public function setClassChange(param1:* = false) : void
      {
         this.classChange = param1;
         this.txt_changeclass.visible = this.classChange;
         var _loc2_:uint = 1;
         while(_loc2_ <= 5)
         {
            this["cc" + _loc2_].visible = this.classChange;
            _loc2_++;
         }
      }
      
      public function setGuns(param1:Stats_Guns, param2:Stats_Guns) : void
      {
         this.txt_curgun.text = param1.name;
      }
      
      public function addExp(param1:uint = 0) : void
      {
         var _loc2_:uint = 0;
         if(this.game.player)
         {
            SD.classSaves[this.game.player.unitInfo.classNum].funds += param1 * Stats_Misc.priceMod;
            if(SD.classSaves[this.game.player.unitInfo.classNum].funds > 2147483647)
            {
               SD.classSaves[this.game.player.unitInfo.classNum].funds = 2147483647;
            }
            this.txt_funds.text = "L" + UT.addNumCommas(SD.classSaves[this.game.player.unitInfo.classNum].funds);
            if(SD.classSaves[this.game.player.unitInfo.classNum].level != 90)
            {
               SD.classSaves[this.game.player.unitInfo.classNum].exp += param1;
               this.expholder.bar_exp.width = Number(SD.classSaves[this.game.player.unitInfo.classNum].exp) / Stats_Classes.getNextExp(SD.classSaves[this.game.player.unitInfo.classNum].level) * 510;
               if(SD.classSaves[this.game.player.unitInfo.classNum].exp >= Stats_Classes.getNextExp(SD.classSaves[this.game.player.unitInfo.classNum].level))
               {
                  SD.classSaves[this.game.player.unitInfo.classNum].exp = 0;
                  ++SD.classSaves[this.game.player.unitInfo.classNum].level;
                  SH.playSound(S_Powerup,true);
                  SH.playSound(S_rocketExplode);
                  this.game.arena.setShake(10,10);
                  _loc2_ = 0;
                  while(_loc2_ < 20)
                  {
                     this.game.createParticle(this.game.player.x + UT.rand(-10,10),this.game.player.y + UT.rand(-40,0),"spark",20,{
                        "xSpd":UT.rand(-5,5),
                        "ySpd":UT.rand(-8,-3)
                     },"ember");
                     _loc2_++;
                  }
                  this.game.createEffect(this.game.player.x,this.game.player.y - 100,"levelup","idle",true);
                  this.game.createParticle(this.game.player.x,this.game.player.y - 60,"slowText",0,null,"bigText","levelup");
                  this.addCustomFeed(this.game.player,"levelup");
                  this.txt_level.text = "lvl: " + SD.classSaves[this.game.player.unitInfo.classNum].level;
                  this.game.player.txt_level.text = SD.classSaves[this.game.player.unitInfo.classNum].level;
                  this.game.hud.setRespawnText("干员已晋升！" + Stats_Classes.getLevelUnlock(SD.classSaves[this.game.player.unitInfo.classNum].level,this.game.player.unitInfo.classNum),16776960);
                  if(SD.classSaves[this.game.player.unitInfo.classNum].level == 5)
                  {
                     AGI.submitQuest("reach_lvl_5");
                  }
                  if(SD.getSelCass(1).level >= 10 && SD.getSelCass(2).level >= 10 && SD.getSelCass(3).level >= 10 && SD.getSelCass(4).level >= 10 && SD.getSelCass(5).level >= 10)
                  {
                     AGI.submitQuest("lvl_10_all_soldiers");
                  }
                  if(SD.classSaves[this.game.player.unitInfo.classNum].level >= 90)
                  {
                     AGI.submitQuest("reach_lvl_50");
                  }
                  this.addExp(0);
               }
               return;
            }
            this.expholder.bar_exp.width = 510;
            Stats_Achievements.setAchievement("level50");
            return;
         }
      }
      
      public function setAmmoCount(param1:Stats_Guns) : void
      {
         if(!param1.extra.noAmmo)
         {
            this.txt_ammo.text = "" + Math.ceil(param1.clipAmmo);
            if(!param1.extra.noClip)
            {
               this.txt_spare.text = "/" + param1.spareAmmo;
            }
            else
            {
               this.txt_spare.text = "/ -";
            }
         }
         else
         {
            this.txt_ammo.text = "- ";
            this.txt_spare.text = "/ -";
         }
      }
      
      public function InitPause() : void
      {
         this.pauseButs = [this.rd_qualL,this.rd_qualM,this.rd_qualH,this.rd_partL,this.rd_partM,this.rd_partH,this.cb_light,this.cb_music,this.cb_sound,this.cb_voices,this.cb_shake,this.cb_bloody,this.rd_bloodL,this.rd_bloodM,this.rd_bloodH,this.rd_rightclick0,this.rd_rightclick1,this.rd_rightclick2];
         if(SD.graphQual == 0)
         {
            this.rd_qualL.selected = true;
         }
         if(SD.graphQual == 1)
         {
            this.rd_qualM.selected = true;
         }
         if(SD.graphQual == 2)
         {
            this.rd_qualH.selected = true;
         }
         if(SD.graphPart == 0)
         {
            this.rd_partL.selected = true;
         }
         if(SD.graphPart == 1)
         {
            this.rd_partM.selected = true;
         }
         if(SD.graphPart == 2)
         {
            this.rd_partH.selected = true;
         }
         this.cb_light.selected = SD.graphLights;
         this.cb_music.selected = SD.music;
         this.cb_sound.selected = SD.sound;
         this.cb_voices.selected = SD.voices;
         this.cb_shake.selected = SD.screenShake;
         this.cb_bloody.selected = SD.screenBlood;
         if(SD.blood == 0)
         {
            this.rd_bloodL.selected = true;
         }
         if(SD.blood == 1)
         {
            this.rd_bloodM.selected = true;
         }
         if(SD.blood == 2)
         {
            this.rd_bloodH.selected = true;
         }
         this["rd_rightclick" + SD.rightclick].selected = true;
         this.game.matchSettings.showScores(this.barCont);
         if(!MatchSettings.isCampaign && Boolean(SH.songList.length))
         {
            this.txt_song.alpha = 0.5;
            this.txt_nextsong.alpha = 0.5;
            this.txt_song.text = "背景音乐：" + SH.songNames[SH.songList.indexOf(this.curSong)];
         }
         else
         {
            this.txt_song.visible = false;
            this.txt_nextsong.visible = false;
            this.mc_song.visible = false;
         }
      }
      
      public function InitEnd() : void
      {
         this.txt_respawn.text = "";
         this.txt_win.text = !this.won ? "MISSION FAILED" : "MISSION ACCOMPLISHED";
         this.txt_win.textColor = !this.won ? 16764057 : 13434879;
         this.game.matchSettings.showScores(this.barCont);
         if(MatchSettings.isCampaign && this.won)
         {
            if(MatchSettings.caType == 0)
            {
               if(SD.completeCamp[MatchSettings.caStage - 1] < MatchSettings.caDiffMode + 1)
               {
                  SD.completeCamp[MatchSettings.caStage - 1] = MatchSettings.caDiffMode + 1;
               }
               if(MatchSettings.caStage == SD.completeCamp.length && SD.completeCamp.length < 15)
               {
                  SD.completeCamp.push(0);
               }
            }
            if(MatchSettings.caType == 1)
            {
               if(SD.completeChal[MatchSettings.caStage - 1] < MatchSettings.caDiffMode + 1)
               {
                  SD.completeChal[MatchSettings.caStage - 1] = MatchSettings.caDiffMode + 1;
               }
               if(MatchSettings.caStage == SD.completeChal.length && SD.completeChal.length < 15)
               {
                  SD.completeChal.push(0);
               }
            }
         }
         SD.saveGame();
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         if(this.curSong && Boolean(this.txt_nextsong))
         {
            this.txt_nextsong.alpha = !this.txt_nextsong.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
         }
         if(!this.game.paused)
         {
            if(this.classChange)
            {
               _loc1_ = 1;
               while(_loc1_ <= 5)
               {
                  if(_loc1_ != SD.selClass)
                  {
                     if(!this["cc" + _loc1_].hitTestPoint(this.game.mouseX,this.game.mouseY,false))
                     {
                        this["cc" + _loc1_].alpha = 0.3;
                     }
                     else
                     {
                        this["cc" + _loc1_].alpha = 0.6;
                     }
                  }
                  else
                  {
                     this["cc" + _loc1_].alpha = 1;
                  }
                  _loc1_++;
               }
            }
            if(this.msgTimer == 1)
            {
               this.mc_speak.gotoAndPlay("close");
               this.msgForce = false;
            }
            if(this.msgTimer)
            {
               --this.msgTimer;
            }
            if(this.respawnTimer == 1)
            {
               this.txt_respawn.text = "";
            }
            if(this.respawnTimer)
            {
               --this.respawnTimer;
            }
            _loc1_ = 0;
            while(_loc1_ < this.feeds.length)
            {
               --this.feeds[_loc1_].timer;
               if(!this.feeds[_loc1_].timer)
               {
                  this.feeds.pop();
                  this.processFeed();
               }
               _loc1_++;
            }
            if(MatchSettings.useMode == "dom")
            {
               _loc2_ = 0;
               _loc1_ = 0;
               while(_loc1_ < this.game.arena.holdpoints.length)
               {
                  if(this.game.arena.holdpoints[_loc1_].curTeam == 1)
                  {
                     _loc2_++;
                  }
                  this["flag" + (_loc1_ + 1)].gotoAndStop(this.game.arena.holdpoints[_loc1_].curTeam + 1);
                  _loc1_++;
               }
               this.txt_flags.text = _loc2_ + "占领值 " + (_loc2_ == 1 ? "" : "") + " / 3 秒";
            }
            else if(MatchSettings.useMode == "ctf")
            {
               this.txt_flags.text = "";
               if(!this.game.arena.flag1.unitCaptured)
               {
                  this.flag1.gotoAndStop(this.game.arena.flag1.team * 5);
                  this.flag1.txt_letter.text = "";
               }
               else
               {
                  this.flag1.gotoAndStop(this.game.arena.flag1.team * 5 + 1);
                  this.flag1.txt_letter.text = this.game.arena.flag1.team != 1 ? "!" : "?";
                  if(this.game.arena.flag1.team == 1)
                  {
                     this.txt_flags.text = "我方货物已被夺取！";
                  }
               }
               if(!this.game.arena.flag2.unitCaptured)
               {
                  this.flag3.gotoAndStop(this.game.arena.flag2.team * 5);
                  this.flag3.txt_letter.text = "";
               }
               else
               {
                  this.flag3.gotoAndStop(this.game.arena.flag2.team * 5 + 1);
                  this.flag3.txt_letter.text = this.game.arena.flag2.team != 1 ? "!" : "?";
                  if(this.game.arena.flag2.team == 1)
                  {
                     this.txt_flags.text = "我方货物已被夺取！";
                  }
               }
            }
            return;
         }
         this.txt_resume.alpha = !this.txt_resume.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
         this.txt_quit.alpha = !this.txt_quit.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
      }
      
      public function EndGame() : void
      {
         this.game.destroy();
      }
      
      public function MouseUp() : void
      {
         if(this.game.paused)
         {
            var _loc1_:uint = 0;
            while(_loc1_ < this.pauseButs.length)
            {
               this.pauseButs[_loc1_].enabled = true;
               _loc1_++;
            }
            return;
         }
      }
      
      public function MouseDown() : void
      {
         var _loc1_:uint = 0;
         if(!this.game.paused)
         {
            if(this.classChange)
            {
               _loc1_ = 1;
               while(_loc1_ <= 5)
               {
                  if(this["cc" + _loc1_].hitTestPoint(this.game.mouseX,this.game.mouseY,false))
                  {
                     SD.selClass = _loc1_;
                  }
                  _loc1_++;
               }
            }
            return;
         }
         _loc1_ = 0;
         for(; _loc1_ < this.pauseButs.length; _loc1_++)
         {
            if(!this.pauseButs[_loc1_].hitTestPoint(mouseX,mouseY,false))
            {
               continue;
            }
            if(this.pauseButs[_loc1_].name.charAt(0) != "r")
            {
               this.pauseButs[_loc1_].enabled = false;
               this.pauseButs[_loc1_].selected = !this.pauseButs[_loc1_].selected;
            }
            else
            {
               this.pauseButs[_loc1_].selected = true;
            }
            var _loc2_:* = this.pauseButs[_loc1_].name;
            switch("rd_qualL" !== _loc2_ ? ("rd_qualM" !== _loc2_ ? ("rd_qualH" === _loc2_ ? 2 : ("rd_partL" !== _loc2_ ? ("rd_partM" === _loc2_ ? 4 : ("rd_partH" !== _loc2_ ? ("cb_light" === _loc2_ ? 6 : ("cb_music" !== _loc2_ ? ("cb_sound" !== _loc2_ ? ("cb_voices" !== _loc2_ ? ("cb_shake" === _loc2_ ? 10 : ("cb_bloody" !== _loc2_ ? ("rd_bloodL" === _loc2_ ? 12 : ("rd_bloodM" !== _loc2_ ? ("rd_bloodH" !== _loc2_ ? ("rd_rightclick0" === _loc2_ ? 15 : ("rd_rightclick1" !== _loc2_ ? ("rd_rightclick2" !== _loc2_ ? 18 : 17) : 16)) : 14) : 13)) : 11)) : 9) : 8) : 7)) : 5)) : 3)) : 1) : 0)
            {
               case 0:
                  SD.graphQual = 0;
                  Main.STAGE.quality = "low";
                  break;
               case 1:
                  SD.graphQual = 1;
                  Main.STAGE.quality = "medium";
                  break;
               case 2:
                  SD.graphQual = 2;
                  Main.STAGE.quality = "high";
                  break;
               case 3:
                  SD.graphPart = 0;
                  break;
               case 4:
                  SD.graphPart = 1;
                  break;
               case 5:
                  SD.graphPart = 2;
                  break;
               case 6:
                  SD.graphLights = this.cb_light.selected;
                  this.game.arena.toggleLights();
                  break;
               case 7:
                  SD.music = this.cb_music.selected;
                  break;
               case 8:
                  SD.sound = this.cb_sound.selected;
                  break;
               case 9:
                  SD.voices = this.cb_voices.selected;
                  break;
               case 10:
                  SD.screenShake = this.cb_shake.selected;
                  break;
               case 11:
                  SD.screenBlood = this.cb_bloody.selected;
                  this.bloodyscreen.gotoAndStop(!SD.screenBlood ? 2 : 1);
                  break;
               case 12:
                  SD.blood = 0;
                  break;
               case 13:
                  SD.blood = 1;
                  break;
               case 14:
                  SD.blood = 2;
                  break;
               case 15:
                  SD.rightclick = 0;
                  break;
               case 16:
                  SD.rightclick = 1;
                  break;
               case 17:
                  SD.rightclick = 2;
                  break;
            }
         }
         if(!this.txt_resume.hitTestPoint(this.game.mouseX,this.game.mouseY,false))
         {
            if(this.txt_quit.hitTestPoint(this.game.mouseX,this.game.mouseY,false))
            {
               if(this.txt_quit.text != "退出")
               {
                  if(this.txt_quit.text == "取消")
                  {
                     this.txt_resume.text = "返回";
                     this.txt_quit.text = "退出";
                  }
               }
               else
               {
                  this.txt_resume.text = "确认退出";
                  this.txt_quit.text = "取消";
               }
            }
         }
         else if(this.txt_resume.text == "返回")
         {
            this.game.togglePause();
         }
         else if(this.txt_resume.text == "确认退出")
         {
            this.game.destroy();
         }
         if(this.curSong && this.txt_nextsong.visible && this.txt_nextsong.hitTestPoint(mouseX,mouseY,false))
         {
            this.curSong = UT.getNextEl(this.curSong,true,SH.songList);
            SH.playMusic(this.curSong);
            this.txt_song.text = "背景音乐：" + SH.songNames[SH.songList.indexOf(this.curSong)];
         }
      }
      
      public function setScoreBar(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.scorebar.scorebar1.barfade.gotoAndStop(param1 + (param1 != 0 ? 2 : 1));
         this.scorebar.scorebar1.bar.gotoAndStop(param1 + (param1 != 0 ? 2 : 1));
         this.scorebar.scorebar2.barfade.gotoAndStop(param3 + 2);
         this.scorebar.scorebar2.bar.gotoAndStop(param3 + 2);
         this.scorebar.scorebar1.bar.width = param2 / MatchSettings.useScore * 125;
         this.scorebar.scorebar2.bar.width = param4 / MatchSettings.useScore * 125;
         this.scorebar.scorebar1.cap.x = this.scorebar.scorebar1.bar.x + this.scorebar.scorebar1.bar.width;
         this.scorebar.scorebar2.cap.x = this.scorebar.scorebar2.bar.x + this.scorebar.scorebar2.bar.width;
         this.scorebar.scoretxt1.text = "> " + param2;
         this.scorebar.scoretxt2.text = "" + param4;
      }
      
      public function startGame() : void
      {
         this.game.startGame();
      }
      
      public function setRespawnText(param1:String, param2:uint = 16777215) : void
      {
         this.txt_respawn.text = param1;
         this.txt_respawn.textColor = param2;
         this.respawnTimer = 3 * 30;
      }
      
      public function setMsg(param1:*, param2:String, param3:uint = 0, param4:Boolean = false, param5:* = null) : void
      {
         var _loc6_:uint = 0;
         if(this.msgForce && !param4)
         {
            return;
         }
         if(param1 is String)
         {
            _loc6_ = 0;
            while(_loc6_ < this.game.units.length)
            {
               if(this.game.units[_loc6_] != this.game.player)
               {
                  if(this.game.units[_loc6_].name == param1)
                  {
                     param1 = this.game.units[_loc6_];
                     break;
                  }
               }
               _loc6_++;
            }
            if(param1 is String)
            {
               return;
            }
         }
         this.mc_speak.gotoAndPlay("open");
         this.mc_speak.head.gotoAndStop(param1.MC.head.currentFrame);
         if(this.mc_speak.head.camo)
         {
            this.mc_speak.head.camo.gotoAndStop(param1.unitInfo.camo);
         }
         this.mc_speak.txt_name.text = param1.name;
         this.mc_speak.txt_desc.text = param2;
         this.msgForce = param4;
         if(!param5)
         {
            if(!param3)
            {
               param3 = 4;
            }
         }
         else
         {
            param3 = SH.playVoice(param5);
            trace("Voice length:",param3);
            if(param3 < 2)
            {
               param3 = 2;
            }
            param3 += 1.5;
            trace("Final Voice length:",param3);
         }
         this.msgTimer = param3 * 30;
      }
      
      public function setCharMsg(param1:String, param2:uint, param3:uint, param4:String, param5:String, param6:uint = 4, param7:Boolean = false, param8:* = null) : void
      {
         if(this.msgForce && !param7)
         {
            return;
         }
         this.mc_speak.gotoAndPlay("open");
         this.mc_speak.head.gotoAndStop(Stats_Classes.getClass(Stats_Classes.classNums.indexOf(param1)).startFrame + param2);
         if(this.mc_speak.head.camo)
         {
            this.mc_speak.head.camo.gotoAndStop(param3);
         }
         this.mc_speak.txt_name.text = param4;
         this.mc_speak.txt_desc.text = param5;
         this.msgForce = param7;
         if(!param8)
         {
            if(!param6)
            {
               param6 = 4;
            }
         }
         else
         {
            if((param6 = SH.playVoice(param8)) < 1)
            {
               param6 = 1;
            }
            param6 += 1.5;
         }
         this.msgTimer = param6 * 30;
      }
      
      public function setMsgRandomTeammate(param1:uint, param2:String) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         do
         {
            _loc3_ = UT.randEl(this.game.units);
            if(++_loc4_ == 20)
            {
               _loc3_ = this.game.player;
               break;
            }
         }
         while(_loc3_.team != param1 || _loc3_ == this.game.player);
         
         this.setMsg(_loc3_,param2,4);
      }
      
      public function addCustomFeed(param1:*, param2:String) : void
      {
         var _loc3_:* = param2;
         switch("levelup" !== _loc3_ ? ("flag" === _loc3_ ? 1 : ("jug" !== _loc3_ ? ("holdpoint" === _loc3_ ? 3 : 4) : 2)) : 0)
         {
            case 0:
               this.feeds.unshift({
                  "txt":[param1.name,"已获得晋升！"],
                  "col":[this.getUnitColour(param1),16776960],
                  "timer":90
               });
               break;
            case 1:
               this.feeds.unshift({
                  "txt":[param1.name + "已成功夺取" + (param1.team != 1 ? "我方" : "敌方") + "货物！"],
                  "col":[this.getUnitColour(param1)],
                  "timer":90
               });
               break;
            case 2:
               this.feeds.unshift({
                  "txt":[param1.name + "受到了活性源石刺激！"],
                  "col":[this.getUnitColour(param1)],
                  "timer":90
               });
               break;
            case 3:
               this.feeds.unshift({
                  "txt":[(param1.team != 1 ? "敌方" : "我方") + "单位夺取了一个战区！"],
                  "col":[this.getUnitColour(param1)],
                  "timer":90
               });
         }
         this.processFeed();
      }
      
      public function addKillstreakFeed(param1:*, param2:Stats_Streaks) : void
      {
         this.feeds.unshift({
            "txt":[param1.name," 执行了御敌指令 ",param2.name],
            "col":[this.getUnitColour(param1),13421772,13434879],
            "timer":90
         });
         this.processFeed();
      }
      
      public function addKillFeed(param1:*, param2:*, param3:Stats_Guns) : void
      {
         var _loc4_:uint = this.getUnitColour(param2);
         var _loc5_:uint = this.getUnitColour(param1);
         if(param1 != param2)
         {
            this.feeds.unshift({
               "txt":[param2.name," [" + param3.name + "] ",param1.name],
               "col":[_loc4_,13421772,_loc5_],
               "timer":90
            });
            this.processFeed();
            return;
         }
         this.feeds.unshift({
            "txt":["鉴 定 完 毕 系 自 杀"," [" + param3.name + "] ",param2.name],
            "col":[16751103,13421772,_loc4_],
            "timer":90
         });
         this.processFeed();
      }
      
      public function processFeed() : void
      {
         var _loc1_:uint = 0;
         var _loc3_:uint = 0;
         if(this.feeds.length > 13)
         {
            this.feeds.pop();
         }
         this.txt_feed.text = "";
         _loc1_ = 0;
         while(_loc1_ < this.feeds.length)
         {
            this.txt_feed.text += this.feeds[_loc1_].txt.join("") + "\n";
            _loc1_++;
         }
         var _loc2_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < this.feeds.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.feeds[_loc1_].txt.length)
            {
               this.txtFmt.color = this.feeds[_loc1_].col[_loc3_];
               this.txt_feed.setTextFormat(this.txtFmt,_loc2_,_loc2_ + this.feeds[_loc1_].txt[_loc3_].length + 1);
               _loc2_ += this.feeds[_loc1_].txt[_loc3_].length;
               _loc3_++;
            }
            _loc2_ += 1;
            _loc1_++;
         }
      }
      
      public function getUnitColour(param1:*) : uint
      {
         return !param1.human ? (param1.team != 1 ? 16737792 : 6724095) : 10079487;
      }
      
      public function gotoFrame(param1:*) : void
      {
         if(!this.game.gameEnded)
         {
            gotoAndStop(param1);
         }
      }
      
      public function setDebug(param1:uint, param2:String) : void
      {
         this.debug["debug" + param1].text = param2;
      }
      
      function __setProp_rd_qualL_() : *
      {
         if(this.__setPropDict[this.rd_qualL] == undefined || int(this.__setPropDict[this.rd_qualL]) != 18)
         {
            this.__setPropDict[this.rd_qualL] = 18;
            try
            {
               this.rd_qualL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualL.enabled = true;
            this.rd_qualL.groupName = "qualGroup";
            this.rd_qualL.label = "";
            this.rd_qualL.labelPlacement = "left";
            this.rd_qualL.selected = false;
            this.rd_qualL.value = "";
            this.rd_qualL.visible = true;
            try
            {
               this.rd_qualL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_qualH_() : *
      {
         if(this.__setPropDict[this.rd_qualH] == undefined || int(this.__setPropDict[this.rd_qualH]) != 18)
         {
            this.__setPropDict[this.rd_qualH] = 18;
            try
            {
               this.rd_qualH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualH.enabled = true;
            this.rd_qualH.groupName = "qualGroup";
            this.rd_qualH.label = "";
            this.rd_qualH.labelPlacement = "left";
            this.rd_qualH.selected = false;
            this.rd_qualH.value = "";
            this.rd_qualH.visible = true;
            try
            {
               this.rd_qualH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_qualM_() : *
      {
         if(this.__setPropDict[this.rd_qualM] == undefined || int(this.__setPropDict[this.rd_qualM]) != 18)
         {
            this.__setPropDict[this.rd_qualM] = 18;
            try
            {
               this.rd_qualM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualM.enabled = true;
            this.rd_qualM.groupName = "qualGroup";
            this.rd_qualM.label = "";
            this.rd_qualM.labelPlacement = "left";
            this.rd_qualM.selected = false;
            this.rd_qualM.value = "";
            this.rd_qualM.visible = true;
            try
            {
               this.rd_qualM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partL_() : *
      {
         if(this.__setPropDict[this.rd_partL] == undefined || int(this.__setPropDict[this.rd_partL]) != 18)
         {
            this.__setPropDict[this.rd_partL] = 18;
            try
            {
               this.rd_partL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partL.enabled = true;
            this.rd_partL.groupName = "partGroup";
            this.rd_partL.label = "";
            this.rd_partL.labelPlacement = "left";
            this.rd_partL.selected = false;
            this.rd_partL.value = "";
            this.rd_partL.visible = true;
            try
            {
               this.rd_partL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partH_() : *
      {
         if(this.__setPropDict[this.rd_partH] == undefined || int(this.__setPropDict[this.rd_partH]) != 18)
         {
            this.__setPropDict[this.rd_partH] = 18;
            try
            {
               this.rd_partH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partH.enabled = true;
            this.rd_partH.groupName = "partGroup";
            this.rd_partH.label = "";
            this.rd_partH.labelPlacement = "left";
            this.rd_partH.selected = false;
            this.rd_partH.value = "";
            this.rd_partH.visible = true;
            try
            {
               this.rd_partH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partM_() : *
      {
         if(this.__setPropDict[this.rd_partM] == undefined || int(this.__setPropDict[this.rd_partM]) != 18)
         {
            this.__setPropDict[this.rd_partM] = 18;
            try
            {
               this.rd_partM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partM.enabled = true;
            this.rd_partM.groupName = "partGroup";
            this.rd_partM.label = "";
            this.rd_partM.labelPlacement = "left";
            this.rd_partM.selected = false;
            this.rd_partM.value = "";
            this.rd_partM.visible = true;
            try
            {
               this.rd_partM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_light_() : *
      {
         if(this.__setPropDict[this.cb_light] == undefined || int(this.__setPropDict[this.cb_light]) != 18)
         {
            this.__setPropDict[this.cb_light] = 18;
            try
            {
               this.cb_light["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_light.enabled = true;
            this.cb_light.label = "";
            this.cb_light.labelPlacement = "left";
            this.cb_light.selected = false;
            this.cb_light.visible = true;
            try
            {
               this.cb_light["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodH_() : *
      {
         if(this.__setPropDict[this.rd_bloodH] == undefined || int(this.__setPropDict[this.rd_bloodH]) != 18)
         {
            this.__setPropDict[this.rd_bloodH] = 18;
            try
            {
               this.rd_bloodH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodH.enabled = true;
            this.rd_bloodH.groupName = "bloodGroup";
            this.rd_bloodH.label = "";
            this.rd_bloodH.labelPlacement = "left";
            this.rd_bloodH.selected = false;
            this.rd_bloodH.value = "";
            this.rd_bloodH.visible = true;
            try
            {
               this.rd_bloodH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodM_() : *
      {
         if(this.__setPropDict[this.rd_bloodM] == undefined || int(this.__setPropDict[this.rd_bloodM]) != 18)
         {
            this.__setPropDict[this.rd_bloodM] = 18;
            try
            {
               this.rd_bloodM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodM.enabled = true;
            this.rd_bloodM.groupName = "bloodGroup";
            this.rd_bloodM.label = "";
            this.rd_bloodM.labelPlacement = "left";
            this.rd_bloodM.selected = false;
            this.rd_bloodM.value = "";
            this.rd_bloodM.visible = true;
            try
            {
               this.rd_bloodM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodL_() : *
      {
         if(this.__setPropDict[this.rd_bloodL] == undefined || int(this.__setPropDict[this.rd_bloodL]) != 18)
         {
            this.__setPropDict[this.rd_bloodL] = 18;
            try
            {
               this.rd_bloodL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodL.enabled = true;
            this.rd_bloodL.groupName = "bloodGroup";
            this.rd_bloodL.label = "";
            this.rd_bloodL.labelPlacement = "left";
            this.rd_bloodL.selected = false;
            this.rd_bloodL.value = "";
            this.rd_bloodL.visible = true;
            try
            {
               this.rd_bloodL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_shake_() : *
      {
         if(this.__setPropDict[this.cb_shake] == undefined || int(this.__setPropDict[this.cb_shake]) != 18)
         {
            this.__setPropDict[this.cb_shake] = 18;
            try
            {
               this.cb_shake["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_shake.enabled = true;
            this.cb_shake.label = "";
            this.cb_shake.labelPlacement = "left";
            this.cb_shake.selected = false;
            this.cb_shake.visible = true;
            try
            {
               this.cb_shake["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_bloody_() : *
      {
         if(this.__setPropDict[this.cb_bloody] == undefined || int(this.__setPropDict[this.cb_bloody]) != 18)
         {
            this.__setPropDict[this.cb_bloody] = 18;
            try
            {
               this.cb_bloody["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_bloody.enabled = true;
            this.cb_bloody.label = "";
            this.cb_bloody.labelPlacement = "left";
            this.cb_bloody.selected = false;
            this.cb_bloody.visible = true;
            try
            {
               this.cb_bloody["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_music_() : *
      {
         if(this.__setPropDict[this.cb_music] == undefined || int(this.__setPropDict[this.cb_music]) != 18)
         {
            this.__setPropDict[this.cb_music] = 18;
            try
            {
               this.cb_music["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_music.enabled = true;
            this.cb_music.label = "";
            this.cb_music.labelPlacement = "left";
            this.cb_music.selected = false;
            this.cb_music.visible = true;
            try
            {
               this.cb_music["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_sound_() : *
      {
         if(this.__setPropDict[this.cb_sound] == undefined || int(this.__setPropDict[this.cb_sound]) != 18)
         {
            this.__setPropDict[this.cb_sound] = 18;
            try
            {
               this.cb_sound["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_sound.enabled = true;
            this.cb_sound.label = "";
            this.cb_sound.labelPlacement = "left";
            this.cb_sound.selected = false;
            this.cb_sound.visible = true;
            try
            {
               this.cb_sound["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_voices_() : *
      {
         if(this.__setPropDict[this.cb_voices] == undefined || int(this.__setPropDict[this.cb_voices]) != 18)
         {
            this.__setPropDict[this.cb_voices] = 18;
            try
            {
               this.cb_voices["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_voices.enabled = true;
            this.cb_voices.label = "";
            this.cb_voices.labelPlacement = "left";
            this.cb_voices.selected = false;
            this.cb_voices.visible = true;
            try
            {
               this.cb_voices["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick0_() : *
      {
         if(this.__setPropDict[this.rd_rightclick0] == undefined || int(this.__setPropDict[this.rd_rightclick0]) != 18)
         {
            this.__setPropDict[this.rd_rightclick0] = 18;
            try
            {
               this.rd_rightclick0["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick0.enabled = true;
            this.rd_rightclick0.groupName = "rightGroup";
            this.rd_rightclick0.label = "";
            this.rd_rightclick0.labelPlacement = "left";
            this.rd_rightclick0.selected = false;
            this.rd_rightclick0.value = "";
            this.rd_rightclick0.visible = true;
            try
            {
               this.rd_rightclick0["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick1_() : *
      {
         if(this.__setPropDict[this.rd_rightclick1] == undefined || int(this.__setPropDict[this.rd_rightclick1]) != 18)
         {
            this.__setPropDict[this.rd_rightclick1] = 18;
            try
            {
               this.rd_rightclick1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick1.enabled = true;
            this.rd_rightclick1.groupName = "rightGroup";
            this.rd_rightclick1.label = "";
            this.rd_rightclick1.labelPlacement = "left";
            this.rd_rightclick1.selected = false;
            this.rd_rightclick1.value = "";
            this.rd_rightclick1.visible = true;
            try
            {
               this.rd_rightclick1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick2_() : *
      {
         if(this.__setPropDict[this.rd_rightclick2] == undefined || int(this.__setPropDict[this.rd_rightclick2]) != 18)
         {
            this.__setPropDict[this.rd_rightclick2] = 18;
            try
            {
               this.rd_rightclick2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick2.enabled = true;
            this.rd_rightclick2.groupName = "rightGroup";
            this.rd_rightclick2.label = "";
            this.rd_rightclick2.labelPlacement = "left";
            this.rd_rightclick2.selected = false;
            this.rd_rightclick2.value = "";
            this.rd_rightclick2.visible = true;
            try
            {
               this.rd_rightclick2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function frame18() : *
      {
         this.__setProp_rd_rightclick2_();
         this.__setProp_rd_rightclick1_();
         this.__setProp_rd_rightclick0_();
         this.__setProp_cb_voices_();
         this.__setProp_cb_sound_();
         this.__setProp_cb_music_();
         this.__setProp_cb_bloody_();
         this.__setProp_cb_shake_();
         this.__setProp_rd_bloodL_();
         this.__setProp_rd_bloodM_();
         this.__setProp_rd_bloodH_();
         this.__setProp_cb_light_();
         this.__setProp_rd_partM_();
         this.__setProp_rd_partH_();
         this.__setProp_rd_partL_();
         this.__setProp_rd_qualM_();
         this.__setProp_rd_qualH_();
         this.__setProp_rd_qualL_();
         this.InitPause();
      }
      
      function frame77() : *
      {
         this.startGame();
      }
      
      function frame107() : *
      {
         gotoAndStop("idle");
      }
      
      function frame108() : *
      {
         this.InitEnd();
      }
      
      function frame258() : *
      {
         this.EndGame();
      }
   }
}
