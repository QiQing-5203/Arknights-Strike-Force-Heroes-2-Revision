package
{
   public class Stats_Skills
   {
      
      public static var itemOb:Object;
      
      public static var itemAr:Array;
      
      public static var classAr:Array;
       
      
      public var id:String;
      
      public var sprite:String;
      
      public var name:String;
      
      public var lvlReq:uint;
      
      public var value:Number;
      
      public var special:String;
      
      public var desc:String;
      
      public function Stats_Skills()
      {
         super();
      }
      
      public static function Init() : void
      {
         itemOb = {};
         itemAr = [];
         classAr = [];
         var _loc1_:uint = 0;
         while(_loc1_ < 6)
         {
            classAr.push([]);
            _loc1_++;
         }
         addItem(0,"autostreak","妈的开纪是吧","技力光环",1,3,"妈的开纪是吧","每3秒获得一点御敌指令充能数");
         addItem(0,"autostreak1","妈的开纪是吧","技力光环·I",1,1.5,"妈的开纪是吧","每1.5秒获得一点御敌指令充能数");
         addItem(0,"autostreak2","妈的开纪是吧","技力光环·II",1,0.5,"妈的开纪是吧","每0.5秒获得一点御敌指令充能数");
         addItem(0,"autostreak3","妈的开纪是吧","技力光环·III",1,0.1,"妈的开纪是吧","每0.1秒获得一点御敌指令充能数");
         addItem(0,"invis","","迷彩强化",1,0,"妈的开纪是吧","隐身状态下，即使受到伤害也不会显形");
         addItem(0,"radar","","入侵者监控模式",1,0,"妈的开纪是吧","总是将敌人的位置标记在小地图上");
         addItem(1,"none","","无",1,-1,"","");
         addItem(1,"steady","","精准捕杀",2,-1,"移动和射击时武器精准度不会下降","以牢固的握力使武器保持最佳精准度");
         addItem(1,"adren","","迅捷打击·γ型",6,0.7,"受到攻击后5秒内，攻击速度+30%","提升受到伤害后的攻击速度以帮助自己摆脱困境");
         addItem(1,"regen","","紧急包扎",10,5,"自动恢复生命值的速度提升400%","一段时间不受到伤害后，使用罗德岛最新研发的特效药快速恢复投影的生命值");
         addItem(1,"efficiency","","高效补给",14,-1,"所有御敌指令需求的充能数降低1点","所有支援装置的部署效率将得到显著提高");
         addItem(2,"none","","无",1,-1,"","");
         addItem(2,"nosweat","","火神附体",2,-0.3,"受到的爆炸与燃烧伤害降低30%，且免疫自身伤害","如同火神一般怒火中烧，因此无视自身对自己造成的伤害");
         addItem(2,"sacrifice","","爆发剂·榴莲味",6,1.15,"攻击力+15%，但生命上限-15%","消耗自身生命值来获取更高的伤害");
         addItem(2,"ammo","","再回收",10,0.15,"击杀敌人将获得敌人剩余弹药的15%","回收敌人身上的弹药化为己用");
         addItem(2,"clip","","过载模式",14,0.1,"所有轻机铳无需装填，且攻击有10%的几率点燃目标","通过弹链不断为铳枪供弹，连续射击还会导致铳管过热而有几率点燃目标");
         addItem(3,"autostreak","efficiency","技力光环",1,1,"每3秒获得一点御敌指令充能数","提升鼓舞的技巧以更快地为战场上的队友提供助力");
         addItem(3,"reload","","战术快插弹匣",2,-1,"所有的双持武器、突击步铳和散射铳的装填速度+300%","特殊结构的快插弹匣可以提升武器装填速度，保证火力源源不断");
         addItem(3,"auto","","自动速射扳机",6,0.92,"攻击速度+8%，所有武器的开火方式变更为全自动","自动扳机让所有武器可以进行全自动射击，同时提高一定的攻击速度");
         addItem(3,"transfusion","","鲜血汲取",10,0.33,"在以自身为中心半径8英尺的距离内击杀敌人后，恢复自身33%的生命值","使用特殊的源石技艺能在近距离击杀敌人时偷取目标的部分生命力治疗自己");
         addItem(3,"gunplay","","玩枪",14,-1,"击杀敌人后自动立刻装填好未手持的另一把武器","每次击杀目标后切换武器，以确保杀戮的节奏永不止歇");
         addItem(4,"none","","无",1,-1,"","");
         addItem(4,"killsteal","","狼眼",2,1.3,"对未注意到自身的敌人造成的伤害+30%","让暗杀变得易如反掌");
         addItem(4,"pierce","","碎甲击",6,0.8,"所有攻击无视目标护甲，但造成的伤害降低至80%","攻击命中目标时将直接削减生命值");
         addItem(4,"focus","","蓄力攻击",10,1.5,"若1秒内未进行攻击，则下一次攻击时的攻击力提升至150%","花费更多的时间寻找对手的弱点以提高杀伤力");
         addItem(4,"overkill","","伤害储存",14,-1,"击杀敌人后溢出的伤害量可累积至下一次攻击","成功击杀就是对狙击干员最好的鼓励");
         addItem(5,"none","","无",1,-1,"","");
         addItem(5,"armor","","坚守模式",2,1.5,"护甲值+50%","护甲永远都不嫌多");
         addItem(5,"reflect","","强互作用反射镀层",6,0.3,"有30%的几率反弹受到的弹道类攻击","强互作用镀层改装的重甲能在意想不到的时候救你一命");
         addItem(5,"boobytrap","","不毁重构",10,-1,"自身护甲值归零时对周围敌人造成一定的物理伤害并点燃目标","重甲彻底损毁时将会触发自毁装置向外自爆（每次部署只能触发1次）");
         addItem(5,"resistance","","严酷训练",14,0.75,"免疫所有负面效果","长期的严酷训练使投影无法被点燃、腐蚀、冰冻或电击");
      }
      
      public static function addItem(param1:uint, param2:String, param3:String, param4:String, param5:uint, param6:Number, param7:String, param8:String) : void
      {
         var _loc9_:Stats_Skills;
         (_loc9_ = new Stats_Skills()).id = param2;
         _loc9_.sprite = !param3 ? param2 : param3;
         _loc9_.name = param4;
         _loc9_.lvlReq = param5;
         _loc9_.value = param6;
         _loc9_.special = param7;
         _loc9_.desc = param8;
         itemOb[param2] = _loc9_;
         itemAr.push(_loc9_);
         classAr[param1].push(_loc9_);
      }
      
      public static function getRandItem(param1:Stats_Classes) : Stats_Skills
      {
         var _loc2_:Stats_Skills = null;
         do
         {
            _loc2_ = UT.randEl(classAr[param1.classNum]);
         }
         while(_loc2_.id == "none");
         
         return _loc2_;
      }
   }
}
