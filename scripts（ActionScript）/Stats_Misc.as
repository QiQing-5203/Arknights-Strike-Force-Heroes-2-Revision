package
{
   public class Stats_Misc
   {
      
      public static var gameModes:Array;
      
      public static var mods:Array;
      
      public static var randGunGame:Array;
      
      public static var priceMod:Number;
       
      
      public function Stats_Misc()
      {
         super();
      }
      
      public static function Init() : void
      {
         gameModes = ["dm","jug","gun","tdm","ctf","dom","tgun"];
         priceMod = 5;
      }
      
      public static function buildModList() : void
      {
         mods = ["none","sky9","clips"];
         if(SD.achievements.indexOf(Stats_Achievements.achOrder.indexOf("fruit")) != -1)
         {
            mods.push("bodypop");
         }
         if(SD.achievements.indexOf(Stats_Achievements.achOrder.indexOf("tesla")) != -1)
         {
            mods.push("ammo");
         }
         if(SD.achievements.indexOf(Stats_Achievements.achOrder.indexOf("party")) != -1)
         {
            mods.push("party");
         }
      }
      
      public static function getMod(param1:String) : Object
      {
         var _loc2_:Object = {"id":param1};
         var _loc3_:* = param1;
         switch("none" !== _loc3_ ? ("sky9" !== _loc3_ ? ("clips" !== _loc3_ ? ("ammo" === _loc3_ ? 3 : ("party" !== _loc3_ ? ("bodypop" === _loc3_ ? 5 : 6) : 4)) : 2) : 1) : 0)
         {
            case 0:
               _loc2_.name = "无";
               _loc2_.desc = "未选择合约";
               _loc2_.expmod = 1;
               break;
            case 1:
               _loc2_.name = "协同战术：失重";
               _loc2_.desc = "我——要——飞——得——更——高——（会卡顿）";
               _loc2_.expmod = 1;
               break;
            case 2:
               _loc2_.name = "协同战术：军械";
               _loc2_.desc = "后备弹药无限";
               _loc2_.expmod = 0.4;
               break;
            case 3:
               _loc2_.name = "协同战术：无限";
               _loc2_.desc = "弹药无限，无需装填";
               _loc2_.expmod = 0.2;
               break;
            case 4:
               _loc2_.name = "协同战术：随机";
               _loc2_.desc = "随机刷新持有的武器";
               _loc2_.expmod = 0.7;
               break;
            case 5:
               _loc2_.name = "协同战术：羸弱";
               _loc2_.desc = "“博士，你也不想自己的老婆被打得稀碎吧？——”";
               _loc2_.expmod = 1;
               _loc2_.name = "EXP盛宴";
               _loc2_.desc = "特种作战演习第一关同款经验值加成~";
               _loc2_.expmod = 10;
         }
         if(_loc2_.expmod != 1)
         {
            _loc2_.exp = "-" + (100 - Number(_loc2_.expmod) * 100) + "% EXP";
         }
         else
         {
            _loc2_.exp = "";
         }
         return _loc2_;
      }
      
      public static function getDiffName(param1:uint) : String
      {
         return UT.getEl(param1,["-TEST-","刻俄柏","Very Easy","伊内丝","Easy","普通","Normal","突袭","Hard","绝境","Insane","炼狱之末","Unreal","水火相灭","Nightmare","终极天灾"]);
      }
      
      public static function getGameMode(param1:String) : Object
      {
         var _loc2_:Object = {"id":param1};
         _loc2_.sprite = param1;
         var _loc3_:* = param1;
         switch("dm" !== _loc3_ ? ("tdm" !== _loc3_ ? ("elim" === _loc3_ ? 2 : ("telim" !== _loc3_ ? ("ctf" === _loc3_ ? 4 : ("dom" !== _loc3_ ? ("jug" !== _loc3_ ? ("zom" !== _loc3_ ? ("gun" === _loc3_ ? 8 : ("tgun" !== _loc3_ ? 10 : 9)) : 7) : 6) : 5)) : 3)) : 1) : 0)
         {
            case 0:
               _loc2_.name = "死斗";
               _loc2_.desc = "人人皆敌，考验单兵战斗能力";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 25;
               _loc2_.scorelist = [10,25,50,75,100,200,400];
               _loc2_.teams = 1;
               break;
            case 1:
               _loc2_.name = "团队死斗";
               _loc2_.desc = "团队配合，迎击敌军";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 25;
               _loc2_.scorelist = [10,25,50,75,100,200,400];
               _loc2_.teams = 2;
               break;
            case 2:
               _loc2_.name = "Elimination";
               _loc2_.desc = "Kill all enemies and be the last survivor.";
               _loc2_.scoretype = "LIVES";
               _loc2_.startscore = 5;
               _loc2_.scorelist = [3,5,10,15,25];
               _loc2_.teams = 1;
               break;
            case 3:
               _loc2_.name = "Team Elimination";
               _loc2_.desc = "Kill the enemy team and be the surviving team.";
               _loc2_.scoretype = "LIVES";
               _loc2_.startscore = 5;
               _loc2_.scorelist = [3,5,10,15,25];
               _loc2_.teams = 2;
               break;
            case 4:
               _loc2_.name = "货物运送模式";
               _loc2_.desc = "争夺敌方货物并安全返回我方，最考验团队配合能力";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 3;
               _loc2_.scorelist = [3,5,10,15];
               _loc2_.teams = 2;
               break;
            case 5:
               _loc2_.name = "占据模式";
               _loc2_.desc = "攻取敌方据点并占领，考验团队配合能力";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 50;
               _loc2_.scorelist = [50,75,100,150,200];
               _loc2_.teams = 2;
               break;
            case 6:
               _loc2_.name = "天灾之战模式";
               _loc2_.desc = "“感染者必须被消灭”击杀感染者后自身立即受到源石刺激";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 10;
               _loc2_.scorelist = [10,25,50,75,100];
               _loc2_.teams = 1;
               break;
            case 7:
               _loc2_.name = "Outbreak";
               _loc2_.desc = "Survive the zombies. Get killed by one, and become one.";
               _loc2_.scoretype = "SURVIVALS";
               _loc2_.startscore = 10;
               _loc2_.scorelist = [5,10,25,50,100];
               _loc2_.teams = 1;
               break;
            case 8:
               _loc2_.name = "铳械竞赛";
               _loc2_.desc = "击杀敌人以升级自身武器，综合考验单兵作战能力和武器精通性";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 15;
               _loc2_.scorelist = [10,15,25,50,75];
               _loc2_.teams = 1;
               break;
            case 9:
               _loc2_.name = "团队铳械竞赛";
               _loc2_.desc = "击杀敌人以升级我方武器，综合考验团队配合能力与武器精通性";
               _loc2_.scoretype = "目标分数";
               _loc2_.startscore = 25;
               _loc2_.scorelist = [10,15,25,50,75];
               _loc2_.teams = 2;
         }
         return _loc2_;
      }
      
      public static function getHeadName(param1:uint, param2:uint) : String
      {
         var _loc3_:Array = [];
         var _loc4_:* = param2;
         switch(1 !== _loc4_ ? (2 !== _loc4_ ? (3 === _loc4_ ? 2 : (4 !== _loc4_ ? (5 === _loc4_ ? 4 : 5) : 3)) : 1) : 0)
         {
            case 0:
               _loc3_.push("罗比菈塔");
               _loc3_.push("//亚叶 - 残葛");
               _loc3_.push("格劳克斯");
               _loc3_.push("麦哲伦");
               break;
            case 1:
               _loc3_.push("W");
               _loc3_.push("//棘刺 - 惬意");
               _loc3_.push("煌");
               _loc3_.push("//斯卡蒂 - 驭浪 WR04");
               break;
            case 2:
               _loc3_.push("//温蒂 - 糖果仙子");
               _loc3_.push("见行者");
               _loc3_.push("//风丸 - 幻影轻俏");
               _loc3_.push("//水月 - 夏日餮宴");
               break;
            case 3:
               _loc3_.push("//灰喉 - 归巢");
               _loc3_.push("//迷迭香 - 拥抱新生");
               _loc3_.push("//黑 - 天际线");
               _loc3_.push("//白雪 - 曲刃晴风");
               break;
            case 4:
               _loc3_.push("//塞雷娅 - 铁律");
               _loc3_.push("//雷蛇 - 春竜");
               _loc3_.push("//临光 - 灿阳朝露 SD01");
               _loc3_.push("灰毫");
         }
         return _loc3_[param1 - 1];
      }
      
      public static function getBodyName(param1:uint, param2:uint) : String
      {
         var _loc3_:Array = [];
         var _loc4_:* = param2;
         switch(1 !== _loc4_ ? (2 !== _loc4_ ? (3 === _loc4_ ? 2 : (4 !== _loc4_ ? (5 === _loc4_ ? 4 : 5) : 3)) : 1) : 0)
         {
            case 0:
               _loc3_.push("第四代凯夫拉防弹衣");
               _loc3_.push("轻装上阵");
               _loc3_.push("罗德岛特制防弹衣");
               break;
            case 1:
               _loc3_.push("黑色武装");
               _loc3_.push("紧急救援");
               _loc3_.push("防弹插板装甲");
               break;
            case 2:
               _loc3_.push("干员制服");
               _loc3_.push("金牌指挥");
               _loc3_.push("护板背心");
               break;
            case 3:
               _loc3_.push("高分子潜行服");
               _loc3_.push("紧身背心碳纤板甲");
               _loc3_.push("炽合金高温护甲");
               break;
            case 4:
               _loc3_.push("增强型战术装甲");
               _loc3_.push("刺棱合金护甲");
               _loc3_.push("重型防弹武装");
         }
         return _loc3_[param1 - 1];
      }
      
      public static function getCamoName(param1:uint) : String
      {
         var _loc2_:Array = [];
         _loc2_.push("生命之流");
         _loc2_.push("尖灭作战");
         _loc2_.push("战地猩红");
         _loc2_.push("冬寒凛冽");
         _loc2_.push("真理孑然");
         _loc2_.push("夜幕降临");
         _loc2_.push("罗德工艺");
         _loc2_.push("整合运动");
         _loc2_.push("画中之人");
         _loc2_.push("空想花庭");
         _loc2_.push("切城突围");
         _loc2_.push("罗德制药");
         _loc2_.push("生于黑夜");
         _loc2_.push("无昼之境");
         _loc2_.push("四年的坚守与追寻");
         _loc2_.push("海滨沙滩");
         _loc2_.push("火蓝之心");
         _loc2_.push("曙光穿云");
         _loc2_.push("0011™制造");
         _loc2_.push("重商之城");
         return _loc2_[param1 - 1];
      }
      
      public static function getCamoTeam(param1:uint) : uint
      {
         var _loc2_:uint = 1;
         var _loc3_:* = param1;
         switch(1 !== _loc3_ ? (2 !== _loc3_ ? 2 : 1) : 0)
         {
            case 0:
               _loc2_ = UT.randEl([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);
               break;
            case 1:
               _loc2_ = UT.randEl([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);
         }
         return _loc2_;
      }
      
      public static function getRarity(param1:int, param2:Boolean = false) : Object
      {
         var _loc3_:Object = {"id":param1};
         var _loc4_:* = param1;
         switch(-2 !== _loc4_ ? (-1 !== _loc4_ ? (0 !== _loc4_ ? (1 === _loc4_ ? 3 : (2 !== _loc4_ ? (3 === _loc4_ ? 5 : 6) : 4)) : 2) : 1) : 0)
         {
            case 0:
               _loc3_.name = "破旧的";
               _loc3_.color = 10040064;
               break;
            case 1:
               _loc3_.name = "恶臭的";
               _loc3_.color = 10052932;
               break;
            case 2:
               _loc3_.name = "";
               _loc3_.color = 16777215;
               break;
            case 3:
               _loc3_.name = "改良型";
               _loc3_.color = 6737049;
               break;
            case 4:
               _loc3_.name = "军工级";
               _loc3_.color = 6724095;
               break;
            case 5:
               _loc3_.name = "";
               if(param2)
               {
                  _loc3_.name = "专业级";
               }
               _loc3_.color = 16763904;
               break;
            default:
               _loc3_.name = "英雄级";
               _loc3_.color = 230230215;
         }
         if(_loc3_.name)
         {
            _loc3_.name += " ";
         }
         return _loc3_;
      }
      
      public static function getRandRarity(param1:int = 0) : int
      {
         var _loc3_:int = 0;
         var _loc2_:Number = Math.random();
         var _loc4_:* = param1;
         switch(0 !== _loc4_ ? (1 === _loc4_ ? 1 : (2 !== _loc4_ ? (3 !== _loc4_ ? 4 : 3) : 2)) : 0)
         {
            case 0:
               if(_loc2_ <= 0.995)
               {
                  if(_loc2_ <= 0.965)
                  {
                     if(_loc2_ <= 0.9)
                     {
                        if(_loc2_ <= 0.2)
                        {
                           if(_loc2_ > 0.7)
                           {
                              _loc3_ = -1;
                              break;
                           }
                           _loc3_ = -2;
                           break;
                        }
                        _loc3_ = 0;
                        break;
                     }
                     _loc3_ = 1;
                     break;
                  }
                  _loc3_ = 2;
                  break;
               }
               _loc3_ = 3;
               break;
            case 1:
               if(_loc2_ <= 0.95)
               {
                  if(_loc2_ <= 0.8)
                  {
                     _loc3_ = 1;
                     break;
                  }
                  _loc3_ = 2;
                  break;
               }
               _loc3_ = 3;
               break;
            case 2:
               if(_loc2_ <= 0.8)
               {
                  if(_loc2_ <= 0.2)
                  {
                     _loc3_ = 1;
                     break;
                  }
                  _loc3_ = 2;
                  break;
               }
               _loc3_ = 3;
               break;
            case 3:
               _loc3_ = 3;
         }
         return _loc3_;
      }
      
      public static function getGunName(param1:uint) : String
      {
         var _loc2_:* = "";
         var _loc3_:* = param1;
         switch(0 !== _loc3_ ? (1 === _loc3_ ? 1 : (2 !== _loc3_ ? (3 !== _loc3_ ? (4 === _loc3_ ? 4 : (5 !== _loc3_ ? (6 !== _loc3_ ? (7 === _loc3_ ? 7 : (8 !== _loc3_ ? (9 !== _loc3_ ? (10 === _loc3_ ? 10 : 11) : 9) : 8)) : 6) : 5)) : 3) : 2)) : 0)
         {
            case 0:
               _loc2_ = "手铳/微型速射铳";
               break;
            case 1:
               _loc2_ = "突击步铳";
               break;
            case 2:
               _loc2_ = "速射铳/速射弩";
               break;
            case 3:
               _loc2_ = "双持武器";
               break;
            case 4:
               _loc2_ = "狙击铳/弓弩";
               break;
            case 5:
               _loc2_ = "散射铳";
               break;
            case 6:
               _loc2_ = "轻机铳";
               break;
            case 7:
               _loc2_ = "高能源石爆破物发射器";
               break;
            case 8:
               _loc2_ = "高能源石爆破物抛射器";
               break;
            case 9:
               _loc2_ = "元素武器";
               break;
            case 10:
               _loc2_ = "自制武器";
         }
         return _loc2_;
      }
      
      public static function getAppLvlReq(param1:String, param2:uint) : uint
      {
         if(param1 != "head")
         {
            return UT.getEl(param2,[1,9,17]);
         }
         return UT.getEl(param2,[1,5,13,21]);
      }
      
      public static function getCost(param1:uint, param2:Number = 1) : uint
      {
         return UT.getCurvedRange(param1,50,70 * priceMod,1000 * priceMod) * param2;
      }
      
      public static function getStreakHealth(param1:uint, param2:Number = 1) : uint
      {
         return UT.getCurvedRange(param1,50,150,400) * param2;
      }
      
      public static function setRandomGunGame() : void
      {
         randGunGame = [];
         var _loc1_:uint = 0;
         while(_loc1_ < 100)
         {
            randGunGame.push(UT.randEl(Stats_Guns.gunGameAr).id);
            _loc1_++;
         }
         trace("Random Gun Game:",randGunGame);
      }
      
      public static function getCustomGunGameWeapon(param1:int) : String
      {
         var _loc2_:Array = [];
         var _loc3_:* = MatchSettings.useExtra.gunGameSpecial;
         switch("reverse" !== _loc3_ ? ("explosive" !== _loc3_ ? 2 : 1) : 0)
         {
            case 0:
               _loc2_.push("Wand");
               _loc2_.push("Knife");
               _loc2_.push("Flamethrower");
               _loc2_.push("Cobra");
               _loc2_.push("Commando");
               _loc2_.push("Javelin");
               _loc2_.push("RPG");
               _loc2_.push("Thumper");
               _loc2_.push("L118A");
               _loc2_.push("G11");
               _loc2_.push("Minigun");
               _loc2_.push("PKP");
               _loc2_.push("f500");
               _loc2_.push("MP412");
               _loc2_.push("Neostead");
               _loc2_.push("Judgement");
               _loc2_.push("Famas");
               _loc2_.push("Scar");
               _loc2_.push("ACR");
               _loc2_.push("Bizon");
               _loc2_.push("PP2000");
               _loc2_.push("Raffica");
               _loc2_.push("Desert Eagle");
               _loc2_.push("Kriss Kard");
               _loc2_.push("USP");
               break;
            case 1:
               _loc2_.push("RPG");
               _loc2_.push("XM 25");
               _loc2_.push("Stinger");
               _loc2_.push("EX 41");
               _loc2_.push("Javelin");
               _loc2_.push("M32");
               _loc2_.push("Commando");
               _loc2_.push("Thumper");
               _loc2_.push("Flamethrower");
               _loc2_.push("Wand");
               _loc2_.push("Sheep");
               _loc2_.push("RPG");
               _loc2_.push("XM 25");
               _loc2_.push("Stinger");
               _loc2_.push("EX 41");
               _loc2_.push("Javelin");
               _loc2_.push("M32");
               _loc2_.push("Commando");
               _loc2_.push("Thumper");
               _loc2_.push("Flamethrower");
               _loc2_.push("RPG");
               _loc2_.push("XM 25");
               _loc2_.push("Stinger");
               _loc2_.push("Wand");
               _loc2_.push("Sheep");
         }
         if(param1 >= _loc2_.length)
         {
            param1 = _loc2_.length - 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         return _loc2_[param1];
      }
      
      public static function getGunGameWeapon(param1:int) : String
      {
         if(!MatchSettings.useExtra.gunGameSpecial)
         {
            if(MatchSettings.useMod != "party")
            {
               var _loc2_:Array = [];
               var _loc3_:* = MatchSettings.useScore;
               switch(10 !== _loc3_ ? (15 !== _loc3_ ? (25 === _loc3_ ? 2 : (50 !== _loc3_ ? (75 === _loc3_ ? 4 : 5) : 3)) : 1) : 0)
               {
                  case 0:
                     _loc2_.push("USP");
                     _loc2_.push("M4A4");
                     _loc2_.push("No Name");
                     _loc2_.push("Intervention");
                     _loc2_.push("Judgement");
                     _loc2_.push("Minigun");
                     _loc2_.push("RPG");
                     _loc2_.push("Thumper");
                     _loc2_.push("Flamethrower");
                     _loc2_.push("Knife");
                     break;
                  case 1:
                     _loc2_.push("USP");
                     _loc2_.push("Raffica");
                     _loc2_.push("M4A4");
                     _loc2_.push("RCP 90");
                     _loc2_.push("No Name");
                     _loc2_.push("G11");
                     _loc2_.push("Intervention");
                     _loc2_.push("Judgement");
                     _loc2_.push("AUG");
                     _loc2_.push("Minigun");
                     _loc2_.push("RPG");
                     _loc2_.push("Thumper");
                     _loc2_.push("Flamethrower");
                     _loc2_.push("Knife");
                     _loc2_.push("Wand");
                     break;
                  case 2:
                     _loc2_.push("USP");
                     _loc2_.push("Desert Eagle");
                     _loc2_.push("Raffica");
                     _loc2_.push("Glock 18");
                     _loc2_.push("M4A4");
                     _loc2_.push("Famas");
                     _loc2_.push("G36");
                     _loc2_.push("RCP 90");
                     _loc2_.push("Raging Judge");
                     _loc2_.push("No Name");
                     _loc2_.push("G11");
                     _loc2_.push("Barrett");
                     _loc2_.push("Intervention");
                     _loc2_.push("f1216");
                     _loc2_.push("SPAS 12");
                     _loc2_.push("Judgement");
                     _loc2_.push("AUG");
                     _loc2_.push("Minigun");
                     _loc2_.push("RPG");
                     _loc2_.push("Commando");
                     _loc2_.push("XM 25");
                     _loc2_.push("Thumper");
                     _loc2_.push("Flamethrower");
                     _loc2_.push("Knife");
                     _loc2_.push("Wand");
                     break;
                  case 3:
                     _loc2_.push("USP");
                     _loc2_.push("AMT");
                     _loc2_.push("Desert Eagle");
                     _loc2_.push("Raffica");
                     _loc2_.push("Glock 18");
                     _loc2_.push("PP2000");
                     _loc2_.push("M4A4");
                     _loc2_.push("Type 95");
                     _loc2_.push("Famas");
                     _loc2_.push("Scar");
                     _loc2_.push("ARX 160");
                     _loc2_.push("F2000");
                     _loc2_.push("AKS");
                     _loc2_.push("G36");
                     _loc2_.push("Bizon");
                     _loc2_.push("RCP 90");
                     _loc2_.push("The Patriot");
                     _loc2_.push("ACR");
                     _loc2_.push("MP412");
                     _loc2_.push("f357");
                     _loc2_.push("Taurus 44");
                     _loc2_.push("Raging Judge");
                     _loc2_.push("No Name");
                     _loc2_.push("f500");
                     _loc2_.push("G11");
                     _loc2_.push("G3");
                     _loc2_.push("Dragunov");
                     _loc2_.push("Barrett");
                     _loc2_.push("DSR1");
                     _loc2_.push("Intervention");
                     _loc2_.push("Jackhammer");
                     _loc2_.push("USAS 12");
                     _loc2_.push("f1216");
                     _loc2_.push("Neostead");
                     _loc2_.push("SPAS 12");
                     _loc2_.push("Judgement");
                     _loc2_.push("PKP");
                     _loc2_.push("M60");
                     _loc2_.push("AUG");
                     _loc2_.push("Minigun");
                     _loc2_.push("RPG");
                     _loc2_.push("Stinger");
                     _loc2_.push("Commando");
                     _loc2_.push("XM 25");
                     _loc2_.push("M32");
                     _loc2_.push("Thumper");
                     _loc2_.push("Flamethrower");
                     _loc2_.push("Gauss Rifle");
                     _loc2_.push("Knife");
                     _loc2_.push("Wand");
                     break;
                  case 4:
                     _loc2_.push("USP");
                     _loc2_.push("Beretta Px4");
                     _loc2_.push("M1911");
                     _loc2_.push("P99");
                     _loc2_.push("Five Seven");
                     _loc2_.push("AMT");
                     _loc2_.push("Kriss Kard");
                     _loc2_.push("Desert Eagle");
                     _loc2_.push("Raffica");
                     _loc2_.push("Glock 18");
                     _loc2_.push("FMG9");
                     _loc2_.push("MP9");
                     _loc2_.push("PP2000");
                     _loc2_.push("M4A4");
                     _loc2_.push("Type 95");
                     _loc2_.push("Famas");
                     _loc2_.push("XM8");
                     _loc2_.push("Scar");
                     _loc2_.push("AK 12");
                     _loc2_.push("ARX 160");
                     _loc2_.push("F2000");
                     _loc2_.push("AKS");
                     _loc2_.push("UMP");
                     _loc2_.push("G36");
                     _loc2_.push("Bizon");
                     _loc2_.push("RCP 90");
                     _loc2_.push("PDW");
                     _loc2_.push("The Patriot");
                     _loc2_.push("ACR");
                     _loc2_.push("Thor");
                     _loc2_.push("MP412");
                     _loc2_.push("f357");
                     _loc2_.push("Taurus 44");
                     _loc2_.push("Raging Bull");
                     _loc2_.push("Raging Judge");
                     _loc2_.push("No Name");
                     _loc2_.push("f500");
                     _loc2_.push("G11");
                     _loc2_.push("G3");
                     _loc2_.push("MK 14");
                     _loc2_.push("Dragunov");
                     _loc2_.push("Barrett");
                     _loc2_.push("DSR1");
                     _loc2_.push("L118A");
                     _loc2_.push("Intervention");
                     _loc2_.push("Jackhammer");
                     _loc2_.push("USAS 12");
                     _loc2_.push("f1216");
                     _loc2_.push("KSG");
                     _loc2_.push("Neostead");
                     _loc2_.push("R870");
                     _loc2_.push("SPAS 12");
                     _loc2_.push("Judgement");
                     _loc2_.push("MK 48");
                     _loc2_.push("PKP");
                     _loc2_.push("M60");
                     _loc2_.push("IAR");
                     _loc2_.push("LSW");
                     _loc2_.push("AUG");
                     _loc2_.push("Minigun");
                     _loc2_.push("Cerberus");
                     _loc2_.push("RPG");
                     _loc2_.push("Stinger");
                     _loc2_.push("Javelin");
                     _loc2_.push("Commando");
                     _loc2_.push("XM 25");
                     _loc2_.push("EX 41");
                     _loc2_.push("M32");
                     _loc2_.push("Thumper");
                     _loc2_.push("Flamethrower");
                     _loc2_.push("Cobra");
                     _loc2_.push("Carbonite Gun");
                     _loc2_.push("Gauss Rifle");
                     _loc2_.push("Knife");
                     _loc2_.push("Wand");
               }
               if(param1 >= _loc2_.length)
               {
                  param1 = _loc2_.length - 1;
               }
               if(param1 < 0)
               {
                  param1 = 0;
               }
               return _loc2_[param1];
            }
            if(param1 < 0)
            {
               param1 = 0;
            }
            return randGunGame[param1];
         }
         return getCustomGunGameWeapon(param1);
      }
   }
}
