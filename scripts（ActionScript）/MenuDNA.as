package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class MenuDNA extends MovieClip
   {
       
      
      private var spd:Number;
      
      private var size:Number;
      
      public function MenuDNA()
      {
         super();
         addEventListener(Event.ENTER_FRAME,this.EnterFrame,false,0,true);
         this.reset();
         x = UT.rand(0,900);
      }
      
      private function reset() : void
      {
         x = 1000;
         y = UT.rand(75,550);
         alpha = UT.rand(0.1,0.25);
         this.spd = UT.rand(0.3,0.5);
         this.size = UT.rand(0.5,0.9);
         scaleX = scaleY = this.size;
      }
      
      public function EnterFrame(param1:Event) : void
      {
         x -= this.spd;
         if(x < -250)
         {
            this.reset();
         }
      }
   }
}
