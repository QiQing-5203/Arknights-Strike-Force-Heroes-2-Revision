package
{
   import Playtomic.Log;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class Stats_Achievements extends MovieClip
   {
      
      public static var achOrder:Array;
      
      public static var ach:Stats_Achievements;
       
      
      public var icon:MovieClip;
      
      public var txt_desc:TextField;
      
      public var txt_name:TextField;
      
      public var txt_unlock:TextField;
      
      public function Stats_Achievements()
      {
         super();
         addFrameScript(0,this.frame1);
         stop();
         Stats_Achievements.ach = this;
      }
      
      public static function Init() : void
      {
         achOrder = [];
         achOrder.push("campaign","challenges","level50","hard","insane","camo");
         achOrder.push("gambler","sell","globex","engi","merc","general","sniper","jugg","melee","health","ammo","armor");
         achOrder.push("fruit","tesla","party");
      }
      
      public static function getAchievementNum(param1:*) : Object
      {
         return getAchievement(achOrder[param1]);
      }
      
      public static function getAchievement(param1:String) : Object
      {
         var _loc2_:Object = {};
         _loc2_.id = param1;
         _loc2_.sprite = param1;
         var _loc3_:* = param1;
         switch("campaign" !== _loc3_ ? ("challenges" !== _loc3_ ? ("level50" !== _loc3_ ? ("hard" === _loc3_ ? 3 : ("insane" !== _loc3_ ? ("camo" === _loc3_ ? 5 : ("gambler" !== _loc3_ ? ("sell" !== _loc3_ ? ("globex" !== _loc3_ ? ("engi" === _loc3_ ? 9 : ("merc" !== _loc3_ ? ("general" !== _loc3_ ? ("sniper" === _loc3_ ? 12 : ("jugg" !== _loc3_ ? ("melee" !== _loc3_ ? ("health" === _loc3_ ? 15 : ("ammo" !== _loc3_ ? ("armor" === _loc3_ ? 17 : ("fruit" !== _loc3_ ? ("tesla" === _loc3_ ? 19 : ("party" !== _loc3_ ? 21 : 20)) : 18)) : 16)) : 14) : 13)) : 11) : 10)) : 8) : 7) : 6)) : 4)) : 2) : 1) : 0)
         {
            case 0:
               _loc2_.name = "“苏醒”";
               _loc2_.desc = "名为整合运动的大火已然熄灭，但依然有人将火种藏于手心。";
               break;
            case 1:
               _loc2_.name = "恢宏试炼奖章";
               _loc2_.desc = "击败《明日方舟》制作人及其搬来的救兵。";
               break;
            case 2:
               _loc2_.name = "千锤百炼奖章·III";
               _loc2_.desc = "仍在成长，仍在挖掘，仍在前进。";
               break;
            case 3:
               _loc2_.name = "突袭作战奖章";
               _loc2_.desc = "您已具备在多变战场贯彻目标的能力。";
               break;
            case 4:
               _loc2_.name = "绝境磨难奖章";
               _loc2_.desc = "您的衣角还残留着一点余温。";
               break;
            case 5:
               _loc2_.name = "涂装狂热奖章";
               _loc2_.desc = "您帮助可露希尔完成了多种迷彩涂装的创想。";
               break;
            case 6:
               _loc2_.name = "豪掷千金奖章";
               _loc2_.desc = "您为战备采办部的经营做出了巨大贡献。";
               _loc2_.max = 3000000;
               _loc2_.progress = "已花费@ 龙门币";
               break;
            case 7:
               _loc2_.name = "经营有方奖章";
               _loc2_.desc = "您倒卖的军备破坏了泰拉军火市场的平衡。";
               _loc2_.max = 1000000;
               _loc2_.progress = "已收获@ 龙门币";
               break;
            case 8:
               _loc2_.name = "诛邪除奸奖章·III";
               _loc2_.desc = "您没有给敌人喘息的机会。";
               _loc2_.max = 500;
               _loc2_.progress = "已击杀 @ 名 克隆体";
               break;
            case 9:
               _loc2_.name = "机械化矿牢爬行";
               _loc2_.desc = "您对支援装置的使用已经得心应手。";
               _loc2_.max = 300;
               _loc2_.progress = "已击杀 @ 人";
               break;
            case 10:
               _loc2_.name = "过载的武器和过热的心脏";
               _loc2_.desc = "您让近卫干员对怒气的掌握炉火纯青。";
               _loc2_.max = 500;
               _loc2_.progress = "已击杀 @ 人";
               break;
            case 11:
               _loc2_.name = "大庇天下寒士俱欢颜";
               _loc2_.desc = "队友知道什么时候该伸出援手，您也是。";
               _loc2_.max = 300;
               _loc2_.progress = "已使用 @ 次御敌指令";
               break;
            case 12:
               _loc2_.name = "我，即是枪神";
               _loc2_.desc = "您的枪法令众多狙击干员都为之汗颜。";
               _loc2_.max = 1000;
               _loc2_.progress = "已爆头击杀 @ 次";
               break;
            case 13:
               _loc2_.name = "罗德岛的基石";
               _loc2_.desc = "由您指挥的堡垒绝不会轻易倒下。";
               _loc2_.max = 300000;
               _loc2_.progress = "已承受 @ 点伤害";
               break;
            case 14:
               _loc2_.name = "剑光如我，斩尽芜杂！";
               _loc2_.desc = "敌人永远不知道您什么时候拔刀。";
               _loc2_.max = 1000;
               _loc2_.progress = "已击杀 @ 人";
               break;
            case 15:
               _loc2_.name = "生死一线奖章";
               _loc2_.desc = "您坚持到了补给来临前的最后一刻。";
               _loc2_.max = 50;
               _loc2_.progress = "已拾取 @ 次";
               break;
            case 16:
               _loc2_.name = "弹足粮盈奖章";
               _loc2_.desc = "您精湛的指挥技艺不会让罗德岛落到弹尽粮绝的局面。";
               _loc2_.max = 100;
               _loc2_.progress = "已拾取 @ 次";
               break;
            case 17:
               _loc2_.name = "人型盾甲奖章";
               _loc2_.desc = "您无处不在的武装是取胜的关键。";
               _loc2_.max = 100;
               _loc2_.progress = "已拾取 @ 次";
               break;
            case 18:
               _loc2_.name = "你他妈劈我瓜是吧！";
               _loc2_.desc = "完全破坏龙门市区中的水果摊";
               _loc2_.unlock = "协同战术：羸弱";
               break;
            case 19:
               _loc2_.name = "鏅憺璧涙柉锛�?";
               _loc2_.desc = "“博士……我一直在看着你——”";
               _loc2_.unlock = "协同战术：无限";
               break;
            case 20:
               _loc2_.name = "我爱摸鱼";
               _loc2_.desc = "你叫我去做我就去做啊？那我岂不是很没面子？";
               _loc2_.unlock = "协同战术：随机";
         }
         return _loc2_;
      }
      
      private static function idToNum(param1:String) : uint
      {
         return achOrder.indexOf(param1);
      }
      
      public static function checkAchVariable(param1:String, param2:uint) : void
      {
         if(isNaN(SD.achOb[param1]) || SD.achOb[param1] == null)
         {
            SD.achOb[param1] = 0;
         }
         SD.achOb[param1] += param2;
         if(SD.achOb[param1] >= getAchievement(param1).max)
         {
            setAchievement(param1);
         }
      }
      
      public static function setAchievement(param1:*) : void
      {
         var _loc2_:uint = idToNum(param1);
         if(SD.achievements.indexOf(_loc2_) == -1)
         {
            var _loc3_:Object = getAchievement(param1);
            SD.achievements.push(_loc2_);
            SH.playSound(S_Medal,true);
            SD.saveGame();
            trace("Got achievement",_loc3_.name);
            Log.CustomMetric(_loc3_.name,"Achievemens");
            ach.icon.gotoAndStop(_loc3_.sprite);
            ach.txt_name.text = _loc3_.name;
            ach.txt_desc.text = _loc3_.desc;
            ach.txt_unlock.text = !_loc3_.unlock ? "" : Stats_Misc.getMod(_loc3_.unlock).name + " 支援合约 已解锁！";
            ach.gotoAndPlay(2);
            return;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
