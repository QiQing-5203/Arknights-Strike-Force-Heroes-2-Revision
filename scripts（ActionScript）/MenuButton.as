package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class MenuButton extends MovieClip
   {
       
      
      public var hitbox:MovieClip;
      
      public var txt_word:TextField;
      
      private var id:String;
      
      private var menu:Menu;
      
      public function MenuButton()
      {
         super();
         addFrameScript(1,this.frame2,11,this.frame12,16,this.frame17);
         this.id = name.split("_").join(" ");
         this.txt_word.text = this.id.toUpperCase();
         buttonMode = true;
         this.hitbox.addEventListener(MouseEvent.MOUSE_OVER,this.MouseOver,false,0,true);
         this.hitbox.addEventListener(MouseEvent.MOUSE_OUT,this.MouseOut,false,0,true);
         this.hitbox.addEventListener(MouseEvent.CLICK,this.MouseClick,false,0,true);
         this.menu = Menu(parent);
      }
      
      private function MouseOver(param1:Event) : void
      {
         SH.playSound(S_Click);
         gotoAndPlay("over");
      }
      
      private function MouseOut(param1:Event) : void
      {
         gotoAndPlay("out");
      }
      
      private function MouseClick(param1:Event) : void
      {
         this.menu.ClickButton(this.id);
      }
      
      function frame2() : *
      {
         stop();
         if(this.txt_word.text == "管理干员")
         {
            play();
         }
      }
      
      function frame12() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
   }
}
