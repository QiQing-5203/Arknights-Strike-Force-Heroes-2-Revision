package
{
   public class Stats_Armor
   {
      
      public static var itemOb:Object;
      
      public static var itemAr:Array;
      
      public static var typeAr:Array;
       
      
      public var type:uint;
      
      public var id:String;
      
      public var sprite:String;
      
      public var name:String;
      
      public var cost:uint;
      
      public var costMod:Number;
      
      public var armorRange:Range;
      
      public var armor:uint;
      
      public var desc:String;
      
      public var shit:Boolean;
      
      public var healthMod:Number = 1;
      
      public var ammoMod:Number = 0;
      
      public var regenMod:Number = 0;
      
      public var explosiveRes:Number = 0;
      
      public var meleeMod:Number = 1;
      
      public var reflect:Number = 0;
      
      public function Stats_Armor()
      {
         super();
      }
      
      public static function Init() : void
      {
         itemOb = {};
         itemAr = [];
         typeAr = [];
         var _loc1_:uint = 0;
         while(_loc1_ < 7)
         {
            typeAr.push([]);
            _loc1_++;
         }
         addItem(0,"Old Boot","","热水壶",25,[0,0],{"shit":true},"罗德岛办公室里的同款热水壶，有人经常大半夜用热水壶煮速食面吃，这种生活习惯不是很健康......");
         addItem(0,"Empty Bottle","","芙蓉的健康餐",0.1,[0,0],{"shit":true},"身体健康但是心理不太健康，只吃这样的东西就没心思作战了。");
         addItem(0,"Fish Bones","","巅峰作战记录",10,[0,0],{"shit":true},"《 全 撤 了 》");
         addItem(0,"Tin Can","","鲱鱼罐头",0.1,[0,0],{"shit":true},"打开后，十米内无人敢近身。");
         addItem(0,"Sock with Hole","","报纸",0.1,[0,0],{"shit":true},"玛恩纳随身携带的红酒报报纸。就是一张普通的报纸。");
         addItem(0,"Turtle Shell","","“文明的存续”",25,[0,0],{"shit":true},"小小的黑色王冠。");
         addItem(0,"Riot Shield","","明日方舟美术设定集Vol.1",25,[0,0],{"shit":true},"预售，200天内发货");
         addItem(0,"Waste-Rock Gold","","荒金",0.75,[0,0],{"shit":true},"小矿床中的金粒可能无法满足富豪们的需求，但要落在孩子手中，依旧是堪比太阳般闪耀的珍宝。出售后只能换取少量龙门币");
         addItem(0,"Scrap Fusion Cube","","混色金",1.25,[0,0],{"shit":true},"正规矿场里依照流程开采出的金矿，成色虽然稍显不足，但只要稍加精炼的话……出售后可以换取较多龙门币");
         addItem(0,"Orirock Cube","","赤金",1.75,[0,0],{"shit":true},"需要多少矿石才能提炼出如此贵重的金条呢——之类的想法已经不重要了。现在它正整整齐齐堆在你眼前，这才是关键啊。可以换取大量龙门币。");
         addItem(0,"A Wheelbarrow of Orirock Cube","","赤金的远征",6.3,[0,0],{"shit":true},"君王自荒地出发，集市在她的裙下如春芽萌发，财富之路连通高山密林，直到她消失在西方浪涛的边崖。——萨尔贡古老童话");
         addItem(0,"CEOBE1","","乌萨斯列巴",0.1,[0,0],{"shit":true},"一种来自乌萨斯的食物，吃起来有一股子浓烈的发酵味儿。就是酸。");
         addItem(0,"CEOBE2","","脱水仙人掌干",0.1,[0,0],{"shit":true},"这种干缩的奇怪植物看起来并不好吃，而玻利瓦尔人则拿它来泡水喝。");
         addItem(0,"CEOBE3","","风干大蕉果",0.2,[0,0],{"shit":true},"蕉兰果是一种生长在干旱地区的水果，口味极佳，风干后更容易保存。");
         addItem(0,"CEOBE4","","商队盒饭",0.3,[0,0],{"shit":true},"哥伦比亚城际商队内部发放的方便食品，油炸，热量很高，味道很好，不太健康。");
         addItem(0,"CEOBE5","","半盒沙虫罐头",0.3,[0,0],{"shit":true},"“切碎的沙虫用橄榄油浸泡，散发着自然的清香！”广告是这么说的，别当真。恶......");
         addItem(0,"CEOBE6","","维多利亚军粮",0.4,[0,0],{"shit":true},"前维多利亚士官这么描述：“量大管饱，难以下咽，吃不死人。”");
         addItem(0,"CEOBE14","","噪音引擎",0.4,[0,0],{"shit":true},"哥伦比亚最新工业产品，在中小型城镇的移动拖车上非常常见，性价比很高。噪音很大。也太大了点。");
         addItem(0,"CEOBE15","","豌豆花盆",0.2,[0,0],{"shit":true},"造型古怪的哥伦比亚后院豌豆盆栽，既能装点室内又能收获作物，说不定还有其他功效。");
         addItem(0,"CEOBE16","","综合园艺成果",0.2,[0,0],{"shit":true},"原本可能是一盆放在公共区域的普通盆栽，经由调香师、铃兰、炎客等多位干员之手后，开始变得复杂起来。");
         addItem(0,"CEOBE17","","炭化烤肉棒",0.3,[0,0],{"shit":true},"因为某人糟糕的厨艺而被烤到整个焦黑的大块带骨肉，足以成为凶器。");
         addItem(0,"CEOBE18","","压缩糖砖",0.3,[0,0],{"shit":true},"这种压缩食品的制作工艺不明，坚硬无比，甚至可以砌墙。比普通的烹饪失败产物更具杀伤力。");
         addItem(1,"Kevlar","","干员制服（方舟地牢搬运）",2.1,[50,120],{},"干员穿着最舒适的搭配之一，很简便。");
         addItem(1,"Military","","罗德岛战术护甲（方舟地牢搬运）",2.3,[80,150],{"ammoMod":0.75},"“再说一遍，坚雷，这里不是存放零食的地方。”\n前方的背心口袋中可以存放救灾物资、医药品和手套。");
         addItem(1,"Superalloy","","炽合金轻型护甲",3,[15,60],{"healthMod":2},"高温炽合金材料制造，大幅度提升存活率\n提高100%的生命值。");
         addItem(1,"Aerogel","","气凝胶特制防弹衣",2.2,[35,90],{"regenMod":1},"特种气凝胶材料特制而成，具有一定的可再生性\n护甲值可缓慢恢复");
         addItem(1,"Magnetic","","先进强磁护甲",2.3,[25,75],{"reflect":0.15},"利用强磁材料对子弹的斥力而实现概率性的反射\n有15%的几率反射子弹");
         addItem(1,"Oobleck","","卡西米尔护胸（方舟地牢搬运）",2.2,[25,75],{"regenMod":3},"“这样穿真的合适吗？你怎么只保护你的胸部……”\n它只保护身体的要害，忽略了身体的其他部位。");
         addItem(2,"Kevlar","","干员制服（方舟地牢搬运）",2.1,[50,120],{},"干员穿着最舒适的搭配之一，很简便。");
         addItem(2,"Military","","罗德岛战术护甲（方舟地牢搬运）",2.3,[40,100],{"ammoMod":0.75},"“再说一遍，坚雷，这里不是存放零食的地方。”\n前方的背心口袋中可以存放救灾物资、医药品和手套。");
         addItem(2,"Titanium","","帝国之盾 2型（方舟地牢搬运）",3,[100,240],{"ammoMod":-0.3},"乌萨斯游击队的精锐部队过去身着的重甲。\n得到这件护甲的同时，你明白了为什么乌萨斯经\n历的每一场战斗最终都获得了胜利。");
         addItem(2,"Aerogel","","气凝胶特制防弹衣",2.2,[35,90],{"regenMod":1},"特种气凝胶材料特制而成，具有一定的可再生性\n护甲值可缓慢恢复");
         addItem(2,"Blast","","龙门战术护甲（方舟地牢搬运）",2.2,[35,90],{"explosiveRes":-0.3},"龙门战斗警察使用的正规战术护甲。\n正面的三排钢板为穿着者提供了极大的安全保\n护。");
         addItem(2,"Static","","实验性外骨骼战甲",2.2,[35,90],{"meleeMod":1.15},"电流持续刺激肌肉以强化力量并提升兴奋性\n提升15%的近战武器伤害");
         addItem(3,"Kevlar","","干员制服（方舟地牢搬运）",2.1,[50,120],{},"干员穿着最舒适的搭配之一，很简便。");
         addItem(3,"Military","","罗德岛战术护甲（方舟地牢搬运）",2.3,[40,100],{"ammoMod":0.75},"”再说一遍，坚雷，这里不是存放零食的地方。”\n前方的背心口袋中可以存放救灾物资、医药品和手套。");
         addItem(3,"Superalloy","","炽合金轻型护甲",3,[15,60],{"healthMod":2},"高温炽合金材料制成，大幅度提升存活率\n提高100%的生命值");
         addItem(3,"Oobleck","","卡西米尔护胸（方舟地牢搬运）",2.2,[25,75],{"regenMod":3},"“这样穿真的合适吗？你怎么只保护你的胸部……”\n它只保护身体的要害，忽略了身体的其他部位。");
         addItem(3,"Static","","实验性外骨骼战甲",2.2,[35,90],{"meleeMod":1.15},"电流持续刺激肌肉以强化力量并提升兴奋性\n提升15%的近战武器伤害");
         addItem(3,"Aerogel","","气凝胶特制防弹衣",2.2,[35,90],{"regenMod":1},"特种气凝胶材料特制而成，具有一定的可再生性\n护甲值可缓慢恢复");
         addItem(3,"LankaWood Safety Suit","","蓝卡坞安全衣",2.5,[50,120],{"healthMod":3},"蓝卡坞片场定制护具，用以帮助演员完成超高难度动作戏的拍摄，设计原型为某种军用器械。食铁兽曾在合作拍摄时拒绝使用该护具。");
         addItem(4,"Kevlar","","干员制服（方舟地牢搬运）",2.1,[50,120],{},"干员穿着最舒适的搭配之一，很简便。");
         addItem(4,"Superalloy","","炽合金轻型护甲",3,[15,60],{"healthMod":2},"高温炽合金材料制成，大幅度提升存活率\n提高100%的生命值");
         addItem(4,"Oobleck","","卡西米尔护胸（方舟地牢搬运）",2.2,[25,75],{"regenMod":3},"“这样穿真的合适吗？你怎么只保护你的胸部……”\n它只保护身体的要害，忽略了身体的其他部位。");
         addItem(4,"Magnetic","","先进强磁护甲",2.3,[25,75],{"reflect":0.15},"利用强磁材料对子弹的斥力而实现概率性的反射\n有15%的几率反弹子弹");
         addItem(4,"Static","","实验性外骨骼战甲",2.2,[35,90],{"meleeMod":1.15},"电流持续刺激肌肉以强化力量并提升兴奋性\n提升15%的近战武器伤害");
         addItem(4,"Military","","罗德岛战术护甲（方舟地牢搬运）",2.3,[40,100],{"ammoMod":0.75},"“再说一遍，坚雷，这里不是存放零食的地方。”\n前方的背心口袋中可以存放救灾物资、医药品和手套。");
         addItem(4,"Gill-Lurker\'s Slicker","","捕鳞蓑",2,[1,1],{
            "reflect":0.85,
            "healthMod":0.001
         },"伊比利亚海民在浅滩捕杀巨鳞时常穿的外衣，独特的造型与颜色让他们看起来像是普通的礁石。罗德岛工程部以此为原型设计了具有视觉隐匿效果的作战服，目前尚在测试阶段。");
         addItem(5,"Heavy HP","","炽合金重型防弹护甲",3.1,[35,150],{"healthMod":3},"高温超炽合金材料制成，极大幅度提升存活率\n重装干员特制，提高200%的生命值");
         addItem(5,"Heavy Armor","","D32钢超重型防弹护甲",4,[225,540],{"ammoMod":-1.3},"超强韧D32钢材料制成，带来极其恐怖的防御力\n重装干员特制，超高护甲值，但备弹量降低130%");
         addItem(5,"Heavy R1","","致密气凝胶重型防弹护甲",3.2,[75,200],{"regenMod":1},"由致密的特种气凝胶制成，具有一定的可再生性\n重装干员特制，护甲值可缓慢恢复");
         addItem(5,"Heavy R2","","卡西米尔重型战甲",3.2,[55,165],{"regenMod":3},"非牛顿流体材料特制而成，具有较强的可再生性\n重装干员特制，护甲值可较快恢复");
         addItem(5,"Heavy Power","","实验性致密外骨骼战甲",3.2,[75,200],{"meleeMod":1.3},"高频电流持续刺激肌肉以强化力量并提升兴奋性\n重装干员特制，提升30%的近战武器伤害");
         addItem(5,"Heavy Explode","","龙门特战重型防爆护甲",3.2,[75,200],{"explosiveRes":-0.5},"内衬特制防爆复合板，并附有大量防火涂层\n重装干员特制，受到爆炸与火焰的伤害降低50%");
         addItem(5,"Heavy Ammo","","罗德岛军工重型防弹护甲",3.3,[90,225],{"ammoMod":1},"罗德岛标准军用级重型防弹护甲，可携带更多弹药\n重装干员特制，增加100%的后备弹药");
         addItem(6,"HeroSml","","Armor",2,[40,100],{"ammoMod":0.5},"");
         addItem(6,"HeroMed","","Armor",2,[50,120],{"ammoMod":0.5},"");
         addItem(6,"HeroBig","","Armor",2,[60,140],{"ammoMod":0.5},"");
         addItem(6,"none","","Armor",0,[1,1],{},"");
         addItem(6,"Rhine Armor","Heavy HP","莱茵充能护服",3.2,[230,400],{},"莱茵生命能量科为特殊成员定制的作战服");
         addItem(6,"Rhine Heavy Armor","Heavy HP","莱茵重型充能护服",4,[600,1600],{"healthMod":4},"莱茵生命能量科为防卫科成员量身定制的特种作战服，适应各种复杂环境及各种强度的作战和保卫行动。\n高额护甲值，最大生命值提升至400%");
         addItem(0,"Civilight Eterna","Turtle Shell","“漆黑王冠”",16,[2829,8086],{
            "regenMod":16,
            "healthMod":3,
            "meleeMod":2
         },"“我见你，头顶黑冠，将万千生灵，熬成回忆”");
      }
      
      public static function addItem(param1:uint, param2:String, param3:String, param4:String, param5:Number, param6:Array, param7:Object, param8:String) : void
      {
         var _loc10_:* = null;
         var _loc9_:Stats_Armor;
         (_loc9_ = new Stats_Armor()).type = param1;
         _loc9_.id = param2;
         _loc9_.sprite = !param3 ? param2 : param3;
         _loc9_.name = param4;
         _loc9_.costMod = param5;
         _loc9_.cost = 0;
         _loc9_.armorRange = new Range(param6[0],param6[1]);
         _loc9_.armor = 0;
         _loc9_.desc = param8;
         for(_loc10_ in param7)
         {
            _loc9_[_loc10_] = param7[_loc10_];
         }
         itemOb[param2] = _loc9_;
         itemAr.push(_loc9_);
         typeAr[param1].push(_loc9_);
      }
      
      public static function getEffectText(param1:Stats_Armor) : Array
      {
         var _loc2_:Array = [""];
         _loc2_.push(Stats_Armor.itemOb[param1.id].desc);
         return _loc2_;
      }
      
      public static function addMods(param1:Inventory_Armor) : void
      {
         param1.modArmor = UT.rand(0.9,1.1);
         param1.modCost = param1.modArmor;
         param1.modArmor += UT.rand(param1.rarity * 0.05,param1.rarity * 0.08);
         param1.modCost += UT.rand(param1.rarity * 0.15,param1.rarity * 0.2);
      }
      
      public static function createFinalItem(param1:Inventory_Armor) : Stats_Armor
      {
         var _loc2_:Stats_Armor = UT.clone(Stats_Armor.itemOb[param1.id]) as Stats_Armor;
         _loc2_.armor = UT.getLinearRange(param1.level,50,_loc2_.armorRange.min,_loc2_.armorRange.max);
         _loc2_.cost = Stats_Misc.getCost(param1.level,_loc2_.costMod);
         _loc2_.armor = Math.round(_loc2_.armor * param1.modArmor);
         _loc2_.cost = Math.round(_loc2_.cost * param1.modCost);
         return _loc2_;
      }
      
      public static function getRandItemId(param1:uint) : String
      {
         return UT.randEl(typeAr[param1]).id;
      }
      
      public static function getRandItem(param1:Stats_Classes) : Inventory_Armor
      {
         return Inventory_Armor.createInventoryItem(Stats_Armor.getRandItemId(param1.classNum),param1.level,Stats_Misc.getRandRarity(0));
      }
   }
}
