package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Radar extends Sprite
   {
       
      
      public var radarcont:MovieClip;
      
      private var game:Game;
      
      private var bmp:Bitmap;
      
      private var dotbmp:Bitmap;
      
      private var data:BitmapData;
      
      private var dotdata:BitmapData;
      
      private var dotRect:Rectangle;
      
      private var scale:Number;
      
      public function Radar(param1:Game, param2:MovieClip)
      {
         super();
         this.game = param1;
         x = Main.WIDTH - 160;
         y = 0;
         this.scale = 0.1;
         this.data = new BitmapData(2880 * this.scale,2880 * this.scale,true,0);
         this.bmp = new Bitmap(this.data);
         this.radarcont.addChild(this.bmp);
         this.dotdata = new BitmapData(160,120,true,0);
         this.dotbmp = new Bitmap(this.dotdata);
         addChild(this.dotbmp);
         this.dotRect = new Rectangle(0,0,160,120);
         var _loc3_:Matrix = new Matrix();
         _loc3_.scale(this.scale,this.scale);
         Main.STAGE.quality = "high";
         param2.gotoAndStop(50);
         this.data.draw(param2,_loc3_);
         param2.gotoAndStop(1);
      }
      
      public function EnterFrame() : void
      {
         var _loc2_:uint = 0;
         this.dotdata.fillRect(this.dotRect,0);
         this.bmp.x = this.game.player.x * -this.scale + 80;
         this.bmp.y = this.game.player.y * -this.scale + 60;
         _loc2_ = 0;
         while(_loc2_ < this.game.units.length)
         {
            if(!(Boolean(this.game.units[_loc2_].human) && !this.game.units[_loc2_].dead))
            {
               if(this.game.units[_loc2_].team != 1)
               {
                  if(!this.game.units[_loc2_].dead && (this.game.units[_loc2_].status.sScan || this.game.units[_loc2_].status.sCrap || this.game.player.gun.curGun.heartbeat || this.game.player.unitInfo.skill.id == "radar"))
                  {
                     this.paint(Number(this.game.units[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.units[_loc2_].y) * this.scale + this.bmp.y - 3,true,"radar0","enemy");
                  }
               }
               else if(!this.game.units[_loc2_].dead)
               {
                  this.paint(Number(this.game.units[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.units[_loc2_].y) * this.scale + this.bmp.y - 4,true,"radar0","ally");
               }
               else
               {
                  this.paint(Number(this.game.units[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.units[_loc2_].y) * this.scale + this.bmp.y - 4,true,"radar0","allyskull");
               }
            }
            else
            {
               this.paint(Number(this.game.units[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.units[_loc2_].y) * this.scale + this.bmp.y - 4,true,"radar0","player");
            }
            _loc2_++;
         }
         if(MatchSettings.useMode == "dom")
         {
            _loc2_ = 0;
            while(true)
            {
               if(_loc2_ < this.game.arena.holdpoints.length)
               {
                  this.paint(Number(this.game.arena.holdpoints[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.arena.holdpoints[_loc2_].y) * this.scale + this.bmp.y - 3,true,"radar0","flag" + this.game.arena.holdpoints[_loc2_].curTeam);
                  _loc2_++;
                  continue;
               }
            }
         }
         else if(MatchSettings.useMode == "ctf")
         {
            _loc2_ = 0;
            while(_loc2_ < this.game.arena.ctfflags.length)
            {
               if(!this.game.arena.ctfflags[_loc2_].unitCaptured)
               {
                  this.paint(Number(this.game.arena.ctfflags[_loc2_].x) * this.scale + this.bmp.x + 2,Number(this.game.arena.ctfflags[_loc2_].y) * this.scale + this.bmp.y - 3,true,"radar0","flag" + this.game.arena.ctfflags[_loc2_].team);
               }
               _loc2_++;
            }
         }
      }
      
      public function paint(param1:Number, param2:Number, param3:Boolean, param4:String, param5:String = "", param6:uint = 1) : void
      {
         var _loc7_:BitmapData = BH.getBit(param4,param5,param6);
         var _loc8_:Point = !param3 ? new Point(param1,param2) : new Point(param1 - _loc7_.width / 2,param2 - _loc7_.height / 2);
         this.dotdata.copyPixels(_loc7_,new Rectangle(0,0,_loc7_.width,_loc7_.height),_loc8_,null,null,true);
      }
   }
}
