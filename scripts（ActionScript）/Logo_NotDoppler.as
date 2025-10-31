package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.KeyboardEvent;
   
   public class Logo_NotDoppler extends MovieClip
   {
       
      
      public var skip:SimpleButton;
      
      public var introbutton:SimpleButton;
      
      private var main:Main;
      
      public function Logo_NotDoppler(param1:Main, param2:Object = null)
      {
         super();
         addFrameScript(188,this.frame189);
         this.main = param1;
         Main.visible = true;
         buttonMode = this.clickable();
         this.introbutton.visible = this.clickable();
         this.skip;
      }
      
      public function logoDone() : void
      {
         this.main.logoDopplerDone();
         stop();
      }
      
      public function MouseDown() : void
      {
         if(!(this.skip.visible && this.skip.hitTestPoint(mouseX,mouseY,false)))
         {
            if(this.clickable())
            {
               SD.urlNotDoppler(true);
            }
         }
         else
         {
            this.logoDone();
         }
      }
      
      public function clickable() : Boolean
      {
         return !Main.ARMORFIRST || !Main.SPONSORSITE;
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
      
      function frame189() : *
      {
         stop();
         this.logoDone();
      }
   }
}
