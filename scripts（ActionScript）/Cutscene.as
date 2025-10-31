package
{
   import flash.display.MovieClip;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class Cutscene extends MovieClip
   {
       
      
      public var but_next:TextField;
      
      public var ikNode_1:MovieClip;
      
      public var txt_title:TextField;
      
      public var but_prev:TextField;
      
      private var main:Main;
      
      private var type:String;
      
      private var song;
      
      private var frames:Array;
      
      private var curFrame:uint = 0;
      
      public function Cutscene(param1:Main, param2:Object)
      {
         super();
         addFrameScript(16,this.frame17,19,this.frame20,24,this.frame25,29,this.frame30,32,this.frame33,37,this.frame38,40,this.frame41,42,this.frame43);
         this.main = param1;
         this.txt_title.text = MatchSettings.caName;
         this.type = param2.type;
         this.song = MatchSettings[this.type + "CutSong"];
         this.frames = MatchSettings[this.type + "CutFrames"];
         if(this.song)
         {
            SH.playMusic(this.song);
         }
         gotoAndStop(this.frames[this.curFrame]);
         this.setButs();
         UT.forceGarbageCollection();
      }
      
      public function EnterFrame() : void
      {
         this.but_prev.alpha = !this.ht(this.but_prev) ? 0.5 : 1;
         this.but_next.alpha = !this.ht(this.but_next) ? 0.5 : 1;
      }
      
      public function MouseDown() : void
      {
         if(!(this.ht(this.but_prev) && this.but_prev.text == "返回"))
         {
            if(!(this.ht(this.but_next) && this.but_next.text == "继续"))
            {
               if(!(this.ht(this.but_next) && this.but_next.text == "开始游戏"))
               {
                  if(this.ht(this.but_next) && this.but_next.text == "返回主菜单")
                  {
                     this.main.startClass(Menu);
                  }
               }
               else
               {
                  this.main.startClass(Game);
               }
            }
            else
            {
               ++this.curFrame;
               this.setButs();
               gotoAndStop(this.frames[this.curFrame]);
            }
         }
         else
         {
            --this.curFrame;
            this.setButs();
            gotoAndStop(this.frames[this.curFrame]);
         }
      }
      
      public function setButs() : void
      {
         if(!(this.curFrame == this.frames.length - 1 && this.type == "pre"))
         {
            if(!(this.curFrame == this.frames.length - 1 && this.type == "post"))
            {
               if(this.curFrame != 0)
               {
                  this.but_prev.visible = true;
                  this.but_next.visible = true;
                  this.but_prev.text = "返回";
                  this.but_next.text = "继续";
               }
               else
               {
                  this.but_prev.visible = false;
                  this.but_next.visible = true;
                  this.but_prev.text = "";
                  this.but_next.text = "继续";
               }
            }
            else
            {
               if(this.frames.length <= 1)
               {
                  this.but_prev.visible = false;
                  this.but_prev.text = "";
               }
               else
               {
                  this.but_prev.visible = true;
                  this.but_prev.text = "返回";
               }
               this.but_next.visible = true;
               this.but_next.text = "返回主菜单";
            }
         }
         else
         {
            if(this.frames.length <= 1)
            {
               this.but_prev.visible = false;
               this.but_prev.text = "";
            }
            else
            {
               this.but_prev.visible = true;
               this.but_prev.text = "返回";
            }
            this.but_next.visible = true;
            this.but_next.text = "开始游戏";
         }
      }
      
      public function MouseUp() : void
      {
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function KeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function MouseWheel(param1:MouseEvent) : void
      {
      }
      
      public function flashActivate() : void
      {
      }
      
      public function flashDeactivate() : void
      {
      }
      
      private function ht(param1:*) : Boolean
      {
         if(!param1 || !param1.visible)
         {
            return false;
         }
         return param1.hitTestPoint(mouseX,mouseY,false);
      }
      
      function frame17() : *
      {
         SH.playSound(S_deagle);
         SH.playSound(S_Headshot2);
         SH.playMusic(M_Machine);
      }
      
      function frame20() : *
      {
         SH.playSound(S_Jet);
      }
      
      function frame25() : *
      {
         SH.playSound(S_Radar);
      }
      
      function frame30() : *
      {
         SH.playSound(S_rocketExplode);
         SH.playSound(S_Mine1);
      }
      
      function frame33() : *
      {
         SH.playSound(S_Blunt2);
      }
      
      function frame38() : *
      {
         SH.playMusic(M_Mute,true);
         SH.playSound(S_deagle);
         SH.playSound(S_Headshot3);
      }
      
      function frame41() : *
      {
         this.but_next.visible = false;
         this.but_prev.visible = false;
      }
      
      function frame43() : *
      {
         SH.playMusic(M_Meeting,true);
         SH.playSound(S_Powerup,true);
         SH.playSound(S_rocketExplode);
         SH.playSound(S_Mine1);
      }
   }
}
