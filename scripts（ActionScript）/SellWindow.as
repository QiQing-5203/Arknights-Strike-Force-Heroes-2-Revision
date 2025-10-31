package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class SellWindow extends MovieClip
   {
       
      
      public var mc_error:MovieClip;
      
      public var txt_for:TextField;
      
      public var txt_desc:TextField;
      
      public var txt_cost:TextField;
      
      public var txt_descError:TextField;
      
      public var mc_option1:MovieClip;
      
      public var txt_title:TextField;
      
      public var mc_option2:MovieClip;
      
      public var txt_item:TextField;
      
      public var txt_titleError:TextField;
      
      private var menu:Menu;
      
      private var item;
      
      private var inv;
      
      private var itemName:String;
      
      private var ready:Boolean;
      
      public function SellWindow()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,8,this.frame9,9,this.frame10);
         this.menu = Menu(parent);
         mouseEnabled = false;
      }
      
      public function EnterFrame() : void
      {
         if(this.ready)
         {
            if(this.mc_option1)
            {
               this.mc_option1.alpha = !this.mc_option1.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
            }
            if(this.mc_option2)
            {
               this.mc_option2.alpha = !this.mc_option2.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
            }
            if(this.mc_error)
            {
               this.mc_error.alpha = !this.mc_error.hitTestPoint(mouseX,mouseY,false) ? 0.5 : 1;
            }
            return;
         }
      }
      
      public function MouseDown() : void
      {
         if(this.ready)
         {
            if(Boolean(this.mc_option1) && this.mc_option1.hitTestPoint(mouseX,mouseY,false))
            {
               var _loc1_:* = this.mc_option1.txt_word.text;
               switch("出售" !== _loc1_ ? ("购买" !== _loc1_ ? ("拾取" === _loc1_ ? 2 : ("无法拾取" !== _loc1_ ? 4 : 3)) : 1) : 0)
               {
                  case 0:
                     SD.getSelCass().funds = SD.getSelCass().funds + this.menu.getCost(this.item);
                     if(SD.getSelCass().funds > 99999999)
                     {
                        SD.getSelCass().funds = 99999999;
                     }
                     Stats_Achievements.checkAchVariable("sell",this.menu.getCost(this.item));
                     if(this.inv is Inventory_Gun)
                     {
                        SD.getSelCass().gunInv.splice(SD.getSelCass().gunInv.indexOf(this.inv),1);
                     }
                     if(this.inv is Inventory_Attachment)
                     {
                        SD.getSelCass().attachInv.splice(SD.getSelCass().attachInv.indexOf(this.inv),1);
                     }
                     if(this.inv is Inventory_Armor)
                     {
                        SD.getSelCass().armorInv.splice(SD.getSelCass().armorInv.indexOf(this.inv),1);
                     }
                     SH.playSound(S_Buy);
                     this.end();
                     break;
                  case 1:
                     if(this.inv is Inventory_Gun)
                     {
                        if(SD.getSelCass().funds < this.menu.getCost(this.item,true))
                        {
                           this.setError("funds");
                           break;
                        }
                        if(SD.getSelCass().gunInv.length == 24)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().gunInv.push(this.inv);
                        SD.getSelCass().funds = SD.getSelCass().funds - this.menu.getCost(this.item,true);
                        Shop.classGunShops[SD.selClass][Shop.classGunShops[SD.selClass].indexOf(this.inv)] = null;
                     }
                     if(this.inv is Inventory_Attachment)
                     {
                        if(SD.getSelCass().funds < this.menu.getCost(this.item,true))
                        {
                           this.setError("funds");
                           break;
                        }
                        if(SD.getSelCass().attachInv.length == 12)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().attachInv.push(this.inv);
                        SD.getSelCass().funds = SD.getSelCass().funds - this.menu.getCost(this.item,true);
                        Shop.classOtherShops[SD.selClass][Shop.classOtherShops[SD.selClass].indexOf(this.inv)] = null;
                     }
                     if(this.inv is Inventory_Armor)
                     {
                        if(SD.getSelCass().funds < this.menu.getCost(this.item,true))
                        {
                           this.setError("funds");
                           break;
                        }
                        if(SD.getSelCass().armorInv.length == 6)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().armorInv.push(this.inv);
                        SD.getSelCass().funds = SD.getSelCass().funds - this.menu.getCost(this.item,true);
                        Shop.classOtherShops[SD.selClass][Shop.classOtherShops[SD.selClass].indexOf(this.inv)] = null;
                     }
                     SH.playSound(S_Buy);
                     this.end();
                     break;
                  case 2:
                     if(this.inv is Inventory_Gun)
                     {
                        if(SD.getSelCass().gunInv.length == 24)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().gunInv.push(this.inv);
                        this.menu.slotmachine.removedItem();
                     }
                     if(this.inv is Inventory_Attachment)
                     {
                        if(SD.getSelCass().attachInv.length == 12)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().attachInv.push(this.inv);
                        this.menu.slotmachine.removedItem();
                     }
                     if(this.inv is Inventory_Armor)
                     {
                        if(SD.getSelCass().armorInv.length == 6)
                        {
                           this.setError("full");
                           break;
                        }
                        SD.getSelCass().armorInv.push(this.inv);
                        this.menu.slotmachine.removedItem();
                     }
                     this.end();
                     break;
                  case 3:
                     this.end();
               }
            }
            if(Boolean(this.mc_option2) && this.mc_option2.hitTestPoint(mouseX,mouseY,false))
            {
               _loc1_ = this.mc_option2.txt_word.text;
               switch("取消" !== _loc1_ ? ("出售" !== _loc1_ ? 2 : 1) : 0)
               {
                  case 0:
                     this.end();
                     break;
                  case 1:
                     SD.getSelCass().funds = SD.getSelCass().funds + this.menu.getCost(this.item);
                     if(SD.getSelCass().funds > 99999999)
                     {
                        SD.getSelCass().funds = 99999999;
                     }
                     Stats_Achievements.checkAchVariable("sell",this.menu.getCost(this.item));
                     this.menu.slotmachine.removedItem();
                     this.end();
                     SH.playSound(S_Buy);
               }
            }
            if(Boolean(this.mc_error) && this.mc_error.hitTestPoint(mouseX,mouseY,false))
            {
               this.endError();
            }
            return;
         }
      }
      
      public function setError(param1:String, param2:String = "") : void
      {
         this.menu.buyMode = true;
         gotoAndStop("error");
         visible = true;
         this.menu.misc_info.visible = false;
         this.menu.gun_info.visible = false;
         var _loc3_:* = param1;
         switch("funds" !== _loc3_ ? ("full" === _loc3_ ? 1 : 2) : 0)
         {
            case 0:
               this.txt_titleError.text = "龙门币不足";
               this.txt_descError.text = "您没有足够的龙门币进行此操作\n请多出几趟任务";
               this.mc_error.txt_word.text = "妈的";
               SH.playSound(S_Error);
               break;
            case 1:
               this.txt_titleError.text = "装备库已满";
               this.txt_descError.text = "别老惦记着你那些垃圾装备了\n卖了会死是吧";
               this.mc_error.txt_word.text = "妈的";
               SH.playSound(S_Error);
               break;
            default:
               this.txt_titleError.text = param1;
               this.txt_descError.text = param2;
               this.mc_error.txt_word.text = "好的";
         }
      }
      
      private function endError() : void
      {
         this.ready = true;
         this.menu.buyMode = false;
         this.menu.Init();
         gotoAndStop(1);
      }
      
      private function end() : void
      {
         this.ready = true;
         this.menu.buyMode = false;
         this.menu.Init();
         gotoAndPlay("end");
         this.inv = null;
         this.item = null;
         this.itemName = "";
         SD.saveGame();
      }
      
      public function setWindow(param1:*, param2:String) : void
      {
         var _loc3_:Array = null;
         if(!this.menu.buyMode)
         {
            this.inv = param1;
            this.menu.buyMode = true;
            gotoAndPlay("start");
            visible = true;
            if(this.inv is Inventory_Gun)
            {
               this.item = Stats_Guns.createFinalItem(this.inv);
               this.menu.gun_info.x = 135;
               this.menu.gun_info.y = 250;
               _loc3_ = Stats_Guns.getEffectText(this.item);
               this.itemName = Stats_Misc.getRarity(this.inv.rarity).name + _loc3_.shift() + this.item.name;
            }
            if(this.inv is Inventory_Attachment)
            {
               this.item = Stats_Attachments.createFinalItem(this.inv);
               this.menu.misc_info.x = 570;
               this.menu.misc_info.y = 255;
               _loc3_ = Stats_Attachments.getEffectText(this.item);
               this.itemName = Stats_Misc.getRarity(this.inv.rarity).name + _loc3_.shift() + this.item.name;
            }
            if(this.inv is Inventory_Armor)
            {
               this.item = Stats_Armor.createFinalItem(this.inv);
               this.menu.misc_info.x = 570;
               this.menu.misc_info.y = 255;
               _loc3_ = Stats_Armor.getEffectText(this.item);
               this.itemName = Stats_Misc.getRarity(this.inv.rarity).name + _loc3_.shift() + this.item.name;
            }
            var _loc4_:* = param2;
            switch("sell" !== _loc4_ ? ("buy" === _loc4_ ? 1 : ("takeslot" !== _loc4_ ? ("sellslot" !== _loc4_ ? 4 : 3) : 2)) : 0)
            {
               case 0:
                  this.txt_title.text = "出售";
                  this.txt_desc.text = "您确定要出售：";
                  this.txt_item.text = this.itemName;
                  this.txt_item.textColor = Stats_Misc.getRarity(param1.rarity).color;
                  this.txt_for.text = "价值";
                  this.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item));
                  this.mc_option1.txt_word.text = "出售";
                  this.mc_option2.txt_word.text = "取消";
                  break;
               case 1:
                  this.txt_title.text = "购买";
                  this.txt_desc.text = "您确定要购买：";
                  this.txt_item.text = this.itemName;
                  this.txt_item.textColor = Stats_Misc.getRarity(param1.rarity).color;
                  this.txt_for.text = "花费";
                  this.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item,true));
                  this.mc_option1.txt_word.text = "购买";
                  this.mc_option2.txt_word.text = "取消";
                  break;
               case 2:
                  this.txt_title.text = "拾取";
                  this.txt_desc.text = "您确定要拾取：";
                  this.txt_item.text = this.itemName;
                  this.txt_item.textColor = Stats_Misc.getRarity(param1.rarity).color;
                  this.txt_for.text = "或者出售获得";
                  this.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item));
                  this.mc_option1.txt_word.text = "拾取";
                  this.mc_option2.txt_word.text = "出售";
                  break;
               case 3:
                  this.txt_title.text = "拾取";
                  this.txt_desc.text = "这是什么勾扒？？";
                  this.txt_item.text = this.itemName;
                  this.txt_item.textColor = Stats_Misc.getRarity(param1.rarity).color;
                  this.txt_for.text = "出售获得";
                  this.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item));
                  this.mc_option1.txt_word.text = "无法拾取";
                  this.mc_option2.txt_word.text = "出售";
            }
            return;
         }
      }
      
      function frame1() : *
      {
         stop();
         visible = false;
      }
      
      function frame6() : *
      {
         stop();
         this.ready = true;
      }
      
      function frame9() : *
      {
         gotoAndStop(1);
      }
      
      function frame10() : *
      {
         this.ready = true;
      }
   }
}
