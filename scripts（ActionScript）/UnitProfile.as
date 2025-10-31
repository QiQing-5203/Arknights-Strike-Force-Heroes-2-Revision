package
{
   import flash.display.MovieClip;
   
   public class UnitProfile extends MovieClip
   {
       
      
      public var body:MovieClip;
      
      public var legup2:MovieClip;
      
      public var foot1:MovieClip;
      
      public var foot2:MovieClip;
      
      public var arm1:MovieClip;
      
      public var head:MovieClip;
      
      public var arm2:MovieClip;
      
      public var leglow1:MovieClip;
      
      public var leglow2:MovieClip;
      
      public var legup1:MovieClip;
      
      public var curHead:uint;
      
      public var curBody:uint;
      
      public var curCamo:uint;
      
      private var curAnim:String;
      
      private var primary:Stats_Guns;
      
      private var primaryAttach:Stats_Attachments;
      
      public function UnitProfile()
      {
         super();
         addFrameScript(97,this.frame98,150,this.frame151,248,this.frame249,353,this.frame354,434,this.frame435);
         this.curHead = 1;
         this.curBody = 1;
         this.curCamo = 1;
      }
      
      public function goto(param1:String) : void
      {
         if(param1 != this.curAnim)
         {
            this.curAnim = param1;
            gotoAndPlay(this.curAnim);
            return;
         }
      }
      
      public function setWeaponSprite(param1:MovieClip) : void
      {
         param1.gotoAndStop(this.primary.sprite);
         Stats_Attachments.display(param1,this.primaryAttach);
      }
      
      public function setClip(param1:MovieClip) : void
      {
         param1.visible = false;
         var _loc2_:uint = 0;
         while(_loc2_ < param1.currentLabels.length)
         {
            if(param1.currentLabels[_loc2_].name == this.primary.sprite)
            {
               param1.visible = true;
               param1.gotoAndStop(this.primary.sprite);
            }
            _loc2_++;
         }
      }
      
      public function loadSkin() : void
      {
         this.curHead = SD.getSelCass().head;
         this.curBody = SD.getSelCass().body;
         this.curCamo = SD.getSelCass().camo;
         this.setSkin();
         this.primary = SD.getSelCass().primary.createFinalItem();
         var _loc1_:Stats_Guns = SD.getSelCass().secondary.createFinalItem();
         this.arm1.gotoAndStop(this.primary.frameIdle);
         this.arm1.gun.gotoAndStop(this.primary.sprite);
         this.arm2.gotoAndStop(this.primary.frameIdle);
         this.body.gunside.visible = false;
         this.body.gunback.visible = false;
         this.body["gun" + _loc1_.unequip].visible = true;
         this.body["gun" + _loc1_.unequip].gotoAndStop(_loc1_.sprite);
         Stats_Attachments.display(this.arm1.gun);
         if(!this.primary.defaultTop)
         {
            this.arm1.gun.top.visible = false;
         }
         else
         {
            Stats_Attachments.display(this.arm1.gun,Stats_Attachments.createBasicItem(this.primary.defaultTop));
         }
         if(!SD.getSelCass().primaryAttach)
         {
            this.primaryAttach = null;
         }
         else
         {
            this.primaryAttach = Stats_Attachments.createFinalItem(SD.getSelCass().primaryAttach);
            Stats_Attachments.display(this.arm1.gun,this.primaryAttach);
         }
      }
      
      public function soldierFirstSkin() : void
      {
         this.curHead = 2;
         this.curBody = 3;
         this.curCamo = 20;
         this.setSkin();
         this.primary = Stats_Guns.itemOb["M4EX"];
         var _loc1_:Stats_Guns = Stats_Guns.itemOb["Katana"];
         this.arm1.gotoAndStop(this.primary.frameIdle);
         this.arm1.gun.gotoAndStop(this.primary.sprite);
         this.arm2.gotoAndStop(this.primary.frameIdle);
         this.body.gunside.visible = false;
         this.body.gunback.visible = false;
         this.body["gun" + _loc1_.unequip].visible = true;
         this.body["gun" + _loc1_.unequip].gotoAndStop(_loc1_.sprite);
         this.primaryAttach = Stats_Attachments.itemOb["HAMR"];
         Stats_Attachments.display(this.arm1.gun,this.primaryAttach);
      }
      
      public function setSkin() : void
      {
         this.setPart(this.head,this.curHead);
         this.setPart(this.body,this.curBody);
         this.setPart(this.arm2.armup2,this.curBody);
         this.setPart(this.arm2.armlow2,this.curBody);
         this.setPart(this.arm2.hand2,this.curBody);
         this.setPart(this.arm1.armup1,this.curBody);
         this.setPart(this.arm1.armlow1,this.curBody);
         this.setPart(this.arm1.hand1,this.curBody);
         this.setPart(this.legup1,this.curBody);
         this.setPart(this.legup2,this.curBody);
         this.setPart(this.leglow1,this.curBody);
         this.setPart(this.leglow2,this.curBody);
         this.setPart(this.foot1,this.curBody);
         this.setPart(this.foot2,this.curBody);
      }
      
      public function setPart(param1:MovieClip, param2:uint) : void
      {
         param1.gotoAndStop(param2 + Stats_Classes.getClass(SD.selClass).startFrame);
         if(param1.camo)
         {
            param1.camo.gotoAndStop(this.curCamo);
         }
      }
      
      function frame98() : *
      {
         gotoAndPlay("idle1");
      }
      
      function frame151() : *
      {
         gotoAndPlay("idle2");
      }
      
      function frame249() : *
      {
         gotoAndPlay("idle3");
      }
      
      function frame354() : *
      {
         gotoAndPlay("idle4");
      }
      
      function frame435() : *
      {
         gotoAndPlay("idle5");
      }
   }
}
