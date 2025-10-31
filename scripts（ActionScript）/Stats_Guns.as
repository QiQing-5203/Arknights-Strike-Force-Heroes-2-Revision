package
{
   public class Stats_Guns
   {
      
      public static var itemOb:Object;
      
      public static var itemAr:Array;
      
      public static var typeAr:Array;
      
      public static var gunGameAr:Array;
      
      public static var randomPri:Array;
      
      public static var randomSec:Array;
       
      
      public var id:String;
      
      public var sprite:String;
      
      public var name:String;
      
      public var costMod:Number;
      
      public var cost:uint;
      
      public var typeName:String;
      
      public var shotSound;
      
      public var hitSound;
      
      public var type:uint;
      
      public var dmgRange:Range;
      
      public var dmg:Number;
      
      public var force:Number;
      
      public var bodBreak:Number;
      
      public var splash:Number;
      
      public var splashMult:Number;
      
      public var clipSize:uint;
      
      public var clipSpare:uint;
      
      public var range:uint;
      
      public var recoil:Number;
      
      public var fireType:uint;
      
      public var shootDelay:Number;
      
      public var effShoot:String;
      
      public var effHit:String;
      
      public var effShell:String;
      
      public var unequip:String;
      
      public var params:Array;
      
      public var frameIdle:String;
      
      public var frameFire:String;
      
      public var frameReload:String;
      
      public var cls;
      
      public var extra:Object;
      
      public var special:String;
      
      public var xOff:uint;
      
      public var yOff:int;
      
      public var headDmg:Number = 0;
      
      public var critDmg:Number = 0;
      
      public var vision:Number = 0.5;
      
      public var heartbeat:Boolean = false;
      
      public var crit:Number = 0;
      
      public var recoilSpread:Number = 0.3;
      
      public var noHead:Boolean;
      
      public var consume:Number = 1;
      
      public var isTurret:Boolean;
      
      public var soundFrames:uint;
      
      public var noCrit:Boolean;
      
      public var extraShots:uint = 0;
      
      public var burst:uint = 3;
      
      public var defaultTop:String;
      
      public var armorDmg:Number = 0;
      
      public var fleshDmg:Number = 0;
      
      public var fire:Number = 0;
      
      public var ice:Number = 0;
      
      public var acid:Number = 0;
      
      public var jam:Boolean = false;
      
      public var flash:Boolean = false;
      
      public var reduce:Number = 1;
      
      public var zap:Number = 0;
      
      public var noBlood:Boolean;
      
      public var selfDmg:Number = 1;
      
      public var isExplosive:Boolean;
      
      public var isMelee:Boolean;
      
      public var isRangedMelee:Boolean;
      
      public var reflectFrames:uint;
      
      public var crap:Number = 0;
      
      public var ammoTotal:uint;
      
      public var clipAmmo:Number;
      
      public var spareAmmo:uint;
      
      public var spareMax:uint;
      
      public function Stats_Guns()
      {
         super();
      }
      
      public static function Init() : void
      {
         var _loc1_:uint = 0;
         itemOb = {};
         itemAr = [];
         typeAr = [];
         _loc1_ = 0;
         while(_loc1_ < 11)
         {
            typeAr.push([]);
            _loc1_++;
         }
         addItem(0,"USP","","USP.45",0.8,[12,35],3,0,0,0,12,5,49,3,0,0.21,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistol1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动手铳|“切记——你拿枪只能对着坏人。”");
         addItem(0,"Beretta Px4","","伯莱塔 M9",0.8,[13,38],5,0,0,0,15,5,45,2,0,0.25,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistol2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "crit":0.25,
            "critDmg":2.3
         },"半自动手铳|提升25%的暴击率，提升230%的暴击伤害|“集中精神......直视前方。”");
         addItem(0,"M1911","","柯尔特 M1911",0.8,[14,42],10,0,0,0,7,5,48,4,0,0.25,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistol1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动手铳|“只有经历过冲突的两端，你才能真正理解它。”");
         addItem(0,"P99","","特种作战手铳",0.8,[12,35],3,0,0,0,12,5,46,2,0,0.23,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistol2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动手铳");
         addItem(0,"Five Seven","","FN 57",0.8,[12,35],3,0,0,0,20,5,45,4,0,0.2,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistolFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动手铳|“闪电风暴！”");
         addItem(0,"AMT","","PT-29铳型施术单元",1,[20,50],10,0.3,0,0,7,5,53,4,0,0.3,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_magnum2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"半自动手铳|提升10%的暴击率");
         addItem(0,"Kriss Kard","","短剑 Kard",0.8,[14,40],5,0,0,0,10,5,46,3,0,0.25,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_pistol2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动手铳");
         addItem(0,"Desert Eagle","","沙漠之鹰",1.3,[20,50],15,0.3,0,0,7,5,53,4,0,0.3,8,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_deagle,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"critDmg":0.9},"半自动手铳|提升90%的暴击伤害");
         addItem(0,"Raffica","","射钉枪",1.3,[12,35],3,0,0,0,8,4,46,23,0,2.3,8,-8,null,"bulletspark",null,"side","pistol","pistol","pistol",S_sniperFire,null,Bullet_Proj_Basic,["snowFall",7,1],{
            "extraShots":9,
            "armorDmg":0.5
         },"电驱式散射射钉枪|提升50%对护甲伤害|“电量储备还很充足！”");
         addItem(0,"Glock 18","","复合剂注射镖枪",0.8,[12,35],3,0,0,0,16,4,45,5,1,0.12,8,-8,null,null,null,"side","pistol","pistol","pistol",S_sniperFire,null,Bullet_Proj_Basic,["ember",7,1],{
            "ice":0.5,
            "zap":0.5
         },"半自动镖枪|命中后分别有50%几率使目标冻结或麻痹|“放心，闪灵来了都救不了你们”");
         addItem(0,"FMG9","","莱茵生命制式折叠速射铳",0.8,[11,28],3,0,0,0,33,4,50,5,1,0.12,8,-8,"gas_small","bulletspark","pistol","side","pistol","pistol","pistol",S_pistolFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"轻量化改装的全自动速射铳，威力较弱|“这种程度，又能阻止谁？”");
         addItem(0,"PM9","","PM-9",0.8,[11,28],3,0,0,0,25,4,50,5,1,0.11,8,-8,"gas_small","bulletspark","pistol","side","mpistol","mpistol","mpistol",S_mp5,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动微型冲锋铳");
         addItem(0,"MP9","","MP9",0.8,[10,25],3,0,0,0,32,4,50,4,1,0.12,8,-8,"gas_small","bulletspark","pistol","side","pistol","pistol","pistol",S_smg1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动微型速射铳");
         addItem(0,"PP2000","","PP-2000",0.8,[10,25],3,0,0,0,20,4,55,5,1,0.1,8,-8,"gas_small","bulletspark","pistol","side","pistol","pistol","pistol",S_smg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动微型速射铳");
         addItem(0,"Skorpion","","蝎式 M84",0.8,[11,28],3,0,0,0,20,4,55,5,1,0.11,8,-8,"gas_small","bulletspark","pistol","side","smg","smg","smg",S_smg1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动微型速射铳");
         addItem(0,"sMP412","","“我的希望”",0.9,[14,44],3,0.1,0,0,6,5,57,3,0,0.25,8,-8,null,"healthPickup",null,"side","magnum","magnum","magnum",S_silencer,null,Bullet_Proj_Basic,["healthPickup",5,1],{},"凯尔希的注射器，但不能治疗|“Mon3tr，采集好我需要的组织样本。”");
         addItem(0,"sf357","","Justice",0.9,[16,48],3,0.1,0,0,6,5,58,4,0,0.27,8,-8,"smoke","bulletspark","pistol","side","magnum","magnum","magnum",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"转轮手铳|提升10%的暴击率");
         addItem(0,"sTaurus 44","","闪电之手",1,[18,52],3,0.2,0,0,6,5,57,4,3,0.3,8,-8,"smoke","bulletspark","pistol","side","magnum","magnum","magnum",S_magnum3,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "crit":0.1,
            "armorDmg":0.5
         },"传奇雇佣兵“桥夹”克里夫所使用的手铳，三连发|提升10%的暴击率，提升50%对护甲伤害");
         addItem(0,"sRaging Bull","","“小审判官”",1,[23,64],3,0.3,0,0,6,5,55,5,0,0.35,8,-8,"smoke","bulletspark","pistol","side","magnum","magnum","magnum",S_magnum2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "crit":0.15,
            "armorDmg":0.5
         },"审判官艾丽妮使用的手铳|“我的心将作出判决。”|提升15%的暴击率，提升50%对护甲伤害");
         addItem(0,"sRaging Judge","","“你须愧悔”",1.1,[88,192],3,0.2,110,0.7,6,5,62,3,0,0.35,8,-8,"smoke","explosion","rocket","side","magnum","magnum","magnum",S_rocketFire,S_rocketExplode,Bullet_Proj_Basic,["fire",7,0.5],{
            "armorDmg":0.5,
            "fire":0.5,
            "isExplosive":true
         },"菲亚梅塔的手炮，可以发射爆炸物|“抱歉 ，没收住手。”|爆炸有50%的几率点燃目标，提升50%对护甲伤害");
         addItem(0,"sf500","","领袖的尊严",1.4,[25,70],3,0.5,0,0,5,4,61,2,0,0.45,10,-8,"smoke","bulletspark","pistol","side","magnum","magnum","magnum",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"伺夜的手铳|“今天，谁会死在这里？”|提升10%的暴击率");
         addItem(0,"sThor","","雷神",0.8,[14,44],3,0.1,0,0,8,5,61,2,0,0.27,11,-8,"smoke","bulletspark","pistol","side","pistol","pistol","pistol",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"半自动手铳|提升10%的暴击率");
         addItem(0,"sNo Name","","无名氏",1.3,[22,60],3,0.2,0,0,6,5,58,3,0,0.4,11,-8,"smoke","bulletspark","pistol","side","magnum","magnum","magnum",S_magnum3,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"转轮手铳|提升10%的暴击率");
         addItem(0,"Flare Gun","sRaging Judge","信号枪",1,[0,10],2,0,70,0,1,10,66,0.8,0,3,8,-8,"smoke","fire",null,"side","magnum","magnum","magnum",S_Fire,S_Fire,Bullet_Proj_Bounce,["explosionRed",5,2,60],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"用来发出紧急求救或酒醉亢奋的讯号。警告：向|人直接发射可能导致对方立刻燃烧。|可从非肉体表面反弹，无法暴击或爆头");
         addItem(0,"Katana","","罗德岛制式长剑",1.4,[125,250],10,0.7,0,0,0,0,8,0,3,0.55,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true,
            "reflectFrames":6
         },"罗德岛基础干员配备的近战武器，无法爆头|可反弹所有物体");
         addItem(0,"Prod","","焓熵法杖",33,[650,1600],10,0,0,0,0,0,8,0,3,0.55,8,-8,"","","","back","sword","sword","pistol",S_Whip2,S_Zap,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true,
            "ice":1
         },"前文明行星工程师的武器之一（仿制品）|能够将目标身上的热量转移到空间中|无法爆头");
         addItem(0,"Knife","","轻型手里剑",0.8,[25,80],10,0.3,0,0,30,0,60,3,3,0.3,8,-8,"","","","side","knife","knife","pistol",S_Whip1,S_Cut3,Bullet_Proj_Bounce,["knifeSpin",4,1,0.7],{
            "isRangedMelee":true,
            "noHead":true,
            "fleshDmg":0.5,
            "armorDmg":-0.3
         },"远距离投掷武器，无法爆头|对肉体伤害提升50%，对护甲伤害降低30%|可从非肉体表面反弹");
         addItem(0,"First Blood","","砍刀",1.1,[35,80],10,0.3,0,0,0,0,5,0,3,0.25,8,-8,"","","","side","knife","knife","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true,
            "crit":0.5,
            "critDmg":0.5
         },"整合运动士兵配备的近战武器，无法爆头|提升50%的暴击率及暴击伤害");
         addItem(0,"chisel knife","First Blood","雕词錾刀",1,[10,35],10,0,0,0,0,0,5,0,0,0.25,8,-8,"","","","side","knife","knife","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true,
            "armorDmg":0.5
         },"曾经是萨卡兹石匠惯用的工具。在恸哭之刺上錾|刻祷词，据说可以平息死魂灵的怨怒。|錾刀尚算锋利，祷词却已无人知晓。|无法爆头，提升50%对护甲伤害");
         addItem(0,"Wrench","","扳手",1,[45,100],20,0.3,0,0,0,0,5,0,3,0.3,8,-8,"","","","side","knife","knife","pistol",S_Whip2,S_Blunt2,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true
         },"近战武器，无法爆头");
         addItem(0,"Reflect Shield","Wrench","反射护盾",1,[0,0],0,0,0,0,4,0,0,0,0,5,0,0,"shieldHexBlue","","","side","knife","knife","pistol",S_Equip,null,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "isMelee":true,
            "reflectFrames":150
         },"莱茵生命主研的护具|使用后可获得150帧的正面反弹效果，冷却5秒");
         addItem(1,"M4A4","","R4-C突击步铳",1,[16,33],3,0.1,0,0,30,3,65,3,1,0.12,10,-3,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_elite,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"彩虹小队队长灰烬所使用的自动步铳");
         addItem(1,"mk2M4A4","M4A4","Mk.2 R4-C突击步铳",2,[24,41],3,0.1,0,0,40,3,65,3,1,0.12,10,-3,"armorPickup","bulletspark","pistol","back","rifle","rifle","rifle",S_elite,null,Bullet_Line_Basic,[false,5,16777215,0.4,3,16777215,0.8],{
            "flash":true,
            "vision":0.6875,
            "defaultTop":"Thermal"
         },"一周年限定武器，枪身铭刻着信仰的起源|曳光子弹，命中后降低目标的精准度|原装中型瞄准镜，提升18.75%的视野范围");
         addItem(1,"Type 95","","95式",1.2,[18,35],3,0.1,0,0,30,3,67,3,1,0.13,10,-1,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_ak,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"自动步铳");
         addItem(1,"Famas","","法玛斯 G1",1,[18,35],3,0.1,0,0,25,3,63,4,2,0.15,10,-1,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_assaultFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"三连发步铳");
         addItem(1,"XM8","","XM8A1",1,[17,34],3,0.1,0,0,30,3,67,4,1,0.12,10,-1,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_ar2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"自动步铳");
         addItem(1,"Scar","","SCAR-L",1,[19,37],3,0.1,0,0,30,3,68,3,1,0.13,10,-1,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_elite,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"模块化设计的自动步铳");
         addItem(1,"AK 12","","AK 47",0.9,[20,38],3,0.1,0,0,30,3,60,4,1,0.14,10,-1,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_ak,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "recoilSpread":0.4,
            "critDmg":1
         },"自动步铳，暴击伤害提升100%");
         addItem(1,"ARX 160","","ARX-160",1,[21,40],3,0.1,0,0,30,3,70,2,0,0.15,10,-1,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_ar2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"半自动步铳");
         addItem(1,"F2000","","FN F2000",1.2,[15,32],3,0.1,0,0,30,3,62,4,1,0.1,10,-1,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_assaultFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"自动步铳");
         addItem(2,"AKS","","AKS-74U",1,[18,35],3,0,0,0,30,3,55,5,1,0.13,8,-8,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_ak,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳");
         addItem(0,"UMP","","UMP-45",1,[15,32],3,0,0,0,25,4,53,3,1,0.12,8,-8,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_mp5,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳");
         addItem(2,"G36","","匪帮热能步铳",1.2,[16,33],3,0,0,0,30,3,65,4,1,0.13,8,-8,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_ar2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"fire":0.5},"匪帮用全自动速射铳|有50%几率点燃目标");
         addItem(2,"Bizon","","野牛 PP-19",1,[13,30],3,0,0,0,64,3,53,5,1,0.1,8,-8,"gas_small","bulletspark","pistol","back","bottom","bottom","bottom",S_smg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳");
         addItem(2,"RCP 90","","FN P90",1,[13,30],3,0,0,0,50,3,52,5,1,0.1,8,-8,"gas_small","bulletspark","pistol","back","top","top","top",S_mp5,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳");
         addItem(2,"PDW","","MagPul PDW",1,[14,31],3,0,0,0,30,3,55,5,1,0.1,8,-8,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_smg1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳");
         addItem(0,"Vector","","//维克托 - 午夜邮差[过载模式]",1.2,[15.4,34.1],3,0,0,0,25,3,50,3,2,0.09,8,-8,"gas_small","bulletspark","pistol","side","smg","smg","smg",S_smg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"burst":5},"5连发速射铳|“苹果派！”|攻击力提升至110%");
         addItem(2,"The Patriot","","MK18 MOD0",1.2,[14,31],3,0,0,0,64,3,57,5,1,0.11,8,-8,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_elite,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射铳|但W从来没有用过这把铳");
         addItem(2,"ACR","","“磐蟹饲养员”",0.9,[15,32],3,0,0,0,30,3,64,3,1,0.12,8,-8,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_sniperFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"全自动速射弩|“来，豆豆，和博士打个招呼吧。”");
         addItem(2,"UZI","","PM-9",0.8,[11,28],3,0,0,0,50,3,50,6,1,0.08,8,-8,"gas_small","bulletspark","pistol","side","mpistol2","mpistol2","mpistol2",S_mp5,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"双持微型速射铳");
         addItem(3,"Thor","","雷神",0.8,[14,44],3,0.1,0,0,16,4,61,3,3,0.17,11,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","mpistol2",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"双持手铳|提升10%的暴击率");
         addItem(3,"MP412","","“我的希望”",0.9,[14,44],3,0.1,0,0,12,4,57,4,3,0.14,8,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_deagle,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.15},"凯尔希的注射器，但不能治疗|“Mon3tr和我会保护所有人的，特别是博士|你。”|提升15%的暴击率");
         addItem(3,"f357","","Justice",0.9,[16,48],3,0.1,0,0,12,4,58,5,3,0.17,8,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"双持转轮手铳|提升10%的暴击率");
         addItem(3,"Taurus 44","","雷霆之手",1,[18,52],3,0.2,0,0,12,4,57,5,3,0.2,8,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_magnum3,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"armorDmg":0.5},"传奇雇佣兵“桥夹”克里夫所使用的双持手铳|提升50%对护甲伤害");
         addItem(3,"Raging Bull","","“小审判官”",1,[23,64],3,0.3,0,0,12,4,55,6,3,0.25,8,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_magnum2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.15},"审判官艾丽妮所使用的双持手铳|“我的剑将劈开海潮！”|提升15%的暴击率");
         addItem(3,"Raging Judge","","“你须愧悔”",1.1,[88,192],3,0.2,110,0.7,12,5,62,3,0,0.25,8,-8,"smoke","explosion","rocket","side","magnum2","magnum2","magnum2",S_rocketFire,S_rocketExplode,Bullet_Proj_Basic,["fire",7,0.5],{
            "armorDmg":0.5,
            "fire":0.5,
            "isExplosive":true
         },"菲亚梅塔的手炮（双持），可以发射爆炸物|“在我面前，还有人敢眨眼？”|爆炸有50%的几率点燃目标，提升50%对护甲伤|害");
         addItem(3,"No Name","","无名氏",1.3,[22,60],3,0.2,0,0,12,3,58,4,3,0.3,11,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_magnum3,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"双持转轮手枪|提升10%的暴击率");
         addItem(3,"f500","","领袖的尊严",1.4,[25,70],3,0.5,0,0,10,3,61,3,3,0.35,10,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","magnum2",S_magnum1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"crit":0.1},"双持转轮手铳|提升10%的暴击率");
         addItem(3,"dDesert Eagle","","双持沙漠之鹰",1.3,[20,50],15,0.3,0,0,14,4,53,5,3,0.2,8,-8,"smoke","bulletspark","pistol","side","magnum2","magnum2","mpistol2",S_deagle,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{},"双持手铳");
         addItem(4,"G11","","HK G11无壳弹步枪",1.4,[20,45],3,0.3,0,0,45,3,100,3,2,0.2,12,-1,"smoke","bulletspark","sniper","back","bullpup","bullpup","bullpup",S_magnum3,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.25,
            "vision":1,
            "recoilSpread":0.6
         },"三连发精确射手步枪|提升25%的爆头伤害，提升50%的视野范围");
         addItem(4,"G3","","//守林人 - 枯柏",1.3,[32,70],3,0.3,0,0,20,4,110,2,1,0.25,15,-1,"smoke","bulletspark","sniper","back","rifle","rifle","rifle",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.25,
            "vision":1,
            "recoilSpread":0.6
         },"便携式精确射手弓弩|“我会一直走下去，直到彻底实现复仇那天。”|提升25%的爆头伤害，提升50%的视野范围");
         addItem(4,"MK 14","","“光羽箭”",0.9,[35,75],8,0.3,0,0,20,4,2000,3,1,0.15,12,-1,"smoke","bulletspark","sniper","back","rifle","rifle","rifle",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.25,
            "vision":1,
            "recoilSpread":0.6
         },"精确高级射手弓弩，射程极远|“战斗中，无须多言。”|提升25%的爆头伤害，提升50%的视野范围");
         addItem(4,"Dragunov","","反拉弩",0.9,[50,115],8,0.5,0,0,15,4,127,2,0,0.35,16,-1,"smoke","bulletspark","sniper","back","rifle","rifle","rifle",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.5,
            "vision":1,
            "recoilSpread":0.6
         },"半自动射手弓弩|“他们的视野里空无一物，无需担心。”|提升50%的爆头伤害，提升50%的视野范围");
         addItem(4,"Barrett","","“锐箭”",1.5,[105,255],14,1,70,0.7,1,15,250,1,0,0.9,16,-1,"smoke","bulletspark","sniper","back","rifle","rifle","rifle",S_sniper3,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":1,
            "vision":1
         },"大威力反器材弓弩，配高爆箭矢|“希望哪怕是一个人，你也要活下去——”|提升100%的爆头伤害，提升50%的视野范围");
         addItem(4,"DSR1","","Guerrillas",1.3,[100,240],14,0.7,0,0,4,4,250,1,0,1,15,-1,"smoke","bulletspark","sniper","back","sniper","sniper","sniper",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":1,
            "vision":1
         },"游击队配备的大威力反器材弓弩|提升100%的爆头伤害，提升50%的视野范围");
         addItem(4,"L118A","","//HM-200 - 暗矢",1.3,[95,225],14,0.7,0,0,5,4,250,1,0,1.05,15,-1,"smoke","bulletspark","sniper","back","sniper","sniper","sniper",S_sniper2,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.5,
            "vision":1
         },"安哲拉自己制作的模型枪，做工相当精细|“我从小就非常喜欢拉特兰的铳械，所以才会自|己仿制了这把铳。”|提升50%的爆头伤害，提升50%的视野范围");
         addItem(4,"Intervention","","黑矢",1.4,[125,235],14,0.7,0,0,7,4,250,1,0,1.1,15,-1,"smoke","bulletspark","sniper","back","sniper","sniper","sniper",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.5,
            "vision":1,
            "armorDmg":0.8
         },"半自动强力弓弩|“真显眼。”|提升80%对护甲伤害、提升50%的爆头伤害，提|升50%的视野范围");
         addItem(5,"Jackhammer","","雷托",1.1,[10,25],3,0.5,0,0,10,3,30,9,1,0.29,10,0,"gas_small","bulletspark","shotgun","back","sbullpup","sbullpup","sbullpup",S_uziFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"全自动散射铳");
         addItem(5,"USAS 12","","USAS-12",0.9,[9,24],3,0.5,0,0,10,3,31,8.5,1,0.27,10,0,"gas_small","bulletspark","shotgun","back","rifle","rifle","rifle",S_autoshotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"全自动散射铳");
         addItem(5,"f1216","","M1216",1.1,[8,21],3,0.5,0,0,16,3,32,8.5,0,0.27,10,0,"gas_small","bulletspark","shotgun","back","bottom","bottom","bottom",S_uziFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"半自动散射铳");
         addItem(5,"KSG","","DB12",0.9,[9,22],3,0.5,0,0,14,3,32,8,0,0.29,10,0,"gas_small","bulletspark","shotgun","back","sbullpup","sbullpup","sbullpup",S_autoshotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"半自动散射铳");
         addItem(5,"Neostead","","假日风暴",1.3,[11,29],7,0.5,0,0,13,3,33,7,2,0.55,10,0,"gas_small","bulletspark","shotgun","back","shotgun","shotgun","shotgun",S_shotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "burst":2,
            "extraShots":4
         },"陈警官的二连发水枪|“我来火力压制！”");
         addItem(5,"R870","","公证所执行者",0.8,[14,43],10,0.5,0,0,7,3,34,6,0,0.65,10,0,"gas_small","bulletspark","shotgun","back","shotgun","shotgun","shotgun",S_shotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"泵动式散射铳");
         addItem(5,"SPAS 12","","M1014多功能散射铳",1.1,[13,41],10,0.5,0,0,8,3,35,5,0,0.65,10,0,"gas_small","bulletspark","shotgun","back","shotgun","shotgun","shotgun",S_shotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"泵动式散射铳");
         addItem(5,"Judgement","","“最终旅程”",1.4,[15,47],10,0.7,0,0,5,3,36,4,0,0.75,10,0,"gas_small","bulletspark","shotgun","back","judgement","judgement","judgement",S_shotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"extraShots":4},"杠杆式散射铳|“条律中的语句需要执行者去实现它的效力。”");
         addItem(5,"Double Judgement","Judgement","圣约决裁",4.9,[20,55],10,0.7,0,0,16,3,36,4,0,0.25,8,-8,"gas_small","bulletspark","shotgun","back","magnum2","magnum2","mpistol2",S_shotgunFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "extraShots":6,
            "armorDmg":0.3
         },"双持杠杆式散射铳|“毁灭是最常见的结果。”|提升30%对护甲伤害|击杀敌人后回复自身生命值（未实现）");
         addItem(6,"MK 48","","M249",1,[21,40],3,0.2,0,0,100,1,73,6,1,0.12,10,5,"gas_small","bulletspark","pistol","back","heavy","heavy","heavy",S_mg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.45},"全自动轻机铳");
         addItem(6,"PKP","","PKP Pecheneg机铳",1,[23,42],3,0.2,0,0,100,1,71,6.5,1,0.13,10,5,"gas_small","bulletspark","pistol","back","heavy","heavy","heavy",S_ak,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.45},"似乎是从COD8穿越过来的一把全自动轻机铳");
         addItem(6,"M60","","M60E4掠食者机铳",0.9,[22,41],3,0.2,0,0,100,1,72,6.5,1,0.11,10,5,"gas_small","bulletspark","pistol","back","heavy","heavy","heavy",S_mg1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.45},"似乎是从COD8穿越过来的一把全自动轻机铳");
         addItem(0,"IAR","","沸腾斗志",1,[18,36],3,1,0,0,0,0,8,0,1,0.1,10,5,"","","","back","heavy","heavy","heavy",S_Fire,null,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true,
            "reduce":0.5
         },"链锯，无法爆头|“鲜血染尽武器，蒸腾整片战场！”|手持时使自身受到的所有伤害降低50%");
         addItem(6,"LSW","","L86-LSW",1.1,[19,37],3,0.15,0,0,100,1,68,4,1,0.13,10,-5,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_assaultFire,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.4},"似乎是从COD8穿越过来的一把全自动轻机铳");
         addItem(6,"AUG","","AUG HBAR-T",1.1,[28,47],3,0.18,0,0,42,3,85,3,0,0.18,10,-5,"gas_small","bulletspark","pistol","back","bullpup","bullpup","bullpup",S_aug,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.6},"半自动精确射手轻机铳|重型铳管配强化弹头，提升精准度、射程与伤害");
         addItem(6,"Minigun","","M134 Mini",1.3,[18,36],3,0.3,0,0,150,0,74,7,1,0.08,10,15,"gas_small","bulletspark","pistol","back","cannon","cannon","cannon",S_mg1,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.5},"全自动六管轻机铳");
         addItem(6,"Cerberus","","中锋",1.4,[20,38],3,0.2,0,0,150,0,75,6,1,0.11,10,15,"gas_small","bulletspark","pistol","back","cannon","cannon","cannon",S_mg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"recoilSpread":0.45},"全自动轻机铳|“你的外形让我想起了一位故人”");
         addItem(7,"RPG","","液氮大炮",1,[110,240],25,1,110,0.7,1,6,150,6,0,0.7,8,-8,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_rocket1,S_rocketExplode,Bullet_Proj_Basic,["gas_rocket",7,0.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.5
         },"改装蓄水炮，可以发射高能源石爆破物|“全都让开！”|爆炸有50%的几率点燃目标，无法暴击或爆头");
         addItem(7,"mk2RPG","RPG","Mk.2 液氮大炮",2,[135,265],200,0,110,0.7,1,6,150,6,0,0.7,8,-8,"armorPickup","spawn","","back","rocket","rocket","rocket",S_Skill,S_rocketExplode,Bullet_Proj_Basic,["armorPickup",7,0.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "ice":1,
            "recoilSpread":2.5
         },"原装蓄水炮，保留了其原本功能，威力更强|“锁定敌人！攻击！”|命中后冻结目标，后坐力极大，无法暴击或爆头");
         addItem(10,"Stinger","","“祖宗发射器”",10,[12000,25000],80,1,330,1.5,6,1,150,10,0,2,10,-1,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_rocketFire,S_rocketExplode,Bullet_Proj_Basic,["explosionRed",7,0.5,180,6],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1,
            "armorDmg":2,
            "selfDmg":0,
            "extraShots":2
         },"主炮级巫术增幅单元，溅射范围巨大|“是谁告诉你，我每次都会倒数的？”|爆炸必定点燃目标，无法暴击或爆头|提升200%对护甲伤害，无视对自身造成的伤害");
         addItem(7,"Javelin","","军用制式火箭筒",1.2,[90,195],25,1,110,0.7,1,5,150,5,0,0.7,8,-8,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_rocketFire,S_rocketExplode,Bullet_Proj_Follow,["gas_rocket",3,0,150,11],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.5
         },"高能源石爆破物发射器，具有较强的追踪能力|爆炸有50%的几率点燃目标，无法暴击或爆头");
         addItem(7,"Commando","","R-11a突击动力火箭筒",1.4,[72,144],20,1,110,0.5,4,5,150,6,1,0.17,8,-8,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_rocketFire,S_rocketExplode,Bullet_Proj_Basic,["gas_rocket",7,0.5],{
            "burst":1,
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.5
         },"“你猜从谁身上拆下来的”|爆炸有50%的几率点燃目标，无法暴击或爆头");
         addItem(7,"Firework Launcher","Commando","烟花发射器",0.5,[45,60],3,0,110,0.25,4,5,85,5,1,0.17,8,-8,"smoke","explosion","","back","rocket","rocket","rocket",S_rocketFire,S_rocketExplode,Bullet_Proj_Basic,["bulletspark",5,0.5],{
            "burst":1,
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1,
            "flash":true
         },"即使是烟花，打人身上也是很疼的。|爆炸必定点燃目标，无法暴击或爆头|命中后降低目标的精准度");
         addItem(0,"XM 25","","M120CREM破墙榴弹发射器",1,[100,230],20,0.8,110,0.6,1,2,60,5,0,0.4,10,2,"smoke","explosion","rocket","back","rifle","rifle","magnum",S_ripperFire,S_grenade,Bullet_Proj_Bounce,["grenade",5,4,1.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"高能源石爆破物抛射器，可从非肉体表面反弹|异世界战术装备之一|爆炸有25%的几率点燃目标，无法暴击或爆头");
         addItem(8,"EX 41","","//爆破弩 - 石墨",1,[70,150],20,0.8,110,0.7,4,5,60,6,0,0.6,8,8,"smoke","explosion","rocket","back","rifle","rifle","rifle",S_shotgunFire,S_grenade,Bullet_Proj_Bounce,["grenade",5,4,1.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.25
         },"高能源石爆破物抛射器，可从非肉体表面反弹|“想从我布置完善的包围网中脱逃，真是异想天|开。”|爆炸有25%的几率点燃目标，无法暴击或爆头");
         addItem(8,"Heavy ion elastic recoil","EX 41","重离子弹性反冲",1,[600,700],20,0.8,110,0.7,0,0,127,0,0,12,8,8,"","explosion","","back","rifle","rifle","rifle",S_Laser,S_rocketExplode,Bullet_Proj_Bounce,["lightningYellow",1,0],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true
         },"拟态机械的防御手段之一|无法暴击或爆头");
         addItem(8,"M32","","“徘徊歧路”",1.1,[35,80],20,0.8,110,0.6,24,5,60,7,1,0.3,10,8,"smoke","explosion","rocket","back","magnum2","magnum2","mpistol2",S_ripperFire,S_grenade,Bullet_Proj_Bounce,["grenade",4,3,1.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.25
         },"高能源石爆破物抛射器，可从非肉体表面反弹|“所有人都要为他们的选择承担后果。”|爆炸有25%的几率点燃目标，无法暴击或爆头");
         addItem(8,"Thumper","","M320",1.3,[80,250],20,1,110,0.6,12,5,70,6,1,0.12,8,-8,"smoke","explosion","rocket","back","top","top","top",S_ripperFire,S_grenade,Bullet_Proj_Stick,["grenade",3,1,1],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.75
         },"高能源石爆破物抛射器（易燃型），可黏附于物|体表面|爆炸有75%的几率点燃目标，无法暴击或爆头");
         addItem(9,"Flamethrower","","W-0502",1.3,[30,60],1,0,1,0.7,300,0,30,1,1,0.05,5,13,"","flame","","back","cannon","cannon2","cannon",S_Fire,null,Bullet_Proj_Frames,["FT",1,-3,-30],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "fire":1,
            "soundFrames":9
         },"点燃目标，短时间内持续造成较大伤害|“地狱，随时填装！”|无法暴击或爆头");
         addItem(9,"mk2Flamethrower","Flamethrower","Mk.2 W-0502",2.6,[100,200],1,0,110,0.7,30,0,30,1,0,2.9,13,5,"flame","FT","","back","cannon","cannon2","cannon",S_Fire,null,Bullet_Proj_Basic,["FT",8,0],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "fire":1,
            "armorDmg":0.3
         },"基建部改装后的火焰喷射器，造成单次较高伤害|攻击必定点燃目标，提升30%对护甲伤害|“大地，沸腾吧！”|无法暴击或爆头");
         addItem(9,"Cobra","","酸猎犬",0.9,[30,60],1,0.7,1,0.7,300,0,30,1,1,0.05,5,15,"","bubble","","back","cannon","cannon2","cannon",S_Fire,null,Bullet_Proj_Frames,["acid",1,3,-30],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "acid":1,
            "soundFrames":9
         },"腐蚀目标，长时间内持续造成少量伤害|无法暴击或爆头");
         addItem(9,"Carbonite Gun","","寒冬猎人",1.2,[15,55],1,1,1,0.7,300,0,30,0.3,1,0.05,8,13,"","","","back","cannon","cannon2","cannon",S_Shock,null,Bullet_Line_Laser,[10,13434879,0.3,5,10092543,0.3],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "ice":1,
            "soundFrames":9
         },"冰冻目标，降低目标50%的攻击速度|无法暴击或爆头");
         addItem(9,"Gauss Rifle","","特斯拉步枪",1,[20,50],15,0,1,0.7,300,0,30,3,1,0.05,10,17,"","","","back","cannon","cannon2","cannon",S_Shock,null,Bullet_Line_Zapper,[6711039,6724095],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "zap":1,
            "soundFrames":9
         },"电击目标，降低目标30%的攻击伤害|无法暴击或爆头");
         addItem(10,"Invalid","","",0,[0,0],0,0,0,0,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"space","","空间射线",0,[0,0],20,0,10,1,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"env","","环境",0,[0,0],0,0,0,0,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"env2","","环境",0,[0,0],45,0,10,1,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"env3","","环境",0,[0,0],20,1,10,1,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"fire","","焚烬",0,[5,15],0,0,0,0,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "noBlood":true,
            "selfDmg":0.5
         },"");
         addItem(10,"acid","","腐蚀",0,[1.5,6],0,0.7,0,0,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "selfDmg":0.5
         },"");
         addItem(10,"drone","","武装型龙腾无人机",0,[15,60],0,0,0,0,9,5,66,3,1,0.25,0,0,"smoke","explosion","rocket","back","pistol","pistol","pistol",S_rocketFire,S_rocketExplode,Bullet_Proj_Follow,["gas_rocket",2,0,160,7],{"isTurret":true},"");
         addItem(10,"turret","","支援机铳",1,[10,25],3,0.3,0,0,9,5,60,3,1,0.15,0,0,"smoke","bulletspark","sniper","back","pistol","pistol","pistol",S_mg2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{"isTurret":true},"");
         addItem(10,"tesla","","特斯拉强电弧感应圈",2.2,[10,40],0,0,0,0,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",S_Shock,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "isTurret":true,
            "zap":1,
            "soundFrames":9
         },"");
         addItem(10,"sentry","","铁钳号·改型机",1.5,[72,144],20,1,0,0,9,5,80,3,1,0.8,0,0,"smoke","explosion","rocket","back","pistol","pistol","pistol",S_rocketFire,S_rocketExplode,Bullet_Proj_Follow,["gas_rocket",2,0,160,7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "isTurret":true
         },"");
         addItem(10,"boobytrap","","不毁重构",0,[64,127],25,0.4,100,1,2,3,60,6,0,0.15,0,0,"","explosion","","","","","",null,null,Bullet_Splash,[false],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"");
         addItem(10,"mechrocket","","巫术导弹",1.2,[72,144],20,1,60,0.7,1,4,200,7,1,0.9,8,-8,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_rocketFire,S_rocketExplode,Bullet_Proj_Follow,["fire",1,0,3000,4],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"");
         addItem(10,"mechlaser","","废热喷口",0,[45,90],0,0,10,1,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true,
            "fire":1
         },"");
         addItem(10,"mechgun","","开膛者机枪",0,[60,140],0,0.5,10,1,9,5,66,3,1,0.25,0,0,"smoke","explosionSmall","pistol","back","pistol","pistol","pistol",S_sniper2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true
         },"");
         addItem(10,"stomp","","机甲践踏",0,[80,200],10,1,10,1,9,5,66,3,1,0.25,0,0,"smoke","bulletspark","pistol","back","pistol","pistol","pistol",null,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "noHead":true,
            "noCrit":true
         },"");
         addItem(10,"Empty","","施术单元",0.8,[25,65],30,0.5,60,0.7,0,0,60,0,3,0.35,8,-8,"smoke","explosionSmall","","side","knife","knife","pistol",null,null,Bullet_Proj_Basic,["fire",8,0.7],{},"");
         addItem(0,"Wand","","混乱的施术单元",3,[55,120],30,0.7,60,0.7,540,10,500,3,3,0.3,8,-8,"smoke","explosionRed","","side","knife","knife","pistol",S_Whip1,S_rocketExplode,Bullet_Proj_Basic,["fireRed",3,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":0.5,
            "acid":0.5,
            "ice":0.5,
            "zap":0.5
         },"可释放烈焰、寒冰、腐蚀、雷电四大技艺的施术单元|命中后有几率使目标随机进入异常状态");
         addItem(0,"Saber","","//源石剑 - 意志",3,[65,160],15,1,0,0,0,0,8,0,3,0.3,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Zap,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "reflectFrames":10
         },"德克萨斯在企鹅物流任职期间使用的武器，韧性|极强|可反弹所有物体");
         addItem(0,"Hammer","","“秽壤之土”",3,[120,255],80,1,0,0,0,0,10,0,3,0.7,8,-8,"","","","back","sword","sword","pistol",S_Whip2,S_Blunt2,Bullet_Melee_Basic,[],{
            "isMelee":true,
            "noHead":true,
            "reduce":0.1
         },"“沃土磐石，站起来吧。”|可击飞目标|手持时使自身受到的所有伤害降低90%");
         addItem(10,"Sheep","","艾雅法拉发射器",2.5,[72,144],80,1,100,0.7,4,10,250,6,1,0.3,8,-8,"smoke","explosion","rocket","back","rocket","rocket","rocket",S_Sheep,S_rocketExplode,Bullet_Proj_FollowStick,["sheep",4,0,170,7,1],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"艾雅法拉发射器！发射出的小羊会自动追寻敌人|可黏附于物体表面，爆炸后必定点燃目标");
         addItem(10,"Garbage","","答辩发射器",2.5,[48,96],80,0,110,0.7,10,6,70,5,1,0.25,10,2,"bulletsparkPoop","bulletsparkPoop","rocket","back","hbullpup","hbullpup","hbullpup",S_Fart,S_Blunt2,Bullet_Proj_Bounce,["poop",4,2],{"crap":1},"装着答辩的发射器|“大喊一声奥利给，所有东西都下胃”|可从非肉体表面反弹，无限时爆炸，可击飞目标");
         addItem(10,"M4EX","","R4-C（专业定制版）",3,[17,34],3,0.1,0,0,100,1,70,2.5,1,0.12,10,-3,"gas_small","bulletspark","pistol","back","rifle","rifle","rifle",S_ar2,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "vision":0.75,
            "recoilSpread":0
         },"似乎是从R6S穿越过来的一把专业定制步铳|四倍镜，提升25%的视野范围|鼓式弹匣，弹容量提升至100发|垂直握把，有效降低射击后坐力|激光瞄准器，提升未开镜射击时的精准度");
         addItem(10,"SKS","","“锐笔速写”",3.3,[25,55],3,0.3,0,0,20,4,127,2,0,0.15,15,-1,"smoke","bulletspark","sniper","back","rifle","rifle","rifle",S_sniperFire,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":1,
            "vision":1,
            "crit":1,
            "critDmg":1,
            "armorDmg":0.5
         },"半自动重型射手弓弩|“战场上，弩箭比笔尖更锋利。”|提升50%对护甲伤害和视野范围|爆头伤害、暴击率、暴击伤害提升100%");
         addItem(10,"AWM","","战术的终结",3.3,[65,170],14,0.7,0,0,1,13,250,1,0,1.05,15,-1,"smoke","bulletspark","sniper","back","sniper","sniper","sniper",S_sniper,null,Bullet_Line_Sniper,[true,3.5,13421772,0.3,1.5,15658734,0.6],{
            "headDmg":0.75,
            "vision":1.4375,
            "crit":0.2,
            "heartbeat":true,
            "armorDmg":1,
            "extraShots":6
         },"半自动重型弓弩|“小姐有仁慈之心，我没有。”|提升100%对护甲伤害");
         addItem(10,"Extreme Gun","","熵烬聚变发生器",3.4,[100,250],10,0.7,50,0.5,30,0,35,5,1,0.3,10,15,"smoke","explosionSmall","sniper","back","cannon","cannon","cannon",S_Shock,S_Zap,Bullet_Line_Sniper,[false,5,16711680,0.3,1.5,16711680,0.6],{
            "fire":1,
            "crit":0.2,
            "extraShots":4,
            "heartbeat":true,
            "flash":true
         },"前文明行星工程师的武器之一（仿制品）|能将空间中的热量转移到目标身上");
         addItem(0,"MP5K","","UMP-45（专业定制版）",3,[15,32],3,0,0,0,40,4,60,3,1,0.1,8,-3,"gas_small","bulletspark","pistol","back","smg","smg","smg",S_silencer,null,Bullet_Line_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "heartbeat":true,
            "flash":true,
            "vision":0.6875,
            "recoilSpread":0.15,
            "crit":0.2,
            "armorDmg":0.2
         },"似乎是从COD8穿越过来的一把专业定制速射铳|三倍镜，提升18.75%的视野范围|扩容弹匣，弹容量提升至40发|心跳传感器，将敌方位置暴露在雷达中|镁光战术手电，命中后降低目标的精准度|超合金披甲弹，提升20%的护甲伤害及暴击率");
         addItem(10,"blade1","Katana","“搅碎利刃”",1,[140,270],10,0.7,0,0,0,0,8,0,0,0.55,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"“近卫一张纸，重装纸对折”|无法爆头、无法反弹");
         addItem(10,"blade2","Katana","“复仇烈焰”",1,[170,320],10,0.7,0,0,0,0,8,0,0,0.4,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"“以前在乌萨斯，他们都叫我‘红刀’。”|无法爆头、无法反弹");
         addItem(10,"blade3","Katana","“火与钢”",1,[200,350],10,0.7,0,0,0,0,8,0,0,0.3,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"“那个曾在59区废墟被你击败的劲敌，将重新出现在你面前，划出复仇的烈焰。”|无法爆头、无法反弹");
         addItem(10,"no weapon","Empty","赤手空拳",1,[45,100],10,0.7,0,0,0,0,5,0,0,0.3,8,-8,"","","","side","knife","knife","pistol",S_Whip2,S_Blunt2,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"“我武器哪？？”");
         addItem(10,"garbage shovel","Hammer","垃圾铲",0,[0,0],10,0.7,0,0,0,0,250,0,0,0.3,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Blunt2,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"超远距离攻击，但没伤害|无法爆头，但是就算能爆头也没用");
         addItem(10,"ice ring","Carbonite Gun","冰环法术",1,[180,250],0,0,70,0.7,0,0,30,100,0,10.5,8,-8,"","explosionSmall","","back","cannon","cannon2","cannon",S_Skill,S_rocketExplode,Bullet_Proj_Bounce,["grenade",5,4,1.5],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "ice":1,
            "extraShots":25,
            "isMelee":true,
            "selfDmg":4
         },"霜星的源石技艺之一|在自身周围释放冰环，冷却10.5s|必定冻结目标，无法暴击或爆头");
         addItem(10,"ice","First Blood","冰锥",1,[90,150],10,0.5,0,0,0,0,60,3,0,3.7,8,-8,"","explosionSmall","","side","knife","knife","pistol",S_grenade,null,Bullet_Proj_Basic,["fireRed",3,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "ice":1,
            "recoilSpread":2
         },"霜星的源石技艺之一|必定冻结目标，无法暴击或爆头");
         addItem(0,"ice staff","Wand","冰系施术单元",3,[80,140],10,0.5,0,0,540,10,60,3,0,4,8,-8,"","explosionSmall","","side","knife","knife","pistol",S_Whip1,null,Bullet_Proj_Basic,["fireRed",3,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "ice":0.33
         },"33%几率冻结目标，无法暴击或爆头");
         addItem(0,"fire staff","Wand","火系施术单元",3,[90,150],10,0.5,0,0,540,10,60,3,0,3,8,-8,"","explosionSmall","","side","knife","knife","pistol",S_Whip1,null,Bullet_Proj_Basic,["fire",8,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"必定点燃目标，无法暴击或爆头");
         addItem(10,"throwing spear","Hammer","爱国者投枪",1,[3240,3240],80,1,110,0.7,0,0,250,0,0,20,8,-8,"","explosionRed","","back","sword","sword","pistol",S_Whip1,S_Stomp,Bullet_Proj_Basic,["explosion",7,0.5],{
            "noHead":true,
            "isExplosive":true
         },"爱国者投出的长枪，超远距离攻击，攻击力极强|冷却20s，无法爆头");
         addItem(10,"great halberd","Hammer","星火巨戟",1,[2400,2400],0,0.7,0,0,0,0,14,0,0,4,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Blunt2,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true
         },"爱国者的巨戟，攻击力极强|无法爆头");
         addItem(10,"flame","Wand","烈焚灼息",1,[130,180],10,0.5,110,1,0,0,60,3,0,4.5,8,-8,"","explosion","","side","knife","knife","pistol",S_grenade,null,Bullet_Proj_Basic,["flame",8,0],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"黑蛇的源石技艺之一|必定点燃目标，无法暴击或爆头");
         addItem(10,"chopping","Katana","“日冕”",1,[1500,1500],0,0.7,0,0,0,0,10,0,0,15,8,-8,"","","","back","sword","sword","pistol",S_Skill,null,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "noHead":true,
            "fire":1
         },"黑蛇的战技之一，攻击力不容小觑|冷却15s，必定点燃目标，无法爆头");
         addItem(10,"blaze","Empty","净浊之焰",1,[180,600],10,0,110,0.7,0,0,60,3,0,5,8,-8,"","explosion","","side","knife","knife","pistol",S_grenade,null,Bullet_Proj_Basic,["fire",8,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "fire":1
         },"“他们谨记着领袖的教诲，渴望着用烈焰净化大地的污浊。”|必定点燃目标，无法暴击或爆头");
         addItem(10,"originium crystal","First Blood","宿主源石结晶",1,[25,80],10,0.3,0,0,0,0,60,3,3,2,8,-8,"","","","side","knife","knife","pistol",S_Whip1,S_Cut3,Bullet_Proj_Bounce,["knifeSpin",4,1,0.7],{
            "isRangedMelee":true,
            "noHead":true
         },"从掷骨手身上扯出的源石晶簇，无法爆头|可从非肉体表面反弹");
         addItem(10,"moulding stars","Wand","手部外骨骼操作系统",1,[170,250],0,0,0,0,0,0,60,3,0,5,8,-8,"","explosionSmall","","side","knife","knife","pistol",S_Zap,null,Bullet_Proj_Basic,["fire",8,0.7],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "extraShots":1
         },"“这一次，换我先动手吧。”|无法暴击或爆头");
         addItem(10,"Grim Kollam\'s Saber","Katana","青色怒火",1,[85,195],10,2,0,0,0,0,10,0,2,0.3,8,-8,"","","","back","sword","sword","pistol",S_Whip1,S_Cut3,Bullet_Melee_Basic,[true,3.5,16777156,0.3,1.5,16777156,0.6],{
            "isMelee":true,
            "burst":2,
            "fire":1,
            "ice":1,
            "zap":1,
            "acid":1,
            "crap":1,
            "reduce":0.8,
            "noHead":true,
            "reflectFrames":10,
            "crit":1,
            "critDmg":0.5,
            "armorDmg":0.3,
            "flash":true
         },"“传说，奎隆有令其敌人不战而退之威……但也有人称其为仁爱君主，任何遭其佩剑划破的伤口都不会流血，如若退后，则能苟全性命”|攻击为二连击，使命中目标获得所有负面效果");
         addItem(10,"The annihilation battle Equipment","Empty","歼灭战装备",1,[100,200],200,2,110,1,30,0,150,0,0,8,8,-8,"useStreak","explosion","","back","sword","sword","pistol",S_Skill,S_Stomp,Bullet_Proj_Basic,["explosion",7,0],{
            "noHead":true,
            "noCrit":true,
            "isExplosive":true,
            "reduce":0.2,
            "extraShots":2,
            "armorDmg":0.5,
            "selfDmg":0,
            "reflectFrames":500
         },"迷迭香的歼灭战装备。她的忠实伙伴。|攻击投掷3发歼灭战装备，并获得500帧的正面|反弹效果|无法爆头和暴击，免疫对自身造成的伤害|手持时使自身受到的所有伤害降低80%，对护甲伤害提升50%");
         addItem(10,"The Shield of Rock","Hammer","石之盾",1,[1,1],0,0,0,0,0,0,5,0,0,4,8,-8,"","","","side","sniper","sniper","sniper",null,null,Bullet_Melee_Basic,[],{
            "noHead":true,
            "noCrit":true,
            "reduce":0.1
         },"蔓德拉的源石技艺之一|手持时无法攻击，使自身受到的所有伤害降低90%");
         addItem(10,"gaze","Empty","蔓德拉的注目",1,[13,40],0,2,0,0,999,5,20,0,1,0.1,8,-8,"ammoPickup","","","side","knife","knife","pistol",S_Laser,null,Bullet_Line_Basic,[false,8,16777156,0.4,5,16777156,0.2],{
            "isMelee":true,
            "noHead":true,
            "noCrit":true,
            "noBlood":true,
            "ice":1,
            "reduce":0.65
         },"蔓德拉的源石技艺之一|攻击必定冻结敌人，无法爆头和暴击|手持时使自身受到的所有伤害降低35%");
         gunGameAr = [];
         _loc1_ = 0;
         while(_loc1_ < itemAr.length)
         {
            if(!itemAr[_loc1_].isMelee && itemAr[_loc1_].type != 10)
            {
               gunGameAr.push(itemAr[_loc1_]);
            }
            _loc1_++;
         }
         gunGameAr.push(itemOb["Wand"]);
         gunGameAr.push(itemOb["Sheep"]);
         gunGameAr.push(itemOb["Garbage"]);
         randomPri = [];
         _loc1_ = 0;
         while(_loc1_ < itemAr.length)
         {
            if(itemAr[_loc1_].type != 0 && itemAr[_loc1_].type != 10)
            {
               randomPri.push(itemAr[_loc1_]);
            }
            _loc1_++;
         }
         randomPri.push(itemOb["Wand"]);
         randomPri.push(itemOb["Sheep"]);
         randomPri.push(itemOb["Garbage"]);
         randomSec = [];
         _loc1_ = 0;
         while(_loc1_ < itemAr.length)
         {
            if(itemAr[_loc1_].type == 0)
            {
               randomSec.push(itemAr[_loc1_]);
            }
            _loc1_++;
         }
         randomSec.push(itemOb["Hammer"]);
      }
      
      public static function addItem(param1:uint, param2:String, param3:String, param4:String, param5:Number, param6:Array, param7:Number, param8:Number, param9:Number, param10:Number, param11:uint, param12:uint, param13:uint, param14:Number, param15:uint, param16:Number, param17:uint, param18:int, param19:String, param20:String, param21:String, param22:String, param23:String, param24:String, param25:String, param26:*, param27:*, param28:*, param29:Array, param30:Object, param31:String) : void
      {
         var _loc33_:* = null;
         var _loc32_:Stats_Guns;
         (_loc32_ = new Stats_Guns()).id = param2;
         _loc32_.sprite = !param3 ? param2 : param3;
         _loc32_.name = !param4 ? param2 : param4;
         _loc32_.costMod = param5;
         _loc32_.cost = 0;
         _loc32_.shotSound = param26;
         _loc32_.hitSound = param27;
         _loc32_.type = param1;
         _loc32_.dmgRange = new Range(param6[0],param6[1]);
         _loc32_.dmg = 0;
         _loc32_.force = param7;
         _loc32_.bodBreak = param8 * 0.2;
         _loc32_.splash = param9;
         _loc32_.splashMult = param10;
         _loc32_.clipSize = param11;
         _loc32_.clipSpare = param12;
         _loc32_.range = param13;
         _loc32_.recoil = param14;
         _loc32_.fireType = param15;
         _loc32_.shootDelay = param16;
         _loc32_.xOff = param17;
         _loc32_.yOff = param18;
         _loc32_.effShoot = param19;
         _loc32_.effShell = param21;
         _loc32_.unequip = param22;
         _loc32_.effHit = param20;
         _loc32_.params = param29;
         _loc32_.frameIdle = param23;
         _loc32_.frameFire = param24;
         _loc32_.frameReload = param25;
         _loc32_.cls = param28;
         _loc32_.extra = param30;
         _loc32_.special = param31;
         if(param1 == 3)
         {
            _loc32_.name += "";
         }
         _loc32_.typeName = Stats_Misc.getGunName(param1);
         for(_loc33_ in param30)
         {
            _loc32_[_loc33_] = param30[_loc33_];
         }
         itemOb[param2] = _loc32_;
         itemAr.push(_loc32_);
         typeAr[param1].push(_loc32_);
      }
      
      public static function getDamageAtLevel(param1:String, param2:uint) : Number
      {
         var _loc3_:Stats_Guns = Stats_Guns.itemOb[param1];
         return _loc3_.dmgRange.min + (_loc3_.dmgRange.max - _loc3_.dmgRange.min) / 49 * (param2 - 1);
      }
      
      public static function createBasicItem(param1:String, param2:uint) : Stats_Guns
      {
         var _loc3_:Stats_Guns = UT.clone(Stats_Guns.itemOb[param1]) as Stats_Guns;
         _loc3_.extra = UT.cloneObject(Stats_Guns.itemOb[param1].extra);
         _loc3_.dmg = UT.getLinearRange(param2,50,_loc3_.dmgRange.min,_loc3_.dmgRange.max);
         _loc3_.cost = Stats_Misc.getCost(param2,_loc3_.costMod);
         return _loc3_;
      }
      
      public static function addMods(param1:Inventory_Gun) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         param1.modDmg = UT.rand(0.9,1.1);
         param1.modRange = UT.rand(0.9,1.1);
         param1.modRecoil = UT.rand(0.9,1.1);
         param1.modDelay = UT.rand(0.9,1.1);
         param1.modCost = (param1.modDmg + param1.modRange + param1.modRecoil + param1.modDelay) / 4;
         param1.modDmg += UT.rand(0,param1.rarity * 0.075);
         param1.modRange += UT.rand(0,param1.rarity * 0.04);
         param1.modRecoil -= UT.rand(0,param1.rarity * 0.04);
         param1.modDelay -= UT.rand(0,param1.rarity * 0.03);
         param1.modCost += UT.rand(param1.rarity * 0.2,param1.rarity * 0.25);
         param1.effects = [];
         var _loc7_:* = Stats_Guns.itemOb[param1.id].type;
         switch(0 !== _loc7_ ? (1 === _loc7_ ? 1 : (2 !== _loc7_ ? (3 !== _loc7_ ? (4 === _loc7_ ? 4 : (5 !== _loc7_ ? (6 === _loc7_ ? 6 : (7 !== _loc7_ ? (8 === _loc7_ ? 8 : (9 !== _loc7_ ? 10 : 9)) : 7)) : 5)) : 3) : 2)) : 0)
         {
            case 0:
               if(Boolean(Stats_Guns.itemOb[param1.id].isMelee) || Boolean(Stats_Guns.itemOb[param1.id].isRangedMelee))
               {
                  _loc2_ = ["fireChance2","zapChance2","iceChance2","acidChance2","damageMore"];
                  _loc3_ = ["critChance","speedMore","armorMore","fleshMore","critDmg"];
                  _loc4_ = ["armorLess","fleshLess","speedLess"];
                  break;
               }
            case 1:
            case 2:
            case 3:
            case 4:
               _loc2_ = ["fireChance","zapChance","iceChance","acidChance","explosive","armorMore","fleshMore"];
               _loc3_ = ["critChance","clipMore","rangeMore","accuracyMore","recoilMore","speedMore"];
               _loc4_ = ["jam","clipLess","armorLess","fleshLess","rangeLess","accuracyLess","recoilLess","speedLess"];
               break;
            case 5:
               _loc2_ = ["fireChance","zapChance","iceChance","acidChance","explosive","armorMore","fleshMore"];
               _loc3_ = ["critChance","rangeMore","speedMore"];
               _loc4_ = ["armorLess","fleshLess","rangeLess","speedLess"];
               break;
            case 6:
               _loc2_ = ["fireChance","zapChance","iceChance","acidChance","explosive","armorMore","fleshMore"];
               _loc3_ = ["critChance","clipMore","rangeMore","accuracyMore","recoilMore","speedMore"];
               _loc4_ = ["clipLess","armorLess","fleshLess","rangeLess","accuracyLess","recoilLess","speedLess"];
               break;
            case 7:
               _loc2_ = ["fireChance2","zapChance2","iceChance2","acidChance2"];
               _loc3_ = ["rangeMore","accuracyMore","armorMore","fleshMore"];
               _loc4_ = ["armorLess","fleshLess","rangeLess","accuracyLess"];
               break;
            case 8:
               _loc2_ = ["fireChance2","zapChance2","iceChance2","acidChance2"];
               _loc3_ = ["clipMore","accuracyMore","recoilMore","speedMore"];
               _loc4_ = ["jam","clipLess","armorLess","fleshLess","accuracyLess","recoilLess","speedLess"];
               break;
            case 9:
               _loc2_ = ["fleshMore","consumeLess"];
               _loc3_ = ["clipMore","damageMore"];
               _loc4_ = ["clipLess","fleshLess","consumeMore","damageLess"];
         }
         if(Stats_Guns.itemOb[param1.id].type < 10)
         {
            if(param1.rarity > 0)
            {
               _loc5_ = param1.rarity;
               _loc6_ = 0;
               while(true)
               {
                  if(_loc6_ < _loc5_)
                  {
                     if(_loc5_ == 3 && _loc6_ == 0)
                     {
                        param1.modCost += 0.35;
                        param1.effects.push(_loc2_.splice(UT.irand(0,_loc2_.length - 1),1)[0]);
                     }
                     else if(Math.random() < 0.5)
                     {
                        param1.modCost += 0.12;
                        param1.effects.push(_loc3_.splice(UT.irand(0,_loc3_.length - 1),1)[0]);
                     }
                     _loc6_++;
                     continue;
                  }
               }
            }
            else if(param1.rarity < 0)
            {
               _loc5_ = -param1.rarity;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(Math.random() < 0.5)
                  {
                     param1.modCost -= 0.08;
                     param1.effects.push(_loc4_.splice(UT.irand(0,_loc4_.length - 1),1)[0]);
                  }
                  _loc6_++;
               }
            }
         }
      }
      
      public static function createFinalItem(param1:Inventory_Gun) : Stats_Guns
      {
         var _loc2_:Stats_Guns = UT.clone(Stats_Guns.itemOb[param1.id]) as Stats_Guns;
         _loc2_.extra = UT.cloneObject(Stats_Guns.itemOb[param1.id].extra);
         _loc2_.dmg = UT.getLinearRange(param1.level,50,_loc2_.dmgRange.min,_loc2_.dmgRange.max);
         _loc2_.cost = Stats_Misc.getCost(param1.level,_loc2_.costMod);
         _loc2_.dmg *= param1.modDmg;
         _loc2_.range = Math.round(_loc2_.range * param1.modRange);
         _loc2_.recoil *= param1.modRecoil;
         _loc2_.shootDelay *= param1.modDelay;
         _loc2_.cost = Math.round(_loc2_.cost * param1.modCost);
         var _loc3_:uint = 0;
         while(_loc3_ < param1.effects.length)
         {
            _loc2_.extra[param1.effects[_loc3_]] = true;
            var _loc4_:* = param1.effects[_loc3_];
            switch("fireChance" !== _loc4_ ? ("iceChance" === _loc4_ ? 1 : ("zapChance" !== _loc4_ ? ("acidChance" !== _loc4_ ? ("fireChance2" === _loc4_ ? 4 : ("iceChance2" !== _loc4_ ? ("zapChance2" === _loc4_ ? 6 : ("acidChance2" !== _loc4_ ? ("explosive" === _loc4_ ? 8 : ("jam" !== _loc4_ ? ("clipMore" !== _loc4_ ? ("clipLess" === _loc4_ ? 11 : ("rangeMore" !== _loc4_ ? ("rangeLess" === _loc4_ ? 13 : ("armorMore" !== _loc4_ ? ("armorLess" !== _loc4_ ? ("fleshMore" !== _loc4_ ? ("fleshLess" === _loc4_ ? 17 : ("critChance" !== _loc4_ ? ("accuracyMore" !== _loc4_ ? ("accuracyLess" !== _loc4_ ? ("recoilMore" === _loc4_ ? 21 : ("recoilLess" !== _loc4_ ? ("speedMore" !== _loc4_ ? ("speedLess" === _loc4_ ? 24 : ("consumeMore" !== _loc4_ ? ("damageMore" !== _loc4_ ? ("damageLess" === _loc4_ ? 27 : ("critDmg" !== _loc4_ ? 29 : 28)) : 26) : 25)) : 23) : 22)) : 20) : 19) : 18)) : 16) : 15) : 14)) : 12)) : 10) : 9)) : 7)) : 5)) : 3) : 2)) : 0)
            {
               case 0:
                  _loc2_.fire += 0.1;
                  _loc2_.effHit = "bulletsparkFire";
                  break;
               case 1:
                  _loc2_.ice += 0.15;
                  _loc2_.effHit = "bulletsparkIce";
                  break;
               case 2:
                  _loc2_.zap += 0.15;
                  _loc2_.effHit = "bulletsparkZap";
                  break;
               case 3:
                  _loc2_.acid += 0.1;
                  _loc2_.effHit = "bulletsparkAcid";
                  break;
               case 4:
                  _loc2_.fire += 0.33;
                  break;
               case 5:
                  _loc2_.ice += 0.5;
                  break;
               case 6:
                  _loc2_.zap += 0.5;
                  break;
               case 7:
                  _loc2_.acid += 0.33;
                  break;
               case 8:
                  _loc2_.splash = 40;
                  _loc2_.splashMult = 0.5;
                  _loc2_.effHit = "explosionTiny";
                  break;
               case 9:
                  _loc2_.jam = true;
                  break;
               case 10:
                  _loc2_.clipSize = Math.round(_loc2_.clipSize * 1.2) + 2;
                  break;
               case 11:
                  _loc2_.clipSize = Math.round(_loc2_.clipSize * 0.8) - 2;
                  break;
               case 12:
                  _loc2_.range += 15;
                  break;
               case 13:
                  _loc2_.range -= 10;
                  break;
               case 14:
                  _loc2_.armorDmg += 0.1;
                  break;
               case 15:
                  _loc2_.armorDmg += -0.1;
                  break;
               case 16:
                  _loc2_.fleshDmg += 0.1;
                  break;
               case 17:
                  _loc2_.fleshDmg += -0.1;
                  break;
               case 18:
                  _loc2_.crit += 0.15;
                  break;
               case 19:
                  _loc2_.recoil *= 0.7;
                  break;
               case 20:
                  _loc2_.recoil *= 1.3;
                  break;
               case 21:
                  _loc2_.recoilSpread *= 0.7;
                  break;
               case 22:
                  _loc2_.recoilSpread *= 1.3;
                  break;
               case 23:
                  _loc2_.shootDelay *= 0.9;
                  break;
               case 24:
                  _loc2_.shootDelay *= 1.1;
                  break;
               case 25:
                  _loc2_.shootDelay *= 1.2;
                  break;
               case 26:
                  _loc2_.dmg *= 1.1;
                  break;
               case 27:
                  _loc2_.dmg *= 0.9;
                  break;
               case 28:
                  _loc2_.critDmg = 0.1;
                  break;
            }
            _loc3_++;
         }
         if(param1.invalidName)
         {
            _loc2_.name += " " + param1.invalidName;
         }
         return _loc2_;
      }
      
      public static function getEffectText(param1:Stats_Guns) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:uint = 0;
         var _loc2_:Array = [""];
         if(param1.special)
         {
            _loc3_ = param1.special.split("|");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc2_.push(_loc3_[_loc4_]);
               _loc4_++;
            }
         }
         if(param1.extra.fireChance)
         {
            _loc2_[0] = "火术弹药 ";
         }
         if(param1.extra.iceChance)
         {
            _loc2_[0] = "霜法弹药 ";
         }
         if(param1.extra.zapChance)
         {
            _loc2_[0] = "冲击弹药 ";
         }
         if(param1.extra.acidChance)
         {
            _loc2_[0] = "强酸弹药 ";
         }
         if(param1.extra.fireChance2)
         {
            _loc2_[0] = "火术爆弹 ";
         }
         if(param1.extra.iceChance2)
         {
            _loc2_[0] = "霜法爆弹 ";
         }
         if(param1.extra.zapChance2)
         {
            _loc2_[0] = "冲击装药 ";
         }
         if(param1.extra.acidChance2)
         {
            _loc2_[0] = "强酸装药 ";
         }
         if(param1.extra.explosive)
         {
            _loc2_[0] = "杀伤型 ";
         }
         if(param1.extra.armorMore)
         {
            _loc2_[0] = "穿甲型 ";
         }
         if(param1.extra.fleshMore)
         {
            _loc2_[0] = "撕裂型 ";
         }
         if(param1.extra.consumeLess)
         {
            _loc2_[0] = "高压型 ";
         }
         if(param1.isMelee || param1.isRangedMelee)
         {
            if(param1.extra.damageMore)
            {
               _loc2_[0] = "强化型 ";
            }
            if(param1.extra.fireChance)
            {
               _loc2_[0] = "火焰附加 ";
            }
            if(param1.extra.iceChance)
            {
               _loc2_[0] = "寒霜附加 ";
            }
            if(param1.extra.zapChance)
            {
               _loc2_[0] = "电流附加";
            }
            if(param1.extra.fireChance2)
            {
               _loc2_[0] = "火焰附加 ";
            }
            if(param1.extra.iceChance2)
            {
               _loc2_[0] = "寒霜附加 ";
            }
            if(param1.extra.zapChance2)
            {
               _loc2_[0] = "电流附加 ";
            }
         }
         if(param1.extra.fireChance)
         {
            _loc2_.push("火系法术弹药，命中后有10%的几率点燃目标");
         }
         if(param1.extra.iceChance)
         {
            _loc2_.push("冰系法术弹药，命中后有15%的几率冰冻目标");
         }
         if(param1.extra.zapChance)
         {
            _loc2_.push("冲击型法术弹药，命中后有15%的几率电击目标");
         }
         if(param1.extra.acidChance)
         {
            _loc2_.push("强酸弹药，命中后有10%的几率腐蚀目标");
         }
         if(param1.extra.fireChance2)
         {
            _loc2_.push("33%的几率点燃目标，短时间持续造成较大伤害");
         }
         if(param1.extra.iceChance2)
         {
            _loc2_.push("50%的几率冰冻目标，降低目标攻击速度");
         }
         if(param1.extra.zapChance2)
         {
            _loc2_.push("50%的几率电击目标，降低目标攻击伤害");
         }
         if(param1.extra.acidChance2)
         {
            _loc2_.push("33%的几率腐蚀目标，长时间持续造成少量伤害");
         }
         if(param1.extra.explosive)
         {
            _loc2_.push("高爆弹，附加50%的溅射伤害");
         }
         if(param1.extra.armorMore)
         {
            _loc2_.push("增加10%对护甲的伤害");
         }
         if(param1.extra.fleshMore)
         {
            _loc2_.push("增加10%对肉体的伤害");
         }
         if(param1.extra.consumeLess)
         {
            _loc2_.push("降低20%的弹药消耗");
         }
         if(param1.extra.damageMore)
         {
            _loc2_.push("增加10%的伤害");
         }
         if(param1.extra.clipMore)
         {
            _loc2_.push("扩容弹仓");
         }
         if(param1.extra.clipLess)
         {
            _loc2_.push("缺损弹仓");
         }
         if(param1.extra.rangeMore)
         {
            _loc2_.push("提升武器的有效射程");
         }
         if(param1.extra.rangeLess)
         {
            _loc2_.push("减少武器的有效射程");
         }
         if(param1.extra.jam)
         {
            _loc2_.push("射击时有几率卡壳");
         }
         if(param1.extra.critChance)
         {
            _loc2_.push("提升15%的暴击率");
         }
         if(param1.extra.armorLess)
         {
            _loc2_.push("减少10%对护甲的伤害");
         }
         if(param1.extra.fleshLess)
         {
            _loc2_.push("减少10%对肉体的伤害");
         }
         if(param1.extra.recoilMore)
         {
            _loc2_.push("降低30%射击时的后坐力");
         }
         if(param1.extra.recoilLess)
         {
            _loc2_.push("增加30%射击时的后坐力");
         }
         if(param1.extra.accuracyMore)
         {
            _loc2_.push("提升30%的精准度");
         }
         if(param1.extra.accuracyLess)
         {
            _loc2_.push("降低30%的精准度");
         }
         if(param1.extra.speedMore)
         {
            _loc2_.push("提升10%的武器射速/攻击速度");
         }
         if(param1.extra.speedLess)
         {
            _loc2_.push("降低10%的武器射速/攻击速度");
         }
         if(param1.extra.consumeMore)
         {
            _loc2_.push("增加20%的弹药消耗");
         }
         if(param1.extra.damageLess)
         {
            _loc2_.push("降低10%的伤害");
         }
         if(param1.extra.critDmg)
         {
            _loc2_.push("提升10%的暴击伤害");
         }
         return _loc2_;
      }
      
      public static function getRandItemId(param1:uint) : String
      {
         return UT.randEl(typeAr[param1]).id;
      }
      
      public static function getRandPrimary(param1:Stats_Classes) : Inventory_Gun
      {
         var _loc2_:uint = uint(Stats_Classes.getClass(param1.classNum).weaponTypes[UT.irand(1,Stats_Classes.getClass(param1.classNum).weaponTypes.length - 1)]);
         return Inventory_Gun.createInventoryItem(Stats_Guns.getRandItemId(_loc2_),param1.level,Stats_Misc.getRandRarity(0));
      }
      
      public static function getRandSecondary(param1:Stats_Classes) : Inventory_Gun
      {
         return Inventory_Gun.createInventoryItem(Stats_Guns.getRandItemId(0),param1.level,Stats_Misc.getRandRarity(0));
      }
   }
}
