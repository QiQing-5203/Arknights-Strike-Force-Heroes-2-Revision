package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class Turret extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var head:MovieClip;
      
      public var mc_hp:MovieClip;
      
      public var txt_name:TextField;
      
      public var txt_level:TextField;
      
      public function Turret()
      {
         super();
         addFrameScript(0,this.frame1,63,this.frame64);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         gotoAndPlay("idle");
      }
   }
}
