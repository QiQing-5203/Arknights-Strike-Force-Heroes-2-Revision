package
{
   public class Particle
   {
       
      
      private var game:Game;
      
      public var remove:Boolean;
      
      private var behave:String;
      
      private var name:String;
      
      private var sub:String;
      
      private var x:Number;
      
      private var y:Number;
      
      private var hitFrame:uint;
      
      private var stats:Object;
      
      private var frame:uint;
      
      private var holdFrame:Boolean;
      
      private var xSpd:Number;
      
      private var ySpd:Number;
      
      private var xVel:Number;
      
      private var yVel:Number;
      
      private var extra:Object;
      
      private var hitCount:uint;
      
      private var rotation:Number;
      
      private var fc:uint;
      
      public function Particle(param1:Game, param2:Number, param3:Number, param4:String, param5:uint, param6:Object, param7:String, param8:String, param9:uint)
      {
         super();
         this.game = param1;
         this.x = param2;
         this.y = param3;
         this.fc = 0;
         this.behave = param4;
         this.hitFrame = param5;
         this.name = param7;
         this.sub = param8;
         this.extra = !param6 ? {} : param6;
         this.stats = BH.getBitAniStats(this.name + 0,this.sub);
         this.rotation = UT.irand(0,this.stats.rotAmt - 1);
         if(!param9)
         {
            this.frame = 1;
         }
         else
         {
            this.frame = param9;
            this.holdFrame = true;
         }
         this.name += this.rotation;
         var _loc10_:* = this.behave;
         switch("loop" !== _loc10_ ? ("fairy" !== _loc10_ ? ("space" !== _loc10_ ? ("waterdrop" === _loc10_ ? 3 : ("water" !== _loc10_ ? ("snow" !== _loc10_ ? ("shell" !== _loc10_ ? ("spark" === _loc10_ ? 7 : ("geiser" !== _loc10_ ? ("leaf" === _loc10_ ? 9 : ("raise" !== _loc10_ ? ("move" === _loc10_ ? 11 : ("fish" !== _loc10_ ? ("text" !== _loc10_ ? ("slowText" === _loc10_ ? 14 : 15) : 13) : 12)) : 10)) : 8)) : 6) : 5) : 4)) : 2) : 1) : 0)
         {
            case 0:
               break;
            case 1:
               this.extra.rot1 = Math.random() * 360;
               this.extra.rot2 = Math.random() * 360;
               break;
            case 2:
               this.extra.rot1 = Math.random() * 360;
               this.extra.rot2 = Math.random() * 360;
               break;
            case 3:
               this.holdFrame = true;
               this.xSpd = UT.rand(-1,1);
               this.ySpd = UT.rand(0,1);
               break;
            case 4:
               this.xSpd = UT.rand(this.extra.min,this.extra.max);
               this.ySpd = UT.rand(-1,3);
               break;
            case 5:
               this.xSpd = UT.rand(0,1);
               this.ySpd = UT.rand(3,5);
               break;
            case 6:
               this.xSpd = UT.xMoveToRot(Number(this.extra.rot) - 110 * Number(this.extra.flip) + UT.rand(-15,15),8);
               this.ySpd = UT.yMoveToRot(Number(this.extra.rot) - 110 * Number(this.extra.flip) + UT.rand(-15,15),8);
               break;
            case 7:
               this.xSpd = UT.rand(-2,2);
               this.ySpd = UT.rand(-1,3);
               if(this.extra.xSpd)
               {
                  this.xSpd = this.extra.xSpd;
               }
               if(!this.extra.ySpd)
               {
                  break;
               }
               this.ySpd = this.extra.ySpd;
               break;
            case 8:
               this.xSpd = UT.rand(-2,2);
               this.ySpd = UT.rand(-1,0);
               if(this.extra.xSpd)
               {
                  this.xSpd = this.extra.xSpd;
               }
               if(!this.extra.ySpd)
               {
                  break;
               }
               this.ySpd = this.extra.ySpd;
               break;
            case 9:
               this.hitFrame = 10;
               this.xSpd = UT.rand(0,1);
               this.ySpd = UT.rand(0.5,3);
               this.rotation = Math.random() * 360;
               break;
            case 10:
               this.ySpd = UT.rand(1,3) * Number(param6.ySpd);
               this.xSpd = !(this.ySpd * Number(this.extra.xSpd)) ? 0 : Number(this.extra.xSpd);
               break;
            case 11:
               this.ySpd = this.extra.ySpd;
               this.xSpd = this.extra.xSpd;
               break;
            case 12:
               this.extra.rot1 = Math.random() * 360;
               this.extra.rot2 = Math.random() * 360;
               break;
            case 13:
               this.ySpd = -1;
               this.yVel = 20;
               this.holdFrame = true;
               this.frame = 1;
               break;
            case 14:
               this.ySpd = -0.7;
               this.yVel = 35;
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         if(!this.remove)
         {
            ++this.fc;
            var _loc2_:* = this.behave;
            switch("fairy" !== _loc2_ ? ("space" === _loc2_ ? 1 : ("waterdrop" !== _loc2_ ? ("water" === _loc2_ ? 3 : ("snow" !== _loc2_ ? ("leaf" !== _loc2_ ? ("loop" === _loc2_ ? 6 : ("shell" !== _loc2_ ? ("spark" === _loc2_ ? 8 : ("geiser" !== _loc2_ ? ("raise" === _loc2_ ? 10 : ("move" !== _loc2_ ? ("fish" !== _loc2_ ? ("text" === _loc2_ ? 13 : ("slowText" !== _loc2_ ? 15 : 14)) : 12) : 11)) : 9)) : 7)) : 5) : 4)) : 2)) : 0)
            {
               case 0:
                  this.extra.rot1 += 1;
                  this.extra.rot2 += 2;
                  this.x += UT.xMoveToRot(this.extra.rot1,1);
                  this.y += UT.yMoveToRot(this.extra.rot2,0.6);
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 1:
                  this.extra.rot1 += 0.3;
                  this.extra.rot2 += 0.6;
                  this.x += UT.xMoveToRot(this.extra.rot1,1);
                  this.y += UT.yMoveToRot(this.extra.rot2,0.6);
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 2:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  this.ySpd += 0.5;
                  if(!this.hitCount && (this.hitTest() || this.hitTestPlayer()))
                  {
                     this.y -= this.ySpd;
                     this.ySpd = 0;
                     this.hitCount = 1;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  if(!this.hitCount)
                  {
                     break;
                  }
                  ++this.frame;
                  if(this.frame != this.stats.frames)
                  {
                     break;
                  }
                  this.remove = true;
                  break;
               case 3:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  this.ySpd += 0.5;
                  if(!this.hitCount)
                  {
                     if(this.fc >= this.hitFrame && Boolean(this.hitTest()))
                     {
                        this.hitCount = 1;
                     }
                     _loc1_ = 0;
                     while(_loc1_ < this.game.units.length)
                     {
                        if(!this.game.units[_loc1_].dead)
                        {
                           if(UT.inBox(this.x,this.y,Number(this.game.units[_loc1_].x) - 25,Number(this.game.units[_loc1_].y) - 70,50,50))
                           {
                              this.hitCount = 1;
                           }
                        }
                        _loc1_++;
                     }
                  }
                  if(this.hitCount == 1)
                  {
                     this.xSpd *= 3;
                     this.y -= this.ySpd;
                     this.ySpd *= -UT.rand(0.2,0.5);
                     this.hitCount = 1;
                  }
                  if(!this.hitCount)
                  {
                     this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,1);
                     break;
                  }
                  ++this.hitCount;
                  if(this.hitCount == 20)
                  {
                     this.remove = true;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,uint(this.hitCount / 10) + 2);
                  break;
               case 4:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  if(this.fc % 3 == 0 && Boolean(this.hitTest()))
                  {
                     this.remove = true;
                     this.game.createEffect(this.x,this.y,"snowSplash");
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 5:
                  if(!this.hitCount)
                  {
                     this.rotation += 5;
                     this.x += UT.xMoveToRot(this.rotation,2);
                     this.x += this.xSpd;
                     this.y += this.ySpd;
                     if(this.fc % 3 == 0 && Boolean(this.hitTest()))
                     {
                        this.hitCount = 1;
                     }
                  }
                  else
                  {
                     ++this.hitCount;
                     if(this.hitCount > 60)
                     {
                        this.frame = uint((this.hitCount - 60) / 10) + 4;
                        if(this.hitCount >= 90)
                        {
                           this.remove = true;
                        }
                     }
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 6:
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 7:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  this.ySpd += 1;
                  if(this.hitCount)
                  {
                     if(this.hitTest())
                     {
                        this.ySpd *= -0.6;
                     }
                     ++this.hitCount;
                     if(this.hitCount > 20)
                     {
                        this.remove = true;
                     }
                  }
                  else if(this.hitTest())
                  {
                     this.hitCount = 1;
                     this.xSpd *= 0.6;
                     this.ySpd *= -0.3;
                     this.ySpd -= 5;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 8:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  this.ySpd += 0.5;
                  if(!this.hitCount && (this.hitTest() || this.hitTestPlayer()))
                  {
                     this.xSpd *= 3;
                     this.y -= this.ySpd;
                     this.ySpd *= -UT.rand(0.2,0.5);
                     this.hitCount = 1;
                  }
                  if(!this.hitCount)
                  {
                     this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,1);
                     break;
                  }
                  ++this.hitCount;
                  if(this.hitCount == 20)
                  {
                     this.remove = true;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,uint(this.hitCount / 10) + 2);
                  break;
               case 9:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  this.ySpd += 0.5;
                  if(!this.hitCount && (this.hitTest() || this.hitTestPlayer()))
                  {
                     this.xSpd *= 10;
                     this.ySpd = UT.rand(-2,2);
                     this.hitCount = 1;
                  }
                  if(!this.hitCount && this.ySpd > 0)
                  {
                     this.hitCount = 1;
                  }
                  if(!this.hitCount)
                  {
                     this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,1);
                     break;
                  }
                  ++this.hitCount;
                  if(this.hitCount == 20)
                  {
                     this.remove = true;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,uint(this.hitCount / 10) + 2);
                  break;
               case 10:
                  this.x += this.xSpd;
                  this.y -= this.ySpd;
                  if(this.fc == 20)
                  {
                     this.remove = true;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 11:
                  this.x += this.xSpd;
                  this.y += this.ySpd;
                  if(this.frame == this.stats.frames)
                  {
                     this.remove = true;
                  }
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  break;
               case 12:
                  this.extra.rot1 += 0.4;
                  this.extra.rot2 += 2;
                  this.xVel = UT.xMoveToRot(this.extra.rot1,1);
                  this.yVel = UT.yMoveToRot(this.extra.rot2,0.1);
                  this.x += this.xVel;
                  this.y += this.yVel;
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.xVel <= 0 ? 2 : 1);
                  break;
               case 13:
               case 14:
                  this.y += this.ySpd;
                  this.game.bitscreen.paint(this.x + this.game.arena.x,this.y + this.game.arena.y,true,this.name,this.sub,this.frame);
                  if(this.fc <= this.yVel)
                  {
                     break;
                  }
                  this.remove = true;
                  break;
            }
            if(!this.holdFrame)
            {
               ++this.frame;
               if(this.frame > this.stats.frames)
               {
                  this.frame = 1;
               }
            }
            return;
         }
      }
      
      private function hitTest(param1:Number = 0, param2:Number = 0) : uint
      {
         if(this.fc >= this.hitFrame)
         {
            var _loc3_:uint = this.game.arena.wall.getPixel32(this.x + param1,this.y + param2);
            if(_loc3_)
            {
               return _loc3_.toString(16).substring(0,2) != "ff" ? 0 : _loc3_;
            }
            return _loc3_;
         }
         return 0;
      }
      
      private function hitTestPlayer() : Boolean
      {
         if(!this.game.player.dead)
         {
            if(this.fc >= this.hitFrame)
            {
               return UT.inBox(this.x,this.y,this.game.player.x - 20,this.game.player.y - UT.rand(55,70),40,50);
            }
            return false;
         }
         return false;
      }
   }
}
