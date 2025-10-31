package
{
   public class Effect
   {
       
      
      private var game:Game;
      
      public var remove:Boolean;
      
      private var name:String;
      
      private var sub:String;
      
      private var x:Number;
      
      private var y:Number;
      
      private var stats:Object;
      
      private var frame:uint;
      
      private var rotation:uint;
      
      public function Effect(param1:Game, param2:Number, param3:Number, param4:String, param5:String, param6:uint)
      {
         super();
         this.game = param1;
         this.x = param2;
         this.y = param3;
         this.name = param4;
         this.sub = param5;
         this.stats = BH.getBitAniStats(this.name + 0,this.sub);
         this.rotation = UT.irand(0,this.stats.rotAmt - 1);
         this.frame = param6;
         this.name += this.rotation;
      }
      
      public function EnterFrame() : void
      {
         if(!this.remove)
         {
            this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
            ++this.frame;
            if(this.frame > this.stats.frames)
            {
               this.remove = true;
            }
            return;
         }
      }
   }
}
