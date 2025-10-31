package
{
   import flash.geom.ColorTransform;
   
   public class Killstreak
   {
       
      
      protected var game:Game;
      
      public var unit;
      
      protected var maxWidth:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public var shootable:Boolean;
      
      protected var target;
      
      public var fc:uint = 0;
      
      protected var shootTimer:uint = 0;
      
      protected var timer:uint = 0;
      
      protected var gun:Stats_Guns;
      
      protected var gunName:String;
      
      protected var MC;
      
      private var hpCur:Number;
      
      private var hpMax:Number;
      
      private var healthBar:Range;
      
      public var dead:Boolean = false;
      
      private var hpBarDist:Number;
      
      public function Killstreak(param1:Game, param2:*, param3:Number, param4:String, param5:Boolean)
      {
         super();
         this.game = param1;
         this.unit = param2;
         this.timer = param3;
         this.shootable = param5;
         this.gunName = param4;
         this.gun = Stats_Guns.createBasicItem(this.gunName,this.unit.unitInfo.level);
      }
      
      public function setText(param1:*) : void
      {
         if(this.shootable)
         {
            param1.icon.gotoAndStop(this.gunName);
            param1.txt_level.text = this.unit.unitInfo.level;
            param1.txt_name.text = this.unit.name;
            var _loc2_:* = new ColorTransform();
            _loc2_.color = this.unit.status.healthColor;
            param1.icon.transform.colorTransform = _loc2_;
            param1.icon.alpha = 0.7;
            param1.txt_level.transform.colorTransform = _loc2_;
            param1.txt_level.alpha = 0.7;
            param1.txt_name.transform.colorTransform = _loc2_;
            param1.txt_name.alpha = 0.7;
            this.hpCur = this.hpMax = Stats_Misc.getStreakHealth(this.unit.unitInfo.level,this.gun.costMod);
            this.healthBar = new Range(0,35 + this.hpMax * 0.05);
            this.healthBar.cur = this.healthBar.max;
            this.hpBarDist = this.hpMax / 25;
            trace("HP Bar amount",this.hpBarDist,"with max health",this.hpMax);
            this.hpBarDist = this.healthBar.max / this.hpBarDist;
            this.setBars();
            return;
         }
      }
      
      public function damage(param1:Number, param2:Unit, param3:Stats_Guns, param4:Object, param5:Boolean = false) : void
      {
         if(this.shootable)
         {
            this.hpCur -= param1;
            if(this.unit != param2)
            {
               if(!this.unit.human)
               {
                  if(MatchSettings.isCampaign && !this.unit.human && !param2.human)
                  {
                     param1 *= 0.4 + param2.diff * 0.03;
                  }
                  else if(!this.unit.human && !param2.human)
                  {
                     param1 *= 0.6 + param2.diff * 0.04;
                  }
               }
               else
               {
                  param1 *= 0.3 + param2.diff * 0.07;
               }
            }
            else if(param3.extra.noAllyDmg)
            {
               param1 *= 0.4;
            }
            if(this.hpCur <= 0)
            {
               this.hpCur = 0;
               this.end(true);
            }
            this.setBars();
            return;
         }
      }
      
      public function setBars() : void
      {
         var _loc3_:Number = NaN;
         this.healthBar.cur = this.hpCur / this.hpMax * this.healthBar.max;
         this.MC.mc_hp.graphics.clear();
         this.MC.mc_hp.graphics.beginFill(16777113,1);
         this.MC.mc_hp.graphics.drawRect(this.healthBar.min,0,this.healthBar.cur,3);
         this.MC.mc_hp.graphics.endFill();
         var _loc1_:* = true;
         var _loc2_:uint = this.hpBarDist;
         while(_loc2_ < this.healthBar.cur)
         {
            if(_loc1_)
            {
               _loc3_ = this.hpBarDist;
               if(_loc2_ + this.hpBarDist > this.healthBar.cur)
               {
                  _loc3_ = this.healthBar.cur - _loc2_;
               }
               this.MC.mc_hp.graphics.beginFill(0,0.2);
               this.MC.mc_hp.graphics.drawRect(_loc2_,0,_loc3_,3);
               this.MC.mc_hp.graphics.endFill();
            }
            _loc1_ = !_loc1_;
            _loc2_ += this.hpBarDist;
         }
      }
      
      public function end(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.unit.endKillstreak();
         }
         if(this.MC)
         {
            this.game.unitCont.removeChild(this.MC);
         }
         this.game.killstreaks.splice(this.game.killstreaks.indexOf(this),1);
      }
      
      protected function hitTestWall(param1:Number = 0, param2:Number = 0) : Boolean
      {
         var _loc3_:uint = this.game.arena.wall.getPixel32(this.x + param1,this.y + param2);
         return Boolean(_loc3_) && _loc3_.toString(16).substring(0,2) == "ff";
      }
   }
}
