package
{
   public class Stats_Streaks
   {
      
      public static var itemOb:Object;
      
      public static var itemAr:Array;
      
      public static var classAr:Array;
       
      
      public var id:String;
      
      public var sprite:String;
      
      public var name:String;
      
      public var lvlReq:uint;
      
      public var kills:Number;
      
      public var desc:String;
      
      public var allyUse:String;
      
      public var allySound;
      
      public var enemyUse:String;
      
      public var enemySound;
      
      public function Stats_Streaks()
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
         addItem(0,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(1,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(1,"turret","","支援机铳",3,3,"在当前位置部署一个支援机铳。持续20秒","支援机铳已部署！",ks1_1t,"敌方部署了支援机铳！",ks1_1e);
         addItem(1,"drone","","武装型龙腾无人机",8,2,"启动一架携带武装打击模块的龙腾无人机协助自身作战。每架持续12秒\n（取消了无人机的持有上限）\nfix6更新：龙腾无人机的弹药改为追踪火箭","",null,"",null);
         addItem(1,"tesla","","梅什科线圈",16,3,"在当前位置部署一个高耐久度的梅什科线圈，持续对处于攻击范围内的敌人造成物理伤害和电击。持续30秒","梅什科线圈已部署！",ks1_3t,"敌方部署了梅什科线圈！",ks1_3e);
         addItem(1,"sentry","","铁钳号·改型机",20,4,"白铁最新开发的支援装置，具备制导功能和超大攻击范围。持续20秒","铁钳号已就位！",ks1_4t,"敌方部署了铁钳号！保持警惕！",ks1_4e);
         addItem(2,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(2,"surge","","攻击力强化·α型",4,1,"攻击力+25%，持续10秒","不自量力！",null,"",null);
         addItem(2,"blood","","歃血",8,2,"自身对目标造成的所有伤害量将转化为等量的生命值。持续12秒","敢和我对着干，你哪来的勇气？",ks2_2t,"",null);
         addItem(2,"rage","","丛林之魂",16,4,"攻击力+50%，且自身受到的伤害降低90%。持续12秒","崽种，面对我！",ks2_3t,"",null);
         addItem(2,"wizard","","极致火力",20,3,"所有武器不消耗弹药。持续12秒","你们一起上吧，别浪费我太多时间！",ks2_4t,"敌方开启了极致火力！隐蔽！",ks2_4e);
         addItem(3,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(3,"regenB","","医疗力场",4,2,"以300%的速度持续恢复全体我方投影的生命值。持续12秒","保全自身！",ks3_1t,"敌方正在快速恢复生命值！",ks3_1e);
         addItem(3,"aimB","","精确打击",8,2,"全体我方投影的精准度+100%。持续12秒","视野清晰，目标明确！",ks3_2t,"敌方的命中率正在大幅提升！",ks3_2e);
         addItem(3,"critB","","战意沸腾",16,2,"全体我方投影的暴击率+50%。持续12秒","瞄准他们的要害！",ks3_3t,"敌方的暴击率正在大幅提升！",ks3_3e);
         addItem(3,"moralB","","终焉决裁",20,3,"全体我方投影同时获得前三个御敌指令一半的效果，且优先级高于前三个御敌指令。持续15秒","出其不意，攻其不备！就是现在，绞碎敌人吧！",ks3_4t,"发现敌方士气大增，请小心应对！",ks3_4e);
         addItem(4,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(4,"scan","","雷达定位",4,1,"将全体敌人位置暴露在雷达上并附加30%的脆弱效果。持续15秒","入侵者监控模式已上线！",ks4_1t,"当前位置已暴露，请尽快转移！",ks4_1e);
         addItem(4,"stealth","","环境伪装",8,2,"自身进入迷彩状态。持续15秒\n若自身进行攻击或受到攻击将短暂解除迷彩状态","隐藏气息，别被敌人发现了。",null,"敌方狙击干员使用了迷彩！",null);
         addItem(4,"aimbot","","暮眼锐瞳",16,2,"自身所有攻击有75%的几率判定为爆头攻击(无法无视武器的无法爆头效果)。持续12秒","锡兰小姐才有仁慈之心，我没有。",ks4_3t,"敌方狙击干员开启了暮眼锐瞳！",ks4_3e);
         addItem(4,"wallhack","","“永恒狩猎”",20,4,"自身大部分攻击无视任何墙体障碍。持续12秒","胆小鬼会先打破沉默。",ks4_4t,"敌方狙击干员开启了永恒狩猎！",ks4_4e);
         addItem(5,"none","","无",1,0,"技能未选择","",null,"",null);
         addItem(5,"fire","","狱火环身",2,2,"点燃以自身为中心半径6英尺内的敌人，且自身受到的伤害降低20%。持续12秒","活着的火焰会净化你们污浊的内在！",ks5_1t,"敌方重装干员启用了元素防御！",ks5_1e);
         addItem(5,"ice","","零度爆发",8,2,"冰冻以自身为中心半径8英尺内的敌人，且自身受到的伤害降低35%。持续12秒","速战速决吧！",ks5_1t,"敌方重装干员启用了元素防御！",ks5_1e);
         addItem(5,"zap","","电磁充能防御",16,2,"电击以自身为中心半径8英尺内的敌人，且自身受到的伤害降低35%。持续15秒","闪电风暴！",ks5_1t,"敌方重装干员启用了元素防御！",ks5_1e);
         addItem(5,"acid","","污染秽蚀",20,2,"腐蚀以自身为中心半径6英尺内的敌人，且自身受到的伤害降低20%。持续12秒","嗯哼哼啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊！——",ks5_1t,"敌方重装干员启用了元素防御！",ks5_1e);
      }
      
      public static function addItem(param1:uint, param2:String, param3:String, param4:String, param5:uint, param6:Number, param7:String, param8:String, param9:*, param10:String, param11:*) : void
      {
         var _loc12_:Stats_Streaks;
         (_loc12_ = new Stats_Streaks()).id = param2;
         _loc12_.sprite = !param3 ? param2 : param3;
         _loc12_.name = !param4 ? param2 : param4;
         _loc12_.lvlReq = param5;
         _loc12_.kills = param6;
         _loc12_.desc = param7;
         _loc12_.allyUse = param8;
         _loc12_.allySound = param9;
         _loc12_.enemyUse = param10;
         _loc12_.enemySound = param11;
         itemOb[param2] = _loc12_;
         itemAr.push(_loc12_);
         classAr[param1].push(_loc12_);
      }
      
      public static function getRandItem(param1:Stats_Classes) : Stats_Streaks
      {
         var _loc2_:Stats_Streaks = null;
         do
         {
            _loc2_ = UT.randEl(classAr[param1.classNum]);
         }
         while(_loc2_.id == "none");
         
         return _loc2_;
      }
   }
}
