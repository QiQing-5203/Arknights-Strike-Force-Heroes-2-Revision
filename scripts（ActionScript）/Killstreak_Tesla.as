package
{
   public class Killstreak_Tesla extends Killstreak
   {
       
      
      private var sub:String;
      
      private var followSpd:Number;
      
      private var rot:Number;
      
      private var yVel:Number = 0;
      
      public var mov:Movement;
      
      public var active:Boolean;
      
      public function Killstreak_Tesla(param1:Game, param2:*, param3:uint)
      {
         super(param1,param2,param3,"tesla",true);
         if(unit.unitInfo.extra.permaStreak)
         {
            timer = 9999999;
         }
         MC = new Tesla();
         game.unitCont.addChild(MC);
         MC.x = x = unit.x;
         MC.y = y = unit.y;
         setText(MC);
         this.followSpd = UT.rand(0.2,0.4);
         shootTimer = UT.irand(0,25);
         this.rot = 90;
         this.mov = new Movement(null);
         this.active = false;
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:uint = 0;
         if(this.active)
         {
            ++fc;
            if(fc >= 35)
            {
               ++shootTimer;
               if(fc % gun.soundFrames == 0)
               {
                  game.playScreenSound(gun.shotSound,x,y);
               }
               if(shootTimer > gun.shootDelay * 30)
               {
                  shootTimer = 0;
                  MC.lightning.gotoAndPlay(1);
                  _loc1_ = 0;
                  while(_loc1_ < game.units.length)
                  {
                     if(game.units[_loc1_] != unit)
                     {
                        if(!game.units[_loc1_].dead)
                        {
                           if(!(Boolean(unit.team) && game.units[_loc1_].team == unit.team))
                           {
                              if(UT.getDist(x,y,game.units[_loc1_].x,game.units[_loc1_].y) < 200)
                              {
                                 game.units[_loc1_].status.damage(gun.dmg,unit,gun,{});
                              }
                           }
                        }
                     }
                     _loc1_++;
                  }
               }
               if(Boolean(unit.dead) || fc >= timer)
               {
                  this.end();
               }
               return;
            }
            return;
         }
         this.yVel += 1;
         if(this.yVel > 25)
         {
            this.yVel = 25;
         }
         y += this.yVel;
         if(hitTestWall(0,2))
         {
            while(hitTestWall(0,2))
            {
               y = y - 1;
            }
            this.active = true;
            MC.play();
            game.playScreenSound(S_Deploy,x,y);
         }
         MC.y = y;
      }
      
      override public function end(param1:Boolean = true) : void
      {
         if(param1)
         {
            unit.endKillstreak();
         }
         if(MC)
         {
            game.unitCont.removeChild(MC);
         }
         game.killstreaks.splice(game.killstreaks.indexOf(this),1);
         game.createEffect(x,y - 20,"explosionSmall");
         game.playScreenSound(S_rocketExplode,x,y);
      }
   }
}
