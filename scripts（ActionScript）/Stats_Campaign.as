package
{
   import Box2D.Common.Math.b2Vec2;
   
   public class Stats_Campaign
   {
      
      public static var sn:uint = 0;
      
      public static var fc:uint = 0;
      
      private static var showStatsOnly:Boolean;
       
      
      public function Stats_Campaign()
      {
         super();
      }
      
      public static function setMatch(param1:uint, param2:Boolean = false) : void
      {
         MatchSettings.caStage = param1 + 1;
         showStatsOnly = param2;
         var _loc3_:* = MatchSettings.caType;
         loop0:
         switch(0 !== _loc3_ ? (1 !== _loc3_ ? 2 : 1) : 0)
         {
            case 0:
               _loc3_ = MatchSettings.caStage;
               switch(1 !== _loc3_ ? (2 === _loc3_ ? 1 : (3 !== _loc3_ ? (4 === _loc3_ ? 3 : (5 !== _loc3_ ? (6 !== _loc3_ ? (7 !== _loc3_ ? (8 === _loc3_ ? 7 : (9 !== _loc3_ ? (10 === _loc3_ ? 9 : (11 !== _loc3_ ? (12 !== _loc3_ ? (13 !== _loc3_ ? (14 !== _loc3_ ? (15 === _loc3_ ? 14 : 15) : 13) : 12) : 11) : 10)) : 8)) : 6) : 5) : 4)) : 2)) : 0)
               {
                  case 0:
                     setCutscene([1],[2],M_Robot,null);
                     setLvl("tdm",15,"space",[1,7,15],null,"困境","一群武装分子突袭了“引航者”空间站，他们的目的是什么？\n但精英干员们可来不及想这么多。是时候拿起铳械，为了罗德岛的理念而战了！","角色：斯诺奇\n主武器：UMP-45（专业定制版）\n副武器：扳手\n突袭条件：禁止使用被动技能及御敌指令",{});
                     setPlr(1,"斯诺奇","",101,101,4,"MP5K","Wrench","none","","none","none",{
                        "exactFrame":true,
                        "spawn":{
                           "x":600,
                           "y":1230,
                           "node":"a"
                        },
                        "noRope":true
                     });
                     addBot(1,"斯特朗","general",101,101,4,"UMP","Wrench","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "spawn":{
                           "x":2797,
                           "y":855,
                           "node":"a"
                        },
                        "noRope":true
                     });
                     addBot(1,"起子","engi",101,101,4,"MP5K","Wrench","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "spawn":{
                           "x":976,
                           "y":1114,
                           "node":"a"
                        },
                        "aimReverse":true,
                        "noRope":true
                     });
                     addBot(1,"毛布","jugg",101,101,4,"MP5K","Wrench","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "spawn":{
                           "x":1407,
                           "y":936,
                           "node":"a"
                        },
                        "noRope":true
                     });
                     addBot(2,"武装人员","general",102,102,14,"M1911","First Blood","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true
                     });
                     addBot(2,"武装人员","sniper",102,102,14,"AMT","First Blood","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true
                     });
                     addBot(2,"武装人员","jugg",102,102,14,"USP","First Blood","none","","none","none",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true
                     });
                     break loop0;
                  case 1:
                     setCutscene([3,4],null,M_Robot,null);
                     setLvl("dm",15,"base",[1,7,15],M_Rocket,"战斗技巧","为了调查“引航者”空间站失联的原因，罗德岛成立了“精英小队”。\n这是你加入精英小队的第一天。作为精英小队的新成员，你要向老前辈们证明自己的实力。\n她们会接受你吗？","突袭条件：敌方单位攻击力提升",{});
                     setPlr(0,"","",0,0,0,"","","","","","",{"noRope":true});
                     addBot(0,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{"noRope":true});
                     addBot(0,"W","merc",1,3,6,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{"noRope":true});
                     addBot(0,"温蒂","general",1,3,1,"f357","AMT","FMJ","HeroSml","efficiency","regenB",[0,0,0],{"noRope":true});
                     addBot(0,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{"noRope":true});
                     addBot(0,"临光","jugg",3,3,16,"Judgement","Raffica","Mag","HeroBig","armor","fire",[0,0,0],{"noRope":true});
                     break loop0;
                  case 2:
                     setCutscene([5,6],[7,8],M_Dawn,null);
                     setLvl("tdm",30,"base",[1,8,15],null,"兵不接刃","一天的训练结束后，一群神秘人潜入了罗德岛本舰展开了突袭，他们究竟是何来头？\n立刻行动，阻止他们！务必保护好身后的罗德岛！","突袭条件：敌方单位生命上限大幅度提升",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{"noRope":true});
                     addBot(1,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{"noRope":true});
                     addBot(1,"温蒂","general",1,3,1,"f357","AMT","FMJ","HeroSml","efficiency","regenB",[0,0,0],{"noRope":true});
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","engi",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{});
                     break loop0;
                  case 3:
                     setCutscene([9],[10,11,12],null,M_Robot);
                     setLvl("tdm",20,"market",[1,8,15],M_Dawn,"病入膏肓","为了调查真相，亚叶、W和特遣干员三人乘坐近地飞行器，前往炎国-龙门寻找曾经的那位科学家，\n一定要问个清楚，她一定知道些什么。","<科学家>主武器：R4-C突击步铳\n副武器：USP.45\n突袭条件：保护科学家不被击倒",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"QiQing琪卿_","engi",103,105,4,"M4A4","USP","HAMR","Rhine Armor","none","none",[0,0,0],{
                        "noRope":true,
                        "hpMod":4
                     });
                     addBot(1,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"W","merc",1,3,6,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     break loop0;
                  case 4:
                     setCutscene(null,[44,13,14],null,null);
                     setLvl("dom",75,"mansion",[1,8,15],M_Robot,"回旋","队员们前往特里蒙市郊寻求莱茵生命前数据维护专员白面鸮的帮助。但当众人来到她的宅邸后却发现这里空无一人。一并赶来的，却是那群“老朋友”们……","突袭条件：敌方单位的占领效率极大幅度提升",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"W","merc",1,3,6,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     break loop0;
                  case 5:
                     setCutscene(null,null,null,null);
                     setLvl("ctf",3,"convoyStill",[2,8,15],M_Dawn,"不要恐慌","在撤离乔伊丝的宅邸后，队员们侦测到了整合运动遗弃的一支车队，正好可以用来获取工厂的位置。\n随后，三人向罗德岛本舰递交了行动请求。\n“请求已接受，速战速决。”\n尽你所能收集情报，多多益善。","突袭条件：敌方单位的重生时间大幅度减少",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"W","merc",1,3,6,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     break loop0;
                  case 6:
                     setCutscene(null,null,null,null);
                     setLvl("tdm",25,"factory",[2,9,15],M_Machine,"灯火将熄","从情报中得到的所有线索，都指向切尔诺伯格市郊的一座荒废工厂。\n循着线索，队员们找到了那处荒废的工厂。\n然而，在工厂里等待着他们的却是……","突袭条件：敌方单位的射程提升",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"亚叶","engi",2,3,11,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"W","merc",1,3,6,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"克隆体 亚叶","engi",5,4,14,"Type 95","FMG9","HAMR","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(2,"克隆体 W","merc",5,4,14,"M60","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"克隆体 温蒂","general",5,4,14,"f357","AMT","FMJ","HeroSml","efficiency","regenB",[0,0,0],{});
                     addBot(2,"克隆体 迷迭香","sniper",5,4,14,"L118A","Katana","Laser Sight","HeroSml","pierce","scan",[0,0,0],{});
                     addBot(2,"克隆体 临光","jugg",5,4,14,"Judgement","Raffica","Mag","HeroBig","armor","fire",[0,0,0],{});
                     break loop0;
                  case 7:
                     setCutscene([15,16,17,18],[20],M_Robot,null);
                     setLvl("tdm",30,"base",[2,9,15],null,"孽生恶物","一周后，罗德岛精英小队队长温蒂接到了乔伊丝研究员的来电。\n好消息是特效血清的成功研制。\n而坏消息却犹如雷霆乍惊般响彻了整个本舰……","突袭条件：额外敌人立即出现，且敌方单位护甲值提升",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"亚叶","engi",2,3,11,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{});
                     addBot(1,"临光","jugg",3,3,16,"Double Judgement","Raffica","Mag","HeroBig","armor","fire",[0,0,0],{});
                     addBot(2,"W","merc",1,3,6,"PKP","First Blood","Red Dot","HeroMed","efficiency","wizard",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{"noSpawn":true});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noSpawn":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noSpawn":true});
                     break loop0;
                  case 8:
                     setCutscene(null,null,null,null);
                     setLvl("dom",100,"convoy",[2,9,15],M_Meeting,"解决谁？","击退侵入罗德岛的整合运动后，W逃走了！\n她正在前往乔伊丝的宅邸，白面鸮随时都有可能处于水深火热之中！快追上去以免她遭遇不测！","突袭条件：我方干员再部署时间延长",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{"noRope":true});
                     addBot(1,"亚叶","engi",2,3,11,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{"noRope":true});
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{"noRope":true});
                     addBot(1,"临光","jugg",3,3,16,"Double Judgement","Raffica","Heartbeat","HeroBig","armor","fire",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","engi",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{});
                     break loop0;
                  case 9:
                     setCutscene(null,null,null,null);
                     setLvl("tdm",25,"mansionIagi",[3,9,15],M_Mute,"变节之刃","经历了一番有惊无险的追逐后，队员们赶来了，但他们有赶在W之前到达吗……","<乔伊丝>主武器：特斯拉步枪\n副武器：焓熵法杖\n突袭条件：白面鸮的生命上限提升，攻击力提升，永久御敌指令\n变更为[特斯拉强电弧感应圈]",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{
                        "spawn":{
                           "x":2434,
                           "y":903,
                           "node":"g"
                        },
                        "noRope":true
                     });
                     addBot(1,"亚叶","engi",2,3,11,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{
                        "spawn":{
                           "x":2096,
                           "y":916,
                           "node":"g"
                        },
                        "noRope":true,
                        "aimReverse":true
                     });
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{
                        "spawn":{
                           "x":2200,
                           "y":919,
                           "node":"g"
                        },
                        "noRope":true,
                        "aimReverse":true
                     });
                     addBot(1,"临光","jugg",3,3,16,"Double Judgement","Raffica","Heartbeat","HeroBig","armor","fire",[0,0,0],{
                        "spawn":{
                           "x":2317,
                           "y":913,
                           "node":"g"
                        },
                        "noRope":true,
                        "aimReverse":true
                     });
                     addBot(2,"W","merc",1,3,6,"Commando","First Blood","","HeroMed","efficiency","wizard",[0,0,0],{"noSpawn":true});
                     addBot(2,"乔伊丝","engi",105,105,1,"Gauss Rifle","Prod","","HeroMed","efficiency","none",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true,
                        "hpMod":4,
                        "permaStreak":"tesla"
                     });
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noSpawn":true});
                     break loop0;
                  case 10:
                     setCutscene(null,[21],null,null);
                     setLvl("dom",50,"market",[3,9,15],M_Dawn,"浸染","乔伊丝牺牲了，队员们该上哪儿找比她和整合运动更精通克隆技术的人呢？……\n队员们回到了龙门，决定找科学家讨个说法。","<科学家>主武器：R4-C突击步铳\n副武器:扳手\n突袭条件：敌方单位的攻击速度提升，且保护科学家不被击倒",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"QiQing琪卿_","engi",103,105,4,"M4A4","Wrench","HAMR","Rhine Armor","none","none",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true,
                        "hpMod":4
                     });
                     addBot(1,"亚叶","engi",2,3,11,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     break loop0;
                  case 11:
                     setCutscene([22],null,M_Machine,null);
                     setLvl("ctf",5,"factory",[3,10,15],null,"人心，向背无常","遵循科学家的指示，队员们再次前往工厂内收集有关整合运动克隆体的情报，并发送给科学家进行解析","突袭条件：敌方单位移动速度提升",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"亚叶","engi",2,3,11,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{});
                     addBot(1,"迷迭香","sniper",2,2,11,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{});
                     addBot(1,"临光","jugg",3,3,16,"Double Judgement","Raffica","Heartbeat","HeroBig","armor","fire",[0,0,0],{});
                     addBot(2,"整合运动 克隆体","merc",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","general",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","sniper",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     addBot(2,"整合运动 克隆体","jugg",5,4,14,"","","","","","",[0,0,0],{"noRope":true});
                     break loop0;
                  case 12:
                     setCutscene([23,24],[25,26,27],M_Mute,M_Robot);
                     setLvl("dom",100,"space",[3,10,15],M_Rocket,"再见，只为再见","为了使整合运动克隆体失去控制，精英小队将执行向空间站的主控计算终端传输病毒的艰巨任务。\n但我们相信，这一切都是值得的。","突袭条件：我方干员的占领效率降低",{});
                     setPlr(1,"","",101,101,0,"","","","","","",{"exactFrame":true});
                     addBot(1,"亚叶","engi",101,101,4,"M4EX","FMG9","","HeroMed","efficiency","turret",[0,0,0],{"exactFrame":true});
                     addBot(1,"迷迭香","sniper",101,101,4,"The annihilation battle Equipment","Katana","","HeroSml","pierce","scan",[0,0,0],{"exactFrame":true});
                     addBot(1,"临光","jugg",101,101,4,"Double Judgement","Raffica","Heartbeat","HeroBig","armor","fire",[0,0,0],{"exactFrame":true});
                     addBot(2,"整合运动 克隆体","merc",102,102,14,"","","","","","",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true
                     });
                     addBot(2,"整合运动 克隆体","general",102,102,14,"","","","","","",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true
                     });
                     addBot(2,"整合运动 克隆体","sniper",102,102,14,"","","","","","",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true
                     });
                     addBot(2,"整合运动 克隆体","jugg",102,102,14,"","","","","","",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true
                     });
                     break loop0;
                  case 13:
                     setCutscene([45],[28,29],null,null);
                     setLvl("tdm",30,"factoryMech",[4,10,15],M_Mute,"睁眼，便是日暮","大部分整合运动克隆体都脱离了卫星的控制，不再是威胁。\n但仍有一部分克隆体受切尔诺伯格指挥塔信号的控制而能自由行动。现在要做的便是肃清指挥塔内的所有克隆体。","<九的机甲>可以释放扫射、激光、践踏干扰我方\n指挥塔内集结了最强大的一批克隆体，请小心应对！\n突袭条件：额外敌人同时出现，机甲技能冷却缩短",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{"spawn":{
                        "x":2662,
                        "y":994,
                        "node":"e"
                     }});
                     addBot(2,"W","merc",1,3,6,"PKP","First Blood","HP","HeroMed","efficiency","wizard",[0,0,0],{"spawn":{
                        "x":287,
                        "y":994,
                        "node":"a"
                     }});
                     addBot(2,"整合运动 克隆体","engi",5,4,3,"","","","","","",[0,0,0],{
                        "noSpawn":true,
                        "permaStreak":"drone"
                     });
                     addBot(2,"整合运动 克隆体","merc",5,4,3,"","","","","","",[0,0,0],{
                        "noSpawn":true,
                        "permaStreak":"blood"
                     });
                     addBot(2,"整合运动 克隆体","general",5,4,3,"","","","","","",[0,0,0],{
                        "noSpawn":true,
                        "permaStreak":"regenB"
                     });
                     addBot(2,"整合运动 克隆体","sniper",5,4,3,"","","","","","",[0,0,0],{
                        "noSpawn":true,
                        "permaStreak":"aimbot"
                     });
                     addBot(2,"整合运动 克隆体","jugg",5,4,3,"","","","","","",[0,0,0],{
                        "noSpawn":true,
                        "permaStreak":"zap"
                     });
                     addBot(2,"九的机甲","jugg",5,4,14,"","","","","","",[0,0,0],{"noSpawn":true});
                     break loop0;
                  case 14:
                     setCutscene([30,31,32,33,34],[35,36,37,38,39,40,41],M_Robot,null);
                     setLvl("tdm",20,"mech",[4,10,15],null,"昂首，足践烈焰","幕后的主使终于出现在了眼前——新整合运动的领袖：九！\n这是你彻底解除整合运动对泰拉大陆的威胁的最后机会，\n泰拉的希望就掌握在你的手中！\n[本次行动中我方单位和敌方单位击杀目标可恢复自身生命值]","角色：阿米娅（属性全面提升）   战略调度：近卫干员\n主武器：青色怒火    副武器：沙漠之鹰    护甲：漆黑王冠\n<九的机甲>可以释放导弹、激光干扰我方\n突袭条件：额外敌人立即出现，且敌方单位生命上限提升",{"vampire":true});
                     setPlr(1,"阿米娅","merc",109,109,12,"Grim Kollam\'s Saber","Desert Eagle","","Civilight Eterna","adren","blood",{
                        "permaSurge":true,
                        "exactFrame":true,
                        "hpMod":2
                     });
                     addBot(2,"九","merc",100,100,13,"M4EX","Saber","","HeroBig","autostreak","regenB",[0,0,0],{
                        "exactFrame":true,
                        "hpMod":12,
                        "kills":7,
                        "permaStreak":"moralB"
                     });
                     addBot(2,"九","jugg",100,100,13,"Extreme Gun","Prod","","HeroBig","autostreak","critB",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true,
                        "hpMod":12,
                        "kills":6,
                        "permaStreak":"ice"
                     });
                     addBot(2,"九","sniper",100,100,13,"SKS","Raffica","","HeroBig","autostreak","sentry",[0,0,0],{
                        "exactFrame":true,
                        "noSpawn":true,
                        "hpMod":12,
                        "kills":6,
                        "permaStreak":"tesla"
                     });
                     break loop0;
                  default:
                     setCutscene(null,null,null,null);
                     setLvl("tdm",15,"base",[1,7,15],null,"TEST","A research facility is being attacked. You hold very vital information, escape with your life!\n\n[Tutorial Level]","Play as an Astronaut",{});
               }
               break;
            case 1:
               setCutscene(null,null,null,null);
               _loc3_ = MatchSettings.caStage;
               switch(1 !== _loc3_ ? (2 !== _loc3_ ? (3 !== _loc3_ ? (4 === _loc3_ ? 3 : (5 !== _loc3_ ? (6 === _loc3_ ? 5 : (7 !== _loc3_ ? (8 !== _loc3_ ? (9 === _loc3_ ? 8 : (10 !== _loc3_ ? (11 === _loc3_ ? 10 : (12 !== _loc3_ ? (13 !== _loc3_ ? (14 === _loc3_ ? 13 : (15 !== _loc3_ ? 15 : 14)) : 12) : 11)) : 9)) : 7) : 6)) : 4)) : 2) : 1) : 0)
               {
                  case 0:
                     setLvl("tdm",20,"market",[4,11,15],M_Dawn,"GH-EX-1 扫黑除恶","罗德岛举办的第一场特种作战演习；先来热热身吧。\n你将带领414、415小队，直面曾经的宿敌。","经验值加成：10倍\n永久御敌指令：极致火力\n※拥有极其高强的队友助战",{"expMod":10});
                     setPlr(1,"","",0,0,0,"","","","","","",{"permaStreak":"wizard"});
                     addBot(1,"印度战神","engi",5,4,20,"Intervention","P99","none","Military","autostreak3","aimB",[0,0,0],{"permaStreak":"drone"});
                     addBot(1,"B Brother","general",101,4,4,"f500","Katana","none","Oobleck","autostreak3","critB",[0,0,0],{
                        "permaStreak":"surge",
                        "exactFrame":true
                     });
                     addBot(1,"林FieFie","sniper",1,4,14,"Barrett","Saber","Laser Sight","Magnetic","autostreak3","scan",[0,0,0],{"permaStreak":"wallhack"});
                     addBot(1,"初魁","merc",109,109,14,"Commando","Hammer","FMJB","Kevlar","autostreak3","rage",[0,0,0],{
                        "permaStreak":"fire",
                        "exactFrame":true
                     });
                     addBot(1,"奥特之父","general",102,1,20,"M4EX","Saber","none","Aerogel","autostreak3","regenB",[0,0,0],{
                        "permaStreak":"aimbot",
                        "exactFrame":true
                     });
                     addBot(2,"[顶级]中锋","jugg",7,1,1,"garbage shovel","Empty","","none","regen","none",[0,0,0],{
                        "hpMod":15,
                        "scale":1.5,
                        "dontStop":true
                     });
                     break loop0;
                  case 1:
                     setLvl("tdm",25,"factory",[4,11,15],M_Mute,"切尔诺伯格 破碎大道","被战火摧残的街道，路面斑驳，断壁残垣，而造成这一切的罪魁祸首依旧驻扎在这片区域。","<热泵通道>每4~6秒造成一次2000真实伤害\n主武器：罗德岛制式长剑\n副武器：不可用\n生命值、经验值加成：1.5倍",{"expMod":1.5});
                     setPlr(1,"","",0,0,0,"Katana","Empty","","","","",{"hpMod":1.5});
                     addBot(2,"碎岩者","merc",5,4,4,"Hammer","Empty","","Kevlar","boobytrap","surge",[0,0,0],{
                        "hpMod":0.13,
                        "scale":1.25
                     });
                     addBot(2,"碎岩者组长","merc",5,4,3,"Hammer","Empty","","Heavy Power","boobytrap","critB",[0,0,0],{
                        "hpMod":0.15,
                        "scale":1.25
                     });
                     addBot(2,"特工组长","engi",5,4,3,"Saber","Empty","","Magnetic","autostreak1","stealth",[0,0,0],{"hpMod":1.2});
                     addBot(2,"机动盾兵组长","merc",7,4,3,"no weapon","Empty","","Titanium","boobytrap","none",[0,0,0],{"hpMod":1.2});
                     addBot(2,"编制术师组长","sniper",5,4,3,"Empty","USP","","Superalloy","none","fire",[0,0,0],{});
                     break loop0;
                  case 2:
                     setLvl("tdm",25,"base",[5,11,15],M_Epic,"荒野 无名庇护所","一座荒野中的藏身之所，古老的萨卡兹祭坛仍在运行。这里不欢迎外人，自然也不会善待拿着武器的罗德岛干员。","<源石祭坛>周期性向四周释放脉冲波，对我军与敌军造成伤害\n主武器：源石剑\n副武器：不可用\n经验值加成：1.5倍\n",{"expMod":1.5});
                     setPlr(1,"","",0,0,0,"Saber","Empty","","","","",{});
                     addBot(1,"灰喉","sniper",1,1,14,"Desert Eagle","Empty","","Kevlar","focus","aimbot",[0,0,0],{"permaStreak":"stealth"});
                     addBot(1,"塞雷娅","jugg",1,4,5,"Hammer","Empty","","Heavy HP","regen","fire",[0,0,0],{"permaStreak":"regenB"});
                     addBot(2,"寻仇者","merc",102,40,15,"blade1","blade1","none","Static","autostreak1","surge",[0,0,0],{
                        "exactFrame":true,
                        "hpMod":1.9
                     });
                     addBot(2,"复仇者","merc",102,40,3,"blade2","blade2","none","Static","autostreak1","critB",[0,0,0],{
                        "hpMod":2.1,
                        "exactFrame":true
                     });
                     addBot(2,"“复仇者”，雷德","merc",102,40,3,"blade3","blade3","none","Heavy Power","autostreak1","rage",[0,0,0],{
                        "permaStreak":"surge",
                        "hpMod":5,
                        "exactFrame":true,
                        "scale":1.3
                     });
                     addBot(2,"隐形术师组长","sniper",5,4,3,"Empty","Empty","","Superalloy","none","none",[0,0,0],{"permaStreak":"stealth"});
                     addBot(2,"游击队突袭炮兵","merc",7,4,14,"Javelin","First Blood","Locater","Titanium","nosweat","wizard",[0,0,0],{"hpMod":2});
                     addBot(2,"萨卡兹雇佣军战士组长","merc",5,1,3,"no weapon","Empty","","Titanium","pierce","none",[0,0,0],{
                        "permaStreak":"aimbot",
                        "hpMod":3
                     });
                     break loop0;
                  case 3:
                     setLvl("tdm",25,"factoryMech",[5,12,15],M_Machine,"H5-4 炼狱行动-4","浮士德再度出现，并变得更加强大，全场的所有弩炮也得到大幅度加强。合理规划干员的位置和部署顺序，抵挡住浮士德猛烈的进攻！","<弩炮台>会定期射出弩箭对我方单位造成物理伤害\n生命值、经验值加成：2倍",{"expMod":2});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":2});
                     addBot(2,"法术近卫组长","merc",7,3,3,"Katana","Empty","","Kevlar","pierce","zap",[0,0,0],{"hpMod":2});
                     addBot(2,"特战术师组长","merc",7,4,3,"Wand","Wand","","Kevlar","none","none",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"drone"
                     });
                     addBot(2,"炮兵组长","merc",7,1,3,"Javelin","Javelin","","Kevlar","nosweat","wizard",[0,0,0],{"permaStreak":"scan"});
                     addBot(2,"粉碎攻坚组长","jugg",5,4,3,"Hammer","Empty","","Heavy Armor","armor","ice",[0,0,0],{"hpMod":0.4});
                     addBot(2,"幻影弩手","sniper",5,4,14,"DSR1","Thor","Mag","Magnetic","autostreak","aimbot",[0,0,0],{"permaStreak":"stealth"});
                     addBot(2,"浮士德，“锐箭”","sniper",7,48,11,"Barrett","Saber","Heartbeat","Heavy Ammo","autostreak1","wallhack",[0,0,0],{
                        "permaStreak":"aimbot",
                        "hpMod":6,
                        "scale":1.3
                     });
                     break loop0;
                  case 4:
                     setLvl("tdm",25,"factory",[5,12,15],M_Machine,"H6-4 冰狱行动-4","全盛状态的霜星回归战场，运用你的战术头脑，抵御这股寒霜风暴吧！","<源石冰晶>周期性地释放对我方单位施加【寒冷】的范围性寒流\n生命值、经验值加成：2倍",{"expMod":2});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":2});
                     addBot(2,"雪怪狙击手组长","sniper",7,1,4,"DSR1","L118A","Thermal","Kevlar","focus","scan",[0,0,0],{"permaStreak":"ice"});
                     addBot(2,"轻甲卫兵组长","merc",7,1,3,"no weapon","Empty","none","Titanium","resistance","none",[0,0,0],{
                        "permaStreak":"ice",
                        "hpMod":1.2
                     });
                     addBot(2,"雪怪术师组长","sniper",7,48,4,"ice staff","Empty","","Superalloy","resistance","none",[0,0,0],{"permaStreak":"ice"});
                     addBot(2,"炮兵组长","merc",7,1,3,"M32","Javelin","IceB","Kevlar","resistance","wizard",[0,0,0],{
                        "permaStreak":"ice",
                        "hpMod":2
                     });
                     addBot(2,"雪怪小队破冰者","merc",101,40,4,"blade1","Empty","","Heavy Armor","resistance","rage",[0,0,0],{
                        "permaStreak":"ice",
                        "exactFrame":true,
                        "hpMod":2.1
                     });
                     addBot(2,"霜星，“冬痕”","general",7,48,4,"ice","ice ring","","Heavy Armor","armor","moralB",[0,0,0],{
                        "permaStreak":"ice",
                        "hpMod":7,
                        "scale":1.3
                     });
                     break loop0;
                  case 5:
                     setLvl("tdm",35,"base",[5,12,15],M_Meeting,"H7-4 星火行动-4","如果你从未见识过他们过去的阵列，你就无法理解为何他们曾被战场上的所有生灵恐惧。兴许有人能向你描述，乌萨斯是用什么碾碎了文明本身……","<源石祭坛>周期性向四周释放脉冲波，对我军与敌军造成伤害\n生命值、经验值加成：3倍",{"expMod":3});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":3});
                     addBot(1,"MrBlockDou","sniper",101,102,14,"Barrett","dDesert Eagle","ACOG","Kevlar","pierce","aimbot",[0,0,0],{
                        "permaStreak":"stealth",
                        "exactFrame":true,
                        "hpMod":2
                     });
                     addBot(1,"黑","sniper",3,4,10,"AWM","dDesert Eagle","none","Military","pierce","scan",[0,0,0],{
                        "hpMod":3,
                        "permaStreak":"wallhack"
                     });
                     addBot(2,"游击队弩手组长","sniper",7,4,3,"G11","Five Seven","Laser Sight","Aerogel","auto","aimbot",[0,0,0],{"permaStreak":"scan"});
                     addBot(2,"游击队突袭战士组长","merc",101,4,3,"First Blood","F2000","none","Titanium","boobytrap","surge",[0,0,0],{
                        "exactFrame":true,
                        "hpMod":2
                     });
                     addBot(2,"游击队突袭炮兵组长","merc",7,4,3,"Javelin","Javelin","Locater","Titanium","nosweat","wizard",[0,0,0],{"hpMod":2});
                     addBot(2,"游击队传令兵组长","general",5,4,3,"no weapon","no weapon","none","Titanium","autostreak3","moralB",[0,0,0],{
                        "permaStreak":"zap",
                        "hpMod":2.8,
                        "exactFrame":true
                     });
                     addBot(2,"游击队盾卫组长","jugg",5,4,3,"no weapon","Empty","none","Heavy Armor","armor","rage",[0,0,0],{
                        "permaStreak":"zap",
                        "hpMod":4.5,
                        "scale":1.15
                     });
                     addBot(2,"爱国者，“毁灭姿态”","jugg",7,100,10,"throwing spear","great halberd","","HeroBig","autostreak1","rage",[0,0,0],{
                        "permaStreak":"surge",
                        "exactFrame":true,
                        "hpMod":14,
                        "scale":1.5
                     });
                     break loop0;
                  case 6:
                     setLvl("tdm",20,"factoryMech",[5,12,15],M_Epic,"H8-4 狂夜行动-4","神祗傲慢且无礼。\n在新旧两任整合运动领袖的夹击下求得生路。","<能量聚合体>向四周四方向发出火球，对一名我方单位造成法\n术伤害并施加【烈焚灼息】\n<乌萨斯平民>被敌人击杀时扣除关卡生命值\n生命值、经验值加成：3倍",{"expMod":3});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":3});
                     addBot(1,"乌萨斯平民","engi",7,50,1,"no weapon","Empty","","none","none","none",[0,0,0],{"kills":7});
                     addBot(1,"乌萨斯平民","engi",7,50,1,"no weapon","Empty","","none","none","none",[0,0,0],{"kills":8});
                     addBot(2,"不息恶火","engi",0,0,0,"Reflect Shield","Reflect Shield","","","autostreak3","fire",[0,0,0],{
                        "permaStreak":"stealth",
                        "scale":0.01,
                        "hpMod":10
                     });
                     addBot(2,"不息恶火","engi",0,0,0,"Reflect Shield","Reflect Shield","","","autostreak3","fire",[0,0,0],{
                        "permaStreak":"stealth",
                        "scale":0.01,
                        "hpMod":10
                     });
                     addBot(2,"塔露拉，“不死的黑蛇”","general",7,40,3,"flame","chopping","","HeroBig","overkill","surge",[0,0,0],{
                        "hpMod":18.75,
                        "permaStreak":"fire",
                        "scale":1.35
                     });
                     break loop0;
                  case 7:
                     setLvl("tdm",35,"base",[5,12,15],M_Epic,"H9-6 急雨行动-3","当鬼魂从帝国庞大的暗影中爬出，它们的怒火绝不会轻易平息。守住自己的位置，再一次迎接来自蔓德拉和深池战士的复仇吧。","<破碎支柱>可以被相邻干员击倒，对倒下方向的两格造成真实\n伤害并生成阻挡路线的废墟\n生命值、经验值加成：3倍",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":3});
                     addBot(2,"深池狙击队长","sniper",7,4,3,"G3","Empty","","Kevlar","focus","scan",[0,0,0],{"permaStreak":"fire"});
                     addBot(2,"蔓德拉，“岩石术师”","general",7,4,10,"The Shield of Rock","gaze","","Titanium","autostreak3","moralB",[0,0,0],{"hpMod":6});
                     addBot(2,"深池暗影术师队长","sniper",7,4,3,"fire staff","Empty","","Kevlar","pierce","surge",[0,0,0],{
                        "permaStreak":"fire",
                        "hpMod":1.5
                     });
                     addBot(2,"深池伙友影刃精英","engi",7,50,3,"Saber","Empty","","Titanium","autostreak3","stealth",[0,0,0],{
                        "permaStreak":"turret",
                        "hpMod":4
                     });
                     addBot(2,"深池伙友卫队精英","jugg",7,4,3,"Wrench","Empty","","Heavy Armor","autostreak3","ice",[0,0,0],{
                        "permaStreak":"fire",
                        "hpMod":6
                     });
                     addBot(2,"深池塑能术师队长","sniper",7,4,3,"blaze","Empty","","Heavy Armor","pierce","none",[0,0,0],{
                        "permaStreak":"fire",
                        "hpMod":3
                     });
                     break loop0;
                  case 8:
                     setLvl("ctf",6,"factory",[6,13,15],M_Machine,"切尔诺伯格 石棺","于切尔诺伯格石棺深处检测到了巨大的能量波动！究竟是什么使这些长眠于地下的牧群化的整合运动士兵苏醒了过来？","敌方狂暴宿主单位不再自然损失生命值\n生命值加成：4倍",{"expMod":1});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":4});
                     addBot(1,"迷迭香","sniper",2,4,14,"Barrett","Desert Eagle","none","Heavy R2","autostreak3","wallhack",[0,0,0],{"permaStreak":"aimbot"});
                     addBot(1,"灰毫","jugg",4,4,4,"SPAS 12","PM9","Long Barrel","Heavy Armor","armor","zap",[0,0,0],{"permaStreak":"rage"});
                     addBot(1,"麦哲伦","engi",4,2,20,"Commando","sf357","HPB","Heavy HP","autostreak3","sentry",[0,0,0],{"permaStreak":"drone"});
                     addBot(2,"狂暴宿主掷骨手","merc",5,23,3,"originium crystal","Empty","none","Heavy R2","autostreak1","rage",[0,0,0],{
                        "hpMod":3,
                        "permaStreak":"surge",
                        "exactFrame":true
                     });
                     addBot(2,"萨卡兹宿主卫巢百夫长","merc",5,4,3,"AK 12","Katana","FMJ","Heavy Armor","transfusion","aimbot",[0,0,0],{
                        "hpMod":3.5,
                        "permaStreak":"blood"
                     });
                     addBot(2,"萨卡兹宿主卫巢百夫长","merc",5,4,3,"AK 12","Katana","FMJ","Heavy Armor","transfusion","aimbot",[0,0,0],{
                        "hpMod":3.5,
                        "permaStreak":"blood"
                     });
                     addBot(2,"宿主重装组长","jugg",5,4,3,"no weapon","no weapon","","Heavy Armor","autostreak3","regenB",[0,0,0],{
                        "permaStreak":"acid",
                        "hpMod":4
                     });
                     addBot(2,"宿主重装组长","jugg",5,4,3,"no weapon","no weapon","","Heavy Armor","autostreak3","regenB",[0,0,0],{
                        "permaStreak":"acid",
                        "hpMod":4
                     });
                     break loop0;
                  case 9:
                     setLvl("tdm",400,"market",[6,13,15],M_Dawn,"长期剿灭委托 龙门市区","剿灭攻入龙门市区的整合运动武装分子，夺回地区主动权。","部署费用不会自然回复\n敌方初始杀敌数：200",{"expMod":1});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(1,"寒哥他爹","merc",2,3,15,"G3","FMG9","HP","Kevlar","autostreak3","aimB",[0,0,0],{
                        "permaStreak":"regenB",
                        "hpMod":2.3
                     });
                     addBot(1,"塞雷娅","jugg",1,4,5,"Jackhammer","Raffica","Hair Trigger","Heavy Armor","ammo","ice",[0,0,0],{"hpMod":3});
                     addBot(1,"Anderson","engi",43,0,14,"ARX 160","Wrench","Silencer","Rhine Armor","autostreak2","critB",[0,0,0],{
                        "permaStreak":"aimbot",
                        "hpMod":1.85,
                        "exactFrame":true
                     });
                     addBot(2,"粉碎攻坚组长","jugg",5,4,3,"Hammer","Empty","none","Heavy Armor","armor","zap",[0,0,0],{
                        "hpMod":0.4,
                        "kills":40
                     });
                     addBot(2,"宿主流浪者","merc",5,4,3,"Hammer","Empty","none","Titanium","regen","blood",[0,0,0],{
                        "hpMod":0.35,
                        "kills":40
                     });
                     addBot(2,"特战术师组长","sniper",5,4,4,"Empty","Empty","","Kevlar","autostreak1","turret",[0,0,0],{
                        "permaStreak":"drone",
                        "kills":40
                     });
                     addBot(2,"破阵者组长","merc",7,23,3,"RCP 90","FMG9","Red Dot","Kevlar","adren","scan",[0,0,0],{});
                     addBot(2,"隐形术师组长","sniper",5,4,3,"Empty","Empty","","Superalloy","none","none",[0,0,0],{
                        "permaStreak":"stealth",
                        "kills":40
                     });
                     addBot(2,"特战士兵","engi",101,4,15,"M4A4","First Blood","HAMR","Kevlar","autostreak1","turret",[0,0,0],{"kills":40});
                     break loop0;
                  case 10:
                     setLvl("tdm",400,"mansionFull",[6,13,15],M_Rocket,"剿灭委托 实验基地机库","359号实验基地的清理工作正在进行，原本存放在机库的实验动力甲此时因不明原因突然恢复行动。在场的罗德岛干员需要迅速处理介入并平息事端。","部署费用不会自然回复\n<R系列动力装甲>吸收周围实验产物回复技力，技力满时激活\n生命值加成：3倍",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":3});
                     addBot(2,"R-11a突击动力装甲","jugg",101,101,4,"Commando","Commando","Locater","Heavy Ammo","ammo","wizard",[0,0,0],{
                        "permaStreak":"surge",
                        "exactFrame":true,
                        "hpMod":4,
                        "scale":1.5
                     });
                     addBot(2,"R-11a突击动力装甲","jugg",101,101,4,"Commando","Commando","Locater","Heavy Ammo","ammo","wizard",[0,0,0],{
                        "permaStreak":"surge",
                        "exactFrame":true,
                        "hpMod":4,
                        "scale":1.5
                     });
                     addBot(2,"R-31a重型动力装甲","jugg",101,101,4,"no weapon","no weapon","","Heavy Armor","armor","rage",[0,0,0],{
                        "permaStreak":"scan",
                        "exactFrame":true,
                        "hpMod":4,
                        "scale":1.5
                     });
                     addBot(2,"莱茵生命高级工程科成员","engi",1,101,5,"Scar","M1911","Heartbeat","Kevlar","efficiency","drone",[0,0,0],{"permaStreak":"tesla"});
                     addBot(2,"莱茵生命高级工程科成员","engi",1,101,5,"Scar","M1911","Heartbeat","Kevlar","efficiency","drone",[0,0,0],{"permaStreak":"tesla"});
                     addBot(2,"莱茵生命防卫科高级成员","merc",666,101,5,"Katana","Empty","none","Rhine Armor","none","none",[0,0,0],{"exactFrame":true});
                     break loop0;
                  case 11:
                     setLvl("ctf",7,"space",[6,13,15],M_Rocket,"TN-1 新星爆发","跟随琪卿的脚步，回到万星园，见证人性的兴替。","<重力感应>存在重力感应机关与“行星碎屑”\n本次行动中干员部署不受近远程限制，敌人重量大幅减少\n生命值、经验值加成：4倍",{"expMod":4});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":4});
                     addBot(1,"塞雷娅","jugg",1,20,5,"R870","Kriss Kard","Hair Trigger","Heavy Armor","autostreak3","regenB",[0,0,0],{"hpMod":2.7});
                     addBot(1,"弧光镜卫长","jugg",101,99,4,"no weapon","no weapon","","Heavy Armor","armor","none",[0,0,0],{
                        "hpMod":4.5,
                        "exactFrame":true,
                        "permaStreak":"tesla"
                     });
                     addBot(1,"白面鸮","engi",104,104,5,"AKS","Prod","Long Barrel","HeroMed","regen","scan",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"tesla",
                        "hpMod":1.9,
                        "noRope":true
                     });
                     addBot(1,"QiQing琪卿_","engi",103,105,5,"Intervention","Wrench","Laser Sight","Rhine Armor","autostreak3","moralB",[0,0,0],{
                        "permaStreak":"wizard",
                        "hpMod":4
                     });
                     addBot(2,"克丽斯腾","general",7,4,15,"moulding stars","Empty","","HeroBig","autostreak1","aimB",[0,0,0],{
                        "permaStreak":"tesla",
                        "hpMod":8,
                        "scale":1.3
                     });
                     addBot(2,"弧光锋卫长","sniper",101,101,15,"Saber","Empty","","Titanium","focus","aimbot",[0,0,0],{
                        "exactFrame":true,
                        "hpMod":2,
                        "permaStreak":"tesla"
                     });
                     addBot(2,"Ayanokouji","",7,0,0,"","","","","autostreak1","",[0,0,0],{"noSpawn":true});
                     break loop0;
                  case 12:
                     setLvl("tdm",20,"mansion",[6,14,15],M_Epic,"TN-2 梦的开始","天灾无情，但人定胜天。\n战胜Arknights：SFH的创造者。","生命值、经验值加成：2倍",{"expMod":2});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":2});
                     addBot(2,"QiQing琪卿_","engi",103,105,5,"AWM","Saber","","Rhine Armor","autostreak3","aimB",[0,0,0],{"permaStreak":"aimbot"});
                     addBot(2,"Ruler统治者_","merc",7,99,15,"Commando","First Blood","AcidB","Heavy Armor","armor","surge",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"wizard"
                     });
                     addBot(1,"Ayanokouji","",7,102,10,"","Empty","none","","","",[0,0,0],{"noSpawn":true});
                     addBot(1,"Kallen","",1,3,14,"","Empty","none","","","",[0,0,0],{"noSpawn":true});
                     addBot(1,"","",0,0,0,"","Empty","none","","","",[0,0,0],{"noSpawn":true});
                     break loop0;
                  case 13:
                     setLvl("tdm",20,"doubleMech",[6,14,15],M_Machine,"TN-3 梦的延续","泰拉是人类永远的摇篮，但终归会有人不愿在无知中入眠。\n战胜零叁肇事组的两位高层。","生命值、经验值加成：3倍\n真是简简又单单啊！",{"expMod":3});
                     setPlr(1,"","",0,0,0,"","","","","","",{"hpMod":3});
                     addBot(2,"RustyIronDoor","sniper",666,4,14,"Intervention","Katana","none","Titanium","sacrifice","scan",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"aimbot",
                        "hpMod":3
                     });
                     addBot(2,"RustyIronWay","merc",7,99,14,"Type 95","P99","Laser Sight","Titanium","autostreak3","turret",[0,0,0],{
                        "permaStreak":"blood",
                        "exactFrame":true,
                        "hpMod":2
                     });
                     break loop0;
                  case 14:
                     setLvl("tdm",40,"base",[7,14,15],M_Rocket,"TN-4 梦的终结","如果造物主放任自己的造物自由发展，那他们终有一天会发展到足以反噬造物主的境界。\n战胜《明日方舟》游戏制作人 海猫络合物与关卡设计师 Rua（以及他们的拥趸）","附加效果：终焉决裁（永久）、免疫自我伤害、4倍经验\n※这是真正的天灾！——铳响涤薪，弹火纷鸣！\n当前合约难度极大\n请谨慎行动",{"expMod":4});
                     setPlr(1,"","",0,0,0,"","","","","","",{
                        "permaStreak":"moralB",
                        "selfDmg":0
                     });
                     addBot(2,"Ocean Cat","engi",107,107,12,"G36","Saber","none","Heavy R2","autostreak1","aimbot",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"sentry",
                        "scale":1.25,
                        "levelAdd":1
                     });
                     addBot(2,"Rua","jugg",106,106,7,"Cerberus","Hammer","none","Heavy Explode","autostreak1","rage",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"scan",
                        "scale":1.25,
                        "levelAdd":1
                     });
                     addBot(2,"QiQing琪卿_","engi",103,105,5,"mk2M4A4","Saber","HAMR","Rhine Armor","autostreak3","wizard",[0,0,0],{
                        "permaStreak":"aimbot",
                        "noSpawn":true
                     });
                     addBot(2,"RustyIronDoor","sniper",666,4,14,"Intervention","Katana","none","Titanium","sacrifice","scan",[0,0,0],{
                        "exactFrame":true,
                        "permaStreak":"aimbot",
                        "noSpawn":true
                     });
                     addBot(2,"Wan顽子","engi",104,104,5,"MP5K","Prod","","HeroMed","regen","scan",[0,0,0],{
                        "exactFrame":true,
                        "noRope":true,
                        "noSpawn":true
                     });
                     addBot(2,"喵零酱","general",6,104,14,"SKS","Thumper","","Superalloy","autostreak3","tesla",[0,0,0],{
                        "noRope":true,
                        "exactFrame":true,
                        "noSpawn":true
                     });
                     break loop0;
                  default:
                     setLvl("tdm",15,"space",[7,7,15],null,"","","",{});
                     setPlr(1,"","",0,0,0,"","","","","","",{});
                     addBot(2,"","",0,0,0,"","","","","","",[1,14,15],{});
               }
         }
      }
      
      public static function runScripts(param1:Game) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Stats_Guns = null;
         var _loc4_:* = MatchSettings.caType;
         loop6:
         switch(0 !== _loc4_ ? (1 !== _loc4_ ? 2 : 1) : 0)
         {
            case 0:
               _loc4_ = MatchSettings.caStage;
               switch(1 !== _loc4_ ? (2 !== _loc4_ ? (3 === _loc4_ ? 2 : (4 !== _loc4_ ? (5 !== _loc4_ ? (6 === _loc4_ ? 5 : (7 !== _loc4_ ? (8 !== _loc4_ ? (9 === _loc4_ ? 8 : (10 !== _loc4_ ? (11 !== _loc4_ ? (12 !== _loc4_ ? (13 === _loc4_ ? 12 : (14 !== _loc4_ ? (15 !== _loc4_ ? 15 : 14) : 13)) : 11) : 10) : 9)) : 7) : 6)) : 4) : 3)) : 1) : 0)
               {
                  case 0:
                     if(sn == 1)
                     {
                        param1.physWorld.m_world.SetGravity(new b2Vec2(0,10));
                        param1.arena.mc_laser.stop();
                        param1.player.gun.swapGuns();
                        param1.units[1].gun.swapGuns();
                        param1.units[2].gun.swapGuns();
                        param1.units[3].gun.swapGuns();
                        param1.units[1].setDiffStats(0);
                        param1.units[2].setDiffStats(0);
                        param1.units[3].setDiffStats(0);
                        _loc2_ = 1;
                        while(_loc2_ <= 5)
                        {
                           param1.arena["mc_box" + _loc2_].gotoAndStop(1);
                           _loc2_++;
                        }
                        ++sn;
                        fc = 0;
                        param1.arena.changeWallFrame(sn);
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("斯特朗","备用电源出现故障，我们无法使用主升降机，\n去空间站外面看看怎么回事。",0,true,v1_1);
                        }
                        if(fc == 9 * 30)
                        {
                           param1.hud.gotoFrame("tutmove");
                           fc = 0;
                           ++sn;
                           param1.arena.changeWallFrame(sn);
                           param1.arena.setShake(4,4);
                           _loc2_ = 1;
                           while(_loc2_ <= 5)
                           {
                              param1.arena["mc_box" + _loc2_].gotoAndPlay("float");
                              _loc2_++;
                           }
                           param1.arena.mc_door1.gotoAndPlay("open");
                        }
                     }
                     if(sn == 6)
                     {
                        if(fc == 0 * 30)
                        {
                           param1.hud.setMsg("斯特朗","发电机老是抽风，敲它几下就完事了。",0,true,v1_2);
                           param1.arena.mc_party.visible = true;
                        }
                     }
                     if(sn == 9)
                     {
                        if(fc == 0 * 30)
                        {
                           param1.arena.mc_party.visible = false;
                           param1.arena.mc_lights.play();
                           param1.hud.gotoFrame("idle");
                           SH.playSound(S_Deploy);
                           SH.playSound(S_Radar);
                        }
                        if(fc == 1 * 15)
                        {
                           param1.hud.setMsg("斯特朗","干得漂亮，我们现在有活儿干。你来控制室一趟。",0,true,v1_3);
                        }
                     }
                     if(sn == 12)
                     {
                        if(fc == 1 * 30)
                        {
                           fc = 0;
                           ++sn;
                           param1.arena.changeWallFrame(sn);
                           param1.arena.setShake(4,4);
                           _loc2_ = 1;
                           while(_loc2_ <= 5)
                           {
                              param1.arena["mc_box" + _loc2_].gotoAndPlay("drop");
                              _loc2_++;
                           }
                           param1.arena.mc_door1.gotoAndPlay("close");
                           param1.arena.mc_door2.gotoAndPlay("open");
                        }
                     }
                     if(sn == 13)
                     {
                        if(fc == 0 * 30)
                        {
                           param1.hud.setMsg("起子","欢迎回来，没事吧。斯特朗正要见你。",0,true,v1_4);
                           param1.arena.mc_door2.gotoAndPlay("close");
                        }
                     }
                     if(sn == 16)
                     {
                        if(fc == 1 * 30)
                        {
                           param1.arena.setShake(12,14);
                           SH.playSound(S_rocketExplode);
                           SH.playMusic(M_Machine);
                           param1.createEffect(param1.units[1].x + 25,Number(param1.units[1].y) - 10,"explosion");
                           param1.createEffect(2550,1060,"explosion");
                           param1.createEffect(2820,1010,"explosion");
                           param1.createEffect(2650,1050,"explosion");
                           param1.units[1].die(param1.units[4],Stats_Guns.itemOb["env2"],{
                              "headMult":1,
                              "hitX":param1.units[1].x + 15,
                              "hitY":Number(param1.units[1].y) - 15
                           });
                           param1.units[1].unitInfo.extra.noSpawn = true;
                           param1.arena.mc_door2.gotoAndPlay("open");
                           param1.arena.mc_destroyed.visible = false;
                        }
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("起子","发生什么了？队长那边怎么回事！",0,true,v1_5);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setMsg("毛布","空间站遭到了袭击！所有干员立刻进入一级戒备状态！",0,true,v1_6);
                        }
                        if(fc == 10 * 30)
                        {
                           fc = 0;
                           ++sn;
                           param1.arena.changeWallFrame(sn);
                           param1.hud.gotoFrame("tutswitch");
                        }
                     }
                     if(sn == 19)
                     {
                        if(fc == 0 * 30)
                        {
                           param1.arena.setShake(6,6);
                           param1.physWorld.m_world.SetGravity(new b2Vec2(0,0));
                           param1.units[2].spawn(990,1110,"b",false);
                           param1.units[3].spawn(1306,935,"k",false);
                           param1.units[2].setDiffStats(-99);
                           param1.units[3].setDiffStats(-99);
                           param1.units[4].spawn(2500,1230,"e",false);
                           param1.units[5].spawn(2600,1230,"e",false);
                           param1.units[6].spawn(2700,1230,"e",false);
                           param1.arena.mc_laser.play();
                           _loc2_ = 1;
                           while(_loc2_ <= 5)
                           {
                              param1.arena["mc_box" + _loc2_].gotoAndPlay("float");
                              _loc2_++;
                           }
                        }
                        if(fc == 2 * 30)
                        {
                           param1.hud.setMsg("毛布","模拟重力都失效了，这帮家伙到底是什么人！",0,true,v1_7);
                        }
                        if(param1.matchSettings.team1score >= 6)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 20)
                     {
                        if(fc == 2 * 30)
                        {
                           param1.hud.setMsg("起子","现在到底是什么情况？罗德岛好像没告诉过我们这种情况怎么应对！",0,true,v1_8);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setMsg("毛布","我鬼知道啊！但我们必须先解决他们！",0,true,v1_9);
                        }
                        if(param1.matchSettings.team1score >= 14)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 21)
                     {
                        break loop6;
                     }
                     if(fc != 2 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("起子","我快坚持不住了，他们还在源源不断地冲着这边来……罗德岛的精英干员…怎么能在这种地方倒下！……",0,true,v1_10);
                     break loop6;
                  case 1:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","那么，在加入精英小队之前，让我们看看你都有什么能耐。",0,true,v2_1);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("温蒂","别紧张嘛，我们会让着你的。",0,true,v2_2);
                        }
                        if(param1.player.pscore >= 5)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","哇哦，你还挺厉害的。对了……我的代号是迷迭香。",0,true,v2_3);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("W","嗨害嗨~没错，小姑娘，叫她香香就好了。",0,true,v2_4);
                        }
                        if(fc == 13 * 30)
                        {
                           param1.hud.setMsg("迷迭香","嗯——这个称呼好像也不错……",0,true,v2_5);
                        }
                        if(param1.player.pscore >= 9)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 3)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","罗德岛的大家是我的朋友，精英干员和我的队员们是我的家人。凯尔希不想我把他们当做亲人，最开始我不明白，现在我懂了。",0,true,v2_6);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setMsg("迷迭香","临光？你不过来说几句话吗？",0,true,v2_7);
                        }
                        if(fc == 10 * 30)
                        {
                           param1.hud.setMsg("临光","我在。",0,true,v2_8);
                        }
                        if(param1.player.pscore >= 14)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 4)
                     {
                        break loop6;
                     }
                     if(fc != 3 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","不错，真是令人印象深刻——从今天起，你就是我们精英小队的一员了，要加油哦！",0,true,v2_9);
                     break loop6;
                  case 2:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","什么？整合运动？\n他们几年前不是被彩虹小队击溃了吗？现在怎么会出现在这里！",0,true,v3_1);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("温蒂","管不了这么多了，一口气解决他们！——等等，W呢？她跑哪儿去了？\n临光，你去找找看吧。",0,true,v3_2);
                        }
                        if(param1.matchSettings.team1score >= 10)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","啊……希望他们不要打爆指挥室的指挥终端！",0,true,v3_3);
                        }
                        if(param1.matchSettings.team1score >= 20)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 3)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","啊！我的手——受伤了……",0,true,v3_4);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("亚叶","想来就来想走就走，以为罗德岛是你们家吗！看来得让你们长长记性才行！",0,true,v3_5);
                        }
                        if(param1.matchSettings.team1score >= 27)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 4)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("亚叶","噢！那个科学家——\n她应该知道这里发生了什么！",0,true,v3_6);
                        break loop6;
                     }
                     break loop6;
                  case 3:
                     if(sn != 1)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("QiQing琪卿_","啊！罗德岛的干员们，救救我！",0,true,v4_1);
                     }
                     if(fc == 8 * 30)
                     {
                        param1.hud.setMsg("亚叶","整合运动卷土重来了，你是不是知道些什么！",0,true,v4_2);
                     }
                     if(fc == 12 * 30)
                     {
                        param1.hud.setMsg("QiQing琪卿_","哦……我知道我知道，他们是……克隆体！",0,true,v4_3);
                     }
                     if(fc == 17 * 30)
                     {
                        param1.hud.setMsg("W","什么东西？克隆体？！",0,true,v4_4);
                     }
                     if(fc != 19 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("QiQing琪卿_","没错……先帮我解决他们，你们会知道你们想要的！",0,true,v4_5);
                     break loop6;
                  case 4:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","我们必须得找到乔伊丝，掘地三尺也要把她找出来！",0,true,v5_1);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("W","整合运动的人也在这里！肯定有谁走漏了风声！",0,true,v5_2);
                        }
                        if(param1.matchSettings.team1score >= 50)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 2)
                     {
                        break loop6;
                     }
                     if(fc != 12 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","不可能……不可能！她一定就在这里！\n继续找找！",0,true,v5_3);
                     break loop6;
                  case 5:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","如果我们计划挫败整合运动的阴谋，那他们的车队必不可少。",0,true,v6_1);
                        }
                        if(param1.matchSettings.team1score >= 1)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("W","知道吗，我们当中有奸细。",0,true,v6_2);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setMsg("W","温蒂最近总是偷偷地一个人，她可能在做什么见不得人的事……",0,true,v6_3);
                        }
                        if(param1.matchSettings.team1score >= 2)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 3)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("W","温蒂作为自罗德岛建立起就存在的成员，利用罗德岛的资源做一些出卖组织的事，也没几个人会怀疑到她头上吧？我看……",0,true,v6_4);
                     }
                     if(fc != 8 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","是啊……我也不知道她最近偷偷摸摸地在做什么……",0,true,v6_5);
                     break loop6;
                  case 6:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("W","这是陷阱！",0,true,v7_1);
                        }
                        if(param1.matchSettings.team1score >= 6)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","啊？等会儿——\n她们……她们是我们？！",0,true,v7_2);
                        }
                        if(param1.matchSettings.team1score >= 15)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 3)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("W","我服了！这件事一定和温蒂脱不了关系！",0,true,v7_3);
                     }
                     if(fc != 9 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","先别激动，我们回去再谈这个。",0,true,v7_4);
                     break loop6;
                  case 7:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","W！……你做了什么！……",0,true,v8_1);
                        }
                        if(param1.matchSettings.team1score >= 2)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 2)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("W","啊哈哈哈，要不要给你们找条出路，小姑娘们？",0,true,v8_7);
                     }
                     if(fc == 5 * 30)
                     {
                        param1.units[5].spawn();
                        param1.units[6].spawn();
                        param1.units[7].spawn();
                     }
                     if(fc == 8 * 30)
                     {
                        param1.hud.setMsg("W","整合运动只招收这片大地上最具资质的感染者……以你们的身价，各位一定不会亏待你们的！",0,true,v8_2);
                     }
                     if(fc == 14 * 30)
                     {
                        param1.hud.setMsg("亚叶","什么？原来你从一开始就欺骗了我们所有人！——",0,true,v8_3);
                     }
                     if(fc == 18 * 30)
                     {
                        param1.hud.setMsg("W","各位还需要我再说得更明白一点吗？\n整合运动的目标可不止你们一个，\n我们的目标是为了这片大地上的感染者！",0,true,v8_4);
                     }
                     if(fc == 24 * 30)
                     {
                        param1.hud.setMsg("W","说实话，当万物终结之日，\n我可不想作为失败的一方~",0,true,v8_5);
                     }
                     if(fc != 29 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","不可理喻！罗德岛怎么出了你这么个叛徒！",0,true,v8_6);
                     break loop6;
                  case 8:
                     if(sn != 1)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("亚叶","W正在赶往乔伊丝那里，我们必须赶在她之前到达！",0,true,v9_1);
                     }
                     if(fc == 8 * 30)
                     {
                        param1.hud.setMsg("迷迭香","是啊……她要是比我们先到的话……",0,true,v9_2);
                     }
                     if(fc != 12 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","不可能！\n这不可能……",0,true,v9_3);
                     break loop6;
                  case 9:
                     if(sn == 1)
                     {
                        ++sn;
                        param1.arena.changeWallFrame(sn);
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","我们得尽快找到乔伊丝，不能让她被W发现！",0,true,v5_1);
                        }
                     }
                     if(sn == 4)
                     {
                        if(fc == 0 * 30)
                        {
                           SH.playMusic(M_Epic);
                        }
                        if(fc == 1 * 30)
                        {
                           param1.units[2].spawn(200,1270,"m",true);
                        }
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("迷迭香","我们找到她了……\n等等，呃……她……",0,true,v10_1);
                        }
                        if(fc == 5 * 30)
                        {
                           param1.units[1].spawn(90,1270,"m",true);
                           param1.units[3].spawn(240,1270,"m",true);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.units[4].spawn(820,905,"j",true);
                           param1.units[6].spawn(250,970,"k",true);
                           param1.hud.setMsg("W","死了？真是难以置信~",0,true,v10_2);
                        }
                        if(fc == 12 * 30)
                        {
                           param1.hud.setMsg("亚叶","W！你这个小人！",0,true,v10_3);
                        }
                        if(fc == 16 * 30)
                        {
                           param1.hud.setMsg("W","噢，谢谢夸奖~\n她现在只是在……为我们而战——",0,true,v10_4);
                        }
                        if(fc == 22 * 30)
                        {
                           param1.hud.setMsg("迷迭香","你们克隆了她！……",0,true,v10_5);
                        }
                        if(param1.matchSettings.team1score >= 5)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 5)
                     {
                        break loop6;
                     }
                     if(fc == 5 * 30)
                     {
                        param1.hud.setMsg("W","看吧，这就是和克隆体合作的美妙之处——\n我们，将他们操纵于鼓掌之间！",0,true,v10_6);
                     }
                     if(fc == 12 * 30)
                     {
                        param1.hud.setMsg("W","是不是啊？乔~伊~丝~",0,true,v10_7);
                     }
                     if(fc == 17 * 30)
                     {
                        param1.units[5].spawn();
                        param1.hud.setMsg("乔伊丝","初始化，完成——",0,true,v10_8);
                     }
                     if(fc != 21 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("亚叶","啊这……",0,true,v10_9);
                     break loop6;
                  case 10:
                     if(sn != 1)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("迷迭香","你怎么还在这儿？……",0,true,v11_1);
                     }
                     if(fc == 6 * 30)
                     {
                        param1.hud.setMsg("QiQing琪卿_","呃……我喜欢这个地方。龙门的贫民窟，虽然不如莱茵生命安排的实验室，但是平时基本没人打扰，是个做研究的好地方啊。",0,true,v11_2);
                     }
                     if(fc == 10 * 30)
                     {
                        param1.hud.setMsg("亚叶","你给我听好，克隆体比我们想象的还要糟\n他们杀害了白面鸮！",0,true,v11_3);
                     }
                     if(fc != 15 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("QiQing琪卿_","噢……可惜了……不过，我倒是有个主意，\n但是先帮我整理好这里的设备先吧。",0,true,v11_4);
                     break loop6;
                  case 11:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","去收集他们的情报，我会找出针对克隆体的方法。",0,true,v12_1);
                        }
                        if(param1.matchSettings.team1score >= 2)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","嗯~有趣……",0,true,v12_2);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setMsg("亚叶","你别卖关子了，快说啊！",0,true,v12_3);
                        }
                        if(fc == 9 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","哦哦哦——我转述一下：克隆体似乎都受到了某个单一信号源的控制……",0,true,v12_4);
                        }
                        if(param1.matchSettings.team1score >= 4)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 3)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","好吧，看样子应该是一个一个一个卫星控制了他们。",0,true,v12_5);
                     }
                     if(fc == 8 * 30)
                     {
                        param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","如果我们可以控制那个卫星\n就能终止绝大部分克隆体的行动。",0,true,v12_6);
                     }
                     if(fc != 14 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("迷迭香","所以说……\n我们要上太空了吗？\n好高兴……",0,true,v12_7);
                     break loop6;
                  case 12:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("亚叶","好吧，下一步该干嘛？",0,true,v13_1);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","我刚刚上传了一个自定义病毒到你们装备上的移动终端中。",0,true,v13_2);
                        }
                        if(fc == 10 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","将其部署在关键点，就能使卫星信号失效！加油吧，必须确保万无一失。",0,true,v13_3);
                        }
                        if(param1.matchSettings.team1score >= 40)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","运行环境良好，继续上传病毒！",0,true,v13_4);
                        }
                        if(param1.matchSettings.team1score >= 85)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 3)
                     {
                        break loop6;
                     }
                     if(fc != 3 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","再过一小会儿……\n我想卫星信号应该很快就会中断了。",0,true,v13_5);
                     break loop6;
                  case 13:
                     if(sn == 1)
                     {
                        param1.units[1].setDiffStats(0);
                        param1.mapExtra = "";
                        ++sn;
                        fc = 0;
                        param1.arena.changeWallFrame(sn);
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",2,11,"亚叶","现在…泰拉的希望……\n都寄托在你身上了……",0,true,v14_1);
                        }
                     }
                     if(sn == 3)
                     {
                        if(fc == 0.5 * 30)
                        {
                           param1.hud.setMsg("W","听好了小姑娘，选择这样是我的个人权利，明白吧？",0,true,v14_2);
                        }
                        if(fc == 4 * 30)
                        {
                           param1.hud.setMsg("W","我的确挺喜欢你的，\n不过这回，我恐怕不会再手下留情了~",0,true,v14_3);
                        }
                        if(fc == 9 * 30)
                        {
                           param1.units[1].die(param1.units[7],Stats_Guns.itemOb["stomp"],{
                              "headMult":1,
                              "hitX":param1.units[1].x,
                              "hitY":Number(param1.units[1].y) - 15
                           });
                           param1.units[1].unitInfo.extra.noSpawn = true;
                           SH.playSound(S_rocketExplode);
                           SH.playSound(S_Mine1);
                           SH.playMusic(M_Machine);
                           ++sn;
                           fc = 0;
                           param1.arena.mc_mechLeg.play();
                        }
                     }
                     if(sn == 4)
                     {
                        if(fc == 2 * 30)
                        {
                           param1.hud.setCharMsg("engi",100,13,"九","说得好，我同意！",0,true,v14_4);
                        }
                        if(fc == 5 * 30)
                        {
                           param1.arena.changeWallFrame(sn);
                           param1.bg1.mc_darkness.play();
                           param1.units[2].spawn();
                           param1.units[3].spawn();
                           param1.setMapExtra("factoryMech");
                        }
                        if(fc == 10 * 30)
                        {
                           param1.hud.setCharMsg("engi",100,13,"九","喜欢我的新武器吗？\n这上面可是装载着多到能把整个泰拉都毁灭掉的核弹！",0,true,v14_5);
                        }
                        if(fc == 14 * 30)
                        {
                           param1.hud.gotoFrame("tutstomp");
                        }
                        if(fc == 19 * 30)
                        {
                           param1.hud.gotoFrame("idle");
                        }
                        if(param1.matchSettings.team1score >= 4)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 5)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.gotoFrame("idle");
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","嘿，听得到我说话吗？你先别着急，听我说，我可以关闭核武的制导系统。",0,true,v14_6);
                        }
                        if(fc == 8 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","失去了它，整合运动领袖就无法成功发射核弹了",0,true,v14_7);
                        }
                        if(param1.matchSettings.team1score >= 10)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 6)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",100,13,"九","打啊！继续打啊！使出搓赤金的力\n这台机甲可不是凭你一己之力就能解决得了的！",0,true,v14_8);
                           param1.units[4].spawn();
                           param1.units[5].spawn();
                        }
                        if(param1.matchSettings.team1score >= 15)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 7)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","继续纠缠她，给我争取更多时间！——",0,true,v14_9);
                        }
                        if(param1.matchSettings.team1score >= 19)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 8)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setCharMsg("engi",100,13,"九","我不妨告诉将死之人一个秘密——W是一颗好棋子。\n但是没办法，她的开价实在是太高了！",0,true,v14_10);
                           param1.units[6].spawn();
                        }
                        if(param1.matchSettings.team1score >= 27)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 9)
                     {
                        break loop6;
                     }
                     if(fc != 8 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setCharMsg("engi",103,1,"QiQing琪卿_","准备就绪！就是现在，快离开这里！",0,true,v14_11);
                     break loop6;
                  case 14:
                     if(sn == 1)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("九","小兔子，就算我无法发射核弹，我也会亲自把它们投出去！",0,true,v15_1);
                        }
                        if(param1.matchSettings.team1score >= 3)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("九","你不会天真到以为凭你自己一个人就能阻止得了我吧？正合我意，就让我来领教一下，罗德岛公开领导人的真正实力吧！",0,true,v15_2);
                        }
                        if(param1.matchSettings.team1score >= 5)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 3)
                     {
                        if(fc == 3 * 30)
                        {
                           param1.hud.setMsg("九","你以为我死了吗？",0,true,v15_3);
                        }
                        if(fc == 6 * 30)
                        {
                           param1.hud.setMsg("九","确实，不过，没想到吧？那都是我的克隆人……",0,true,v15_4);
                        }
                        if(fc == 16 * 30)
                        {
                           param1.hud.setMsg("九","需要些帮助吗，“领袖”？",0,true,v15_5);
                        }
                        if(fc == 20 * 30)
                        {
                           SH.playMusic(M_Epic);
                           param1.units[2].spawn();
                           param1.units[3].spawn();
                        }
                        if(param1.matchSettings.team1score >= 11)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 4)
                     {
                        break loop6;
                     }
                     if(fc == 3 * 30)
                     {
                        param1.hud.setMsg("九","呵~哈~哈~哈~哈~哈~哈~哈~",0,true,v15_6);
                     }
                     if(fc == 6 * 30)
                     {
                        param1.hud.setMsg("九","如果我们要下地狱……",0,true,v15_7);
                     }
                     if(fc != 10 * 30)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg("九","你也要和我们一起下！",0,true,v15_8);
                     break loop6;
               }
               break;
            case 1:
               _loc4_ = MatchSettings.caStage;
               switch(12 !== _loc4_ ? (13 === _loc4_ ? 1 : (15 !== _loc4_ ? 3 : 2)) : 0)
               {
                  case 0:
                     if(sn == 1)
                     {
                        if(param1.matchSettings.team1score == 1)
                        {
                           param1.hud.setMsg(param1.player,"一名友军已叛变！",4,true);
                           param1.units[1].changeTeam(2,true);
                           param1.matchSettings.updateTeams();
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(param1.matchSettings.team1score == 2)
                        {
                           param1.hud.setMsg(param1.player,"一名友军已叛变！",4,true);
                           param1.units[2].changeTeam(2,true);
                           param1.matchSettings.updateTeams();
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 3)
                     {
                        if(param1.matchSettings.team1score == 3)
                        {
                           param1.hud.setMsg(param1.player,"一名友军已叛变！",4,true);
                           param1.units[3].changeTeam(2,true);
                           param1.matchSettings.updateTeams();
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 4)
                     {
                        break loop6;
                     }
                     if(param1.matchSettings.team1score != 4)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg(param1.player,"所有友军已叛变！\n现在我只能孤身对抗总辖了……",4,true);
                     ++sn;
                     fc = 0;
                     break loop6;
                  case 1:
                     if(fc % (0 * 30) != 0)
                     {
                        break loop6;
                     }
                     param1.hud.setMsg(param1.player,"武器已随机刷新！",4,true);
                     _loc2_ = 0;
                     while(true)
                     {
                        if(_loc2_ >= param1.units.length)
                        {
                           break loop6;
                        }
                        do
                        {
                           _loc3_ = UT.randEl(Stats_Guns.itemAr);
                        }
                        while(_loc3_.type == 0 || _loc3_.type == 10);
                        
                        param1.units[_loc2_].setGuns(_loc3_.id);
                        _loc2_++;
                     }
                     break loop6;
                  case 2:
                     if(sn == 1)
                     {
                        if(param1.matchSettings.team1score >= 5)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 2)
                     {
                        if(fc == 2 * 30)
                        {
                           param1.hud.setMsg("Rua","如同蝼蚁一般的泰拉人类，是我们给予了你们生存的机会；而现在你们却向你们的创造者倒戈，这就是你们的选择吗？精英化，晋升！",4,true);
                           param1.units[1].setGuns("MP5K");
                           param1.units[2].setGuns("M4EX");
                        }
                        if(param1.matchSettings.team1score >= 10)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 3)
                     {
                        if(fc == 2 * 30)
                        {
                           param1.hud.setMsg("Ocean Cat","我们是泰拉的缔造者，历史的改写者；我们谱写了泰拉的一切美好与苦难——既然你们选择如此，那我们也不会止步。专精三，突破！",4,true);
                           param1.units[1].setGuns("DSR1");
                           param1.units[2].setGuns("mk2RPG");
                        }
                        if(param1.matchSettings.team1score >= 15)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn == 4)
                     {
                        if(fc == 2 * 30)
                        {
                           param1.hud.setMsg("Rua","可笑，普通感染者也妄图与神明抗衡？那么，就让你们见识一下，原初的力量！专精六，突破！",4,true);
                           param1.units[1].setGuns("Barrett");
                           param1.units[2].setGuns("Double Judgement");
                        }
                        if(param1.matchSettings.team1score >= 25)
                        {
                           ++sn;
                           fc = 0;
                        }
                     }
                     if(sn != 5)
                     {
                        break loop6;
                     }
                     if(fc == 2 * 30)
                     {
                        param1.hud.setMsg("Ocean Cat","有趣，我们辛辛苦苦创造出的造物，果然还是没有辜负我们的希望啊！只可惜，在我们赴死之前，还不能让你如愿以偿。专精九，突破！",4,true);
                        param1.units[3].spawn();
                        param1.units[4].spawn();
                        param1.units[5].spawn();
                        param1.units[6].spawn();
                        param1.units[1].unitInfo.extra.permaStreak = "stealth";
                        param1.units[1].useKillstreak("stealth");
                        param1.units[2].unitInfo.extra.permaStreak = "moralB";
                        param1.units[2].useKillstreak("moralB");
                        param1.units[1].setGuns("AWM");
                        param1.units[2].setGuns("Commando");
                        break loop6;
                     }
                     break loop6;
               }
         }
         ++fc;
      }
      
      private static function setPlr(param1:uint, param2:String, param3:String, param4:uint, param5:uint, param6:uint, param7:String, param8:String, param9:String, param10:String, param11:String, param12:String, param13:Object) : *
      {
         if(!showStatsOnly)
         {
            MatchSettings.caPlayer = new Stats_Classes();
            MatchSettings.caPlayer.team = param1;
            MatchSettings.caPlayer.name = param2;
            if(!param3)
            {
               MatchSettings.caPlayer.classNum = 0;
            }
            else
            {
               MatchSettings.caPlayer.classNum = Stats_Classes.classNums.indexOf(param3);
            }
            var _loc14_:uint = SD.getSelCass(MatchSettings.caPlayer.classNum).level;
            MatchSettings.caPlayer.head = !param4 ? 0 : param4;
            MatchSettings.caPlayer.body = !param5 ? 0 : param5;
            MatchSettings.caPlayer.camo = !param6 ? 0 : param6;
            MatchSettings.caPlayer.primary = !param7 ? null : Inventory_Gun.createInventoryItem(param7,_loc14_,0);
            MatchSettings.caPlayer.secondary = !param8 ? null : Inventory_Gun.createInventoryItem(param8,_loc14_,0);
            if(!(Boolean(param7) && param9 != "none"))
            {
               MatchSettings.caPlayer._primaryAttach = null;
            }
            else
            {
               MatchSettings.caPlayer._primaryAttach = !!param9 ? Inventory_Attachment.createInventoryItem(param9 + Stats_Guns.itemOb[param7].type,_loc14_,0) : null;
            }
            MatchSettings.caPlayer._armor = !param10 ? null : Inventory_Armor.createInventoryItem(param10,_loc14_,0);
            MatchSettings.caPlayer.skill = !param11 ? null : Stats_Skills.itemOb[param11];
            MatchSettings.caPlayer.streak = !param12 ? null : Stats_Streaks.itemOb[param12];
            MatchSettings.caPlayer.extra = param13;
            trace("player is set for campaign",MatchSettings.caPlayer.classNum,param7,param8,param11,param12);
            return;
         }
      }
      
      private static function addBot(param1:uint, param2:String, param3:String, param4:uint, param5:uint, param6:uint, param7:String, param8:String, param9:String, param10:String, param11:String, param12:String, param13:Array, param14:Object) : *
      {
         var _loc16_:Boolean = false;
         var _loc17_:uint = 0;
         if(!showStatsOnly)
         {
            trace("Adding bot:",param2);
            var _loc15_:Stats_Classes;
            (_loc15_ = new Stats_Classes()).team = param1;
            if(!param2)
            {
               while(!_loc16_)
               {
                  param2 = UT.randEl(MatchSettings.qmBotNames);
                  _loc16_ = true;
                  _loc17_ = 0;
                  while(_loc17_ < MatchSettings.caBots.length)
                  {
                     if(MatchSettings.caBots[_loc17_].name == param2)
                     {
                        _loc16_ = false;
                     }
                     _loc17_++;
                  }
               }
            }
            _loc15_.name = param2;
            _loc15_.diff = param13[MatchSettings.caDiffMode];
            if(!_loc15_.diff)
            {
               _loc15_.diff = MatchSettings.caDiff;
            }
            _loc15_.level = Stats_Classes.getAiLevel(_loc15_.diff);
            _loc15_.extra = param14;
            if(param3)
            {
               _loc15_.classNum = Stats_Classes.classNums.indexOf(param3);
            }
            else
            {
               _loc15_.classNum = UT.irand(1,5);
            }
            if(param4)
            {
               _loc15_.head = param4;
            }
            else
            {
               _loc15_.head = UT.irand(1,4);
            }
            if(param5)
            {
               _loc15_.body = param5;
            }
            else
            {
               _loc15_.body = UT.irand(1,3);
            }
            if(param6)
            {
               _loc15_.camo = param6;
            }
            else
            {
               _loc15_.camo = UT.irand(1,20);
            }
            if(param7 != "")
            {
               _loc15_.primary = Inventory_Gun.createInventoryItem(param7,_loc15_.level,0);
            }
            else
            {
               _loc15_.primary = Stats_Guns.getRandPrimary(_loc15_);
            }
            if(param8 != "")
            {
               _loc15_.secondary = Inventory_Gun.createInventoryItem(param8,_loc15_.level,0);
            }
            else
            {
               _loc15_.secondary = Stats_Guns.getRandSecondary(_loc15_);
            }
            if(Boolean(param7) && param9 != "none")
            {
               _loc15_._primaryAttach = !!param9 ? Inventory_Attachment.createInventoryItem(param9 + Stats_Guns.itemOb[param7].type,_loc15_.level,0) : null;
            }
            if(param10)
            {
               _loc15_._armor = Inventory_Armor.createInventoryItem(param10,_loc15_.level,0);
            }
            else
            {
               _loc15_._armor = Stats_Armor.getRandItem(_loc15_);
            }
            if(param11)
            {
               _loc15_.skill = Stats_Skills.itemOb[param11];
            }
            else
            {
               _loc15_.skill = Stats_Skills.getRandItem(_loc15_);
            }
            if(param12)
            {
               _loc15_.streak = Stats_Streaks.itemOb[param12];
            }
            else
            {
               _loc15_.streak = Stats_Streaks.getRandItem(_loc15_);
            }
            if(!_loc15_._primaryAttach)
            {
               _loc15_.primaryAttach = null;
            }
            else
            {
               _loc15_.primaryAttach = _loc15_._primaryAttach.createFinalItem();
            }
            _loc15_.armor = _loc15_._armor.createFinalItem();
            MatchSettings.caBots.push(_loc15_);
            return;
         }
      }
      
      private static function setLvl(param1:String, param2:uint, param3:String, param4:Array, param5:*, param6:String, param7:String, param8:String, param9:Object) : void
      {
         sn = 1;
         fc = 0;
         MatchSettings.caMode = param1;
         MatchSettings.caScore = param2;
         MatchSettings.caMap = param3;
         MatchSettings.caBots = [];
         MatchSettings.caName = param6;
         MatchSettings.caDesc = param7;
         MatchSettings.caSpecial = param8;
         MatchSettings.caDiff = param4[MatchSettings.caDiffMode];
         MatchSettings.useSong = param5;
         MatchSettings.useExtra = param9;
      }
      
      private static function setCutscene(param1:Array, param2:Array, param3:*, param4:*) : void
      {
         if(!showStatsOnly)
         {
            MatchSettings.preCutFrames = param1;
            MatchSettings.postCutFrames = param2;
            MatchSettings.preCutSong = param3;
            MatchSettings.postCutSong = param4;
            return;
         }
      }
   }
}
