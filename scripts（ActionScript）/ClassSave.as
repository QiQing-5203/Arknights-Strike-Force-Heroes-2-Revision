package
{
   public class ClassSave
   {
       
      
      public var head:int = 1;
      
      public var body:int = 1;
      
      public var camo:int = 1;
      
      public var skill:String = "none";
      
      public var streak:String = "none";
      
      public var level:int = 1;
      
      public var exp:int = 0;
      
      public var funds:int = 3000;
      
      public var unlockCamo:int = 5;
      
      public var gunInv:Array;
      
      public var attachInv:Array;
      
      public var armorInv:Array;
      
      public var primary:Inventory_Gun;
      
      public var secondary:Inventory_Gun;
      
      public var primaryAttach:Inventory_Attachment;
      
      public var armor:Inventory_Armor;
      
      private var saveVars:Array;
      
      public function ClassSave(param1:Array)
      {
         super();
         this.gunInv = [];
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            this.gunInv.push(Inventory_Gun.createInventoryItem(param1[_loc2_],1,0));
            _loc2_++;
         }
         this.primary = this.gunInv[0];
         this.secondary = this.gunInv[1];
         this.attachInv = [];
         this.primaryAttach = null;
         this.armorInv = [];
         this.armorInv.push(Inventory_Armor.createInventoryItem("Kevlar",1,0));
         this.armor = this.armorInv[0];
         this.saveVars = ["head","body","camo","skill","streak","level","exp","funds","unlockCamo"];
      }
      
      public function saveObject() : Object
      {
         var _loc2_:uint = 0;
         var _loc1_:Object = {};
         _loc2_ = 0;
         while(_loc2_ < this.saveVars.length)
         {
            _loc1_[this.saveVars[_loc2_]] = this[this.saveVars[_loc2_]];
            _loc2_++;
         }
         _loc1_.gunInv = [];
         _loc2_ = 0;
         while(_loc2_ < this.gunInv.length)
         {
            _loc1_.gunInv.push(this.gunInv[_loc2_].saveObject());
            _loc2_++;
         }
         _loc1_.primary = this.gunInv.indexOf(this.primary);
         _loc1_.secondary = this.gunInv.indexOf(this.secondary);
         _loc1_.attachInv = [];
         _loc2_ = 0;
         while(_loc2_ < this.attachInv.length)
         {
            _loc1_.attachInv.push(this.attachInv[_loc2_].saveObject());
            _loc2_++;
         }
         if(this.primaryAttach)
         {
            _loc1_.primaryAttach = this.attachInv.indexOf(this.primaryAttach);
         }
         else
         {
            _loc1_.primaryAttach = -1;
         }
         _loc1_.armorInv = [];
         _loc2_ = 0;
         while(_loc2_ < this.armorInv.length)
         {
            _loc1_.armorInv.push(this.armorInv[_loc2_].saveObject());
            _loc2_++;
         }
         _loc1_.armor = this.armorInv.indexOf(this.armor);
         return _loc1_;
      }
      
      public function loadObject(param1:Object) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Inventory_Gun = null;
         var _loc4_:Inventory_Attachment = null;
         var _loc5_:Inventory_Armor = null;
         _loc2_ = 0;
         while(_loc2_ < this.saveVars.length)
         {
            this[this.saveVars[_loc2_]] = param1[this.saveVars[_loc2_]];
            _loc2_++;
         }
         this.gunInv = [];
         _loc2_ = 0;
         while(_loc2_ < param1.gunInv.length)
         {
            _loc3_ = new Inventory_Gun();
            _loc3_.loadObject(param1.gunInv[_loc2_]);
            this.gunInv.push(_loc3_);
            _loc2_++;
         }
         this.primary = this.gunInv[param1.primary];
         this.secondary = this.gunInv[param1.secondary];
         this.attachInv = [];
         _loc2_ = 0;
         while(_loc2_ < param1.attachInv.length)
         {
            (_loc4_ = new Inventory_Attachment()).loadObject(param1.attachInv[_loc2_]);
            this.attachInv.push(_loc4_);
            _loc2_++;
         }
         if(param1.primaryAttach != -1)
         {
            this.primaryAttach = this.attachInv[param1.primaryAttach];
         }
         else
         {
            this.primaryAttach = null;
         }
         this.armorInv = [];
         _loc2_ = 0;
         while(_loc2_ < param1.armorInv.length)
         {
            (_loc5_ = new Inventory_Armor()).loadObject(param1.armorInv[_loc2_]);
            this.armorInv.push(_loc5_);
            _loc2_++;
         }
         this.armor = this.armorInv[param1.armor];
      }
   }
}
