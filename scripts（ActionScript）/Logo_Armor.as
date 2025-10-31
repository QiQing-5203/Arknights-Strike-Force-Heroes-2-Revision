package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.KeyboardEvent;
   
   public class Logo_Armor extends MovieClip
   {
       
      
      public var skip:SimpleButton;
      
      private var main:Main;
      
      public function Logo_Armor(param1:Main, param2:Object = null)
      {
         super();
         addFrameScript(206,this.frame207);
         this.main = param1;
         Main.visible = true;
         buttonMode = this.clickable();
         this.skip;
      }
      
      public function logoDone() : void
      {
         this.main.logoArmorDone();
         stop();
      }
      
      public function MouseDown() : void
      {
         if(!(this.skip.visible && this.skip.hitTestPoint(mouseX,mouseY,false)))
         {
            if(this.clickable())
            {
               SD.urlArmor(true);
            }
         }
         else
         {
            this.logoDone();
         }
      }
      
      public function clickable() : Boolean
      {
         return !Main.SPONSORSITE;
      }
      
      public function MouseUp() : void
      {
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function KeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function flashActivate() : void
      {
      }
      
      public function flashDeactivate() : void
      {
      }
      
      public function EnterFrame() : void
      {
      }
      
      function frame207() : *
      {
         this.logoDone();
      }
   }
}
