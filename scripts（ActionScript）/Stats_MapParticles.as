package
{
   public class Stats_MapParticles
   {
       
      
      private var game:Game;
      
      private var map:String;
      
      private var fc:uint;
      
      private var graphPart1:uint;
      
      private var graphPart2:uint;
      
      public function Stats_MapParticles(param1:Game, param2:String)
      {
         super();
         this.game = param1;
         this.map = param2;
         this.fc = 0;
      }
      
      public function mapInit() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = this.map;
         loop1:
         switch("space" !== _loc2_ ? 1 : 0)
         {
            case 0:
               this.game.createParticle(399,699,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(420,825,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(1280,728,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(837,954,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(2062,1049,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(1798,896,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(2776,831,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(2698,756,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               this.game.createParticle(2531,797,"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
               _loc1_ = 0;
               while(true)
               {
                  if(_loc1_ >= 8)
                  {
                     break loop1;
                  }
                  this.game.createParticle(UT.rand(330,2500),UT.rand(700,1150),"space",0,null,"spaceCrap","idle",UT.irand(1,8),true);
                  _loc1_++;
               }
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         ++this.fc;
         var _loc2_:* = this.map;
         loop6:
         switch("space" !== _loc2_ ? ("mansionDay" !== _loc2_ ? ("mansionNight" !== _loc2_ ? ("convoy" === _loc2_ ? 3 : ("convoyStill" !== _loc2_ ? ("base" !== _loc2_ ? ("factory" === _loc2_ ? 6 : ("market" !== _loc2_ ? 8 : 7)) : 5) : 4)) : 2) : 1) : 0)
         {
            case 0:
               if(MatchSettings.isCampaign && MatchSettings.caType == 0 && MatchSettings.caStage == 1 && (Stats_Campaign.sn >= 9 && Stats_Campaign.sn <= 11))
               {
                  if(Math.random() >= 0.1)
                  {
                     break;
                  }
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= UT.irand(5,15))
                     {
                        break loop6;
                     }
                     this.game.createParticle(725,337,"spark",10,null,"ember");
                     _loc1_++;
                  }
                  break;
               }
               break;
            case 1:
               if(Math.random() >= 0.1)
               {
                  break;
               }
               this.game.createParticle(UT.rand(1302,2772),UT.rand(100,300),"leaf",0,null,"leaf","idle",UT.rand(1,3));
               break;
            case 2:
               if(Math.random() >= 0.1)
               {
                  break;
               }
               this.game.createParticle(UT.rand(1302,2772),UT.rand(10,150),"snow",0,null,"snowFall","idle",UT.rand(1,3));
               this.game.createParticle(UT.rand(1302,2772),UT.rand(10,150),"snow",0,null,"snowFall","idle",UT.rand(1,3));
               break;
            case 3:
               if(Math.random() >= 0.5)
               {
                  break;
               }
               this.game.createParticle(UT.rand(350,2800),UT.rand(622,1278),"move",0,{
                  "xSpd":-50,
                  "ySpd":0
               },"wind");
               break;
            case 4:
               break;
            case 5:
               this.game.createParticle(2783 + UT.rand(-30,30),1290,"move",0,{
                  "xSpd":0,
                  "ySpd":-10
               },"gas_big","idle");
               if(Math.random() < 0.1)
               {
                  _loc1_ = 0;
                  while(_loc1_ < UT.irand(3,7))
                  {
                     this.game.createParticle(582,1036,"spark",10,null,"ember");
                     _loc1_++;
                  }
               }
               if(Math.random() >= 0.1)
               {
                  break;
               }
               _loc1_ = 0;
               while(true)
               {
                  if(_loc1_ >= UT.irand(3,7))
                  {
                     break loop6;
                  }
                  this.game.createParticle(2470,879,"spark",10,{"xSpd":UT.rand(0,3)},"ember");
                  _loc1_++;
               }
               break;
            case 6:
               this.game.createParticle(70,958,"move",0,{
                  "xSpd":5,
                  "ySpd":0
               },"gas_small","idle");
               this.game.createParticle(428,1162,"move",0,{
                  "xSpd":3,
                  "ySpd":-4
               },"gas_small","idle");
               this.game.createParticle(2310,1154,"move",0,{
                  "xSpd":-4,
                  "ySpd":-4
               },"gas_small","idle");
               if(Math.random() < 0.1)
               {
                  _loc1_ = 0;
                  while(_loc1_ < UT.irand(3,7))
                  {
                     this.game.createParticle(2818,836,"spark",0,{"xSpd":UT.rand(-1,-3)},"ember");
                     _loc1_++;
                  }
               }
               if(Math.random() < 0.1)
               {
                  _loc1_ = 0;
                  while(_loc1_ < UT.irand(3,7))
                  {
                     this.game.createParticle(1887,810,"spark",10,null,"ember");
                     _loc1_++;
                  }
               }
               if(Math.random() < 0.1)
               {
                  _loc1_ = 0;
                  while(_loc1_ < UT.irand(3,7))
                  {
                     this.game.createParticle(1169,1049,"spark",10,null,"ember");
                     _loc1_++;
                  }
               }
               this.game.createParticle(UT.rand(1385,1484),1287,"raise",0,{"ySpd":2.5},"emberBlue");
               break;
            case 7:
               this.game.createParticle(2265,920,"spark",5,null,"emberBlue");
               this.game.createParticle(559,1031,"spark",5,{"ySpd":UT.rand(-5,-10)},"emberBlue");
         }
      }
   }
}
