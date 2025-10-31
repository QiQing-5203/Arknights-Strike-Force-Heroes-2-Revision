package
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class Arena extends MovieClip
   {
       
      
      public var u_lk:NodeWaypoint;
      
      public var l_kms:NodeWaypoint;
      
      public var $health_15:NodePickup;
      
      public var d_0:NodeSpawn;
      
      public var j_kpl:NodeWaypoint;
      
      public var k_lj:NodeWaypoint;
      
      public var j_p:NodeAiAction;
      
      public var armor_15:NodePickup;
      
      public var g_0:NodeSpawn;
      
      public var a_bk:NodeWaypoint;
      
      public var j_a:NodeAiAction;
      
      public var a__1:NodeCtfFlag;
      
      public var e_2:NodeSpawn;
      
      public var mc_missile2:MovieClip;
      
      public var i_jk:NodeWaypoint;
      
      public var i_daj:NodeWaypoint;
      
      public var i_da:NodeWaypoint;
      
      public var e_difh:NodeWaypoint;
      
      public var m_fl:NodeWaypoint;
      
      public var d_2:NodeSpawn;
      
      public var f_0:NodeSpawn;
      
      public var j_b:NodeAiAction;
      
      public var mc_box1:MovieClip;
      
      public var t_sbhud:NodeWaypoint;
      
      public var j_r:NodeAiAction;
      
      public var mc_darkness:MovieClip;
      
      public var p_0:NodeSpawn;
      
      public var n_lpmo:NodeWaypoint;
      
      public var j_ia:NodeAiAction;
      
      public var d_cjiel:NodeWaypoint;
      
      public var j_de:NodeAiAction;
      
      public var g_2:NodeSpawn;
      
      public var d_efn:NodeWaypoint;
      
      public var j_ikp:NodeWaypoint;
      
      public var f_dhj:NodeWaypoint;
      
      public var f__2:NodeCtfFlag;
      
      public var a_0:NodeSpawn;
      
      public var a_bm:NodeWaypoint;
      
      public var j_c:NodeAiAction;
      
      public var mc_box2:MovieClip;
      
      public var s_0:NodeSpawn;
      
      public var k_jabl:NodeWaypoint;
      
      public var j_s:NodeAiAction;
      
      public var b_ac:NodeWaypoint;
      
      public var g__2:NodeCtfFlag;
      
      public var g_fh:NodeWaypoint;
      
      public var k_aj:NodeWaypoint;
      
      public var b_acj:NodeWaypoint;
      
      public var n_cbg:NodeWaypoint;
      
      public var f_2:NodeSpawn;
      
      public var a_1:NodeSpawn;
      
      public var j_d:NodeAiAction;
      
      public var mc_party:MovieClip;
      
      public var mc_box3:MovieClip;
      
      public var r_0:NodeSpawn;
      
      public var j_t:NodeAiAction;
      
      public var mc_fruit_left:MovieClip;
      
      public var mc_light_right:MovieClip;
      
      public var p_2:NodeSpawn;
      
      public var a_bij:NodeWaypoint;
      
      public var j_pl:NodeAiAction;
      
      public var waterMC:MovieClip;
      
      public var f_elg:NodeWaypoint;
      
      public var o_cdg:NodeWaypoint;
      
      public var c_0:NodeSpawn;
      
      public var b_ack:NodeWaypoint;
      
      public var m_l:NodeWaypoint;
      
      public var j_e:NodeAiAction;
      
      public var wallMC:MovieClip;
      
      public var mc_box4:MovieClip;
      
      public var q_pr:NodeWaypoint;
      
      public var j_u:NodeAiAction;
      
      public var health_15:NodePickup;
      
      public var c_1:NodeSpawn;
      
      public var h_eg:NodeWaypoint;
      
      public var i_de:NodeWaypoint;
      
      public var c_ji:NodeAiAction;
      
      public var k_al:NodeWaypoint;
      
      public var c_bjid:NodeWaypoint;
      
      public var i_jchg:NodeWaypoint;
      
      public var e__2:NodeCtfFlag;
      
      public var l_mk:NodeWaypoint;
      
      public var m_li:NodeWaypoint;
      
      public var fx_jgc:NodeAiAction;
      
      public var j_f:NodeAiAction;
      
      public var ammo_15:NodePickup;
      
      public var b_0:NodeSpawn;
      
      public var mc_box5:MovieClip;
      
      public var midCont:MovieClip;
      
      public var botCont:MovieClip;
      
      public var r_2:NodeSpawn;
      
      public var n_mofe:NodeWaypoint;
      
      public var j_v:NodeAiAction;
      
      public var b_ajc:NodeWaypoint;
      
      public var b_1:NodeSpawn;
      
      public var m_0:NodeSpawn;
      
      public var e_dk:NodeWaypoint;
      
      public var mc_door2:MovieClip;
      
      public var $armor_15:NodePickup;
      
      public var j_g:NodeAiAction;
      
      public var g_hi:NodeWaypoint;
      
      public var k__1:NodeCtfFlag;
      
      public var m_1:NodeSpawn;
      
      public var j_kbcdm:NodeWaypoint;
      
      public var j_bci:NodeWaypoint;
      
      public var c_kl:NodeAiAction;
      
      public var a_b:NodeWaypoint;
      
      public var l_0:NodeSpawn;
      
      public var k_bjli:NodeWaypoint;
      
      public var j_h:NodeAiAction;
      
      public var mc_door3:MovieClip;
      
      public var e_cfs:NodeWaypoint;
      
      public var mc_bounce_right1:MovieClip;
      
      public var j_iakpl:NodeWaypoint;
      
      public var e_dgf:NodeWaypoint;
      
      public var l_mdf:NodeWaypoint;
      
      public var o_0:NodeSpawn;
      
      public var l_1:NodeSpawn;
      
      public var c_bd:NodeWaypoint;
      
      public var j_i:NodeAiAction;
      
      public var a_bc:NodeWaypoint;
      
      public var d_cet:NodeWaypoint;
      
      public var mc_bounce_right2:MovieClip;
      
      public var l_2:NodeSpawn;
      
      public var c_bkjd:NodeWaypoint;
      
      public var h_idge:NodeWaypoint;
      
      public var mc_tv:MovieClip;
      
      public var n_0:NodeSpawn;
      
      public var h_fij:NodeWaypoint;
      
      public var j_j:NodeAiAction;
      
      public var mc_door1:MovieClip;
      
      public var mc_lights:MovieClip;
      
      public var f_eq:NodeWaypoint;
      
      public var mc_bounce_left1:MovieClip;
      
      public var o_2:NodeSpawn;
      
      public var m_ln:NodeWaypoint;
      
      public var h_ig:NodeWaypoint;
      
      public var d_cieg:NodeWaypoint;
      
      public var l_mkde:NodeWaypoint;
      
      public var g_ihf:NodeWaypoint;
      
      public var mc_mechLeg:MovieClip;
      
      public var g_hfj:NodeWaypoint;
      
      public var i_0:NodeSpawn;
      
      public var j_k:NodeAiAction;
      
      public var s_tverc:NodeWaypoint;
      
      public var h_abthg:NodeWaypoint;
      
      public var j_kh:NodeWaypoint;
      
      public var c_bds:NodeWaypoint;
      
      public var mc_bounce_left2:MovieClip;
      
      public var mc_light_left:MovieClip;
      
      public var o_pn:NodeWaypoint;
      
      public var p_nojl:NodeWaypoint;
      
      public var i_1:NodeSpawn;
      
      public var $ammo_15:NodePickup;
      
      public var mc_spring:MovieClip;
      
      public var mc_couch:MovieClip;
      
      public var i_amkp:NodeWaypoint;
      
      public var h_bfj:NodeWaypoint;
      
      public var h_0:NodeSpawn;
      
      public var g_h:NodeWaypoint;
      
      public var j_l:NodeAiAction;
      
      public var h_1:NodeSpawn;
      
      public var o__2:NodeCtfFlag;
      
      public var light:MovieClip;
      
      public var k_0:NodeSpawn;
      
      public var i_ehjk:NodeWaypoint;
      
      public var e_dfi:NodeWaypoint;
      
      public var l_kja:NodeWaypoint;
      
      public var j_m:NodeAiAction;
      
      public var a_bg:NodeWaypoint;
      
      public var j_n:NodeAiAction;
      
      public var mc_fruit_right:MovieClip;
      
      public var j_kj:NodeAiAction;
      
      public var j_cbm:NodeAiAction;
      
      public var k_1:NodeSpawn;
      
      public var j_ji:NodeAiAction;
      
      public var p_lm:NodeWaypoint;
      
      public var c_nog:NodeWaypoint;
      
      public var mc_laser:MovieClip;
      
      public var h_2:NodeSpawn;
      
      public var j_0:NodeSpawn;
      
      public var d_ce:NodeWaypoint;
      
      public var j_1:NodeSpawn;
      
      public var r_qfesq:NodeWaypoint;
      
      public var o_nr:NodeWaypoint;
      
      public var m_lnt:NodeWaypoint;
      
      public var j_o:NodeAiAction;
      
      public var m_cjl:NodeWaypoint;
      
      public var d_chel:NodeWaypoint;
      
      public var k_elmp:NodeWaypoint;
      
      public var j_ihkl:NodeWaypoint;
      
      public var e_dc:NodeWaypoint;
      
      public var mc_missile1:MovieClip;
      
      public var t_0:NodeSpawn;
      
      public var v_mn:NodeWaypoint;
      
      public var p_on:NodeWaypoint;
      
      public var b_act:NodeWaypoint;
      
      public var l_mnpkj:NodeWaypoint;
      
      public var a_bi:NodeWaypoint;
      
      public var e_hdlf:NodeWaypoint;
      
      public var f_gem:NodeWaypoint;
      
      public var b_ahn:NodeWaypoint;
      
      public var e_0:NodeSpawn;
      
      public var f_eg:NodeWaypoint;
      
      public var mc_destroyed:MovieClip;
      
      public var game:Game;
      
      public var wall:BitmapData;
      
      private var camFocus;
      
      private var camIntenseX:Number;
      
      private var camIntenseY:Number;
      
      private var useAim:Boolean;
      
      private var shakeX:Number;
      
      private var shakeY:Number;
      
      private var shkOffX:Number;
      
      private var shkOffY:Number;
      
      public var spawns:Array;
      
      public var spawnsT1:Array;
      
      public var spawnsT2:Array;
      
      public var waypoints:Array;
      
      public var wpOb:Object;
      
      public var aiactions:Array;
      
      public var physboxes:Array;
      
      public var pickups:Array;
      
      public var holdpoints:Array;
      
      public var ctfflags:Array;
      
      public var lights:Array;
      
      public var downarrows:Array;
      
      public var flag1:NodeCtfFlag;
      
      public var flag2:NodeCtfFlag;
      
      public function Arena(param1:Game)
      {
         super();
         addFrameScript(1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5,5,this.frame6,6,this.frame7,7,this.frame8,8,this.frame9,9,this.frame10,10,this.frame11,11,this.frame12);
         this.game = param1;
         trace(MatchSettings.useMap);
         trace(MatchSettings.useMap.map);
         gotoAndStop(MatchSettings.useMap.map);
         if(MatchSettings.useMap.bg1)
         {
            this.game.bg1.gotoAndStop(MatchSettings.useMap.bg1);
         }
         if(MatchSettings.useMap.bg2)
         {
            this.game.bg2.gotoAndStop(MatchSettings.useMap.bg2);
         }
         if(MatchSettings.useMap.sky)
         {
            this.game.bgSky.gotoAndStop(MatchSettings.useMap.sky);
         }
      }
      
      public function changeWallFrame(param1:uint = 1, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1 = this.wallMC.currentFrame + 1;
         }
         this.wallMC.gotoAndStop(param1);
         this.wall.fillRect(new Rectangle(0,0,this.wall.width,this.wall.height),0);
         this.wall.draw(this.wallMC);
      }
      
      protected function Init() : void
      {
         var _loc3_:uint = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         this.wall = new BitmapData(this.wallMC.width,this.wallMC.height,true,0);
         this.wall.draw(this.wallMC);
         this.wallMC.visible = false;
         this.shakeX = 0;
         this.shakeY = 0;
         this.shkOffX = 0;
         this.shkOffY = 0;
         if(this.waterMC)
         {
            if(MatchSettings.useMap.water)
            {
               this.game.water.setWater(this.waterMC);
            }
            else
            {
               this.game.water.disableWater(this.waterMC);
            }
         }
         this.spawns = [];
         this.spawnsT1 = [];
         this.spawnsT2 = [];
         this.waypoints = [];
         this.aiactions = [];
         this.physboxes = [];
         this.pickups = [];
         this.holdpoints = [];
         this.ctfflags = [];
         this.lights = [];
         this.downarrows = [];
         var _loc1_:uint = 1;
         var _loc2_:uint = 2;
         if(MatchSettings.useMode == "ctf" && Math.random() < 0.5)
         {
            _loc1_ = 2;
            _loc2_ = 1;
         }
         _loc3_ = 0;
         while(_loc3_ < numChildren)
         {
            if(getChildAt(_loc3_).name == "light")
            {
               this.lights.push(getChildAt(_loc3_));
            }
            if(getChildAt(_loc3_) is DownArrow)
            {
               this.downarrows.push(getChildAt(_loc3_));
               getChildAt(_loc3_).visible = false;
            }
            if(getChildAt(_loc3_) is NodeSpawn)
            {
               if((_loc4_ = getChildAt(_loc3_)).team == 0)
               {
                  this.spawns.push(getChildAt(_loc3_));
               }
               if(_loc4_.team == _loc1_)
               {
                  this.spawnsT1.push(getChildAt(_loc3_));
               }
               if(_loc4_.team == _loc2_)
               {
                  this.spawnsT2.push(getChildAt(_loc3_));
               }
            }
            if(getChildAt(_loc3_) is NodeWaypoint)
            {
               this.waypoints.push(getChildAt(_loc3_));
            }
            if(getChildAt(_loc3_) is NodeAiAction)
            {
               this.aiactions.push(getChildAt(_loc3_));
            }
            if(getChildAt(_loc3_) is NodePhysBox)
            {
               this.physboxes.push(getChildAt(_loc3_));
            }
            if(getChildAt(_loc3_) is NodePickup)
            {
               this.pickups.push(getChildAt(_loc3_));
            }
            if(getChildAt(_loc3_) is NodeHoldpoint)
            {
               if(MatchSettings.useMode == "dom")
               {
                  this.holdpoints.push(getChildAt(_loc3_));
               }
               else
               {
                  getChildAt(_loc3_).visible = false;
               }
            }
            if(getChildAt(_loc3_) is NodeCtfFlag)
            {
               if(MatchSettings.useMode == "ctf")
               {
                  _loc5_ = getChildAt(_loc3_);
                  this.ctfflags.push(_loc5_);
                  if(_loc5_.team != 1)
                  {
                     this["flag" + _loc2_] = _loc5_;
                     _loc5_.setTeam(_loc2_);
                  }
                  else
                  {
                     this["flag" + _loc1_] = _loc5_;
                     _loc5_.setTeam(_loc1_);
                  }
               }
               else
               {
                  getChildAt(_loc3_).visible = false;
               }
            }
            _loc3_++;
         }
         this.holdpoints.sortOn("x",Array.NUMERIC);
         _loc3_ = 0;
         while(_loc3_ < this.holdpoints.length)
         {
            this.holdpoints[_loc3_].letter = UT.getEl(_loc3_,["A","B","C","D","E"]);
            _loc3_++;
         }
         this.wpOb = {};
         _loc3_ = 0;
         while(_loc3_ < this.waypoints.length)
         {
            this.wpOb[this.waypoints[_loc3_].id] = this.waypoints[_loc3_];
            this.waypoints[_loc3_].arena = this;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.waypoints.length)
         {
            this.waypoints[_loc3_].setConnectors(this.wpOb);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.aiactions.length)
         {
            _loc6_ = 0;
            while(_loc6_ < this.aiactions[_loc3_].con.length)
            {
               trace(this.aiactions[_loc3_].name);
               this.wpOb[this.aiactions[_loc3_].con.charAt(_loc6_)].setActionBox(this.aiactions[_loc3_]);
               _loc6_++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.spawns.length)
         {
            this.spawns[_loc3_].setWaypoint(this.wpOb[this.spawns[_loc3_].id]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.spawnsT1.length)
         {
            this.spawnsT1[_loc3_].setWaypoint(this.wpOb[this.spawnsT1[_loc3_].id]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.spawnsT2.length)
         {
            this.spawnsT2[_loc3_].setWaypoint(this.wpOb[this.spawnsT2[_loc3_].id]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.pickups.length)
         {
            this.pickups[_loc3_].game = this.game;
            _loc3_++;
         }
         this.game.physWorld.generateWorld(this.physboxes);
         this.toggleLights();
         this.game.InitGame(this);
      }
      
      public function toggleLights() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.lights.length)
         {
            this.lights[_loc1_].visible = SD.graphLights;
            _loc1_++;
         }
      }
      
      public function setShake(param1:Number, param2:Number) : void
      {
         if(SD.screenShake)
         {
            if(param1 > this.shakeX)
            {
               this.shakeX = param1;
            }
            if(param2 > this.shakeY)
            {
               this.shakeY = param2;
            }
            return;
         }
      }
      
      public function setFocus(param1:*, param2:Boolean = true, param3:Number = 0.5) : void
      {
         this.camFocus = param1;
         this.useAim = param2;
         this.camIntenseX = param3;
         this.camIntenseY = param3;
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!this.shakeX)
         {
            this.shkOffX = 0;
         }
         else
         {
            this.shkOffX = UT.rand(-this.shakeX,this.shakeX);
            this.shakeX -= 0.2;
            if(this.shakeX < 0)
            {
               this.shakeX = 0;
            }
         }
         if(!this.shakeY)
         {
            this.shkOffY = 0;
         }
         else
         {
            this.shkOffY = UT.rand(-this.shakeY,this.shakeY);
            this.shakeY -= 0.2;
            if(this.shakeY < 0)
            {
               this.shakeY = 0;
            }
         }
         if(this.camFocus)
         {
            _loc3_ = !!this.camFocus.dead ? Number(this.camFocus.dead.rdBody.GetDefinition().userData.x) : Number(this.camFocus.x);
            _loc4_ = !!this.camFocus.dead ? this.camFocus.dead.rdBody.GetDefinition().userData.y + 50 : Number(this.camFocus.y);
            if(!this.useAim)
            {
               _loc1_ = Main.WIDTH * 0.5 - _loc3_;
               _loc2_ = Main.HEIGHT * 0.5 - _loc4_ + 20;
            }
            else
            {
               _loc1_ = Main.WIDTH * 0.5 - _loc3_ - (this.game.mouseX - Main.WIDTH * 0.5) * this.camIntenseX;
               _loc2_ = Main.HEIGHT * 0.5 - _loc4_ - (this.game.mouseY - Main.HEIGHT * 0.5) * this.camIntenseY + 20;
            }
            x += (_loc1_ - x) * 0.7;
            y += (_loc2_ - y) * 0.7;
            if(x > 0)
            {
               x = 0;
            }
            if(y > 5)
            {
               y = 0;
            }
            if(x < -this.wall.width + Main.WIDTH)
            {
               x = -this.wall.width + Main.WIDTH;
            }
            if(y < -this.wall.height + Main.HEIGHT)
            {
               y = -this.wall.height + Main.HEIGHT;
            }
         }
         this.game.bg1.x = (Main.WIDTH - this.game.bg1.usebox.width) * (x / (Main.WIDTH - this.wall.width));
         this.game.bg1.y = (Main.HEIGHT - this.game.bg1.usebox.height) * (y / (Main.HEIGHT - this.wall.height));
         this.game.bg2.x = (Main.WIDTH - this.game.bg2.usebox.width) * (x / (Main.WIDTH - this.wall.width));
         this.game.bg2.y = (Main.HEIGHT - this.game.bg2.usebox.height) * (y / (Main.HEIGHT - this.wall.height));
         x += this.shkOffX;
         y += this.shkOffY;
      }
      
      public function destroy() : void
      {
         this.wall.dispose();
      }
      
      function frame2() : *
      {
         this.Init();
      }
      
      function frame3() : *
      {
         this.Init();
      }
      
      function frame4() : *
      {
         this.Init();
      }
      
      function frame5() : *
      {
         this.Init();
      }
      
      function frame6() : *
      {
         this.Init();
      }
      
      function frame7() : *
      {
         this.Init();
      }
      
      function frame8() : *
      {
         this.Init();
      }
      
      function frame9() : *
      {
         this.Init();
      }
      
      function frame10() : *
      {
         this.Init();
      }
      
      function frame11() : *
      {
         this.Init();
      }
      
      function frame12() : *
      {
         this.Init();
      }
   }
}
