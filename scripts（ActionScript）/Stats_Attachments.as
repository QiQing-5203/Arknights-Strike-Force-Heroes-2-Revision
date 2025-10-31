package
{
   import flash.display.MovieClip;
   
   public class Stats_Attachments
   {
      
      public static var itemOb:Object;
      
      public static var itemAr:Array;
      
      public static var typeAr:Array;
       
      
      public var type:uint;
      
      public var id:String;
      
      public var rawId:String;
      
      public var sprite:String;
      
      public var name:String;
      
      public var location:String;
      
      public var costMod:Number;
      
      public var cost:uint;
      
      public var type1:String;
      
      public var value1Range:Range;
      
      public var value1:Number;
      
      public var type2:String;
      
      public var value2Range:Range;
      
      public var value2:Number;
      
      public var type3:String;
      
      public var value3Range:Range;
      
      public var value3:Number;
      
      public var type4:String;
      
      public var value4Range:Range;
      
      public var value4:Number;
      
      public function Stats_Attachments()
      {
         super();
      }
      
      public static function Init() : void
      {
         itemOb = {};
         itemAr = [];
         typeAr = [];
         var _loc1_:uint = 0;
         while(_loc1_ < 11)
         {
            typeAr.push([]);
            _loc1_++;
         }
         addItem(1,"Loudener","","“先驱者”P3 威力补偿器","barrel",2,"dmg",[0.1,0.2],"recoil",[0.1,0.25],"",[0,0],"range",[0.15,0.05]);
         addItem(1,"Long Barrel","","埃索尔 A2 射程补偿器","barrel",2,"range",[0.1,0.2],"acc",[0.1,0.2],"recoil",[0.1,0.35],"",[0,0]);
         addItem(1,"Laser Sight","","低姿战术激光指示器","side",2,"acc",[0.1,0.2],"headDmg",[0.1,0.2],"critDmg",[0.1,0.2],"",[0,0]);
         addItem(1,"Flashlight","","“夜枭”战术手电","side",2,"flash",[14,50],"vision",[0.05,0.15],"acc",[0.05,0.15],"recoil",[0.35,0.15]);
         addItem(1,"Heartbeat","","RL-01 心跳传感器","side",2,"heartbeat",[14,50],"vision",[0.05,0.2],"",[0,0],"recoil",[1,0.5]);
         addItem(1,"Holographic","","EOTECH 552全息瞄具","top",2,"vision",[0.05,0.15],"acc",[0.15,0.3],"recoil",[0.1,0.25],"",[0,0]);
         addItem(1,"HAMR","","HAMR 3x 组合式光学瞄具","top",3,"vision",[0.15,0.25],"acc",[0.2,0.35],"recoil",[0.1,0.2],"",[0,0]);
         addItem(1,"ACOG","","斥候 4-10x 光学瞄具","top",3,"normVision",[0,0],"vision",[0.2,0.4],"acc",[0.2,0.35],"",[0,0]);
         addItem(1,"ACOG TA31","","TA31 2x 先进战斗光学瞄具","top",3,"normVision",[0,0],"vision",[0.2,0.4],"acc",[0.2,0.35],"",[0,0]);
         addItem(1,"Simple Scope","","猎手 4x 简易瞄准镜","top",1.5,"recoil",[0.1,0.25],"vision",[0.2,0.4],"acc",[0.1,0.25],"",[0,0]);
         addItem(1,"FMJ","","全金属被甲弹","",2.3,"armorDmg",[0.05,0.15],"headDmg",[0.05,0.15],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(1,"HP","","中空子弹","",2.3,"fleshDmg",[0.05,0.15],"crit",[0.05,0.15],"critDmg",[0.05,0.15],"armorDmg",[0.04,0.06]);
         addItem(1,"Power Ammo","","大威力装药扩容弹匣","",2.3,"dmg",[0.15,0.3],"clip",[0.15,0.33],"range",[0.1,0.2],"recoil",[0.5,0.25]);
         addItem(1,"rubber bullet","","Detonics|橡胶弹","",0.1,"dmg",[-0.9,-0.9],"clip",[0.15,0.33],"headDmg",[1.5,1.5],"",[0,0]);
         addItem(1,"Mag","","扩容弹仓","",2,"clip",[0.2,0.35],"recoil",[0.1,0.25],"",[0,0],"",[0,0]);
         addItem(1,"Silencer","","“介字元”II型枪口消音器","barrel",2,"range",[0.1,0.2],"recoil",[0.05,0.2],"acc",[0.05,0.2],"dmg",[0.2,0.05]);
         addItem(1,"Heavy Pipe","","重型铳管","",2,"range",[0.15,0.3],"recoil",[0.2,0.35],"speed",[-0.35,-0.15],"acc",[-0.1,-0.25]);
         addItem(1,"JAK","","JAK战术改件","",4.5,"headDmg",[0.25,0.45],"critDmg",[0.5,0.75],"acc",[0.21,0.38],"",[0,0]);
         addItem(1,"Red Dot","","Coyote 红点瞄准镜","top",2,"vision",[0.05,0.2],"acc",[0.15,0.3],"",[0,0],"",[0,0]);
         addItem(2,"Silencer","","速射手 枪口消音器/静音改装","barrel",2,"range",[0.1,0.2],"recoil",[0.05,0.2],"acc",[0.05,0.2],"dmg",[0.2,0.05]);
         addItem(2,"Long Barrel","","埃索尔 A2 射程补偿器","barrel",2,"range",[0.1,0.2],"acc",[0.1,0.2],"recoil",[0.1,0.35],"",[0,0]);
         addItem(2,"Grip","","库兰塔 军用制式握把","bottom",1.7,"recoil",[0.2,0.5],"acc",[0.1,0.2],"",[0,0],"",[0,0]);
         addItem(2,"Flashlight","","“夜枭”战术手电","side",2,"flash",[14,50],"vision",[0.05,0.15],"acc",[0.05,0.15],"recoil",[0.35,0.15]);
         addItem(2,"Red Dot","","Coyote 红点瞄准镜","top",2,"vision",[0.05,0.2],"acc",[0.15,0.3],"",[0,0],"",[0,0]);
         addItem(2,"Fire","","火系法术弹药/铝热箭","",2.4,"fire",[0.05,0.1],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(2,"Ice","","冰系法术弹药/冰晶箭","",2.3,"ice",[0.1,0.15],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(2,"Zap","","冲击型法术弹药/高压箭","",2.2,"zap",[0.1,0.15],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(2,"Acid","","强酸弹/淬毒箭","",2.3,"acid",[0.05,0.1],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(2,"Mag","","扩容弹仓/箭匣","",2,"clip",[0.2,0.35],"recoil",[0.1,0.25],"",[0,0],"",[0,0]);
         addItem(2,"rubber bullet","","Detonics|橡胶弹","",0.1,"dmg",[-0.9,-0.9],"clip",[0.15,0.33],"headDmg",[1.5,1.5],"",[0,0]);
         addItem(3,"Hair Trigger","","轻骑兵 KS1强化型扳机","",1,"speed",[0.1,0.2],"dmg",[0.05,0.1],"",[0,0],"recoil",[0.45,0.2]);
         addItem(3,"Silencer","","“介字元”II型枪口消音器","barrel",2,"range",[0.1,0.2],"recoil",[0.05,0.2],"acc",[0.05,0.2],"dmg",[0.2,0.05]);
         addItem(3,"Laser Sight","","低姿战术激光指示器","side",2,"acc",[0.1,0.2],"headDmg",[0.1,0.2],"critDmg",[0.1,0.2],"",[0,0]);
         addItem(3,"FMJ","","全金属披甲弹","",2.3,"armorDmg",[0.05,0.15],"headDmg",[0.05,0.15],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(3,"HP","","中空子弹","",2.3,"fleshDmg",[0.05,0.15],"crit",[0.05,0.15],"critDmg",[0.05,0.15],"armorDmg",[0.04,0.06]);
         addItem(3,"Ice","","冰系法术弹药","",2.3,"ice",[0.1,0.15],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(3,"Zap","","冲击型法术弹药","",2.2,"zap",[0.1,0.15],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(3,"rubber bullet","","Detonics|橡胶弹","",0.1,"dmg",[-0.9,-0.9],"clip",[0.15,0.33],"headDmg",[1.5,1.5],"",[0,0]);
         addItem(4,"Laser Sight","","低姿战术激光指示器","side",2,"acc",[0.1,0.2],"headDmg",[0.1,0.2],"critDmg",[0.1,0.2],"",[0,0]);
         addItem(4,"Heartbeat","","RL-01 心跳传感器","side",2.5,"heartbeat",[14,50],"vision",[0.05,0.2],"",[0,0],"recoil",[1,0.5]);
         addItem(4,"ACOG","","斥候 4-10x 光学瞄具","top",3,"normVision",[0,0],"vision",[0.2,0.4],"acc",[0.2,0.35],"",[0,0]);
         addItem(4,"ACOG TA31","","TA31 2x 先进战斗光学瞄具","top",3,"normVision",[0,0],"vision",[0.2,0.4],"acc",[0.2,0.35],"",[0,0]);
         addItem(4,"Simple Scope","","猎手 4x 简易瞄准镜","top",1.5,"recoil",[0.1,0.25],"vision",[0.2,0.4],"acc",[0.1,0.25],"",[0,0]);
         addItem(4,"Thermal","","沃尔特 4x 热成像传感器","top",2,"crit",[0.05,0.15],"critDmg",[0.1,0.2],"",[0,0],"acc",[0.2,0.1]);
         addItem(4,"FMJ","","全金属被甲弹/破甲箭矢","",2.3,"armorDmg",[0.05,0.15],"headDmg",[0.05,0.15],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(4,"HP","","中空子弹/高爆箭矢","",2.3,"fleshDmg",[0.05,0.15],"crit",[0.05,0.15],"critDmg",[0.05,0.15],"armorDmg",[0.04,0.06]);
         addItem(4,"Mag","","扩容弹仓/箭匣","",2,"clip",[0.2,0.35],"recoil",[0.1,0.25],"",[0,0],"",[0,0]);
         addItem(5,"Hair Trigger","","轻骑兵 KS1强化型扳机","",2,"speed",[0.1,0.2],"dmg",[0.05,0.1],"",[0,0],"recoil",[0.45,0.2]);
         addItem(5,"Loudener","","“先驱者”P3 威力补偿器","barrel",2,"dmg",[0.1,0.2],"recoil",[0.1,0.25],"",[0,0],"range",[0.15,0.05]);
         addItem(5,"Heartbeat","","RL-01 心跳传感器","side",2.5,"heartbeat",[14,50],"vision",[0.1,0.25],"",[0,0],"recoil",[1,0.5]);
         addItem(5,"Long Barrel","","埃索尔 A2 射程补偿器","barrel",2,"range",[0.1,0.2],"acc",[0.1,0.2],"recoil",[0.1,0.35],"",[0,0]);
         addItem(5,"Fire","","火系法术弹药","",2.4,"fire",[0.05,0.1],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(5,"Dragon","Fire","龙息弹","",4.8,"fire",[0.6,0.95],"clip",[-0.33,-0.1],"fleshDmg",[0.3,0.5],"",[0,0]);
         addItem(5,"Acid","","强酸弹","",2.3,"acid",[0.05,0.1],"clip",[0.05,0.15],"",[0,0],"dmg",[0.04,0.06]);
         addItem(5,"Mag","","扩容弹仓","",2,"clip",[0.2,0.35],"recoil",[0.1,0.25],"",[0,0],"",[0,0]);
         addItem(5,"Red Dot","","Coyote 红点瞄准镜","top",2,"vision",[0.05,0.2],"acc",[0.15,0.3],"",[0,0],"",[0,0]);
         addItem(5,"Holographic","","EOTECH 552全息瞄具","top",2,"vision",[0.05,0.15],"acc",[0.15,0.3],"recoil",[0.1,0.25],"",[0,0]);
         addItem(5,"Thermal","","沃尔特 4x 热成像传感器","top",2,"crit",[0.05,0.15],"critDmg",[0.1,0.2],"",[0,0],"acc",[0.2,0.1]);
         addItem(6,"Grip","","库兰塔 军用制式握把","bottom",1.7,"recoil",[0.2,0.5],"acc",[0.1,0.2],"",[0,0],"",[0,0]);
         addItem(6,"Heartbeat","","RL-01 心跳传感器","side",2.5,"heartbeat",[14,50],"vision",[0.05,0.2],"",[0,0],"recoil",[1,0.5]);
         addItem(6,"HAMR","","HAMR 3x 组合式光学瞄具","top",3,"vision",[0.15,0.25],"acc",[0.2,0.35],"recoil",[0.1,0.2],"",[0,0]);
         addItem(6,"Red Dot","","Coyote 红点瞄准镜","top",2,"vision",[0.05,0.2],"acc",[0.15,0.3],"",[0,0],"",[0,0]);
         addItem(6,"Holographic","","EOTECH 552全息瞄具","top",2,"vision",[0.05,0.15],"acc",[0.15,0.3],"recoil",[0.1,0.25],"",[0,0]);
         addItem(6,"FMJ","","全金属披甲弹","",2.3,"armorDmg",[0.05,0.15],"headDmg",[0.05,0.15],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(6,"HP","","中空子弹","",2.3,"fleshDmg",[0.05,0.15],"crit",[0.05,0.15],"critDmg",[0.05,0.15],"armorDmg",[0.04,0.06]);
         addItem(6,"Mag","","扩容弹仓","",2,"clip",[0.2,0.35],"recoil",[0.1,0.25],"",[0,0],"",[0,0]);
         addItem(6,"Heavy Pipe","","重型铳管","",2,"range",[0.15,0.3],"recoil",[0.2,0.35],"speed",[-0.35,-0.15],"acc",[-0.1,-0.25]);
         addItem(7,"Heartbeat","","RL-01 心跳传感器","side",2.5,"heartbeat",[14,50],"vision",[0.05,0.2],"",[0,0],"recoil",[1,0.5]);
         addItem(7,"Locater","","G102榴弹发射器","side",2,"dmg",[0.1,0.2],"acc",[0.15,0.35],"range",[0.05,0.15],"radius",[0.3,0.1]);
         addItem(7,"Flux","","“微光”磁通电容器","side",2,"cancrit",[0,0],"crit",[0.05,0.15],"radius",[0.1,0.25],"dmg",[0.2,0.1]);
         addItem(7,"FMJB","FMJ","高能源石爆破物装药（反器材型）","",2.1,"armorDmg",[0.1,0.2],"radius",[0.05,0.2],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(7,"HPB","HP","高能源石爆破物装药（反人员型）","",2.1,"fleshDmg",[0.1,0.2],"radius",[0.05,0.2],"",[0,0],"armorDmg",[0.04,0.06]);
         addItem(7,"FireB","Fire","热敏高能源石装药","",2.2,"fire2",[0.15,0.3],"fleshDmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(7,"ZapB","Zap","电磁脉冲装药","",2.1,"zap2",[0.25,0.5],"dmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(7,"IceB","Ice","“霜星”装药","",2.1,"ice2",[0.25,0.5],"dmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(7,"AcidB","Acid","酸液源石虫萃取物装药","",2.2,"acid2",[0.15,0.3],"armorDmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(8,"Heartbeat","","RL-01 心跳传感器","side",2.5,"heartbeat",[14,50],"vision",[0.05,0.2],"",[0,0],"recoil",[1,0.5]);
         addItem(8,"FireB","Fire","热敏高能源石装药","",2.2,"fire2",[0.15,0.3],"fleshDmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(8,"ZapB","Zap","电磁脉冲装药","",2.1,"zap2",[0.25,0.5],"dmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(8,"IceB","Ice","“霜星”装药","",2.1,"ice2",[0.25,0.5],"dmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(8,"AcidB","Acid","酸液源石虫萃取物装药","",2.2,"acid2",[0.15,0.3],"armorDmg",[0.05,0.1],"",[0,0],"",[0,0]);
         addItem(8,"FMJB","FMJ","高能源石爆破物装药（反器材型）","",2.1,"armorDmg",[0.1,0.2],"radius",[0.05,0.2],"",[0,0],"fleshDmg",[0.04,0.06]);
         addItem(8,"HPB","HP","高能源石爆破物装药（反人员型）","",2.1,"fleshDmg",[0.1,0.2],"radius",[0.05,0.2],"",[0,0],"armorDmg",[0.04,0.06]);
         addItem(8,"Flux","","“微光”磁通电容器","side",2,"cancrit",[0,0],"crit",[0.05,0.15],"radius",[0.1,0.25],"dmg",[0.2,0.1]);
         addItem(8,"Red Dot","","Coyote 红点瞄准镜","top",2,"vision",[0.05,0.2],"acc",[0.15,0.3],"",[0,0],"",[0,0]);
         addItem(8,"Holographic","","EOTECH 552全息瞄具","top",2,"vision",[0.05,0.15],"acc",[0.15,0.3],"recoil",[0.1,0.25],"",[0,0]);
         addItem(8,"Thermal","","沃尔特 4x 热成像传感器","top",2,"crit",[0.05,0.15],"critDmg",[0.1,0.2],"cancrit",[0,0],"acc",[0.2,0.1]);
         addItem(9,"Inject","","强效能源注入器","side",2,"dmg",[0.1,0.2],"speed",[0.05,0.1],"range",[0.05,0.15],"consume",[0.15,0.3]);
         addItem(9,"Consume","","能源回收转换器","side",2,"consume",[0.15,0.3],"",[0,0],"",[0,0],"dmg",[0.15,0.2]);
         addItem(9,"Plate","","磁力偏转板","top",2.2,"reduce",[0.1,0.2],"",[0,0],"",[0,0],"recoil",[0.75,0.25]);
         addItem(4,"Scope","","Mark 5 HD 5-25x长焦瞄准镜","top",3.5,"crit",[0.15,0.5],"vision",[0.4,0.8],"acc",[0.4,0.7],"recoil",[30,25]);
      }
      
      public static function addItem(param1:uint, param2:String, param3:String, param4:String, param5:String, param6:Number, param7:String, param8:Array, param9:String, param10:Array, param11:String, param12:Array, param13:String, param14:Array) : void
      {
         var _loc15_:Stats_Attachments;
         (_loc15_ = new Stats_Attachments()).type = param1;
         _loc15_.id = param2;
         _loc15_.rawId = param2;
         _loc15_.sprite = !param3 ? param2 : param3;
         _loc15_.name = !param4 ? param2 : param4;
         _loc15_.location = param5;
         _loc15_.costMod = param6;
         _loc15_.cost = 0;
         _loc15_.type1 = param7;
         _loc15_.value1Range = new Range(param8[0],param8[1]);
         _loc15_.value1 = 0;
         _loc15_.type2 = param9;
         _loc15_.value2Range = new Range(param10[0],param10[1]);
         _loc15_.value2 = 0;
         _loc15_.type3 = param11;
         _loc15_.value3Range = new Range(param12[0],param12[1]);
         _loc15_.value3 = 0;
         _loc15_.type4 = param13;
         _loc15_.value4Range = new Range(param14[0],param14[1]);
         _loc15_.value4 = 0;
         _loc15_.id += param1;
         itemOb[param2 + param1] = _loc15_;
         itemOb[param2] = _loc15_;
         itemAr.push(_loc15_);
         typeAr[param1].push(_loc15_);
      }
      
      public static function display(param1:MovieClip, param2:Stats_Attachments = null) : void
      {
         if(param1.top)
         {
            param1.top.visible = false;
         }
         if(param1.bottom)
         {
            param1.bottom.visible = false;
         }
         if(param1.side)
         {
            param1.side.visible = false;
         }
         if(param1.barrel)
         {
            param1.barrel.visible = false;
         }
         if(!(!param2 || !param2.location || !param1[param2.location]))
         {
            param1[param2.location].visible = true;
            param1[param2.location].gotoAndStop(param2.sprite);
            return;
         }
      }
      
      public static function addMods(param1:Inventory_Attachment) : void
      {
         param1.modValue1 = UT.rand(0.9,1.1);
         param1.modValue2 = UT.rand(0.9,1.1);
         param1.modValue3 = UT.rand(0.9,1.1);
         param1.modValue4 = UT.rand(0.9,1.1);
         param1.modCost = (param1.modValue1 + param1.modValue2 + param1.modValue3 + param1.modValue4) / 4;
         param1.modValue1 += param1.rarity * 0.08;
         param1.modValue2 += param1.rarity * 0.08;
         param1.modValue3 += param1.rarity * 0.08;
         param1.modValue4 += param1.rarity * 0.08;
         param1.modCost += UT.rand(param1.rarity * 0.15,param1.rarity * 0.2);
      }
      
      public static function createBasicItem(param1:String) : Stats_Attachments
      {
         return Stats_Attachments.createFinalItem(Inventory_Attachment.createInventoryItem(param1,1,0));
      }
      
      public static function createFinalItem(param1:Inventory_Attachment) : Stats_Attachments
      {
         var _loc2_:Stats_Attachments = UT.clone(Stats_Attachments.itemOb[param1.id]) as Stats_Attachments;
         _loc2_.value1 = UT.getLinearRange(param1.level,50,_loc2_.value1Range.min,_loc2_.value1Range.max);
         _loc2_.value2 = UT.getLinearRange(param1.level,50,_loc2_.value2Range.min,_loc2_.value2Range.max);
         _loc2_.value3 = UT.getLinearRange(param1.level,50,_loc2_.value3Range.min,_loc2_.value3Range.max);
         _loc2_.value4 = UT.getLinearRange(param1.level,50,_loc2_.value4Range.min,_loc2_.value4Range.max);
         _loc2_.cost = Stats_Misc.getCost(param1.level,_loc2_.costMod);
         _loc2_.value1 *= param1.modValue1;
         _loc2_.value2 *= param1.modValue2;
         _loc2_.value3 *= param1.modValue3;
         _loc2_.value4 *= 2 - param1.modValue4;
         _loc2_.cost = Math.round(_loc2_.cost * param1.modCost);
         if(param1.invalidName)
         {
            _loc2_.name += " " + param1.invalidName;
         }
         return _loc2_;
      }
      
      public static function getEffectText(param1:Stats_Attachments) : Array
      {
         var _loc4_:Number = NaN;
         var _loc2_:Array = [""];
         var _loc3_:uint = 1;
         for(; _loc3_ <= 4; _loc3_++)
         {
            _loc4_ = Math.round(Number(param1["value" + _loc3_]) * 100);
            if(_loc3_ >= 4)
            {
               var _loc5_:* = param1["type" + _loc3_];
               switch("acc" !== _loc5_ ? ("dmg" !== _loc5_ ? ("recoil" === _loc5_ ? 2 : ("range" !== _loc5_ ? ("vision" === _loc5_ ? 4 : ("consume" !== _loc5_ ? ("radius" !== _loc5_ ? ("armorDmg" === _loc5_ ? 7 : ("fleshDmg" !== _loc5_ ? 9 : 8)) : 6) : 5)) : 3)) : 1) : 0)
               {
                  case 0:
                     _loc2_.push("降低" + _loc4_ + "%的精准度");
                     continue;
                  case 1:
                     _loc2_.push("减少" + _loc4_ + "%的伤害");
                     continue;
                  case 2:
                     _loc2_.push("增加" + _loc4_ + "%的后坐力");
                     continue;
                  case 3:
                     _loc2_.push("减少" + _loc4_ + "%的有效射程");
                     continue;
                  case 4:
                     _loc2_.push("减少" + _loc4_ + "%的视野范围");
                     continue;
                  case 5:
                     _loc2_.push("增加" + _loc4_ + "%的弹药消耗");
                     continue;
                  case 6:
                     _loc2_.push("减小" + _loc4_ + "%的爆炸半径");
                     continue;
                  case 7:
                     _loc2_.push("减少" + _loc4_ + "%对护甲的伤害");
                     continue;
                  case 8:
                     _loc2_.push("减少" + _loc4_ + "%对肉体的伤害");
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               _loc5_ = param1["type" + _loc3_];
               switch("acc" !== _loc5_ ? ("dmg" !== _loc5_ ? ("crit" !== _loc5_ ? ("critDmg" !== _loc5_ ? ("headDmg" === _loc5_ ? 4 : ("heartbeat" !== _loc5_ ? ("flash" === _loc5_ ? 6 : ("recoil" !== _loc5_ ? ("range" === _loc5_ ? 8 : ("vision" !== _loc5_ ? ("reduce" === _loc5_ ? 10 : ("consume" !== _loc5_ ? ("normVision" !== _loc5_ ? ("radius" !== _loc5_ ? ("cancrit" === _loc5_ ? 14 : ("fire" !== _loc5_ ? ("fire2" !== _loc5_ ? ("ice" === _loc5_ ? 17 : ("ice2" !== _loc5_ ? ("zap" === _loc5_ ? 19 : ("zap2" !== _loc5_ ? ("acid" !== _loc5_ ? ("acid2" === _loc5_ ? 22 : ("speed" !== _loc5_ ? ("armorDmg" === _loc5_ ? 24 : ("fleshDmg" !== _loc5_ ? ("clip" !== _loc5_ ? 27 : 26) : 25)) : 23)) : 21) : 20)) : 18)) : 16) : 15)) : 13) : 12) : 11)) : 9)) : 7)) : 5)) : 3) : 2) : 1) : 0)
               {
                  case 0:
                     _loc2_.push("提升" + _loc4_ + "%的精准度");
                     continue;
                  case 1:
                     _loc2_.push("提升" + _loc4_ + "%的伤害");
                     continue;
                  case 2:
                     _loc2_.push("提升" + _loc4_ + "%的暴击率");
                     continue;
                  case 3:
                     _loc2_.push("提升" + _loc4_ + "%的暴击伤害");
                     continue;
                  case 4:
                     _loc2_.push("提升" + _loc4_ + "%的爆头伤害");
                     continue;
                  case 5:
                     _loc2_.push("敌人的位置将始终暴露在雷达中");
                     continue;
                  case 6:
                     _loc2_.push("命中后降低目标的精准度");
                     continue;
                  case 7:
                     _loc2_.push("降低" + _loc4_ + "%的后坐力");
                     continue;
                  case 8:
                     _loc2_.push("提升" + _loc4_ + "%的有效射程");
                     continue;
                  case 9:
                     _loc2_.push("提升" + _loc4_ + "%的视野范围");
                     continue;
                  case 10:
                     _loc2_.push("降低受到攻击伤害的" + _loc4_ + "%");
                     continue;
                  case 11:
                     _loc2_.push("降低" + _loc4_ + "%的弹药消耗");
                     continue;
                  case 12:
                     _loc2_.push("标准视野范围");
                     continue;
                  case 13:
                     _loc2_.push("增大" + _loc4_ + "%的爆炸半径");
                     continue;
                  case 14:
                     _loc2_.push("使该武器可触发暴击");
                     continue;
                  case 15:
                  case 16:
                     _loc2_.push(_loc4_ + "%的几率点燃目标，短时间持续造成较大伤害");
                     continue;
                  case 17:
                  case 18:
                     _loc2_.push(_loc4_ + "%的几率冰冻目标，降低目标的攻击速度");
                     continue;
                  case 19:
                  case 20:
                     _loc2_.push(_loc4_ + "%的几率电击目标，降低目标的攻击伤害");
                     continue;
                  case 21:
                  case 22:
                     _loc2_.push(_loc4_ + "%的几率腐蚀目标，长时间持续造成少量伤害");
                     continue;
                  case 23:
                     _loc2_.push("提升" + _loc4_ + "%的射速");
                     continue;
                  case 24:
                     _loc2_.push("增加" + _loc4_ + "%对护甲的伤害");
                     continue;
                  case 25:
                     _loc2_.push("增加" + _loc4_ + "%对肉体的伤害");
                     continue;
                  case 26:
                     _loc2_.push("扩容" + _loc4_ + "%的载弹量");
                     continue;
                  default:
                     continue;
               }
            }
         }
         return _loc2_;
      }
      
      public static function applyAttachStats(param1:Stats_Guns, param2:Stats_Attachments) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:uint = 1;
         for(; _loc3_ <= 4; _loc3_++)
         {
            _loc4_ = Number(param2["value" + _loc3_]);
            _loc5_ = 1 + param2["value" + _loc3_];
            _loc6_ = 1 - Number(param2["value" + _loc3_]);
            if(param2.rawId == "Silencer")
            {
               param1.shotSound = S_silencer;
            }
            if(_loc3_ >= 4)
            {
               var _loc7_:* = param2["type" + _loc3_];
               switch("acc" !== _loc7_ ? ("dmg" !== _loc7_ ? ("recoil" === _loc7_ ? 2 : ("range" !== _loc7_ ? ("consume" !== _loc7_ ? ("radius" === _loc7_ ? 5 : ("armorDmg" !== _loc7_ ? ("fleshDmg" === _loc7_ ? 7 : 8) : 6)) : 4) : 3)) : 1) : 0)
               {
                  case 0:
                     param1.recoil *= _loc5_;
                     continue;
                  case 1:
                     param1.dmg *= _loc6_;
                     continue;
                  case 2:
                     param1.recoilSpread *= _loc5_;
                     continue;
                  case 3:
                     param1.range *= _loc6_;
                     continue;
                  case 4:
                     param1.consume = _loc5_;
                     continue;
                  case 5:
                     param1.splash *= _loc6_;
                     continue;
                  case 6:
                     param1.armorDmg -= _loc4_;
                     continue;
                  case 7:
                     param1.fleshDmg -= _loc4_;
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               _loc7_ = param2["type" + _loc3_];
               switch("acc" !== _loc7_ ? ("dmg" !== _loc7_ ? ("crit" === _loc7_ ? 2 : ("critDmg" !== _loc7_ ? ("headDmg" !== _loc7_ ? ("heartbeat" !== _loc7_ ? ("flash" === _loc7_ ? 6 : ("recoil" !== _loc7_ ? ("range" !== _loc7_ ? ("vision" === _loc7_ ? 9 : ("reduce" !== _loc7_ ? ("consume" === _loc7_ ? 11 : ("normVision" !== _loc7_ ? ("radius" === _loc7_ ? 13 : ("cancrit" !== _loc7_ ? ("speed" === _loc7_ ? 15 : ("armorDmg" !== _loc7_ ? ("fleshDmg" === _loc7_ ? 17 : ("clip" !== _loc7_ ? ("fire" === _loc7_ ? 19 : ("ice" !== _loc7_ ? ("zap" === _loc7_ ? 21 : ("acid" !== _loc7_ ? ("fire2" !== _loc7_ ? ("ice2" === _loc7_ ? 24 : ("zap2" !== _loc7_ ? ("acid2" === _loc7_ ? 26 : 27) : 25)) : 23) : 22)) : 20)) : 18)) : 16)) : 14)) : 12)) : 10)) : 8) : 7)) : 5) : 4) : 3)) : 1) : 0)
               {
                  case 0:
                     param1.recoil *= _loc6_;
                     continue;
                  case 1:
                     param1.dmg *= _loc5_;
                     continue;
                  case 2:
                     param1.crit += _loc4_;
                     continue;
                  case 3:
                     param1.critDmg += _loc4_;
                     continue;
                  case 4:
                     param1.headDmg += _loc4_;
                     continue;
                  case 5:
                     param1.heartbeat = true;
                     continue;
                  case 6:
                     param1.flash = true;
                     continue;
                  case 7:
                     param1.recoilSpread *= _loc6_;
                     continue;
                  case 8:
                     param1.range *= _loc5_;
                     continue;
                  case 9:
                     param1.vision += _loc4_;
                     continue;
                  case 10:
                     param1.reduce = _loc6_;
                     continue;
                  case 11:
                     param1.consume = _loc6_;
                     continue;
                  case 12:
                     param1.vision = 0.5;
                     continue;
                  case 13:
                     param1.splash *= _loc5_;
                     continue;
                  case 14:
                     param1.noCrit = false;
                     continue;
                  case 15:
                     param1.shootDelay *= _loc6_;
                     continue;
                  case 16:
                     param1.armorDmg += _loc4_;
                     continue;
                  case 17:
                     param1.fleshDmg += _loc4_;
                     continue;
                  case 18:
                     param1.clipSize *= _loc5_;
                     continue;
                  case 19:
                     param1.fire += _loc4_;
                     param1.effHit = "bulletsparkFire";
                     continue;
                  case 20:
                     param1.ice += _loc4_;
                     param1.effHit = "bulletsparkIce";
                     continue;
                  case 21:
                     param1.zap += _loc4_;
                     param1.effHit = "bulletsparkZap";
                     continue;
                  case 22:
                     param1.acid += _loc4_;
                     param1.effHit = "bulletsparkAcid";
                     continue;
                  case 23:
                     param1.fire += _loc4_;
                     continue;
                  case 24:
                     param1.ice += _loc4_;
                     continue;
                  case 25:
                     param1.zap += _loc4_;
                     continue;
                  case 26:
                     param1.acid += _loc4_;
                     continue;
                  default:
                     continue;
               }
            }
         }
      }
      
      public static function getRandPrimary(param1:Object) : String
      {
         return "none";
      }
      
      public static function getRandSecondary(param1:Object) : String
      {
         return "none";
      }
      
      public static function getRandItemId(param1:uint) : String
      {
         return UT.randEl(typeAr[param1]).id;
      }
      
      public static function getRandItem(param1:Stats_Classes) : Inventory_Attachment
      {
         return Inventory_Attachment.createInventoryItem(Stats_Attachments.getRandItemId(Stats_Guns.itemOb[param1.primary.id].type),param1.level,Stats_Misc.getRandRarity(0));
      }
   }
}
