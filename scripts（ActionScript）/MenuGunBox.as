package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class MenuGunBox extends MovieClip
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
      
      private var fullPrice:Boolean;
      
      public var lowLevel:Boolean;
      
      public function MenuGunBox()
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
            visible = true;
            buttonMode = true;
            gotoAndStop(1);
            this.mc.visible = true;
            this.mc.gotoAndStop(this.item.sprite);
            this.txt_level.text = "等级 " + this.inv.level;
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
      }
      
      public function showInfo() : void
      {
         this.menu.gun_info.x = x;
         this.menu.gun_info.y = y;
         if(this.menu.gun_info.y > 445)
         {
            this.menu.gun_info.y = 445;
         }
         var _loc1_:Array = Stats_Guns.getEffectText(this.item);
         var _loc2_:String = _loc1_.shift();
         this.menu.gun_info.txt_extra.text = _loc1_.join("\n");
         this.menu.gun_info.gotoAndStop(_loc1_.length >= 1 ? _loc1_.length : 1);
         this.menu.gun_info.txt_name.text = Stats_Misc.getRarity(this.inv.rarity).name + _loc2_ + this.item.name;
         this.menu.gun_info.txt_name.textColor = Stats_Misc.getRarity(this.inv.rarity).color;
         this.menu.gun_info.txt_level.text = "等级 " + this.inv.level;
         if(!this.lowLevel)
         {
            this.menu.gun_info.txt_level.textColor = 13421772;
         }
         else
         {
            this.menu.gun_info.txt_level.textColor = 16724736;
         }
         if(this.item.type == 5 || this.item.type == 9)
         {
            this.menu.gun_info.txt_stats.text = UT.roundToDecimal(Number(this.item.dmg) * 5,1) + "\n";
         }
         else
         {
            this.menu.gun_info.txt_stats.text = UT.roundToDecimal(this.item.dmg,1) + "\n";
         }
         this.menu.gun_info.txt_stats.text += this.getAccuracy(this.item.recoil) + "%\n";
         this.menu.gun_info.txt_stats.text += Math.round(Number(this.item.range) * 0.5) + " ft\n";
         this.menu.gun_info.txt_stats.text += UT.roundToDecimal(1 / Number(this.item.shootDelay),1) + " rps\n";
         if(this.item.clipSize != 0)
         {
            if(this.item.clipSpare != 0)
            {
               this.menu.gun_info.txt_stats.text += this.item.clipSize + "x" + this.item.clipSpare + "\n";
            }
            else
            {
               this.menu.gun_info.txt_stats.text += this.item.clipSize + "\n";
            }
         }
         else
         {
            this.menu.gun_info.txt_stats.text += "-\n";
         }
         var _loc3_:String = Stats_Misc.getGunName(this.item.type).toUpperCase();
         if(this.item.extra.isMelee)
         {
            _loc3_ = "近战武器";
         }
         if(this.item.extra.isRangedMelee)
         {
            _loc3_ = "投掷武器";
         }
         this.menu.gun_info.txt_type.text = _loc3_ + "\n" + (this.item.type != 0 ? "主武器" : "副武器");
         this.menu.gun_info.txt_cost.text = "L" + UT.addNumCommas(this.menu.getCost(this.item,this.fullPrice));
         this.menu.gun_info.mc.gotoAndStop(this.item.sprite);
         this.menu.gun_info.rarity.gotoAndStop(5 + this.inv.rarity);
         var _loc4_:Stats_Guns = this.item.type == 0 ? SD.getSelCass().secondary.createFinalItem() : SD.getSelCass().primary.createFinalItem();
         this.menu.setCompareArrow(this.menu.gun_info.arrow0,!(this.item.type == 5 || this.item.type == 9) ? Number(this.item.dmg) : Number(this.item.dmg) * 5,!(_loc4_.type == 5 || _loc4_.type == 9) ? _loc4_.dmg : _loc4_.dmg * 5);
         this.menu.setCompareArrow(this.menu.gun_info.arrow1,this.item.recoil,_loc4_.recoil,true);
         this.menu.setCompareArrow(this.menu.gun_info.arrow2,this.item.range,_loc4_.range);
         this.menu.setCompareArrow(this.menu.gun_info.arrow3,this.item.shootDelay,_loc4_.shootDelay,true);
         this.menu.setCompareArrow(this.menu.gun_info.arrow4,this.item.clipSize,_loc4_.clipSize);
      }
      
      public function getAccuracy(param1:Number) : Number
      {
         var _loc2_:Number = 3 + (10 - param1) * 0.7;
         _loc2_ *= 10;
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         return Math.round(_loc2_);
      }
   }
}
