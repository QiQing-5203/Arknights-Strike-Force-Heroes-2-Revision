package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class MenuSideBox extends MovieClip
   {
       
      
      public var hitbox:MovieClip;
      
      public var txt_word:TextField;
      
      private var menu:Menu;
      
      private var returnScreen:String;
      
      public function MenuSideBox()
      {
         super();
         addFrameScript(0,this.frame1);
         buttonMode = true;
         this.hitbox.addEventListener(MouseEvent.MOUSE_OVER,this.MouseOver,false,0,true);
         this.hitbox.addEventListener(MouseEvent.MOUSE_OUT,this.MouseOut,false,0,true);
         this.hitbox.addEventListener(MouseEvent.CLICK,this.MouseClick,false,0,true);
         this.menu = Menu(parent);
      }
      
      public function setReturn(param1:String) : void
      {
         this.returnScreen = param1;
         if(this.returnScreen != "main")
         {
            this.txt_word.text = this.returnScreen.toUpperCase();
         }
         else
         {
            this.txt_word.text = "返回主菜单";
         }
      }
      
      private function MouseOver(param1:Event) : void
      {
         gotoAndStop(2);
      }
      
      private function MouseOut(param1:Event) : void
      {
         gotoAndStop(1);
      }
      
      private function MouseClick(param1:Event) : void
      {
         if(!this.menu.buyMode)
         {
            SH.playSound(S_ClickBack);
            this.menu.ClickButton(this.returnScreen,false);
            return;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
