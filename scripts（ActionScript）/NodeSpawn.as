package
{
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class NodeSpawn extends Sprite
   {
       
      
      public var txt_id:TextField;
      
      public var id:String;
      
      public var team:uint;
      
      public var waypoint:NodeWaypoint;
      
      public var initialSpawned:Boolean;
      
      public function NodeSpawn()
      {
         super();
         var _loc1_:Array = name.split("_");
         this.id = _loc1_[0];
         if(_loc1_[1] == "")
         {
            this.team = 0;
         }
         else
         {
            this.team = _loc1_[1];
         }
         this.txt_id.text = this.id.toUpperCase();
         visible = false;
      }
      
      public function setWaypoint(param1:NodeWaypoint) : void
      {
         this.waypoint = param1;
      }
   }
}
