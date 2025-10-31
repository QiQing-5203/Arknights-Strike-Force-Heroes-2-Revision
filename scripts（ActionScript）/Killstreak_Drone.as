package
{
   public class Killstreak_Drone extends Killstreak
   {
       
      
      public var _x:Number;
      
      public var _y:Number;
      
      private var toX:Number;
      
      private var toY:Number;
      
      private var rot1:Number;
      
      private var rot2:Number;
      
      private var rotX:Number;
      
      private var rotY:Number;
      
      private var sub:String;
      
      private var followSpd:Number;
      
      private var rot:Number;
      
      public function Killstreak_Drone(param1:Game, param2:*, param3:uint)
      {
         super(param1,param2,param3,"drone",false);
         this.rot1 = UT.rand(0,360);
         this.rot2 = UT.rand(0,360);
         this.sub = "enemy";
         if(unit.team == 1 || unit == game.player)
         {
            this.sub = "ally";
         }
         if(unit.unitInfo.extra.permaStreak)
         {
            timer = 9999999;
         }
         this._y = Number(unit.y) - 500;
         this._x = unit.x;
         this.followSpd = UT.rand(0.2,0.4);
         shootTimer = UT.irand(0,25);
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         ++fc;
         ++shootTimer;
         this.rot1 += 1;
         this.rot2 += 2;
         this.rotX = UT.xMoveToRot(this.rot1,20);
         this.rotY = UT.yMoveToRot(this.rot2,10);
         this._x += (Number(unit.x) - this._x) * this.followSpd;
         this._y += (Number(unit.y) - 30 - this._y) * this.followSpd;
         x = this._x + this.rotX;
         y = this._y + this.rotY;
         if(fc % 15 == 0)
         {
            target = null;
            _loc1_ = 0;
            while(_loc1_ < game.units.length)
            {
               if(game.units[_loc1_] != unit)
               {
                  if(!game.units[_loc1_].dead)
                  {
                     if(!(Boolean(unit.team) && game.units[_loc1_].team == unit.team))
                     {
                        if(UT.getDist(x,y,game.units[_loc1_].x,game.units[_loc1_].y) < 300)
                        {
                           target = game.units[_loc1_];
                        }
                     }
                  }
               }
               _loc1_++;
            }
         }
         if(target && shootTimer % 10 == 0)
         {
            game.playScreenSound(gun.shotSound,x,y);
            this.rot = UT.getRotation(x,y + 5,target.x,Number(target.y) - 35);
            UT.rand(-5,5);
            game.bullets.push(new gun.cls(game,unit,this.rot,x,y,0,gun,{"noUnit":true}));
         }
         if(Boolean(unit.dead) || fc >= timer)
         {
            end(false);
         }
         game.bitscreen.paint(x + game.arena.x,y + game.arena.y,true,"drone0",this.sub);
      }
   }
}
