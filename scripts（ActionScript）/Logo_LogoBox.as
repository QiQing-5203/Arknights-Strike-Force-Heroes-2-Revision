package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Logo_LogoBox extends MovieClip
   {
       
      
      public var btn:SimpleButton;
      
      private var armorButton:Boolean;
      
      private var alwaysEnable:Boolean;
      
      public function Logo_LogoBox()
      {
         super();
         if(name != "logo1")
         {
            if(name == "logo2")
            {
               this.armorButton = !Main.ARMORFIRST;
            }
         }
         else
         {
            this.armorButton = Main.ARMORFIRST;
         }
         if(name != "logo1b")
         {
            if(name == "logo2b")
            {
               this.alwaysEnable = true;
               this.armorButton = !Main.ARMORFIRST;
            }
         }
         else
         {
            this.alwaysEnable = true;
            this.armorButton = Main.ARMORFIRST;
         }
         if(!this.armorButton)
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(1);
         }
         if(!this.alwaysEnable)
         {
            if(!this.armorButton && Main.SPONSORSITE && Main.ARMORFIRST)
            {
               this.btn.enabled = false;
            }
            else if(this.armorButton && Main.SPONSORSITE && !Main.ARMORFIRST)
            {
               this.btn.enabled = false;
            }
            else
            {
               this.btn.addEventListener(MouseEvent.CLICK,this.MouseClick,false,0,true);
            }
         }
         else
         {
            this.btn.addEventListener(MouseEvent.CLICK,this.MouseClick,false,0,true);
         }
      }
      
      private function MouseClick(param1:Event) : void
      {
         if(!this.armorButton)
         {
            SD.urlNotDoppler();
         }
         else
         {
            SD.urlArmor();
         }
      }
   }
}
