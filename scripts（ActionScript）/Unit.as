package
{
   import flash.display.MovieClip;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class Unit extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var icon2:MovieClip;
      
      public var txt_level2:TextField;
      
      public var txt_name2:TextField;
      
      public var mc_hp:MovieClip;
      
      public var txt_name:TextField;
      
      public var txt_level:TextField;
      
      public var game:Game;
      
      public var mDown:Boolean;
      
      public var laserColor:uint = 16711680;
      
      public var laserX:Number;
      
      public var laserY:Number;
      
      public var laserOX:Number;
      
      public var laserOY:Number;
      
      public var human:Boolean;
      
      public var unitInfo:Stats_Classes;
      
      public var team:uint;
      
      public var odiff:uint;
      
      public var diff:uint;
      
      public var pscore:int = 0;
      
      public var canRotate:Boolean;
      
      public var dead:PhysActor;
      
      private var firstSpawn:Boolean = true;
      
      public var respawnTimer:uint;
      
      public var streakInProgress:uint;
      
      public var sEvent:uint = 1;
      
      public var hasFlag:NodeCtfFlag;
      
      public var isJug:Boolean;
      
      public var onPoint:Boolean;
      
      public var capturing:Boolean;
      
      public var defendingFlag:Boolean;
      
      private var hudGlow:Array;
      
      private var hudShadow:Array;
      
      public var flip:Boolean;
      
      public var aimX:Number;
      
      public var aimY:Number;
      
      public var aimRoation:Number;
      
      private var rotArm:Number;
      
      private var rotReload:Number = 0;
      
      public var mov:Movement;
      
      public var gun:Guns;
      
      public var status:Status;
      
      public var score:Score;
      
      public var target;
      
      public var keys:uint = 0;
      
      public const UP:uint = 1;
      
      public const DOWN:uint = 2;
      
      public const LEFT:uint = 4;
      
      public const RIGHT:uint = 8;
      
      public var MC:UnitMC;
      
      public var MCfilters:Array;
      
      public var scale:Number;
      
      public var nextAnim:String;
      
      private var surface:String;
      
      public var constAnim:String;
      
      private var fc:uint;
      
      public function Unit(param1:Game, param2:Boolean, param3:Stats_Classes)
      {
         super();
         addFrameScript(0,this.frame1);
         this.game = param1;
         this.human = param2;
         this.unitInfo = param3;
         this.odiff = this.unitInfo.diff;
         this.scale = 1;
         this.MC = new UnitMC(this);
         addChild(this.MC);
         this.mov = new Movement(this);
         this.gun = new Guns(this);
         this.status = new Status(this);
         this.score = new Score(this);
         this.team = this.unitInfo.team;
         name = this.unitInfo.name;
         if(this.unitInfo.extra.kills)
         {
            this.score.setKills(this.unitInfo.extra.kills);
         }
         this.MCfilters = [];
         if(!this.unitInfo.extra.noSpawn)
         {
            if(!this.unitInfo.extra.spawn)
            {
               this.spawn();
            }
            else
            {
               this.spawn(this.unitInfo.extra.spawn.x,this.unitInfo.extra.spawn.y,this.unitInfo.extra.spawn.node);
            }
         }
         else
         {
            visible = false;
            x = -4000;
            y = -4000;
         }
         this.hudGlow = [new DropShadowFilter(5,45,0,1,5,5,1,1),new GlowFilter(65535,1,3,3,1,1)];
         this.hudShadow = [new DropShadowFilter(5,45,0,1,5,5,1,1)];
         setChildIndex(this.MC,0);
      }
      
      public function setGuns(param1:String = "", param2:String = "") : void
      {
         if(param1)
         {
            this.unitInfo.primary = Inventory_Gun.createInventoryItem(param1,this.unitInfo.level,0);
         }
         if(param2)
         {
            this.unitInfo.secondary = Inventory_Gun.createInventoryItem(param2,this.unitInfo.level,0);
         }
         this.gun.setGuns(this.unitInfo.primary,this.unitInfo.secondary);
      }
      
      public function setClass() : void
      {
         if(this.human)
         {
            MatchSettings.updatePlayer();
            this.unitInfo = MatchSettings.usePlayer;
         }
         if(this.human)
         {
            trace("-- Get stats for level",this.unitInfo.level);
         }
         var _loc1_:Object = Stats_Classes.getClass(this.unitInfo.classNum,this.unitInfo.level);
         if(!MatchSettings.isCampaign && !MatchSettings.qmArmor)
         {
            this.unitInfo.armor = new Inventory_Armor("none").createFinalItem();
         }
         if(!MatchSettings.isCampaign && !MatchSettings.qmSkills)
         {
            this.unitInfo.skillID = "none";
            this.unitInfo.skill = Stats_Skills.itemOb["none"];
         }
         if(!MatchSettings.isCampaign && !MatchSettings.qmStreaks)
         {
            this.unitInfo.streakID = "none";
            this.unitInfo.streak = Stats_Streaks.itemOb["none"];
         }
         this.unitInfo.hp = _loc1_.hp.cur;
         if(this.unitInfo.extra.hp)
         {
            this.unitInfo.hp = this.unitInfo.extra.hp;
         }
         this.unitInfo.hp *= this.unitInfo.armor.healthMod;
         if(this.unitInfo.skill.id == "sacrifice")
         {
            this.unitInfo.hp *= 0.85;
         }
         this.unitInfo.crit = Number(_loc1_.crit.cur) * 0.01;
         this.unitInfo.aim = Number(_loc1_.aim.cur) * 0.01;
         this.unitInfo.ammo = Number(_loc1_.ammo.cur) * 0.01;
         this.unitInfo.ammo += this.unitInfo.armor.ammoMod;
         this.unitInfo.headDmg = 1.6;
         this.unitInfo.critDmg = 1.4;
         this.unitInfo.armorDmg = 1;
         this.unitInfo.fleshDmg = 1;
         this.unitInfo.explosiveRes = 1 + this.unitInfo.armor.explosiveRes;
         if(this.unitInfo.skill.id == "nosweat")
         {
            this.unitInfo.explosiveRes += this.unitInfo.skill.value;
            this.unitInfo.extra.selfDmg = 0;
         }
         if(name != "Ocean Cat")
         {
            if(name != "Rua")
            {
               if(name != "QiQing_")
               {
                  if(name != "九")
                  {
                     if(name == "预备干员-近战")
                     {
                        this.unitInfo.extra.exactFrame = true;
                        this.unitInfo.head = this.unitInfo.body = 101;
                     }
                  }
                  else
                  {
                     this.unitInfo.extra.exactFrame = true;
                     this.unitInfo.head = this.unitInfo.body = 100;
                     this.unitInfo.extra.scale = 1.25;
                  }
               }
               else
               {
                  this.unitInfo.extra.exactFrame = true;
                  this.unitInfo.head = this.unitInfo.body = 103;
                  this.unitInfo.extra.scale = 0.95;
               }
            }
            else
            {
               this.unitInfo.extra.exactFrame = true;
               this.unitInfo.head = this.unitInfo.body = 106;
               this.unitInfo.extra.scale = 1.25;
            }
         }
         else
         {
            this.unitInfo.extra.exactFrame = true;
            this.unitInfo.head = this.unitInfo.body = 107;
            this.unitInfo.extra.scale = 1.25;
         }
         this.scale = _loc1_.scale;
         if(this.unitInfo.extra.scale)
         {
            this.scale = this.unitInfo.extra.scale;
         }
         this.MC.scaleX = this.MC.scaleY = this.scale;
         this.unitInfo.reflect = this.unitInfo.armor.reflect;
         if(this.unitInfo.skill.id == "reflect")
         {
            this.unitInfo.reflect += this.unitInfo.skill.value;
         }
         this.unitInfo.icon = _loc1_.icon;
         this.unitInfo.startFrame = _loc1_.startFrame;
         this.unitInfo.className = _loc1_.name;
         this.unitInfo.classNum = _loc1_.num;
         this.unitInfo.runType = _loc1_.runType;
         this.unitInfo.id = _loc1_.id;
         trace("=== Unit Stats:",name,this.unitInfo.skill.name,this.unitInfo.streak.name,this.unitInfo.level,this.unitInfo.team,this.unitInfo.armor.id,!this.unitInfo.primaryAttach ? "NoAttch" : this.unitInfo.primaryAttach.id,"Skin:",this.unitInfo.head,this.unitInfo.body,this.unitInfo.camo);
         this.unitInfo.regen = this.unitInfo.hp * 0.001;
         this.unitInfo.regenArmor = this.unitInfo.armor.armor * 0.001 * this.unitInfo.armor.regenMod;
         if(this.unitInfo.skill.id == "regen")
         {
            this.unitInfo.regen = this.unitInfo.hp * 0.001 * this.unitInfo.skill.value;
         }
         if(!this.unitInfo.extra.exactFrame)
         {
            this.MC.curHead = this.unitInfo.head + this.unitInfo.startFrame;
            this.MC.curBody = this.unitInfo.body + this.unitInfo.startFrame;
         }
         else
         {
            this.MC.curHead = this.unitInfo.head;
            this.MC.curBody = this.unitInfo.body;
         }
         if(MatchSettings.useMod == "ammo")
         {
            this.MC.curHead = 6 + this.unitInfo.startFrame;
         }
         if(MatchSettings.useMod == "party")
         {
            this.MC.curHead = 7 + this.unitInfo.startFrame;
         }
         this.MC.curCamo = this.unitInfo.camo;
         this.MC.setSkin();
         if(MatchSettings.useMode == "gun" || MatchSettings.useMode == "tgun")
         {
            this.gun.noAttachments = true;
            this.setGunGameWeapon(true);
         }
         else if(MatchSettings.useMod != "party")
         {
            this.gun.setGuns(this.unitInfo.primary,this.unitInfo.secondary);
         }
         else
         {
            this.gun.noAttachments = true;
            this.gun.setGuns(Inventory_Gun.createInventoryItem(UT.randEl(Stats_Guns.randomPri).id,this.unitInfo.level,0),Inventory_Gun.createInventoryItem(UT.randEl(Stats_Guns.randomSec).id,this.unitInfo.level,0));
         }
         this.icon.gotoAndStop(this.unitInfo.icon);
         this.icon2.gotoAndStop(this.unitInfo.icon);
         this.txt_level.text = this.txt_level2.text = "" + this.unitInfo.level;
         if(this.unitInfo.extra.levelAdd)
         {
            this.txt_level.text = this.txt_level2.text = "" + (this.unitInfo.level + this.unitInfo.extra.levelAdd);
         }
         this.txt_name.text = this.txt_name2.text = name;
         if(!this.human)
         {
            this.setDiffStats();
            this.icon2.visible = this.txt_level2.visible = this.txt_name2.visible = false;
         }
         else
         {
            this.game.hud.txt_classname.text = this.unitInfo.className;
            this.game.hud.mc_streak.gotoAndStop(this.unitInfo.streak.sprite);
            this.game.hud.mc_streak.visible = this.unitInfo.streak.sprite != "none";
            this.game.hud.hud_bg.gotoAndStop(this.unitInfo.streak.sprite == "none" ? 2 : 1);
            this.game.hud.txt_level.text = "lvl: " + this.unitInfo.level;
            this.game.hud.addExp(0);
            this.setKillstreakNum(0);
         }
         this.endKillstreak();
         if(this.unitInfo.extra.constAnim)
         {
            this.constAnim = this.unitInfo.extra.constAnim;
            if(this.unitInfo.extra.paraOnce)
            {
               this.unitInfo.extra.constAnim = false;
            }
         }
         this.setBarColour();
         if(MatchSettings.useMode == "jug" && !this.isJug)
         {
            this.changeTeam(1,true);
         }
      }
      
      public function changeTeam(param1:uint, param2:Boolean = false) : void
      {
         this.team = param1;
         this.setBarColour();
         if(param2)
         {
            this.changeCamo(Stats_Misc.getCamoTeam(this.team));
         }
      }
      
      public function changeCamo(param1:uint) : void
      {
         this.MC.curCamo = param1;
         this.MC.setSkin();
      }
      
      public function setBarColour() : void
      {
         var _loc1_:* = new ColorTransform();
         var _loc2_:* = this.team;
         switch(0 !== _loc2_ ? (1 !== _loc2_ ? (2 === _loc2_ ? 2 : 3) : 1) : 0)
         {
            case 0:
               if(!this.human)
               {
                  this.status.healthColor = 39168;
               }
               else
               {
                  this.status.healthColor = 3407667;
               }
               _loc1_.color = 3407667;
               break;
            case 1:
               if(!this.human)
               {
                  this.status.healthColor = 26367;
               }
               else
               {
                  this.status.healthColor = 3381708;
               }
               _loc1_.color = 3381708;
               break;
            case 2:
               this.status.healthColor = 13395456;
               _loc1_.color = 13408512;
         }
         this.icon.transform.colorTransform = _loc1_;
         this.icon.alpha = 0.7;
         this.txt_level.transform.colorTransform = _loc1_;
         this.txt_level.alpha = 0.7;
         this.txt_name.transform.colorTransform = _loc1_;
         this.txt_name.alpha = 0.7;
      }
      
      public function setDiffStats(param1:Number = -99, param2:Boolean = false, param3:Boolean = true) : void
      {
      }
      
      public function spawn(param1:Number = 0, param2:Number = 0, param3:String = "", param4:Boolean = true) : void
      {
      }
      
      public function getNextWaypoint(param1:NodeWaypoint = null, param2:Boolean = false) : void
      {
      }
      
      public function unitSpawn(param1:Number, param2:Number, param3:String, param4:Boolean) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:NodeSpawn = null;
         if(this.unitInfo.extra.noSpawn)
         {
            this.unitInfo.extra.noSpawn = false;
         }
         if(this.unitInfo.extra.noRope)
         {
            param4 = false;
            this.unitInfo.extra.noRope = false;
         }
         this.mov.reset();
         if(!this.human)
         {
            this.setClass();
         }
         else
         {
            this.setClass();
         }
         this.status.reset();
         this.MC.prepareSpawn(param4);
         this.dead = null;
         visible = true;
         if(!(Boolean(param1) && Boolean(param2) && Boolean(param3)))
         {
            _loc6_ = this.getSpawnNode();
            this.setAiSpawnNode(_loc6_);
            x = _loc6_.x + UT.rand(-5,5);
            y = _loc6_.y;
         }
         else
         {
            if(!this.human)
            {
               _loc5_ = 0;
               while(_loc5_ < this.game.arena.waypoints.length)
               {
                  if(this.game.arena.waypoints[_loc5_].id == param3)
                  {
                     this.getNextWaypoint(this.game.arena.waypoints[_loc5_],true);
                     break;
                  }
                  _loc5_++;
               }
            }
            x = param1;
            y = param2;
         }
         this.MC.rotation = 0;
         if(this.unitInfo.extra.permaStreak)
         {
            this.useKillstreak(this.unitInfo.extra.permaStreak);
         }
      }
      
      protected function getSpawnNode() : NodeSpawn
      {
         var _loc1_:Array = null;
         var _loc2_:NodeSpawn = null;
         if(!(MatchSettings.useMode == "ctf" && this.team || Boolean(this.unitInfo.extra.teamSpawn)))
         {
            _loc1_ = this.game.arena.spawns;
         }
         else
         {
            _loc1_ = this.game.arena["spawnsT" + this.team];
         }
         if(!this.firstSpawn)
         {
            return UT.randEl(_loc1_);
         }
         do
         {
            _loc2_ = UT.randEl(_loc1_);
         }
         while(_loc2_.initialSpawned);
         
         _loc2_.initialSpawned = true;
         this.firstSpawn = false;
         return _loc2_;
      }
      
      protected function setAiSpawnNode(param1:NodeSpawn) : void
      {
      }
      
      public function die(param1:Unit, param2:Stats_Guns, param3:Object) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:uint = 0;
         this.dead = this.game.physWorld.createCorpse(this,param1,param2,param3);
         if(Boolean(param3.headMult) || Boolean(param3.critMult) || param2.typeName == "Melee")
         {
            var _loc6_:* = UT.irand(0,2);
            switch(0 !== _loc6_ ? (1 === _loc6_ ? 1 : (2 !== _loc6_ ? 3 : 2)) : 0)
            {
               case 0:
                  this.game.playScreenSound(S_Headshot1,x,y);
                  break;
               case 1:
                  this.game.playScreenSound(S_Headshot2,x,y);
                  break;
               case 2:
                  this.game.playScreenSound(S_Headshot3,x,y);
            }
         }
         else if(Math.random() < 0.35)
         {
            _loc6_ = UT.irand(0,5);
            switch(0 !== _loc6_ ? (1 !== _loc6_ ? (2 !== _loc6_ ? (3 === _loc6_ ? 3 : (4 !== _loc6_ ? (5 === _loc6_ ? 5 : 6) : 4)) : 2) : 1) : 0)
            {
               case 0:
                  this.game.playScreenSound(S_Die1,x,y);
                  break;
               case 1:
                  this.game.playScreenSound(S_Die2,x,y);
                  break;
               case 2:
                  this.game.playScreenSound(S_Die6,x,y);
                  break;
               case 3:
                  this.game.playScreenSound(S_Die7,x,y);
                  break;
               case 4:
                  this.game.playScreenSound(S_Die8,x,y);
                  break;
               case 5:
                  this.game.playScreenSound(S_Die9,x,y);
            }
         }
         if(!this.game.gameEnded)
         {
            this.game.hud.addKillFeed(this,param1,param2);
            this.score.addDeath();
            if(this != param1)
            {
               if(!param3.teamkill)
               {
                  if(param1.human)
                  {
                     if(param1.unitInfo.classNum == 4 && Boolean(param3.headMult))
                     {
                        Stats_Achievements.checkAchVariable("sniper",1);
                     }
                     if(param1.unitInfo.classNum == 1 && param2.isTurret)
                     {
                        Stats_Achievements.checkAchVariable("engi",1);
                     }
                     if(param1.unitInfo.classNum == 2 && Boolean(param1.streakInProgress))
                     {
                        Stats_Achievements.checkAchVariable("merc",1);
                     }
                     if(name == "整合运动 克隆体" || name == "武装人员")
                     {
                        Stats_Achievements.checkAchVariable("globex",1);
                     }
                     if(param2.isMelee)
                     {
                        Stats_Achievements.checkAchVariable("melee",1);
                     }
                  }
                  if(param1.unitInfo.skill.id == "gunplay")
                  {
                     this.game.createParticle(param1.x + UT.rand(-5,5),param1.y - UT.rand(50,55),"text",0,null,"bigText","gunplay");
                     param1.gun.reloadOther();
                  }
                  if(param1.unitInfo.skill.id == "transfusion" && UT.getDist(x,y,param1.x,param1.y) < 150)
                  {
                     param1.status.heal(param1.status.hpMax * param1.unitInfo.skill.value);
                  }
                  if(param1.unitInfo.skill.id == "ammo")
                  {
                     this.game.createParticle(param1.x + UT.rand(-5,5),param1.y - UT.rand(50,55),"text",0,null,"bigText","ammo");
                     param1.gun.addAmmo(param1.unitInfo.skill.value);
                  }
                  param1.score.addKill();
                  if(param3.headMult)
                  {
                     ++param1.score.headshots;
                  }
                  ++param1.score["killed" + this.unitInfo.classNum];
                  if(this.isJug)
                  {
                     param3.jugKill = true;
                     param1.setJug();
                  }
                  if(this.hasFlag)
                  {
                     param3.hasFlag = true;
                  }
                  if(param1.human)
                  {
                     _loc5_ = Math.min(Stats_Classes.getUnitExp(param1.unitInfo.level + 3),Stats_Classes.getUnitExp(this.unitInfo.level));
                     if(MatchSettings.useExtra.expMod)
                     {
                        _loc5_ *= MatchSettings.useExtra.expMod;
                     }
                     if(MatchSettings.useMod)
                     {
                        _loc5_ *= Stats_Misc.getMod(MatchSettings.useMod).expmod;
                     }
                     this.game.hud.addExp(_loc5_);
                     this.displayExp(_loc5_);
                  }
                  if(MatchSettings.useExtra.vampire)
                  {
                     param1.status.heal(param1.status.hpMax * 0.6,true);
                  }
               }
               else
               {
                  this.score.addBetrayal();
               }
            }
            else
            {
               this.score.addSuicide();
               if(this.isJug)
               {
                  while((_loc4_ = UT.randEl(this.game.units)) == this || _loc4_.dead || Boolean(_loc4_.status.sSpawn))
                  {
                  }
                  _loc4_.setJug();
               }
            }
            if(this.human)
            {
               if(!MatchSettings.useClassOnly)
               {
                  this.game.hud.setClassChange(true);
               }
               this.game.hud.mc_streakarrow.visible = false;
               this.game.hud.hud_bg.filters = this.hudShadow;
            }
            if(this.constAnim)
            {
               this.game.createParticle(x,y - 110,"move",0,{
                  "xspd":-50,
                  "yspd":0
               },this.constAnim,"animate");
            }
         }
         if(this.hasFlag)
         {
            this.hasFlag.reset();
            this.hasFlag = null;
         }
         visible = false;
         this.respawnTimer = 30 * 5;
         if(this.human)
         {
            this.endKillstreak();
            this.game.aimer.x = -5000;
            this.game.aimer.y = -5000;
         }
      }
      
      public function displayExp(param1:uint) : void
      {
         var _loc2_:Number = x + UT.rand(-5,5) - 8;
         var _loc3_:Number = y - UT.rand(55,60);
         this.game.createParticle(_loc2_,_loc3_,"slowText",0,null,"expText","idle",11);
         if(param1 >= 10)
         {
            this.game.createParticle(_loc2_ + 8,_loc3_,"slowText",0,null,"expText","idle",uint(param1 * 0.1) + 1);
            this.game.createParticle(_loc2_ + 16,_loc3_,"slowText",0,null,"expText","idle",param1 % 10 + 1);
         }
         else
         {
            this.game.createParticle(_loc2_ + 8,_loc3_,"slowText",0,null,"expText","idle",param1 + 1);
         }
      }
      
      public function setJug() : void
      {
         var _loc1_:uint = 0;
         if(this.human)
         {
         }
         _loc1_ = 0;
         while(_loc1_ < this.game.units.length)
         {
            this.game.units[_loc1_].changeTeam(1);
            this.game.units[_loc1_].isJug = false;
            this.game.units[_loc1_].gotoAndStop(1);
            _loc1_++;
         }
         this.changeTeam(2);
         this.status.heal(999,false);
         this.game.arena.setShake(10,10);
         _loc1_ = 0;
         while(_loc1_ < 20)
         {
            this.game.createParticle(x + UT.rand(-10,10),y + UT.rand(-40,0),"spark",20,{
               "xSpd":UT.rand(-5,5),
               "ySpd":UT.rand(-8,-3)
            },"ember");
            _loc1_++;
         }
         this.game.createEffect(x,y - 100,"oneManArmy","idle",true);
         this.isJug = true;
         gotoAndStop(2);
         this.changeCamo(20);
         this.game.hud.addCustomFeed(this,"jug");
         this.scale += 0.3;
         this.MC.scaleX = this.MC.scaleY = this.scale;
         if(MatchSettings.useExtra.fireJug)
         {
            this.status.setFire(this,uint.MAX_VALUE);
            this.useKillstreak("fire");
            this.gun.setGuns(Inventory_Gun.createInventoryItem("Flamethrower",this.unitInfo.level,0),Inventory_Gun.createInventoryItem("Empty",1,0));
         }
      }
      
      public function UnitEnterFrame() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Point = null;
         ++this.fc;
         if(this.streakInProgress)
         {
            --this.streakInProgress;
            if(this.streakInProgress == 0)
            {
               this.endKillstreak();
            }
         }
         if(x < 0 || y < 0 || x > 2880 || y > 2880)
         {
            this.status.damage(9999,this,Stats_Guns.itemOb["env"],{},true);
         }
         this.status.EnterFrame();
         this.gun.EnterFrame();
         this.MC.EnterFrame();
         this.mov.resetMods();
         this.surface = this.getPixel(0,1).toString(16).substring(2);
         if(this.human)
         {
            this.game.hud.setDebug(1,this.surface);
         }
         var _loc3_:* = this.surface;
         loop5:
         switch("ff00ff" !== _loc3_ ? ("33cc99" === _loc3_ ? 1 : ("32cb99" !== _loc3_ ? ("ff9900" !== _loc3_ ? ("ff6699" === _loc3_ ? 4 : ("ff6666" !== _loc3_ ? ("999966" !== _loc3_ ? ("0066ff" === _loc3_ ? 7 : ("0069ff" !== _loc3_ ? ("0077ff" !== _loc3_ ? ("0079ff" === _loc3_ ? 10 : ("0096ff" !== _loc3_ ? ("0099ff" === _loc3_ ? 12 : ("3360ff" !== _loc3_ ? ("3363ff" !== _loc3_ ? ("3262ff" !== _loc3_ ? ("3366ff" === _loc3_ ? 16 : ("3369ff" !== _loc3_ ? ("600060" !== _loc3_ ? ("6600ff" === _loc3_ ? 19 : ("620060" !== _loc3_ ? ("6200ff" === _loc3_ ? 21 : ("6699ff" !== _loc3_ ? ("ffffff" === _loc3_ ? 23 : ("666666" !== _loc3_ ? ("00ffff" !== _loc3_ ? ("330000" === _loc3_ ? 26 : ("320000" !== _loc3_ ? ("2c0000" === _loc3_ ? 28 : ("2a0000" !== _loc3_ ? ("2e0000" !== _loc3_ ? ("2b0000" !== _loc3_ ? ("2f0000" === _loc3_ ? 32 : ("2d0000" !== _loc3_ ? ("660000" === _loc3_ ? 34 : ("620000" !== _loc3_ ? ("630000" !== _loc3_ ? ("640000" === _loc3_ ? 37 : ("990000" !== _loc3_ ? 39 : 38)) : 36) : 35)) : 33)) : 31) : 30) : 29)) : 27)) : 25) : 24)) : 22)) : 20)) : 18) : 17)) : 15) : 14) : 13)) : 11)) : 9) : 8)) : 6) : 5)) : 3) : 2)) : 0)
         {
            case 0:
               if(this.human)
               {
                  if(MatchSettings.isCampaign && MatchSettings.caType == 0 && MatchSettings.caStage == 1)
                  {
                     this.game.hud.gotoFrame("idle");
                     _loc3_ = Stats_Campaign.sn;
                     switch(3 !== _loc3_ ? (5 !== _loc3_ ? (9 !== _loc3_ ? (13 === _loc3_ ? 3 : (14 !== _loc3_ ? (15 === _loc3_ ? 5 : 6) : 4)) : 2) : 1) : 0)
                     {
                        case 0:
                           this.game.hud.gotoFrame("tutjump");
                           break;
                        case 1:
                           this.game.hud.gotoFrame("tutshoot");
                           break;
                        case 2:
                           this.game.hud.gotoFrame("tutduck");
                           break;
                        case 3:
                           this.game.arena.mc_door2.gotoAndPlay("close");
                           break;
                        case 4:
                           this.game.arena.mc_door3.gotoAndPlay("open");
                           break;
                        case 5:
                           this.game.arena.mc_door3.gotoAndPlay("close");
                     }
                  }
                  if(MatchSettings.isCampaign && MatchSettings.caType == 0 && MatchSettings.caStage == 10)
                  {
                     _loc3_ = Stats_Campaign.sn;
                     switch(2 !== _loc3_ ? 1 : 0)
                     {
                        case 0:
                           this.game.arena.mc_darkness.nextFrame();
                     }
                  }
                  trace("SN:",Stats_Campaign.sn);
                  ++Stats_Campaign.sn;
                  Stats_Campaign.fc = 0;
                  this.game.arena.changeWallFrame(Stats_Campaign.sn);
                  break;
               }
               break;
            case 1:
            case 2:
               this.mov.falltimer = 0;
               break;
            case 3:
               Stats_Achievements.setAchievement("party");
               SH.playMusic(M_Rocket);
               break;
            case 4:
               this.mov.modJump = 0.3;
               this.mov.doJump();
               this.mov.falltimer = 0;
               if(this.mov.yVel <= -2.4)
               {
                  break;
               }
               this.mov.yVel -= 1.1;
               break;
            case 5:
               this.mov.modJump = 0.3;
               this.mov.doJump();
               this.mov.falltimer = 0;
               if(this.mov.yVel <= -2.4)
               {
                  break;
               }
               this.mov.yVel -= 0.7;
               break;
            case 6:
               this.mov.modMove = 2;
               this.mov.dontStop = true;
               break;
            case 7:
               this.mov.modJump = 1;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_light_left.gotoAndPlay(2);
               if(this.mov.climb)
               {
                  break;
               }
               _loc1_ = 0;
               while(true)
               {
                  if(_loc1_ >= UT.irand(10,25))
                  {
                     break loop5;
                  }
                  this.game.createParticle(UT.rand(848,911),UT.rand(778,934),"spark",UT.irand(0,15),null,"ember");
                  _loc1_++;
               }
               break;
            case 8:
               this.mov.modJump = 1;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_light_right.gotoAndPlay(2);
               if(this.mov.climb)
               {
                  break;
               }
               _loc1_ = 0;
               while(true)
               {
                  if(_loc1_ >= UT.irand(10,25))
                  {
                     break loop5;
                  }
                  this.game.createParticle(UT.rand(1963,2015),UT.rand(777,939),"spark",UT.irand(0,15),null,"ember");
                  _loc1_++;
               }
               break;
            case 9:
               this.mov.modJump = 1.4;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_bounce_left1.gotoAndPlay(2);
               break;
            case 10:
               this.mov.modJump = 1.4;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_bounce_right1.gotoAndPlay(2);
               break;
            case 11:
               this.mov.modJump = 2;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_bounce_left2.gotoAndPlay(2);
               break;
            case 12:
               this.mov.modJump = 2;
               this.mov.doJump();
               this.game.hud.setDebug(2,"Surface Type = Force Jump");
               this.game.arena.mc_bounce_right2.gotoAndPlay(2);
               break;
            case 13:
               this.mov.modJump = 1.15;
               break;
            case 14:
            case 15:
               this.mov.modGrav = 0.5;
               break;
            case 16:
               this.mov.modJump = 1.4;
               this.game.arena.mc_couch.spring1.gotoAndPlay(2);
               break;
            case 17:
               this.mov.modJump = 1.4;
               this.game.arena.mc_couch.spring2.gotoAndPlay(2);
               break;
            case 18:
               this.mov.falltimer = 0;
               this.mov.modJump = 0.8;
               this.mov.modGrav = 0.5;
               break;
            case 19:
               this.mov.falltimer = 0;
               this.mov.modJump = 1.4;
               this.mov.modGrav = 0.3;
               break;
            case 20:
               this.mov.falltimer = 0;
               this.mov.modJump = 0.75;
               this.mov.modGrav = 0.45;
               break;
            case 21:
               this.mov.falltimer = 0;
               this.mov.modJump = 1.1;
               this.mov.modGrav = 0.3;
               break;
            case 22:
               this.mov.modMax = 0.8;
               this.mov.modBrake = 1.8;
               this.mov.modJump = 0.8;
               this.status.sFire = this.status.sAcid = 0;
               if(this.status.sZap)
               {
                  ++this.status.sZap;
               }
               if(!this.status.sIce)
               {
                  break;
               }
               ++this.status.sIce;
               break;
            case 23:
               this.mov.modBrake = 2;
               if(!(Math.abs(this.mov.xVel) > 1 && this.fc % 3 == 0))
               {
                  break;
               }
               this.game.createEffect(x,y - 4,"snowSplash");
               break;
            case 24:
               this.mov.modMove = 5;
               this.mov.dontStop = true;
               break;
            case 25:
               this.mov.modJump = 1.8;
               this.game.arena.mc_spring.gotoAndPlay(2);
               break;
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
               this.status.damage(9999,this,Stats_Guns.itemOb["env"],{},true);
               break;
            case 34:
            case 35:
            case 36:
            case 37:
               this.status.damage(9999,this,Stats_Guns.itemOb["space"],{
                  "hitX":x,
                  "hitY":y - 20
               },true);
               break;
            case 38:
               if(!(this.fc % 5 == 0 && this.human))
               {
                  break;
               }
               this.status.damage(Stats_Guns.getDamageAtLevel("mechlaser",this.game.units[1].unitInfo.level),this.game.units[1],Stats_Guns.itemOb["mechlaser"],{},true);
               break;
         }
         this.mov.EnterFrame();
         if(this.constAnim)
         {
            this.game.bitscreen.paint(x + this.game.arena.x,y + this.game.arena.y - 110,true,this.constAnim + "0");
         }
         _loc1_ = 0;
         while(_loc1_ < this.game.arena.pickups.length)
         {
            if(!this.game.arena.pickups[_loc1_].taken)
            {
               if(UT.inBox(x,y,Number(this.game.arena.pickups[_loc1_].x) - 40,Number(this.game.arena.pickups[_loc1_].y) - 80,80,150))
               {
                  this.game.arena.pickups[_loc1_].getPickup(this);
               }
            }
            _loc1_++;
         }
         this.onPoint = false;
         this.capturing = false;
         _loc1_ = 0;
         while(this.game.gameStarted && _loc1_ < this.game.arena.holdpoints.length)
         {
            if(UT.inBox(x,y,Number(this.game.arena.holdpoints[_loc1_].x) - 120,Number(this.game.arena.holdpoints[_loc1_].y) - 100,240,200))
            {
               this.onPoint = true;
               this.capturing = this.game.arena.holdpoints[_loc1_].curTeam != this.team;
               this.game.arena.holdpoints[_loc1_].capture(this);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.game.arena.ctfflags.length)
         {
            if(UT.inBox(x,y,Number(this.game.arena.ctfflags[_loc1_].x) - 40,Number(this.game.arena.ctfflags[_loc1_].y) - 70,80,95))
            {
               this.game.arena.ctfflags[_loc1_].capture(this);
            }
            _loc1_++;
         }
         if(this.hasFlag)
         {
            if(this.fc % (!(Boolean(this.keys & this.LEFT) || Boolean(this.keys & this.RIGHT)) ? 30 : 10) == 0)
            {
               this.game.createEffect(x + UT.rand(-7,7),y - UT.rand(3,7),"paper","idle" + UT.irand(1,2));
            }
         }
         if(Boolean(this.MC.head.cigar) && this.fc % 40 < 8)
         {
            _loc2_ = this.MC.head.localToGlobal(new Point(this.MC.head.cigar.x,this.MC.head.cigar.y));
            this.game.createParticle(_loc2_.x - this.game.arena.x,_loc2_.y - this.game.arena.y,"move",0,{
               "xSpd":0,
               "ySpd":-2
            },"gas_tiny","idle");
         }
         if((this.unitInfo.skill.id == "autostreak" || this.unitInfo.skill.id == "autostreak1" || this.unitInfo.skill.id == "autostreak2" || this.unitInfo.skill.id == "autostreak3") && this.fc % (this.unitInfo.skill.value * 30) == 0)
         {
            this.score.addStreak(UT.rand(0.2,0.5));
         }
         this.MC.goto(this.nextAnim);
         this.flip = !this.mov.jumping ? UT.fixRotation(this.aimRoation - this.MC.rotation) < 0 : this.aimX < x;
         this.MC.scaleX = !this.flip ? 1 : -1;
         this.MC.scaleX *= this.scale;
         this.rotArm = UT.getRotation(x + this.MC.arm1.x + this.MC.rotation * 1.2,y + this.MC.arm1.y,this.aimX,this.aimY) - 90;
         this.aimRoation = UT.fixRotation(this.rotArm + 90);
         if(this.flip)
         {
            this.rotArm = -this.rotArm + 180;
         }
         this.rotArm = UT.fixRotation(this.rotArm - rotation) + (!this.flip ? -this.MC.rotation : this.MC.rotation);
         this.rotReload += ((!(this.gun.reloading && this.rotArm < 30) ? 0 : 30) - this.rotReload) * 0.2;
         this.MC.arm1.rotation = this.rotReload + this.rotArm;
         this.MC.arm2.rotation = this.rotReload + this.rotArm;
         this.MC.head.rotation = this.rotReload + this.rotArm * 0.6;
         this.MC.filters = this.MCfilters;
         Main.DEBUGMODE = true;
      }
      
      public function useKillstreak(param1:String = "", param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc4_:uint = 0;
         if(!(!this.score.streakReady() && !param1 && !param2))
         {
            if(this.dead)
            {
               return;
            }
            if(this.human)
            {
               this.game.hud.mc_streakarrow.visible = false;
               this.game.hud.hud_bg.filters = this.hudShadow;
               AGI.submitQuest("use_streak");
            }
            if(!param1)
            {
               if(this.human)
               {
                  this.game.hud.txt_streakready.text = "减震模块已启动，御敌指令运行中！";
               }
               this.game.createEffect(x,y - 100,"useStreak");
               this.game.hud.addKillstreakFeed(this,this.unitInfo.streak);
            }
            if(!param1)
            {
               _loc3_ = this.unitInfo.streak.id;
            }
            else
            {
               _loc3_ = param1;
            }
            if(this.human && this.unitInfo.classNum == 3)
            {
               Stats_Achievements.checkAchVariable("general",1);
            }
            var _loc5_:* = _loc3_;
            loop6:
            switch("drone" !== _loc5_ ? ("turret" !== _loc5_ ? ("sentry" === _loc5_ ? 2 : ("tesla" !== _loc5_ ? ("surge" === _loc5_ ? 4 : ("blood" !== _loc5_ ? ("rage" !== _loc5_ ? ("wizard" === _loc5_ ? 7 : ("regenB" !== _loc5_ ? ("aimB" !== _loc5_ ? ("critB" !== _loc5_ ? ("moralB" === _loc5_ ? 11 : ("scan" !== _loc5_ ? ("stealth" === _loc5_ ? 13 : ("aimbot" !== _loc5_ ? ("wallhack" === _loc5_ ? 15 : ("fire" !== _loc5_ ? ("ice" !== _loc5_ ? ("zap" !== _loc5_ ? ("acid" === _loc5_ ? 19 : 20) : 18) : 17) : 16)) : 14)) : 12)) : 10) : 9) : 8)) : 6) : 5)) : 3)) : 1) : 0)
            {
               case 0:
                  this.game.killstreaks.push(new Killstreak_Drone(this.game,this,this.setTimer(12 * 30,param1)));
                  this.endKillstreak();
                  break;
               case 1:
                  this.streakInProgress = 20 * 30;
                  this.game.killstreaks.push(new Killstreak_Turret(this.game,this,this.setTimer(20 * 30,param1),"turret"));
                  break;
               case 2:
                  this.streakInProgress = 20 * 30;
                  this.game.killstreaks.push(new Killstreak_Turret(this.game,this,this.setTimer(20 * 30,param1),"sentry"));
                  break;
               case 3:
                  this.streakInProgress = 30 * 30;
                  this.game.killstreaks.push(new Killstreak_Tesla(this.game,this,this.setTimer(30 * 30,param1)));
                  break;
               case 4:
                  this.streakInProgress = this.status.sSurge = this.setTimer(30 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 5:
                  this.streakInProgress = this.status.sBloodthirst = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 6:
                  this.streakInProgress = this.status.sRage = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 7:
                  this.streakInProgress = this.status.sWizard = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 8:
                  this.streakInProgress = 12 * 30;
                  if(!this.team)
                  {
                     trace("Self Regen");
                     this.game.playScreenSound(S_Heal,x,y);
                     this.status.sRegenBoost = this.setTimer(15 * 30,param1);
                     this.game.createEffect(x,y - 40,"healthPickup");
                     break;
                  }
                  trace("Team Regen");
                  SH.playSound(S_Heal);
                  _loc4_ = 0;
                  while(true)
                  {
                     if(_loc4_ >= this.game.units.length)
                     {
                        break loop6;
                     }
                     trace(this.game.units[_loc4_].name);
                     if(!this.game.units[_loc4_].dead)
                     {
                        trace(this.game.units[_loc4_].team);
                        if(this.game.units[_loc4_].team == this.team)
                        {
                           trace("Used!");
                           this.game.units[_loc4_].status.sRegenBoost = this.setTimer(12 * 30,param1);
                           this.game.createEffect(this.game.units[_loc4_].x,Number(this.game.units[_loc4_].y) - 40,"healthPickup");
                        }
                     }
                     _loc4_++;
                  }
                  break;
               case 9:
                  this.streakInProgress = 12 * 30;
                  if(!this.team)
                  {
                     this.game.playScreenSound(S_Heal,x,y);
                     this.status.sAimBoost = this.setTimer(15 * 30,param1);
                     this.game.createEffect(x,y - 40,"ammoPickup");
                     break;
                  }
                  SH.playSound(S_Heal);
                  _loc4_ = 0;
                  while(true)
                  {
                     if(_loc4_ >= this.game.units.length)
                     {
                        break loop6;
                     }
                     if(!this.game.units[_loc4_].dead)
                     {
                        if(this.game.units[_loc4_].team == this.team)
                        {
                           this.game.units[_loc4_].status.sAimBoost = this.setTimer(12 * 30,param1);
                           this.game.createEffect(this.game.units[_loc4_].x,Number(this.game.units[_loc4_].y) - 40,"ammoPickup");
                        }
                     }
                     _loc4_++;
                  }
                  break;
               case 10:
                  this.streakInProgress = 12 * 30;
                  if(!this.team)
                  {
                     this.game.playScreenSound(S_Heal,x,y);
                     this.status.sCritBoost = this.setTimer(15 * 30,param1);
                     this.game.createEffect(x,y - 40,"ammoPickup");
                     break;
                  }
                  SH.playSound(S_Heal);
                  _loc4_ = 0;
                  while(true)
                  {
                     if(_loc4_ >= this.game.units.length)
                     {
                        break loop6;
                     }
                     if(!this.game.units[_loc4_].dead)
                     {
                        if(this.game.units[_loc4_].team == this.team)
                        {
                           this.game.units[_loc4_].status.sCritBoost = this.setTimer(12 * 30,param1);
                           this.game.createEffect(this.game.units[_loc4_].x,Number(this.game.units[_loc4_].y) - 40,"ammoPickup");
                        }
                     }
                     _loc4_++;
                  }
                  break;
               case 11:
                  this.streakInProgress = 15 * 30;
                  if(!this.team)
                  {
                     this.game.playScreenSound(S_Heal,x,y);
                     this.status.sMoralBoost = this.setTimer(15 * 30,param1);
                     this.game.createEffect(x,y - 40,"ammoPickup");
                     break;
                  }
                  SH.playSound(S_Heal);
                  _loc4_ = 0;
                  while(true)
                  {
                     if(_loc4_ >= this.game.units.length)
                     {
                        break loop6;
                     }
                     if(!this.game.units[_loc4_].dead)
                     {
                        if(this.game.units[_loc4_].team == this.team)
                        {
                           this.game.units[_loc4_].status.sMoralBoost = this.setTimer(15 * 30,param1);
                           this.game.createEffect(this.game.units[_loc4_].x,Number(this.game.units[_loc4_].y) - 40,"ammoPickup");
                        }
                     }
                     _loc4_++;
                  }
                  break;
               case 12:
                  this.streakInProgress = 15 * 30;
                  SH.playSound(S_Radar);
                  if(!this.team)
                  {
                     _loc4_ = 0;
                     while(true)
                     {
                        if(_loc4_ >= this.game.units.length)
                        {
                           break loop6;
                        }
                        if(!this.game.units[_loc4_].dead)
                        {
                           if(this.game.units[_loc4_] != this)
                           {
                              this.game.units[_loc4_].status.sScan = this.setTimer(15 * 30,param1);
                           }
                        }
                        _loc4_++;
                     }
                  }
                  else
                  {
                     _loc4_ = 0;
                     while(true)
                     {
                        if(_loc4_ >= this.game.units.length)
                        {
                           break loop6;
                        }
                        if(!this.game.units[_loc4_].dead)
                        {
                           if(this.game.units[_loc4_].team != this.team)
                           {
                              this.game.units[_loc4_].status.sScan = this.setTimer(15 * 30,param1);
                           }
                        }
                        _loc4_++;
                     }
                  }
                  break;
               case 13:
                  this.streakInProgress = this.status.sStealth = this.setTimer(15 * 30,param1);
                  break;
               case 14:
                  this.streakInProgress = this.status.sAimbot = this.setTimer(40 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 15:
                  this.streakInProgress = this.status.sWallhack = this.setTimer(8 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 16:
                  this.streakInProgress = this.status.kFire = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 17:
                  this.streakInProgress = this.status.kIce = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 18:
                  this.streakInProgress = this.status.kZap = this.setTimer(15 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
                  break;
               case 19:
                  this.streakInProgress = this.status.kAcid = this.setTimer(12 * 30,param1);
                  this.game.playScreenSound(S_Skill,x,y);
                  this.game.createEffect(x,y - 30,"surge");
                  this.game.arena.setShake(5,5);
            }
            if(!param1)
            {
               if(this.human && Boolean(this.unitInfo.streak.allyUse))
               {
                  this.game.hud.setMsg(this,this.unitInfo.streak.allyUse,4);
                  if(this.unitInfo.streak.allySound)
                  {
                     SH.playVoice(this.unitInfo.streak.allySound);
                  }
               }
               else if(!(this.team == 1 && this.unitInfo.streak.allyUse && !MatchSettings.useExtra.quietStreaks))
               {
                  if(!(this.team == 2 && this.unitInfo.streak.enemyUse && !MatchSettings.useExtra.quietStreaks))
                  {
                     if(this.team == 0 && this.unitInfo.streak.enemyUse && !MatchSettings.useExtra.quietStreaks)
                     {
                        this.game.hud.setCharMsg("jugg",30,1,"PRTS",this.unitInfo.streak.enemyUse,4);
                        if(this.unitInfo.streak.enemySound)
                        {
                           SH.playVoice(this.unitInfo.streak.enemySound);
                        }
                     }
                  }
                  else
                  {
                     this.game.hud.setCharMsg("jugg",30,1,"PRTS",this.unitInfo.streak.enemyUse,4);
                     if(this.unitInfo.streak.enemySound)
                     {
                        SH.playVoice(this.unitInfo.streak.enemySound);
                     }
                  }
               }
               else
               {
                  this.game.hud.setMsg(this,this.unitInfo.streak.allyUse,4);
                  if(this.unitInfo.streak.allySound)
                  {
                     SH.playVoice(this.unitInfo.streak.allySound);
                  }
               }
            }
            else
            {
               this.streakInProgress = 0;
            }
            return;
         }
      }
      
      private function setTimer(param1:Number, param2:String) : uint
      {
         if(!param2)
         {
            return param1;
         }
         return uint.MAX_VALUE;
      }
      
      public function startKillstreak() : void
      {
         this.streakInProgress = 0;
         this.game.createParticle(x,y - 70,"slowText",0,null,"bigText","killstreak");
         this.game.createParticle(x,y - 60,"slowText",0,null,"bigText","ready");
         if(this.human)
         {
            this.game.hud.txt_streakready.text = "按下 E 或 Ctrl执行御敌指令！";
            SH.playSound(S_Killstreak,true);
            this.game.hud.mc_streakarrow.visible = true;
            this.game.hud.hud_bg.filters = this.hudGlow;
         }
      }
      
      public function endKillstreak() : void
      {
         this.streakInProgress = 0;
         this.score.streak = 0;
         this.setKillstreakNum(0);
         if(this.human)
         {
            this.game.hud.txt_streakready.text = "";
         }
         this.score.streakKills = 0;
      }
      
      public function setKillstreakNum(param1:uint) : void
      {
         if(!(!this.human || this.unitInfo.streak.id == "none"))
         {
            this.game.hud.hud_bg.streakbox.bar.height = param1 / (this.unitInfo.skill.id != "efficiency" ? this.unitInfo.streak.kills : this.unitInfo.streak.kills - 1) * 35;
            return;
         }
      }
      
      public function setGunGameWeapon(param1:Boolean = false) : void
      {
         var _loc2_:uint = 0;
         if(MatchSettings.useMode != "gun")
         {
            if(MatchSettings.useMode == "tgun")
            {
               if(param1)
               {
                  this.setGuns(Stats_Misc.getGunGameWeapon(this.game.matchSettings["team" + this.team + "score"]),"Empty");
               }
               else
               {
                  _loc2_ = 0;
                  while(_loc2_ < this.game.matchSettings["team" + this.team].length)
                  {
                     this.game.matchSettings["team" + this.team][_loc2_].setGuns(Stats_Misc.getGunGameWeapon(this.game.matchSettings["team" + this.team + "score"]),"Empty");
                     this.game.createEffect(this.game.matchSettings["team" + this.team][_loc2_].x,Number(this.game.matchSettings["team" + this.team][_loc2_].y) - 40,"ammoPickup");
                     _loc2_++;
                  }
               }
            }
         }
         else
         {
            this.setGuns(Stats_Misc.getGunGameWeapon(this.pscore),"Empty");
            if(!param1)
            {
               this.game.createEffect(x,y - 40,"ammoPickup");
            }
         }
      }
      
      private function hitTestAll(param1:Number = 0, param2:Number = 0, param3:Boolean = false) : *
      {
         var _loc5_:uint = 0;
         var _loc4_:uint;
         if(!((Boolean(_loc4_ = this.game.arena.wall.getPixel32(x + param1,y + param2))) && _loc4_.toString(16).substring(0,2) == "ff"))
         {
            _loc5_ = 0;
            while(_loc5_ < this.game.units.length)
            {
               if(this.game.units[_loc5_] != this)
               {
                  if(!this.game.units[_loc5_].dead)
                  {
                     if(!(Boolean(this.team) && this.team == this.game.units[_loc5_].team))
                     {
                        if(UT.inBox(x + param1,y + param2,Number(this.game.units[_loc5_].x) - 20,Number(this.game.units[_loc5_].y) - 80,40,80))
                        {
                           return this.game.units[_loc5_];
                        }
                     }
                  }
               }
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ = 0;
               while(_loc5_ < this.game.physWorld.actors.length)
               {
                  if(UT.getDist(x + param1,y + param2,this.game.physWorld.actors[_loc5_].rdBody.GetDefinition().userData.x,this.game.physWorld.actors[_loc5_].rdBody.GetDefinition().userData.y) < 30)
                  {
                     return this.game.physWorld.actors[_loc5_];
                  }
                  _loc5_++;
               }
            }
            return null;
         }
         return _loc4_.toString(16).substring(2);
      }
      
      protected function getPixel(param1:Number = 0, param2:Number = 0) : uint
      {
         return this.game.arena.wall.getPixel32(x + param1,y + param2);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
