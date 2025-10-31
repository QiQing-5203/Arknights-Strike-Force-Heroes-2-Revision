package
{
   public class Inventory_Armor
   {
       
      
      public var id:String;
      
      public var level:uint;
      
      public var rarity:int;
      
      public var modArmor:Number;
      
      public var modCost:Number;
      
      public var effects:Array;
      
      public function Inventory_Armor(param1:String = "", param2:uint = 1, param3:int = 0)
      {
         super();
         if(param1)
         {
            this.id = param1;
            this.level = param2;
            this.rarity = param3;
            Stats_Armor.addMods(this);
            return;
         }
      }
      
      public static function createInventoryItem(param1:String, param2:uint, param3:int) : Inventory_Armor
      {
         return new Inventory_Armor(param1,param2,param3);
      }
      
      public function createFinalItem() : Stats_Armor
      {
         return Stats_Armor.createFinalItem(this);
      }
      
      public function saveObject() : Object
      {
         var _loc1_:Object = {};
         _loc1_.type = "armor";
         _loc1_.id = this.id;
         _loc1_.level = this.level;
         _loc1_.rarity = this.rarity;
         _loc1_.modArmor = this.modArmor;
         _loc1_.modCost = this.modCost;
         _loc1_.effects = this.effects;
         return _loc1_;
      }
      
      public function loadObject(param1:Object) : void
      {
         this.id = param1.id;
         this.level = param1.level;
         this.rarity = param1.rarity;
         this.modArmor = param1.modArmor;
         this.modCost = param1.modCost;
         this.effects = param1.effects;
      }
   }
}
