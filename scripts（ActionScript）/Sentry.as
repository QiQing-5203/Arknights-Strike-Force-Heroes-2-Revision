package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class Sentry extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var head:MovieClip;
      
      public var mc_hp:MovieClip;
      
      public var txt_name:TextField;
      
      public var txt_level:TextField;
      
      public function Sentry()
      {
         super();
         addFrameScript(0,this.frame1,67,this.frame68);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         gotoAndPlay("idle");
      }
   }
}
