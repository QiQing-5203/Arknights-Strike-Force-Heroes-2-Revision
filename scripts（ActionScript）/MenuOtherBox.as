package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class MenuOtherBox extends MovieClip
   {
       
      
      public var mc_sell:MovieClip;
      
      public var rarity:MovieClip;
      
      public var hitbox:MovieClip;
      
      public var lock:MovieClip;
      
      public var txt_level:TextField;
      
      public var mc:MovieClip;
      
      private var menu:Menu;
      
      public var inv;
      
      public var item;
      
      public var shit:Boolean;
      
      private var fullPrice:Boolean;
      
      public var lowLevel:Boolean;
      
      public function MenuOtherBox()
      {
         super();
      }
      
      public function setItem(param1:*, param2:Menu, param3:Boolean = false) : void
      {
         this.menu = param2;
         if(param1)
         {
            this.fullPrice = param3;
            this.inv = param1;
            this.item = this.inv.createFinalItem();
            if(this.item is Stats_Armor)
            {
               this.shit = this.item.shit;
            }
            if(this.item is Stats_Attachments)
            {
               this.shit = false;
            }
            visible = true;
            buttonMode = true;
            gotoAndStop(1);
            this.mc.visible = true;
            this.mc.gotoAndStop(this.item.sprite);
            this.txt_level.text = "LV " + this.inv.level;
            this.rarity.gotoAndStop(this.inv.rarity + 5);
            this.mc_sell.visible = false;
            this.mc_sell.buttonMode = true;
            this.mc_sell.mouseEnabled = true;
            this.txt_level.mouseEnabled = false;
            if(this.inv.level <= SD.getSelCass().level)
            {
               this.lowLevel = false;
               this.txt_level.textColor = 16763904;
               this.lock.visible = false;
            }
            else
            {
               this.lowLevel = true;
               this.txt_level.textColor = 16724736;
               this.lock.visible = true;
            }
            return;
         }
         this.inv = null;
         this.item = null;
         this.mc.visible = false;
         buttonMode = false;
         gotoAndStop(1);
         this.txt_level.text = "";
         this.rarity.gotoAndStop(1);
         this.mc_sell.visible = false;
         this.lock.visible = false;
      }
      
      public function equip(param1:uint) : void
      {
         gotoAndStop(param1);
         buttonMode = false;
         this.mc_sell.visible = false;
         if(this.inv is Inventory_Attachment)
         {
            buttonMode = true;
         }
      }
      
      public function showInfo() : void
      {
         this.menu.misc_info.x = x;
         this.menu.misc_info.y = y;
         if(this.menu.misc_info.y > 445)
         {
            this.menu.misc_info.y = 445;
         }
         if(!(this.inv is Inventory_Attachment))
         {
            if(this.inv is Inventory_Armor)
            {
               this.showArmor();
            }
         }
         else
         {
            this.showAttach();
         }
      }
      
      public function showAttach() : void
      {
         var _loc1_:Array = Stats_Attachments.getEffectText(this.item);
         var _loc2_:String = _loc1_.shift();
         this.menu.misc_info.txt_extra.text = _loc1_.join("\n");
         this.menu.misc_info.gotoAndStop(_loc1_.length >= 1 ? _loc1_.length : 1);
         this.menu.misc_info.txt_name.text = Stats_Misc.getRarity(this.inv.rarity,true).name + _loc2_ + this.item.name;
         this.menu.misc_info.txt_name.textColor = Stats_Misc.getRarity(this.inv.rarity).color;
         this.menu.misc_info.txt_level.text = "等级 " + this.inv.level;
         if(!this.lowLevel)
         {
            this.menu.misc_info.txt_level.textColor = 13421772;
         }
         else
         {
            this.menu.misc_info.txt_level.textColor = 16724736;
         }
         this.menu.misc_info.txt_type.text = Stats_Misc.getGunName(this.item.type).toUpperCase();
         this.menu.misc_info.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item,this.fullPrice));
         this.menu.misc_info.mc.visible = true;
         this.menu.misc_info.mc.gotoAndStop(this.item.sprite);
         this.menu.misc_info.rarity.gotoAndStop(5 + this.inv.rarity);
         this.menu.misc_info.stat_icon.visible = false;
         this.menu.misc_info.txt_stats.text = "";
         this.menu.misc_info.arrow0.visible = false;
      }
      
      public function showArmor() : void
      {
         var _loc1_:Array = Stats_Armor.getEffectText(this.item);
         var _loc2_:String = _loc1_.shift();
         this.menu.misc_info.txt_extra.text = _loc1_.join("\n");
         this.menu.misc_info.gotoAndStop(_loc1_.length >= 1 ? _loc1_.length : 1);
         this.menu.misc_info.txt_name.text = Stats_Misc.getRarity(this.inv.rarity,true).name + _loc2_ + this.item.name;
         this.menu.misc_info.txt_name.textColor = Stats_Misc.getRarity(this.inv.rarity).color;
         this.menu.misc_info.txt_level.text = "等级 " + this.inv.level;
         if(!this.lowLevel)
         {
            this.menu.misc_info.txt_level.textColor = 13421772;
         }
         else
         {
            this.menu.misc_info.txt_level.textColor = 16724736;
         }
         this.menu.misc_info.txt_type.text = this.shit ? "收藏品" : "护甲";
         this.menu.misc_info.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item,this.fullPrice));
         this.menu.misc_info.mc.visible = true;
         this.menu.misc_info.mc.gotoAndStop(this.item.sprite);
         this.menu.misc_info.rarity.gotoAndStop(5 + this.inv.rarity);
         this.menu.misc_info.stat_icon.visible = !this.shit;
         this.menu.misc_info.stat_icon.gotoAndStop("tank");
         this.menu.misc_info.txt_stats.text = this.shit ? "" : this.item.armor;
         this.menu.misc_info.arrow0.visible = !this.shit;
         var _loc3_:Stats_Armor = SD.getSelCass().armor.createFinalItem();
         this.menu.setCompareArrow(this.menu.misc_info.arrow0,this.item.armor,_loc3_.armor);
      }
   }
}
