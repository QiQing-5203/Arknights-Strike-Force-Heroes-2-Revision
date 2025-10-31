package
{
   import flash.geom.Point;
   
   public class Bullet_Line_Laser extends Bullet
   {
       
      
      private var line1:Array;
      
      private var line2:Array;
      
      public function Bullet_Line_Laser(param1:Game, param2:Unit, param3:Number, param4:Number, param5:Number, param6:Number, param7:Stats_Guns, param8:Object = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,false,param8);
         this.line1 = [new Point(ox,oy)];
         this.line2 = [new Point(ox,oy)];
         var _loc9_:uint = 0;
         while(_loc9_ < uint(maxDist / 10))
         {
            x += xVel;
            y += yVel;
            this.line1.push(new Point(x + UT.rand(-1,1),y + UT.rand(-1,1)));
            this.line2.push(new Point(x + UT.rand(-1,1),y + UT.rand(-1,1)));
            if(hitObject = hitTestAll())
            {
               break;
            }
            _loc9_++;
         }
         doHitEffect();
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         game.lineCont.graphics.lineStyle(stats.params[0],stats.params[1],stats.params[2]);
         game.lineCont.graphics.moveTo(this.line1[0].x,this.line1[0].y);
         _loc1_ = 1;
         while(_loc1_ < this.line1.length)
         {
            this.line1[_loc1_].x += UT.rand(-1,1);
            this.line1[_loc1_].y += UT.rand(-1,1);
            game.lineCont.graphics.lineTo(this.line1[_loc1_].x,this.line1[_loc1_].y);
            _loc1_++;
         }
         game.lineCont.graphics.lineStyle(stats.params[3],stats.params[4],stats.params[5]);
         game.lineCont.graphics.moveTo(this.line2[0].x,this.line2[0].y);
         _loc1_ = 1;
         while(_loc1_ < this.line2.length)
         {
            this.line2[_loc1_].x += UT.rand(-1,1);
            this.line2[_loc1_].y += UT.rand(-1,1);
            game.lineCont.graphics.lineTo(this.line2[_loc1_].x,this.line2[_loc1_].y);
            _loc1_++;
         }
         removeMe();
      }
   }
}
