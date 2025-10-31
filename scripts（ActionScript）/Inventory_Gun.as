package
{
   public class Inventory_Gun
   {
       
      
      public var invalidName:String;
      
      public var id:String;
      
      public var level:uint;
      
      public var rarity:int;
      
      public var modDmg:Number;
      
      public var modRange:Number;
      
      public var modRecoil:Number;
      
      public var modDelay:Number;
      
      public var modCost:Number;
      
      public var effects:Array;
      
      public function Inventory_Gun(param1:String = "", param2:uint = 1, param3:int = 0)
      {
         super();
         if(param1)
         {
            this.id = param1;
            this.level = param2;
            this.rarity = param3;
            if(!Stats_Guns.itemOb[this.id])
            {
               this.invalidName = this.id;
               this.id = "Invalid";
               trace("ERROR:",this.invalidName,"is not a valid gun!");
            }
            Stats_Guns.addMods(this);
            return;
         }
      }
      
      public static function createInventoryItem(param1:String, param2:uint, param3:int) : Inventory_Gun
      {
         return new Inventory_Gun(param1,param2,param3);
      }
      
      public function createFinalItem() : Stats_Guns
      {
         return Stats_Guns.createFinalItem(this);
      }
      
      public function saveObject() : Object
      {
         var _loc1_:Object = {};
         _loc1_.type = "gun";
         _loc1_.id = this.id;
         _loc1_.level = this.level;
         _loc1_.rarity = this.rarity;
         _loc1_.modDmg = this.modDmg;
         _loc1_.modRange = this.modRange;
         _loc1_.modRecoil = this.modRecoil;
         _loc1_.modDelay = this.modDelay;
         _loc1_.modCost = this.modCost;
         _loc1_.effects = this.effects;
         return _loc1_;
      }
      
      public function loadObject(param1:Object) : void
      {
         this.id = param1.id;
         this.level = param1.level;
         this.rarity = param1.rarity;
         this.modDmg = param1.modDmg;
         this.modRange = param1.modRange;
         this.modRecoil = param1.modRecoil;
         this.modDelay = param1.modDelay;
         this.modCost = param1.modCost;
         this.effects = param1.effects;
      }
   }
}
