package
{
   public class Shop
   {
      
      public static var classGunShops:Array;
      
      public static var classOtherShops:Array;
       
      
      public function Shop()
      {
         super();
      }
      
      public static function resetShops() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Inventory_Gun = null;
         var _loc8_:* = undefined;
         var _loc9_:String = null;
         var _loc10_:Inventory_Attachment = null;
         var _loc11_:String = null;
         var _loc12_:Inventory_Armor = null;
         classGunShops = [0,1,2,3,4,5];
         _loc1_ = 1;
         while(_loc1_ <= 5)
         {
            classGunShops[_loc1_] = [];
            _loc2_ = 0;
            while(_loc2_ < 6)
            {
               _loc3_ = UT.randEl(Stats_Classes.getClass(_loc1_).weaponTypes);
               _loc4_ = UT.randEl(Stats_Guns.typeAr[_loc3_]).id;
               if((_loc5_ = SD.getSelCass(_loc1_).level + UT.irand(-2,1)) < 1)
               {
                  _loc5_ = 1;
               }
               if(_loc5_ > 50)
               {
                  _loc5_ = 50;
               }
               _loc6_ = Stats_Misc.getRandRarity(0);
               _loc7_ = Inventory_Gun.createInventoryItem(_loc4_,_loc5_,_loc6_);
               classGunShops[_loc1_].push(_loc7_);
               _loc2_++;
            }
            _loc1_++;
         }
         classOtherShops = [0,1,2,3,4,5];
         _loc1_ = 1;
         while(_loc1_ <= 5)
         {
            classOtherShops[_loc1_] = [];
            _loc2_ = 0;
            while(_loc2_ < 6)
            {
               if(Math.random() >= 0.7)
               {
                  _loc11_ = UT.randEl(Stats_Armor.typeAr[_loc1_]).id;
                  if((_loc5_ = SD.getSelCass(_loc1_).level + UT.irand(-2,1)) < 1)
                  {
                     _loc5_ = 1;
                  }
                  if(_loc5_ > 50)
                  {
                     _loc5_ = 50;
                  }
                  _loc6_ = Stats_Misc.getRandRarity(0);
                  _loc12_ = Inventory_Armor.createInventoryItem(_loc11_,_loc5_,_loc6_);
                  classOtherShops[_loc1_].push(_loc12_);
               }
               else
               {
                  _loc3_ = uint((_loc8_ = Stats_Classes.getClass(_loc1_).weaponTypes)[UT.irand(1,_loc8_.length - 1)]);
                  _loc9_ = UT.randEl(Stats_Attachments.typeAr[_loc3_]).id;
                  if((_loc5_ = SD.getSelCass(_loc1_).level + UT.irand(-2,1)) < 1)
                  {
                     _loc5_ = 1;
                  }
                  if(_loc5_ > 50)
                  {
                     _loc5_ = 50;
                  }
                  _loc6_ = Stats_Misc.getRandRarity(0);
                  _loc10_ = Inventory_Attachment.createInventoryItem(_loc9_,_loc5_,_loc6_);
                  classOtherShops[_loc1_].push(_loc10_);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
   }
}
