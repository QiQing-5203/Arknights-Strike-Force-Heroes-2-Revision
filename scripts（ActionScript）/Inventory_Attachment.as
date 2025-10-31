package
{
   public class Inventory_Attachment
   {
       
      
      public var invalidName:String;
      
      public var id:String;
      
      public var level:uint;
      
      public var rarity:int;
      
      public var modValue1:Number;
      
      public var modValue2:Number;
      
      public var modValue3:Number;
      
      public var modValue4:Number;
      
      public var modCost:Number;
      
      private var effects:Array;
      
      public function Inventory_Attachment(param1:String = "", param2:uint = 1, param3:int = 0)
      {
         super();
         if(param1)
         {
            this.id = param1;
            this.level = param2;
            this.rarity = param3;
            if(!Stats_Attachments.itemOb[this.id])
            {
               this.invalidName = this.id;
               this.id = "Invalid";
            }
            Stats_Attachments.addMods(this);
            return;
         }
      }
      
      public static function createInventoryItem(param1:String, param2:uint, param3:int) : Inventory_Attachment
      {
         return new Inventory_Attachment(param1,param2,param3);
      }
      
      public function createFinalItem() : Stats_Attachments
      {
         return Stats_Attachments.createFinalItem(this);
      }
      
      public function saveObject() : Object
      {
         var _loc1_:Object = {};
         _loc1_.type = "attach";
         _loc1_.id = this.id;
         _loc1_.level = this.level;
         _loc1_.rarity = this.rarity;
         _loc1_.modValue1 = this.modValue1;
         _loc1_.modValue2 = this.modValue2;
         _loc1_.modValue3 = this.modValue3;
         _loc1_.modValue4 = this.modValue4;
         _loc1_.modCost = this.modCost;
         _loc1_.effects = this.effects;
         return _loc1_;
      }
      
      public function loadObject(param1:Object) : void
      {
         this.id = param1.id;
         this.level = param1.level;
         this.rarity = param1.rarity;
         this.modValue1 = param1.modValue1;
         this.modValue2 = param1.modValue2;
         this.modValue3 = param1.modValue3;
         this.modValue4 = param1.modValue4;
         this.modCost = param1.modCost;
         this.effects = param1.effects;
      }
   }
}
