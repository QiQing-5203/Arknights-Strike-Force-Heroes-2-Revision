package
{
   import flash.display.MovieClip;
   
   public class MatchSettings
   {
      
      public static var qmBotNames:Array;
      
      public static var qmMap:String;
      
      public static var qmMode:String;
      
      public static var qmClassOnly:int;
      
      public static var qmScore:uint;
      
      public static var qmMod:String;
      
      public static var qmSkills:Boolean;
      
      public static var qmStreaks:Boolean;
      
      public static var qmArmor:Boolean;
      
      public static var qmTeams:Boolean;
      
      public static var qmDiff:int;
      
      public static var qmBots0:Array;
      
      public static var qmBots1:Array;
      
      public static var qmBots2:Array;
      
      public static var caStage:uint;
      
      public static var caType:uint;
      
      public static var caMap:String;
      
      public static var caMode:String;
      
      public static var caScore:uint;
      
      public static var caDiff:uint;
      
      public static var caDiffMode:int = 0;
      
      public static var caSpecial:String;
      
      public static var caName:String;
      
      public static var caDesc:String;
      
      public static var caBots:Array;
      
      public static var caPlayer:Stats_Classes;
      
      public static var preCutSong;
      
      public static var preCutFrames:Array;
      
      public static var postCutSong;
      
      public static var postCutFrames:Array;
      
      public static var useMap:Object;
      
      public static var useMode:String;
      
      public static var useClassOnly:int;
      
      public static var useScore:uint;
      
      public static var useMod:String;
      
      public static var useSkills:Boolean;
      
      public static var useStreaks:Boolean;
      
      public static var useArmor:Boolean;
      
      public static var useBots:Array;
      
      public static var usePlayer:Stats_Classes;
      
      public static var useTeams:Boolean;
      
      public static var useExtra:Object;
      
      public static var useFlag:String;
      
      public static var useSong;
      
      public static var isCampaign:Boolean;
       
      
      private var game:Game;
      
      private var initiated:Boolean;
      
      private var team0:Array;
      
      public var team1:Array;
      
      public var team2:Array;
      
      public var team1score:int;
      
      public var team2score:int;
      
      private var fc:uint = 0;
      
      public function MatchSettings(param1:Game)
      {
         super();
         this.game = param1;
      }
      
      public static function Init() : void
      {
         qmBotNames = [];
         qmBotNames.push("Obsidian Festival","KingofPsychic","魔王的小号","陨星","手工骑士02","Vigna","面具侠","海中深色","芙蓉","LeaderOne","Haze","守林人@发把狙","古米","真理","安心院安洁莉娜","芙兰卡","雷蛇","D.D.D.","普罗旺斯","白面鸮","一般通过少女","德克萨斯");
         qmBotNames.push("能天使","可颂@已补货有意者M","慕斯@甜点学徒","香草","杜宾","泡普卡@最爱A6的大家","空爆@带薪吃饭","梓兰","神探","巡林者","LUNG wRATh","Business Cooperation","Grey Feather","Honey Summer","Money is best","Pacer-man");
         qmBotNames.push("Only True Bolivar","All hail Ms.Candela","Wine and Coffee","I love Dossoles","IZUMIKun~","Player断罪","绮良攻略中047","BFSACT.txt");
         qmBotNames.push("红松骑士抱个团","绮良攻略中053","彼岸穿魂炮","sogoL","AOSTA","苹果派不派","AAA#","酷酷队员","凛冬将至","炎狱","奥斯塔你给我等着");
         qmBotNames.push("EX骑士23号","绮良攻略中062","绮良攻略中016","绮良攻略中002","路人","小U今天播了吗","Kira raKira","小U单推人","用户1248","用户2836","可爱萨科塔","重名了","独眼谍报员","掉龙门币了","酗酒警探","我要当可汗");
         qmBotNames.push("水月的集百玩不厌","A_QUASO","擦！有呱","主播U好耶","红刀好哥哥","U酱的耳机","雷电芽衣","由比滨结衣","Ayaer","人形二踢脚","MONSTER SIREN","大剑人");
         qmBotNames.push("不爱蒂蒂了吗","三倍体","Ruler_");
         qmBotNames.push("Ocean Cat","Rua","QiQing_","九","预备干员-近战");
         qmMap = "space";
         qmMode = "tdm";
         qmTeams = false;
         qmClassOnly = 0;
         qmScore = 10;
         qmMod = "none";
         qmSkills = true;
         qmStreaks = true;
         qmArmor = true;
         qmDiff = 1;
         qmBots0 = [];
         qmBots1 = [];
         qmBots2 = [];
         addBot(0);
         addBot(2);
      }
      
      public static function addBot(param1:uint) : void
      {
         var _loc4_:String = null;
         var _loc6_:uint = 0;
         if(!(param1 == 0 && qmBots0.length >= 11))
         {
            if(!(param1 == 1 && qmBots1.length >= 5))
            {
               if(!(param1 == 2 && qmBots2.length >= 6))
               {
                  var _loc2_:Array = MatchSettings["qmBots" + param1];
                  var _loc3_:Boolean = false;
                  while(!_loc3_)
                  {
                     _loc4_ = UT.randEl(qmBotNames);
                     _loc3_ = true;
                     _loc6_ = 0;
                     while(_loc6_ < _loc2_.length)
                     {
                        if(_loc2_[_loc6_].name == _loc4_)
                        {
                           _loc3_ = false;
                        }
                        _loc6_++;
                     }
                  }
                  var _loc5_:Stats_Classes;
                  (_loc5_ = new Stats_Classes()).name = _loc4_;
                  _loc5_.team = param1;
                  _loc5_.level = 1;
                  _loc5_.head = UT.irand(1,4);
                  _loc5_.body = UT.irand(1,3);
                  if(!_loc5_.team)
                  {
                     _loc5_.camo = UT.irand(1,20);
                  }
                  else
                  {
                     _loc5_.camo = Stats_Misc.getCamoTeam(_loc5_.team);
                  }
                  _loc5_.extra = {};
                  _loc2_.push(_loc5_);
                  return;
               }
               return;
            }
            return;
         }
      }
      
      public static function removeBot(param1:uint) : void
      {
         if(!(param1 == 0 && qmBots0.length <= 1))
         {
            if(param1 == 1 && qmBots1.length <= 0)
            {
               return;
            }
            if(!(param1 == 2 && qmBots2.length <= 1))
            {
               MatchSettings["qmBots" + param1].pop();
               return;
            }
            return;
         }
      }
      
      public static function setBotStats(param1:Stats_Classes) : void
      {
         param1.diff = qmDiff;
         param1.level = Stats_Classes.getAiLevel(qmDiff);
         if(param1.level < 1)
         {
            param1.level = 1;
         }
         param1.classNum = !useClassOnly ? UT.irand(1,5) : useClassOnly;
         param1.primary = Stats_Guns.getRandPrimary(param1);
         param1.secondary = Stats_Guns.getRandSecondary(param1);
         param1._primaryAttach = Stats_Attachments.getRandItem(param1);
         param1._armor = Stats_Armor.getRandItem(param1);
         param1.skill = Stats_Skills.getRandItem(param1);
         param1.streak = Stats_Streaks.getRandItem(param1);
         if(!param1._primaryAttach)
         {
            param1.primaryAttach = null;
         }
         else
         {
            param1.primaryAttach = param1._primaryAttach.createFinalItem();
         }
         param1.armor = param1._armor.createFinalItem();
      }
      
      public static function startQuickmatch() : void
      {
         isCampaign = false;
         useMap = Stats_Maps.getMap(MatchSettings.qmMap);
         useMode = qmMode;
         useClassOnly = qmClassOnly;
         useScore = qmScore;
         useMod = qmMod;
         useSkills = qmSkills;
         useStreaks = qmStreaks;
         useArmor = qmArmor;
         useTeams = qmTeams;
         useExtra = {};
         useFlag = "flag";
         postCutFrames = null;
         preCutFrames = null;
         postCutSong = null;
         preCutSong = null;
         if(!useTeams)
         {
            useBots = qmBots0;
         }
         else
         {
            useBots = qmBots1.concat(qmBots2);
         }
         var _loc1_:uint = 0;
         while(_loc1_ < useBots.length)
         {
            setBotStats(useBots[_loc1_]);
            _loc1_++;
         }
         updatePlayer();
      }
      
      public static function startCampaign() : void
      {
         isCampaign = true;
         useMap = Stats_Maps.getMap(MatchSettings.caMap);
         useMode = caMode;
         useScore = caScore;
         useMod = "";
         useSkills = true;
         useStreaks = true;
         useArmor = true;
         useTeams = Stats_Misc.getGameMode(useMode).teams == 2;
         useBots = caBots;
         useFlag = "flag";
         if(useExtra.flag)
         {
            useFlag = useExtra.flag;
         }
         if(!caPlayer.classNum)
         {
            useClassOnly = 0;
         }
         else
         {
            useClassOnly = caPlayer.classNum;
         }
         updatePlayer();
      }
      
      public static function updatePlayer() : void
      {
         var _loc1_:uint = 0;
         if(!isCampaign)
         {
            _loc1_ = !useClassOnly ? SD.selClass : useClassOnly;
            usePlayer = new Stats_Classes();
            usePlayer.name = SD.name;
            usePlayer.classNum = _loc1_;
            usePlayer.camo = SD.getSelCass(_loc1_).camo;
            usePlayer.head = SD.getSelCass(_loc1_).head;
            usePlayer.body = SD.getSelCass(_loc1_).body;
            usePlayer.team = !useTeams ? 0 : 1;
            usePlayer.skill = Stats_Skills.itemOb[SD.getSelCass(_loc1_).skill];
            usePlayer.streak = Stats_Streaks.itemOb[SD.getSelCass(_loc1_).streak];
            usePlayer.primary = SD.getSelCass(_loc1_).primary;
            usePlayer.secondary = SD.getSelCass(_loc1_).secondary;
            usePlayer._primaryAttach = SD.getSelCass(_loc1_).primaryAttach;
            usePlayer._armor = SD.getSelCass(_loc1_).armor;
            usePlayer.level = SD.getSelCass(_loc1_).level;
            usePlayer.extra = {};
         }
         else
         {
            usePlayer = new Stats_Classes();
            usePlayer.name = !caPlayer.name ? SD.name : caPlayer.name;
            usePlayer.classNum = !caPlayer.classNum ? SD.selClass : caPlayer.classNum;
            usePlayer.camo = !caPlayer.camo ? SD.getSelCass(usePlayer.classNum).camo : caPlayer.camo;
            usePlayer.head = !caPlayer.head ? SD.getSelCass(usePlayer.classNum).head : caPlayer.head;
            usePlayer.body = !caPlayer.body ? SD.getSelCass(usePlayer.classNum).body : caPlayer.body;
            usePlayer.team = caPlayer.team;
            usePlayer.skill = !caPlayer.skill ? Stats_Skills.itemOb[SD.getSelCass(usePlayer.classNum).skill] : caPlayer.skill;
            usePlayer.streak = !caPlayer.streak ? Stats_Streaks.itemOb[SD.getSelCass(usePlayer.classNum).streak] : caPlayer.streak;
            usePlayer.primary = !caPlayer.primary ? SD.getSelCass(usePlayer.classNum).primary : caPlayer.primary;
            usePlayer.secondary = !caPlayer.secondary ? SD.getSelCass(usePlayer.classNum).secondary : caPlayer.secondary;
            usePlayer._primaryAttach = !caPlayer._primaryAttach ? SD.getSelCass(usePlayer.classNum).primaryAttach : caPlayer._primaryAttach;
            usePlayer._armor = !caPlayer._armor ? SD.getSelCass(usePlayer.classNum).armor : caPlayer._armor;
            usePlayer.level = SD.getSelCass(usePlayer.classNum).level;
            usePlayer.extra = caPlayer.extra;
         }
         if(!usePlayer._primaryAttach)
         {
            usePlayer.primaryAttach = null;
         }
         else
         {
            usePlayer.primaryAttach = usePlayer._primaryAttach.createFinalItem();
         }
         usePlayer.armor = usePlayer._armor.createFinalItem();
         usePlayer.diff = 10;
      }
      
      public function Init() : void
      {
         var _loc1_:uint = 0;
         this.initiated = true;
         if(MatchSettings.useTeams)
         {
            this.team1 = [];
            this.team2 = [];
            _loc1_ = 0;
            while(_loc1_ < this.game.units.length)
            {
               this["team" + this.game.units[_loc1_].team].push(this.game.units[_loc1_]);
               _loc1_++;
            }
            this.game.hud.setScoreBar(1,0,2,0);
         }
         else
         {
            this.team0 = this.game.units.concat();
            this.game.hud.setScoreBar(this.game.player.team,this.game.player.pscore,this.game.units[1].team,this.game.units[1].pscore);
         }
         this.updateScores();
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         ++this.fc;
         if(MatchSettings.useMode == "dom" && this.fc % (30 * 3) == 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this.game.arena.holdpoints.length)
            {
               if(this.game.arena.holdpoints[_loc1_].curTeam)
               {
                  ++this.game.arena.holdpoints[_loc1_].unitCaptured.pscore;
               }
               _loc1_++;
            }
            this.updateScores();
         }
      }
      
      public function updateTeams() : void
      {
         var _loc3_:uint = 0;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < this.team1.length)
         {
            if(this.team1[_loc3_].team != 1)
            {
               if(this.team1[_loc3_].team == 2)
               {
                  _loc2_.push(this.team1[_loc3_]);
               }
            }
            else
            {
               _loc1_.push(this.team1[_loc3_]);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.team2.length)
         {
            if(this.team2[_loc3_].team != 1)
            {
               if(this.team2[_loc3_].team == 2)
               {
                  _loc2_.push(this.team2[_loc3_]);
               }
            }
            else
            {
               _loc1_.push(this.team2[_loc3_]);
            }
            _loc3_++;
         }
         this.team1 = _loc1_;
         this.team2 = _loc2_;
      }
      
      public function updateScores() : void
      {
         var _loc2_:uint = 0;
         if(this.initiated)
         {
            var _loc1_:* = null;
            var _loc3_:String = useMode;
            switch("dm" !== _loc3_ ? ("gun" !== _loc3_ ? ("zom" === _loc3_ ? 2 : ("jug" !== _loc3_ ? ("tdm" === _loc3_ ? 4 : ("tgun" !== _loc3_ ? ("dom" !== _loc3_ ? ("ctf" === _loc3_ ? 7 : 8) : 6) : 5)) : 3)) : 1) : 0)
            {
               case 0:
               case 1:
               case 2:
               case 3:
                  _loc2_ = 0;
                  while(_loc2_ < this.team0.length)
                  {
                     if(!this.team0[_loc2_].human && (!_loc1_ || this.team0[_loc2_].pscore > _loc1_.pscore))
                     {
                        _loc1_ = this.team0[_loc2_];
                     }
                     if(this.team0[_loc2_].pscore >= useScore)
                     {
                        this.team0[_loc2_].pscore = useScore;
                        this.game.endGame(this.team0[_loc2_].human);
                     }
                     _loc2_++;
                  }
                  this.game.hud.setScoreBar(this.game.player.team,this.game.player.pscore,_loc1_.team,_loc1_.pscore);
                  break;
               case 4:
               case 5:
               case 6:
               case 7:
                  this.team1.sortOn("pscore",Array.NUMERIC | Array.DESCENDING);
                  this.team2.sortOn("pscore",Array.NUMERIC | Array.DESCENDING);
                  this.team1score = 0;
                  _loc2_ = 0;
                  while(_loc2_ < this.team1.length)
                  {
                     this.team1score += this.team1[_loc2_].pscore;
                     _loc2_++;
                  }
                  this.team2score = 0;
                  _loc2_ = 0;
                  while(_loc2_ < this.team2.length)
                  {
                     this.team2score += this.team2[_loc2_].pscore;
                     _loc2_++;
                  }
                  if(this.team1score < useScore)
                  {
                     if(this.team2score >= useScore)
                     {
                        this.team2score = useScore;
                        this.game.endGame(false);
                     }
                  }
                  else
                  {
                     this.team1score = useScore;
                     this.game.endGame(true);
                  }
                  this.game.hud.setScoreBar(1,this.team1score,2,this.team2score);
            }
            return;
         }
      }
      
      public function showScores(param1:MovieClip) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc2_:Number = 0;
         param1.addChild(new ScoreBar(_loc2_,null,"top"));
         if(useTeams)
         {
            this.team1.sortOn("pscore",Array.NUMERIC | Array.DESCENDING);
            this.team2.sortOn("pscore",Array.NUMERIC | Array.DESCENDING);
            this.team1score = 0;
            _loc3_ = 0;
            while(_loc3_ < this.team1.length)
            {
               this.team1score += this.team1[_loc3_].pscore;
               _loc3_++;
            }
            this.team2score = 0;
            _loc3_ = 0;
            while(_loc3_ < this.team2.length)
            {
               this.team2score += this.team2[_loc3_].pscore;
               _loc3_++;
            }
            if(this.team1score > useScore)
            {
               this.team1score = useScore;
            }
            if(this.team2score > useScore)
            {
               this.team2score = useScore;
            }
            if(this.team1score < this.team2score)
            {
               _loc4_ = 2;
               _loc5_ = 1;
            }
            else
            {
               _loc4_ = 1;
               _loc5_ = 2;
            }
            param1.addChild(new ScoreBar(_loc2_ = _loc2_ + 20,null,"team" + _loc4_ + "_player",(_loc4_ != 1 ? "敌" : "我") + "方",this["team" + _loc4_ + "score"]));
            _loc3_ = 0;
            while(_loc3_ < this["team" + _loc4_].length)
            {
               if(!this["team" + _loc4_][_loc3_].unitInfo.extra.noSpawn)
               {
                  param1.addChild(new ScoreBar(_loc2_ = _loc2_ + 20,this["team" + _loc4_][_loc3_]));
               }
               _loc3_++;
            }
            param1.addChild(new ScoreBar(_loc2_ = _loc2_ + 20,null,"team" + _loc5_ + "_player",(_loc5_ != 1 ? "敌" : "我") + "方",this["team" + _loc5_ + "score"]));
            _loc3_ = 0;
            while(true)
            {
               if(_loc3_ < this["team" + _loc5_].length)
               {
                  if(!this["team" + _loc5_][_loc3_].unitInfo.extra.noSpawn)
                  {
                     param1.addChild(new ScoreBar(_loc2_ = _loc2_ + 20,this["team" + _loc5_][_loc3_]));
                  }
                  _loc3_++;
                  continue;
               }
            }
         }
         else
         {
            this.team0.sortOn("pscore",Array.NUMERIC | Array.DESCENDING);
            _loc3_ = 0;
            while(_loc3_ < this.team0.length)
            {
               if(!this.team0[_loc3_].unitInfo.extra.noSpawn)
               {
                  param1.addChild(new ScoreBar(_loc2_ = _loc2_ + 20,this.team0[_loc3_]));
               }
               _loc3_++;
            }
         }
      }
   }
}
