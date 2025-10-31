package
{
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class NodeAiAction extends Sprite
   {
       
      
      public var txt_con:TextField;
      
      public var txt_action:TextField;
      
      public var con:String;
      
      public var action:String;
      
      public function NodeAiAction()
      {
         super();
         var _loc1_:Array = name.split("_");
         this.action = _loc1_[0];
         this.con = _loc1_[1];
         this.txt_con.text = this.con.toUpperCase();
         var _loc2_:* = this.action;
         switch("c" !== _loc2_ ? ("j" !== _loc2_ ? ("fp" !== _loc2_ ? ("fc" === _loc2_ ? 3 : ("fd" !== _loc2_ ? 5 : 4)) : 2) : 1) : 0)
         {
            case 0:
               this.txt_action.text = "Crouch";
               break;
            case 1:
               this.txt_action.text = "Jump";
               break;
            case 2:
               this.txt_action.text = "Fix P";
               break;
            case 3:
               this.txt_action.text = "Fix C";
               break;
            case 4:
               this.txt_action.text = "Fix D";
         }
         visible = false;
      }
   }
}
