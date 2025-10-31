package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class ScoreBar extends MovieClip
   {
       
      
      public var txt_deaths:TextField;
      
      public var icon_status:MovieClip;
      
      public var txt_score:TextField;
      
      public var txt_kills:TextField;
      
      public var icon_class:MovieClip;
      
      public var txt_name:TextField;
      
      private var unit;
      
      public function ScoreBar(param1:Number, param2:* = null, param3:String = "", param4:String = "", param5:int = 0)
      {
         super();
         y = param1;
         this.unit = param2;
         if(!(Boolean(param3) && !param4))
         {
            if(!(Boolean(param3) && Boolean(param4)))
            {
               if(this.unit.team)
               {
                  gotoAndStop("team" + this.unit.team + "_" + (!this.unit.human ? "ai" : "player"));
               }
               else
               {
                  gotoAndStop("ffa_" + (!!this.unit.human ? "player" : "ai"));
               }
               this.icon_class.gotoAndStop(this.unit.unitInfo.icon);
               this.txt_name.text = this.unit.name;
               this.txt_score.text = "" + this.unit.pscore;
               this.txt_kills.text = "" + this.unit.score.kills;
               this.txt_deaths.text = "" + this.unit.score.deaths;
               if(!this.unit.dead)
               {
                  this.icon_status.visible = false;
               }
               else
               {
                  this.icon_status.gotoAndStop("dm");
               }
            }
            else
            {
               gotoAndStop(param3);
               this.icon_status.visible = false;
               this.icon_class.visible = false;
               this.txt_name.text = param4;
               this.txt_score.text = "" + param5;
               this.txt_kills.text = "";
               this.txt_deaths.text = "";
            }
         }
         else
         {
            gotoAndStop(param3);
            this.icon_status.visible = false;
            this.icon_class.visible = false;
         }
      }
   }
}
