package
{
   public class Stats_Maps
   {
      
      public static var mapOrder:Array;
       
      
      public function Stats_Maps()
      {
         super();
      }
      
      public static function Init() : void
      {
         mapOrder = ["factory","space","base","convoy","convoyStill","mansion","mansionFull","mansionLab","market","marketDay","mech","doubleMech","factoryMech"];
      }
      
      public static function getMap(param1:String) : Object
      {
         var _loc2_:Object = {};
         _loc2_.id = param1;
         var _loc3_:* = param1;
         switch("factory" !== _loc3_ ? ("factoryMech" !== _loc3_ ? ("space" === _loc3_ ? 2 : ("convoy" !== _loc3_ ? ("convoyStill" === _loc3_ ? 4 : ("mansion" !== _loc3_ ? ("mansionDay" !== _loc3_ ? ("mansionFull" === _loc3_ ? 7 : ("mansionLab" !== _loc3_ ? ("mansionIagi" !== _loc3_ ? ("market" === _loc3_ ? 10 : ("marketDay" !== _loc3_ ? ("base" === _loc3_ ? 12 : ("mech" !== _loc3_ ? ("doubleMech" === _loc3_ ? 14 : 15) : 13)) : 11)) : 9) : 8)) : 6) : 5)) : 3)) : 1) : 0)
         {
            case 0:
               _loc2_.map = "factory";
               _loc2_.bg1 = "mechCovered";
               _loc2_.bg2 = "factoryb";
               _loc2_.sky = "";
               _loc2_.particles = "factory";
               _loc2_.name = "切尔诺伯格 荒废工厂";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 0;
               break;
            case 1:
               _loc2_.map = "factory";
               _loc2_.bg1 = "mech";
               _loc2_.bg2 = "factoryb";
               _loc2_.sky = "";
               _loc2_.particles = "factory";
               _loc2_.name = "切尔诺伯格 指挥塔 底层";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "";
               _loc2_.extra = "factoryMech";
               _loc2_.water = 0;
               break;
            case 2:
               _loc2_.map = "space";
               _loc2_.bg1 = "";
               _loc2_.bg2 = "earth";
               _loc2_.sky = "";
               _loc2_.particles = "space";
               _loc2_.name = "“引航者”空间站";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "space";
               _loc2_.extra = "space";
               _loc2_.water = 0;
               break;
            case 3:
               _loc2_.map = "convoy";
               _loc2_.bg1 = "desert";
               _loc2_.bg2 = "desertb";
               _loc2_.sky = "desert";
               _loc2_.particles = "convoy";
               _loc2_.name = "护航车队";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "convoy";
               _loc2_.extra = "convoy";
               _loc2_.water = 0;
               break;
            case 4:
               _loc2_.map = "convoyStill";
               _loc2_.bg1 = "desert2";
               _loc2_.bg2 = "desertb2";
               _loc2_.sky = "desert2";
               _loc2_.particles = "convoyStill";
               _loc2_.name = "失联车队";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 0;
               break;
            case 5:
               _loc2_.map = "mansion";
               _loc2_.bg1 = "mansion";
               _loc2_.bg2 = "moon";
               _loc2_.sky = "night";
               _loc2_.particles = "mansionNight";
               _loc2_.name = "白面鸮的宅邸";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 39423;
               break;
            case 6:
               _loc2_.map = "mansion";
               _loc2_.bg1 = "mansion2";
               _loc2_.bg2 = "";
               _loc2_.sky = "dusk";
               _loc2_.particles = "mansionDay";
               _loc2_.name = "白面鸮的宅邸（黄昏）";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 39423;
               break;
            case 7:
               _loc2_.map = "mansionFull";
               _loc2_.bg1 = "mansion2";
               _loc2_.bg2 = "";
               _loc2_.sky = "dusk";
               _loc2_.particles = "mansionDay";
               _loc2_.name = "白面鸮的宅邸与地下实验室";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 39423;
               break;
            case 8:
               _loc2_.map = "mansionLab";
               _loc2_.bg1 = "";
               _loc2_.bg2 = "";
               _loc2_.sky = "";
               _loc2_.particles = "";
               _loc2_.name = "白面鸮的地下实验室";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 39423;
               break;
            case 9:
               _loc2_.map = "mansionIagi";
               _loc2_.bg1 = "mansion2";
               _loc2_.bg2 = "";
               _loc2_.sky = "dusk";
               _loc2_.particles = "mansionDay";
               _loc2_.name = "白面鸮曾经的宅邸";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 39423;
               break;
            case 10:
               _loc2_.map = "market";
               _loc2_.bg1 = "city";
               _loc2_.bg2 = "";
               _loc2_.sky = "city";
               _loc2_.particles = "market";
               _loc2_.name = "龙门市区";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 0;
               break;
            case 11:
               _loc2_.map = "market";
               _loc2_.bg1 = "city2";
               _loc2_.bg2 = "";
               _loc2_.sky = "city2";
               _loc2_.particles = "market";
               _loc2_.name = "龙门商业街";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "";
               _loc2_.water = 0;
               break;
            case 12:
               _loc2_.map = "base";
               _loc2_.bg1 = "base0";
               _loc2_.bg2 = "base2";
               _loc2_.sky = "brown";
               _loc2_.particles = "base";
               _loc2_.name = "罗德岛本舰";
               _loc2_.desc = "A large smelting plant that houses a dark secret. Beware the lava down pour.";
               _loc2_.phys = "";
               _loc2_.extra = "base";
               _loc2_.water = 0;
               break;
            case 13:
               _loc2_.map = "mech";
               _loc2_.bg1 = "";
               _loc2_.bg2 = "";
               _loc2_.sky = "skyMove";
               _loc2_.particles = "";
               _loc2_.name = "机甲之巅";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "";
               _loc2_.extra = "mech";
               _loc2_.water = 0;
               break;
            case 14:
               _loc2_.map = "mech";
               _loc2_.bg1 = "mech";
               _loc2_.bg2 = "base2";
               _loc2_.sky = "brown";
               _loc2_.particles = "";
               _loc2_.name = "机甲之巅（擂台）";
               _loc2_.desc = "A speeding train carrying a live nuclear missile.";
               _loc2_.phys = "";
               _loc2_.extra = "doubleMech";
               _loc2_.water = 0;
         }
         return _loc2_;
      }
   }
}
