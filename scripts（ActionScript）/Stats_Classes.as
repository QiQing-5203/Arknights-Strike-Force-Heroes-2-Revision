package
{
   public class Stats_Classes
   {
      
      public static var classNums:Array;
       
      
      public var name:String;
      
      public var classNum:uint;
      
      public var head:uint;
      
      public var body:uint;
      
      public var camo:uint;
      
      public var team:uint;
      
      public var skillID:String;
      
      public var streakID:String;
      
      public var skill:Stats_Skills;
      
      public var streak:Stats_Streaks;
      
      public var primary:Inventory_Gun;
      
      public var secondary:Inventory_Gun;
      
      public var level:uint;
      
      public var _armor:Inventory_Armor;
      
      public var armor:Stats_Armor;
      
      public var _primaryAttach:Inventory_Attachment;
      
      public var _secondaryAttach:Inventory_Attachment;
      
      public var primaryAttach:Stats_Attachments;
      
      public var secondaryAttach:Stats_Attachments;
      
      public var hp:Number;
      
      public var crit:Number;
      
      public var aim:Number;
      
      public var ammo:Number;
      
      public var headDmg:Number;
      
      public var critDmg:Number;
      
      public var regen:Number;
      
      public var regenArmor:Number;
      
      public var fleshDmg:Number;
      
      public var armorDmg:Number;
      
      public var explosiveRes:Number;
      
      public var reflect:Number;
      
      public var diff:int;
      
      public var extra:Object;
      
      public var icon:String;
      
      public var className:String;
      
      public var startFrame:uint;
      
      public var runType:uint;
      
      public var id:String;
      
      public function Stats_Classes()
      {
         super();
      }
      
      public static function Init() : void
      {
         classNums = ["rand","engi","merc","general","sniper","jugg"];
      }
      
      public static function getClass(param1:uint, param2:uint = 1) : Object
      {
         var _loc3_:Object = {};
         _loc3_.num = param1;
         var _loc4_:* = param1;
         switch(0 !== _loc4_ ? (1 !== _loc4_ ? (2 !== _loc4_ ? (3 === _loc4_ ? 3 : (4 !== _loc4_ ? (5 === _loc4_ ? 5 : 6) : 4)) : 2) : 1) : 0)
         {
            case 0:
               _loc3_.name = "Random";
               _loc3_.id = _loc3_.icon = "rand";
               break;
            case 1:
               _loc3_.id = "engi";
               _loc3_.icon = "engineer";
               _loc3_.name = "辅助干员";
               _loc3_.title = "荒原亚叶（Wilderness Folinic）,现任辅助干员";
               _loc3_.desc = "基础档案：\n【代号】荒原亚叶\n【性别】女\n【战斗经验】两年\n【出身地】乌萨斯\n【生日】8月18日\n【种族】菲林\n【身高】164cm";
               _loc3_.playstyle = "客观履历";
               _loc3_.playdesc = "凯尔希医师的年轻学生，罗德岛优秀的医疗干员。两年前于东国历战归来，并进入精英小队听候博士差遣。\n你无法从这位真正的战地医师身上看到任何青涩，她的眼神中唯留坚毅。";
               _loc3_.startFrame = 0;
               _loc3_.weaponTypes = [0,1,2,5,6,7,8];
               _loc3_.hp = new Range(85,185);
               _loc3_.crit = new Range(10,25);
               _loc3_.aim = new Range(75,125);
               _loc3_.ammo = new Range(100,200);
               _loc3_.runType = 1;
               _loc3_.idleType = 1;
               _loc3_.scale = 1;
               break;
            case 2:
               _loc3_.id = "merc";
               _loc3_.icon = "soldier";
               _loc3_.name = "近卫干员";
               _loc3_.title = "W，现任近卫干员";
               _loc3_.desc = "基础档案:\n【代号】W\n【性别】女\n【战斗经验】十一年\n【出身地】卡兹戴尔\n【生日】本人表示遗忘\n【种族】萨卡兹\n【身高】165cm";
               _loc3_.playstyle = "客观履历";
               _loc3_.playdesc = "萨卡兹佣兵头目，W。曾参与卡兹戴尔漫长的内战，其小队以残暴而高效的作战手段闻名。在切尔诺伯格事件中与罗德岛发生冲突，后因为某些原因叛出整合运动，在凯尔希医生亲自进行了充分交涉后，与罗德岛签订战略合作条款。";
               _loc3_.startFrame = 20;
               _loc3_.weaponTypes = [0,1,6,7,8];
               _loc3_.hp = new Range(95,230);
               _loc3_.crit = new Range(4,15);
               _loc3_.aim = new Range(60,90);
               _loc3_.ammo = new Range(130,300);
               _loc3_.runType = 2;
               _loc3_.idleType = 2;
               _loc3_.scale = 1.08;
               break;
            case 3:
               _loc3_.id = "general";
               _loc3_.icon = "general";
               _loc3_.name = "特种干员";
               _loc3_.title = "温蒂（Weedy），特种干员";
               _loc3_.desc = "基础档案：\n【代号】温蒂\n【性别】女\n【战斗经验】三年\n【出身地】伊比利亚\n【生日】1月23日\n【种族】阿戈尔\n【身高】155cm";
               _loc3_.playstyle = "客观履历";
               _loc3_.playdesc = "生物工程学专家，伊比利亚科研世家出身，罗德岛成立之初就加入的研究者。\n经过本人长期调整与测试，最终完成了为自己量身定做的武器。并根据自身意愿成为干员，在战场上为同僚提供远程支援。";
               _loc3_.startFrame = 40;
               _loc3_.weaponTypes = [0,1,3,5];
               _loc3_.hp = new Range(80,160);
               _loc3_.crit = new Range(20,50);
               _loc3_.aim = new Range(45,120);
               _loc3_.ammo = new Range(80,160);
               _loc3_.runType = 1;
               _loc3_.idleType = 4;
               _loc3_.scale = 0.97;
               break;
            case 4:
               _loc3_.id = "sniper";
               _loc3_.icon = "sniper";
               _loc3_.name = "狙击干员";
               _loc3_.title = "迷迭香（Rosmontis），现任狙击干员";
               _loc3_.desc = "基础档案：\n【代号】迷迭香\n【性别】女\n【战斗经验】一年\n【出身地】哥伦比亚\n【生日】7月6日\n【种族】菲林\n【身高】142cm";
               _loc3_.playstyle = "客观履历";
               _loc3_.playdesc = "迷迭香，罗德岛精英干员，熟练掌握极稀有的源石技艺，于对抗大型生物，破坏硬目标，设施紧急制动与中断小规模冲突等任务中表现出色，并于攻坚战、阵地战与歼灭战中体现出极强的战场掌控力与显著的战术价值。";
               _loc3_.startFrame = 60;
               _loc3_.weaponTypes = [0,2,3,4];
               _loc3_.hp = new Range(70,140);
               _loc3_.crit = new Range(15,45);
               _loc3_.aim = new Range(85,130);
               _loc3_.ammo = new Range(65,130);
               _loc3_.runType = 1;
               _loc3_.idleType = 3;
               _loc3_.scale = 0.95;
               break;
            case 5:
               _loc3_.id = "jugg";
               _loc3_.icon = "tank";
               _loc3_.name = "重装干员";
               _loc3_.title = "临光（Nearl），重装干员";
               _loc3_.desc = "基础档案：\n【代号】临光\n【性别】女\n【战斗经验】五年\n【出身地】卡西米尔\n【生日】4月23日\n【种族】库兰塔\n【身高】171cm";
               _loc3_.playstyle = "客观履历";
               _loc3_.playdesc = "临光，前卡西米尔耀骑士，感染者援助团体“使徒”的一员。在掩护己方队员、机动作战、歼灭战与开阔地带作战中体现出极高的战斗技巧和个人军事素养。\n现于罗德岛作为重装干员行动，并于现场提供战术指挥支援。";
               _loc3_.startFrame = 80;
               _loc3_.weaponTypes = [0,5,6,7,8,9];
               _loc3_.hp = new Range(130,300);
               _loc3_.crit = new Range(2,10);
               _loc3_.aim = new Range(55,80);
               _loc3_.ammo = new Range(130,230);
               _loc3_.runType = 2;
               _loc3_.idleType = 5;
               _loc3_.scale = 1.15;
         }
         _loc3_.hp.cur = UT.getLinearRange(param2,50,_loc3_.hp.min,_loc3_.hp.max);
         _loc3_.crit.cur = UT.getLinearRange(param2,50,_loc3_.crit.min,_loc3_.crit.max);
         _loc3_.aim.cur = UT.getLinearRange(param2,50,_loc3_.aim.min,_loc3_.aim.max);
         _loc3_.ammo.cur = UT.getLinearRange(param2,50,_loc3_.ammo.min,_loc3_.ammo.max);
         return _loc3_;
      }
      
      public static function getNextExp(param1:uint) : uint
      {
         return param1 * param1 * 3 + 40;
      }
      
      public static function getUnitExp(param1:uint) : uint
      {
         return 4 + param1 * 1.4;
      }
      
      public static function getAiLevel(param1:int) : int
      {
         var _loc2_:int = Math.round(param1 * 3.5) + UT.irand(-3,4);
         if(_loc2_ > 50 || param1 == 15)
         {
            _loc2_ = 50;
         }
         return _loc2_ > 0 ? _loc2_ : 1;
      }
      
      public static function getReccLevel(param1:int) : String
      {
         if(param1 != 15)
         {
            var _loc2_:int = Math.round(param1 - 1) * 3.5;
            if(_loc2_ < 1)
            {
               _loc2_ = 1;
            }
            var _loc3_:int = Math.round((param1 + 1) * 3.5);
            if(_loc3_ > 50)
            {
               _loc3_ = 50;
            }
            return _loc2_ + " - " + _loc3_;
         }
         return "50";
      }
      
      public static function getLevelUnlock(param1:uint, param2:uint) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:* = "";
         _loc4_ = 0;
         while(_loc4_ < Stats_Skills.classAr[param2].length)
         {
            if(Stats_Skills.classAr[param2][_loc4_].lvlReq == param1)
            {
               _loc3_ += "\n被动技能存储序列已更新！请前往“能力”界面查看";
               break;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < Stats_Streaks.classAr[param2].length)
         {
            if(Stats_Streaks.classAr[param2][_loc4_].lvlReq == param1)
            {
               _loc3_ += "\n御敌指令存储序列已更新！请前往“能力”界面查看";
               break;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            if(Stats_Misc.getAppLvlReq("head",_loc4_) == param1)
            {
               _loc3_ += "\n头部外观存储序列已更新！请前往“外观”界面查看";
               break;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            if(Stats_Misc.getAppLvlReq("body",_loc4_) == param1)
            {
               _loc3_ += "\n躯干外观存储序列已更新！请前往“外观”界面查看";
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
