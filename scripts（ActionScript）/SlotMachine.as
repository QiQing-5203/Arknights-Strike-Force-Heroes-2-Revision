package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class SlotMachine extends MovieClip
   {
       
      
      public var slot1:MovieClip;
      
      public var slot2:MovieClip;
      
      public var lights:MovieClip;
      
      public var slot3:MovieClip;
      
      public var arm:MovieClip;
      
      public var txt_funds:TextField;
      
      public var txt_result:TextField;
      
      private var cost:uint;
      
      private var menu:Menu;
      
      private var slotActive:Boolean;
      
      private var slotTimer:int;
      
      private var resultType:String;
      
      private var winSound;
      
      private var slotChance:Array;
      
      private var itemChance:Array;
      
      public function SlotMachine()
      {
         var _loc1_:uint = 0;
         super();
         addFrameScript(0,this.frame1);
         this.menu = Menu(parent);
         this.slotChance = [];
         _loc1_ = 0;
         while(_loc1_ < 67)
         {
            this.slotChance.push("nothing");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 66)
         {
            this.slotChance.push("item");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 12)
         {
            this.slotChance.push("money");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 15)
         {
            this.slotChance.push("camo");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 40)
         {
            this.slotChance.push("crap");
            _loc1_++;
         }
         this.itemChance = [];
         _loc1_ = 0;
         while(_loc1_ < 20)
         {
            this.itemChance.push("perfect");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 40)
         {
            this.itemChance.push("flawless");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 60)
         {
            this.itemChance.push("refined");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 120)
         {
            this.itemChance.push("gun");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 120)
         {
            this.itemChance.push("attach");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 120)
         {
            this.itemChance.push("armor");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("sheep");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("wand");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("saber");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("hammer");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("m4ex");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("mp5k");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("sks");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("awm");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("extreme gun");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            this.itemChance.push("garbage");
            _loc1_++;
         }
      }
      
      private function setPrice() : void
      {
         this.cost = Stats_Misc.getCost(SD.getSelCass().level,0.6);
         this.txt_funds.text = "L" + UT.addNumCommas(this.cost);
      }
      
      public function setup(param1:Boolean = false) : void
      {
         this.setPrice();
         this.slot1.icon.gotoAndStop(SD.classSlots[SD.selClass][0]);
         this.slot2.icon.gotoAndStop(SD.classSlots[SD.selClass][1]);
         this.slot3.icon.gotoAndStop(SD.classSlots[SD.selClass][2]);
         this.menu.slot_gun.visible = false;
         this.menu.slot_other.visible = false;
         this.menu.slot_gun.setItem(null,this.menu);
         this.menu.slot_other.setItem(null,this.menu);
         if(!SD.classItems[SD.selClass])
         {
            if(param1)
            {
               this.menu.slotlid.gotoAndStop("closed");
            }
         }
         else
         {
            this.txt_funds.text = "恭喜你！";
            if(param1)
            {
               this.menu.slotlid.gotoAndStop("opened");
            }
            if(!(SD.classItems[SD.selClass] is Inventory_Gun))
            {
               this.menu.slot_other.visible = true;
               this.menu.slot_other.setItem(SD.classItems[SD.selClass],this.menu);
               this.menu.slot_other.mc_sell.visible = false;
            }
            else
            {
               this.menu.slot_gun.visible = true;
               this.menu.slot_gun.setItem(SD.classItems[SD.selClass],this.menu);
               this.menu.slot_gun.mc_sell.visible = false;
            }
         }
         this.lights.gotoAndStop(SD.classLights[SD.selClass]);
      }
      
      public function EnterFrame() : void
      {
         if(this.slotActive)
         {
            ++this.slotTimer;
            if(this.slotTimer == int(30 * 0.25))
            {
               SH.playSound(S_GunClick);
               this.slot1.icon.gotoAndStop(SD.classSlots[SD.selClass][0]);
               this.slot1.gotoAndPlay("end");
            }
            if(this.slotTimer == int(30 * 0.5))
            {
               SH.playSound(S_GunClick);
               this.slot2.icon.gotoAndStop(SD.classSlots[SD.selClass][1]);
               this.slot2.gotoAndPlay("end");
            }
            if(this.slotTimer == int(30 * 0.75))
            {
               SH.playSound(S_GunClick);
               this.slot3.icon.gotoAndStop(SD.classSlots[SD.selClass][2]);
               this.slot3.gotoAndPlay("end");
            }
            if(this.slotTimer == int(30 * 1))
            {
               this.slotActive = false;
               this.menu.buyMode = false;
               this.giveResult();
            }
            return;
         }
      }
      
      public function MouseDown() : void
      {
         if(!SD.classItems[SD.selClass])
         {
            if(!this.slotActive)
            {
               if(this.menu.ht(this.arm))
               {
                  if(SD.getSelCass().funds < this.cost)
                  {
                     this.menu.sellwindow.setError("funds");
                     return;
                  }
                  SD.getSelCass().funds = SD.getSelCass().funds - this.cost;
                  Stats_Achievements.checkAchVariable("gambler",this.cost);
                  this.menu.Init();
                  this.startSlot();
                  SD.saveGame();
               }
               return;
            }
            return;
         }
      }
      
      private function startSlot() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         this.txt_funds.text = "抽奖中…";
         this.arm.play();
         SH.playSound(S_SlotSpin);
         SH.playSound(S_SlotPull);
         this.slotActive = true;
         this.slotTimer = 0;
         this.menu.buyMode = true;
         this.slot1.gotoAndPlay("start");
         this.slot2.gotoAndPlay("start");
         this.slot3.gotoAndPlay("start");
         this.txt_result.text = "";
         this.resultType = "";
         this.lights.gotoAndStop(1);
         do
         {
            _loc1_ = UT.randEl(this.slotChance);
         }
         while(SD.getSelCass().unlockCamo >= 20 && _loc1_ == "camo");
         
         var _loc3_:* = _loc1_;
         loop1:
         switch("nothing" !== _loc3_ ? ("item" === _loc3_ ? 1 : ("money" !== _loc3_ ? ("camo" !== _loc3_ ? ("crap" === _loc3_ ? 4 : 5) : 3) : 2)) : 0)
         {
            case 0:
               this.showRes("Nothing");
               SD.classSlots[SD.selClass] = [UT.irand(1,9),UT.irand(1,9),UT.irand(1,9)];
               if(SD.classSlots[SD.selClass][0] == SD.classSlots[SD.selClass][1] && SD.classSlots[SD.selClass][1] == SD.classSlots[SD.selClass][2])
               {
                  ++SD.classSlots[SD.selClass][2];
                  if(SD.classSlots[SD.selClass][2] > 9)
                  {
                     SD.classSlots[SD.selClass][2] = 1;
                  }
               }
               SD.classLights[SD.selClass] = 1;
               this.winSound = S_Error;
               break;
            case 1:
               _loc2_ = UT.randEl(this.itemChance);
               this.showRes("Item");
               this.resultType = "item";
               _loc3_ = _loc2_;
               switch("perfect" !== _loc3_ ? ("flawless" === _loc3_ ? 1 : ("refined" !== _loc3_ ? ("gun" !== _loc3_ ? ("attach" === _loc3_ ? 4 : ("armor" !== _loc3_ ? ("sheep" === _loc3_ ? 6 : ("wand" === _loc3_ ? 7 : ("saber" === _loc3_ ? 8 : ("hammer" === _loc3_ ? 9 : ("m4ex" === _loc3_ ? 10 : ("mp5k" === _loc3_ ? 11 : ("sks" === _loc3_ ? 12 : ("awm" === _loc3_ ? 13 : ("extreme gun" === _loc3_ ? 14 : ("garbage" !== _loc3_ ? 16 : 15)))))))))) : 5)) : 3) : 2)) : 0)
               {
                  case 0:
                     this.showRes("Perfect");
                     this.resultType = "pitem";
                     SD.classItems[SD.selClass] = this.createItem("primary",3);
                     SD.classSlots[SD.selClass] = ["sfh","sfh","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Win3;
                     break loop1;
                  case 1:
                     this.showRes("777");
                     SD.classItems[SD.selClass] = this.createItem("rand",2);
                     SD.classSlots[SD.selClass] = ["seven","seven","seven"];
                     SD.classLights[SD.selClass] = 3;
                     this.winSound = S_Win2;
                     break loop1;
                  case 2:
                     this.showRes("Stars");
                     SD.classItems[SD.selClass] = this.createItem("rand",1);
                     SD.classSlots[SD.selClass] = ["star","star","star"];
                     SD.classLights[SD.selClass] = 3;
                     this.winSound = S_Win2;
                     break loop1;
                  case 3:
                     this.showRes("Guns");
                     SD.classItems[SD.selClass] = this.createItem("gun",0);
                     SD.classSlots[SD.selClass] = ["gun","gun","gun"];
                     SD.classLights[SD.selClass] = 2;
                     this.winSound = S_Win1;
                     break loop1;
                  case 4:
                     this.showRes("Attach");
                     SD.classItems[SD.selClass] = this.createItem("attach",0);
                     SD.classSlots[SD.selClass] = ["attach","attach","attach"];
                     SD.classLights[SD.selClass] = 2;
                     this.winSound = S_Win1;
                     break loop1;
                  case 5:
                     this.showRes("Armor");
                     SD.classItems[SD.selClass] = this.createItem("armor",0);
                     SD.classSlots[SD.selClass] = ["armor","armor","armor"];
                     SD.classLights[SD.selClass] = 2;
                     this.winSound = S_Win1;
                     break loop1;
                  case 6:
                     this.showRes("Sheep");
                     SD.classItems[SD.selClass] = this.createItem("sheep",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 7:
                     this.showRes("Wand");
                     SD.classItems[SD.selClass] = this.createItem("wand",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 8:
                     this.showRes("Saber");
                     SD.classItems[SD.selClass] = this.createItem("saber",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 9:
                     this.showRes("Hammer");
                     SD.classItems[SD.selClass] = this.createItem("hammer",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 10:
                     this.showRes("M4EX");
                     SD.classItems[SD.selClass] = this.createItem("m4ex",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 11:
                     this.showRes("Stinger");
                     SD.classItems[SD.selClass] = this.createItem("mp5k",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 12:
                     this.showRes("SKS");
                     SD.classItems[SD.selClass] = this.createItem("sks",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 13:
                     this.showRes("AWM");
                     SD.classItems[SD.selClass] = this.createItem("awm",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 14:
                     this.showRes("Extreme Gun");
                     SD.classItems[SD.selClass] = this.createItem("extreme gun",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
                     break loop1;
                  case 15:
                     this.showRes("Garbage");
                     SD.classItems[SD.selClass] = this.createItem("garbage",0);
                     SD.classSlots[SD.selClass] = ["star","seven","sfh"];
                     SD.classLights[SD.selClass] = 4;
                     this.winSound = S_Fart;
               }
               break;
            case 2:
               this.showRes("Money");
               this.resultType = "money";
               SD.classSlots[SD.selClass] = ["money","money","money"];
               SD.classLights[SD.selClass] = 2;
               this.winSound = S_Buy;
               break;
            case 3:
               this.showRes("Camo");
               this.resultType = "camo";
               SD.classSlots[SD.selClass] = ["camo","camo","camo"];
               SD.classLights[SD.selClass] = 2;
               this.winSound = S_Win2;
               break;
            case 4:
               this.showRes("Crap");
               this.resultType = "item";
               SD.classItems[SD.selClass] = this.createItem("crap",0);
               SD.classSlots[SD.selClass] = ["skull","skull","skull"];
               SD.classLights[SD.selClass] = 1;
               this.winSound = S_Fart;
         }
      }
      
      private function showRes(param1:String) : void
      {
         this.txt_result.text += param1 + "\n";
      }
      
      private function giveResult() : void
      {
         SH.playSound(this.winSound);
         var _loc1_:* = this.resultType;
         switch("money" !== _loc1_ ? ("camo" === _loc1_ ? 1 : ("pitem" !== _loc1_ ? ("item" === _loc1_ ? 3 : 4) : 2)) : 0)
         {
            case 0:
               SD.getSelCass().funds = SD.getSelCass().funds + int(this.cost * 3);
               if(SD.getSelCass().funds > 99999999)
               {
                  SD.getSelCass().funds = 99999999;
               }
               this.menu.sellwindow.setError("获得物资","您赢得了" + UT.addNumCommas(int(this.cost * 3)) + "龙门币！");
               break;
            case 1:
               this.menu.sellwindow.setError("迷彩涂装解锁","迷彩涂装存储序列已更新！\n请前往“外观”界面查看");
               ++SD.getSelCass().unlockCamo;
               if(SD.getSelCass().unlockCamo != 20)
               {
                  break;
               }
               Stats_Achievements.setAchievement("camo");
               break;
            case 2:
               AGI.submitQuest("jackpot_slot");
               SD.getSelCass().funds = SD.getSelCass().funds + int(this.cost * 10);
               if(SD.getSelCass().funds > 99999999)
               {
                  SD.getSelCass().funds = 99999999;
               }
               this.menu.sellwindow.setError("彩光！","您赢得了" + UT.addNumCommas(int(this.cost * 10)) + "龙门币！\n和一把举世无双的武器！");
               this.menu.slotlid.gotoAndPlay("open");
               break;
            case 3:
               this.menu.slotlid.gotoAndPlay("open");
         }
         this.menu.Init();
      }
      
      public function removedItem() : void
      {
         SD.classItems[SD.selClass] = null;
         this.menu.slotlid.gotoAndPlay("close");
      }
      
      private function createItem(param1:String, param2:int) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         if(param1 == "rand")
         {
            param1 = UT.randEl(["primary","gun","gun","gun","gun","gun","gun","gun","gun","gun","gun","attach","armor"]);
         }
         var _loc5_:* = param1;
         switch("primary" !== _loc5_ ? ("gun" !== _loc5_ ? ("sheep" !== _loc5_ ? ("wand" === _loc5_ ? 3 : ("saber" === _loc5_ ? 4 : ("hammer" === _loc5_ ? 5 : ("m4ex" === _loc5_ ? 6 : ("mp5k" === _loc5_ ? 7 : ("sks" === _loc5_ ? 8 : ("awm" === _loc5_ ? 9 : ("extreme gun" === _loc5_ ? 10 : ("garbage" === _loc5_ ? 11 : ("attach" !== _loc5_ ? ("armor" !== _loc5_ ? ("crap" !== _loc5_ ? 15 : 14) : 13) : 12)))))))))) : 2) : 1) : 0)
         {
            case 0:
               while((_loc4_ = UT.randEl(Stats_Classes.getClass(SD.selClass).weaponTypes)) == 0)
               {
               }
               _loc3_ = Inventory_Gun.createInventoryItem(Stats_Guns.getRandItemId(_loc4_),SD.getSelCass().level,Stats_Misc.getRandRarity(param2));
               this.showRes("Item type: " + _loc4_);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 1:
               _loc4_ = UT.randEl(Stats_Classes.getClass(SD.selClass).weaponTypes);
               _loc3_ = Inventory_Gun.createInventoryItem(Stats_Guns.getRandItemId(_loc4_),SD.getSelCass().level,Stats_Misc.getRandRarity(param2));
               this.showRes("Item : " + _loc3_.id);
               break;
            case 2:
               _loc3_ = Inventory_Gun.createInventoryItem("Sheep",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 3:
               _loc3_ = Inventory_Gun.createInventoryItem("Wand",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 4:
               _loc3_ = Inventory_Gun.createInventoryItem("Saber",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 5:
               _loc3_ = Inventory_Gun.createInventoryItem("Hammer",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 6:
               _loc3_ = Inventory_Gun.createInventoryItem("M4EX",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 7:
               _loc3_ = Inventory_Gun.createInventoryItem("Stinger",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 8:
               _loc3_ = Inventory_Gun.createInventoryItem("SKS",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 9:
               _loc3_ = Inventory_Gun.createInventoryItem("AWM",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 10:
               _loc3_ = Inventory_Gun.createInventoryItem("Extreme Gun",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 11:
               _loc3_ = Inventory_Gun.createInventoryItem("Garbage",SD.getSelCass().level,4);
               this.showRes("Item : " + _loc3_.id);
               break;
            case 12:
               while((_loc4_ = UT.randEl(Stats_Classes.getClass(SD.selClass).weaponTypes)) == 0)
               {
               }
               _loc3_ = Inventory_Attachment.createInventoryItem(Stats_Attachments.getRandItemId(_loc4_),SD.getSelCass().level,Stats_Misc.getRandRarity(param2));
               this.showRes("Item : " + _loc3_.id);
               break;
            case 13:
               _loc3_ = Inventory_Armor.createInventoryItem(Stats_Armor.getRandItemId(SD.selClass),SD.getSelCass().level,Stats_Misc.getRandRarity(param2));
               this.showRes("Item : " + _loc3_.id);
               break;
            case 14:
               _loc3_ = Inventory_Armor.createInventoryItem(UT.randEl(Stats_Armor.typeAr[0]).id,SD.getSelCass().level,UT.irand(-2,2));
               this.showRes("Item : " + _loc3_.id);
         }
         return _loc3_;
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
