package
{
   import Playtomic.Log;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.ByteArray;
   
   public class SD
   {
      
      public static var useLink:String;
      
      public static var warnCustom:Boolean;
      
      public static var warnChallenges:Boolean;
      
      public static var soldierFirst:Boolean;
      
      public static var sound:Boolean;
      
      public static var music:Boolean;
      
      public static var voices:Boolean;
      
      public static var graphQual:uint;
      
      public static var graphPart:uint;
      
      public static var graphLights:Boolean;
      
      public static var graphGlow:Boolean;
      
      public static var screenShake:Boolean;
      
      public static var screenBlood:Boolean;
      
      public static var blood:uint;
      
      public static var rightclick:uint;
      
      public static var selClass:uint;
      
      public static var classSaves:Array;
      
      public static var completeCamp:Array;
      
      public static var completeChal:Array;
      
      public static var achievements:Array;
      
      public static var name:String;
      
      public static var saveList:Array;
      
      public static var classSlots:Array;
      
      public static var classItems:Array;
      
      public static var classLights:Array;
      
      public static var uid:String;
      
      public static var achOb:Object;
      
      public static var lastSoldierScreen:String;
      
      public static var lastMenuScreen:String;
      
      public static var saveLocation:String;
      
      public static var saveSlot:uint;
       
      
      public function SD()
      {
         super();
      }
      
      public static function Init() : void
      {
         warnChallenges = true;
         warnCustom = true;
         lastSoldierScreen = "profile";
         saveList = [];
         saveList.push("name","selClass","soldierFirst");
         saveList.push("sound","music","voices","graphQual","graphLights","graphGlow","graphPart","screenShake","screenBlood","blood","rightclick");
         saveList.push("completeCamp","completeChal","achievements","achOb");
         saveList.push("classSlots","classLights");
         newGame();
      }
      
      public static function newGame() : void
      {
         soldierFirst = true;
         name = "特遣干员";
         selClass = 1;
         sound = true;
         music = true;
         voices = true;
         graphQual = 1;
         graphLights = false;
         graphGlow = true;
         graphPart = 2;
         screenShake = true;
         screenBlood = false;
         blood = 2;
         rightclick = 0;
         completeCamp = [0];
         completeChal = [0];
         classSaves = [0,1,2,3,4,5];
         classSaves[1] = new ClassSave(["mk2M4A4","MP5K","Wrench"]);
         classSaves[2] = new ClassSave(["MK 48","MP5K","Flare Gun"]);
         classSaves[3] = new ClassSave(["f500","MP5K","mk2RPG"]);
         classSaves[4] = new ClassSave(["Dragunov","MP5K","Reflect Shield"]);
         classSaves[5] = new ClassSave(["SPAS 12","MP5K","Firework Launcher"]);
         achievements = [];
         classSlots = [0];
         classItems = [null,null,null,null,null,null];
         classLights = [1,1,1,1,1,1];
         var _loc1_:uint = 0;
         while(_loc1_ < 5)
         {
            classSlots.push([UT.irand(1,9),UT.irand(1,9),UT.irand(1,9)]);
            _loc1_++;
         }
         achOb = {};
      }
      
      public static function setSaveLocation(param1:uint) : void
      {
         saveSlot = param1;
         saveLocation = "Arknights_SFH2-Saves" + saveSlot;
      }
      
      public static function getSaveSlot(param1:uint) : Object
      {
         setSaveLocation(param1);
         var _loc2_:Object = {};
         var _loc3_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         if(_loc3_.data.savedBefore)
         {
            _loc2_.name = _loc3_.data.name;
            _loc2_.selClass = _loc3_.data.selClass;
            _loc2_.class1 = _loc3_.data.classSaves1.level;
            _loc2_.class2 = _loc3_.data.classSaves2.level;
            _loc2_.class3 = _loc3_.data.classSaves3.level;
            _loc2_.class4 = _loc3_.data.classSaves4.level;
            _loc2_.class5 = _loc3_.data.classSaves5.level;
            _loc3_.close();
            return _loc2_;
         }
         return null;
      }
      
      public static function getSelCass(param1:uint = 0) : ClassSave
      {
         return classSaves[!param1 ? selClass : param1];
      }
      
      public static function eraseGame(param1:Boolean = false) : void
      {
         var _loc2_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         _loc2_.data.savedBefore = false;
         _loc2_.close();
         if(saveSlot == 4 && !param1)
         {
            AGI.deleteData();
         }
      }
      
      public static function checkSave() : Boolean
      {
         var _loc1_:* = false;
         var _loc2_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         _loc1_ = !!_loc2_.data.savedBefore;
         _loc2_.close();
         return _loc1_;
      }
      
      public static function saveGame() : void
      {
         var _loc2_:uint = 0;
         trace("-- Saving game");
         var _loc1_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         _loc2_ = 0;
         while(_loc2_ < saveList.length)
         {
            _loc1_.data[saveList[_loc2_]] = SD[saveList[_loc2_]];
            _loc2_++;
         }
         _loc1_.data.savedBefore = true;
         _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            _loc1_.data["classSaves" + _loc2_] = classSaves[_loc2_].saveObject();
            _loc2_++;
         }
         var _loc3_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < classItems.length)
         {
            if(!classItems[_loc2_])
            {
               _loc3_.push(null);
            }
            else
            {
               _loc3_.push(classItems[_loc2_].saveObject());
            }
            _loc2_++;
         }
         _loc1_.data.classItems = _loc3_;
         if(saveSlot == 4)
         {
            AGI.saveData(_loc1_.data);
         }
         _loc1_.flush();
         _loc1_.close();
      }
      
      public static function loadGame(param1:Object = null) : void
      {
         var _loc3_:uint = 0;
         trace("-- Preparing to Load");
         var _loc2_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         if(saveSlot == 4 && Boolean(param1))
         {
            UT.mergeObject(_loc2_.data,param1);
         }
         if(checkSave())
         {
            _loc3_ = 0;
            while(_loc3_ < saveList.length)
            {
               SD[saveList[_loc3_]] = _loc2_.data[saveList[_loc3_]];
               trace("Loading:",saveList[_loc3_],"=",SD[saveList[_loc3_]]);
               _loc3_++;
            }
            _loc3_ = 1;
            while(_loc3_ <= 5)
            {
               classSaves[_loc3_].loadObject(_loc2_.data["classSaves" + _loc3_]);
               _loc3_++;
            }
            classItems = [];
            _loc3_ = 0;
            while(_loc3_ < _loc2_.data.classItems.length)
            {
               if(_loc2_.data.classItems[_loc3_])
               {
                  if(_loc2_.data.classItems[_loc3_].type != "gun")
                  {
                     if(_loc2_.data.classItems[_loc3_].type != "attach")
                     {
                        if(_loc2_.data.classItems[_loc3_].type == "armor")
                        {
                           classItems.push(new Inventory_Armor().loadObject(_loc2_.data.classItems[_loc3_]));
                        }
                     }
                     else
                     {
                        classItems.push(new Inventory_Attachment().loadObject(_loc2_.data.classItems[_loc3_]));
                     }
                  }
                  else
                  {
                     classItems.push(new Inventory_Gun().loadObject(_loc2_.data.classItems[_loc3_]));
                  }
               }
               else
               {
                  classItems.push(null);
               }
               _loc3_++;
            }
            _loc2_.flush();
            _loc2_.close();
            return;
         }
         _loc2_.flush();
         _loc2_.close();
         newGame();
         if(saveSlot == 4)
         {
            name = AGI.getUserName();
         }
      }
      
      public static function urlSky9Games(param1:Boolean = false) : void
      {
         Log.CustomMetric("Clicked Sky9Games" + (!param1 ? "" : " Intro"),"Link");
         navigateToURL(new URLRequest("http://www.sky9games.com"),"_blank");
      }
      
      public static function urlArmor(param1:Boolean = false) : void
      {
         Log.CustomMetric("Clicked ArmorGames" + (!param1 ? "" : " Intro"),"Link");
         navigateToURL(new URLRequest("https://ak.hypergryph.com/"),"_blank");
      }
      
      public static function urlNotDoppler(param1:Boolean = false) : void
      {
         Log.CustomMetric("Clicked NotDoppler" + (!param1 ? "" : " Intro"),"Link");
         navigateToURL(new URLRequest("https://space.bilibili.com/621988978?spm_id_from=333.1007.0.0"),"_blank");
      }
      
      public static function playSFH1() : void
      {
         var _loc1_:Boolean = false;
         if(!Main.SPONSORSITE)
         {
            _loc1_ = UT.coinFlip(true,false);
         }
         else
         {
            _loc1_ = Main.ARMORFIRST;
         }
         if(!_loc1_)
         {
            Log.CustomMetric("Clicked Play SFH1 - Sent to NotDoppler","Link");
            navigateToURL(new URLRequest("http://www.notdoppler.com/strikeforceheroes.php?ref=sfh2"));
         }
         else
         {
            Log.CustomMetric("Clicked Play SFH1 - Sent to Armorgames","Link");
            navigateToURL(new URLRequest("http://armorgames.com/play/13367/strike-force-heroes"));
         }
      }
      
      public static function exportSave(param1:uint) : void
      {
         setSaveLocation(param1);
         var _loc2_:SharedObject = SharedObject.getLocal(saveLocation,"/");
         var _loc3_:String = _loc2_.data.name;
         _loc3_ = UT.replaceString(_loc3_,"\\");
         _loc3_ = UT.replaceString(_loc3_,"/");
         _loc3_ = UT.replaceString(_loc3_,":");
         _loc3_ = UT.replaceString(_loc3_,"*");
         _loc3_ = UT.replaceString(_loc3_,"?");
         _loc3_ = UT.replaceString(_loc3_,"\"");
         _loc3_ = UT.replaceString(_loc3_,"<");
         _loc3_ = UT.replaceString(_loc3_,">");
         _loc3_ = UT.replaceString(_loc3_,"|");
         _loc3_ = UT.replaceString(_loc3_,"%");
         trace(_loc3_);
         var _loc4_:ByteArray;
         (_loc4_ = new ByteArray()).writeObject(_loc2_.data);
         _loc2_.close();
         var _loc5_:FileReference;
         (_loc5_ = new FileReference()).save(_loc4_,"Arknights：Strike Force Heroes 2 - " + _loc3_ + ".sfh2");
      }
      
      public static function importSave(param1:uint, param2:Menu) : void
      {
         var saveSpot:uint = 0;
         var exFile:FileReference = null;
         var onFileSelected:Function = null;
         var onFileLoaded:Function = null;
         var _num:uint = param1;
         var _menu:Menu = param2;
         onFileSelected = function(param1:Event):void
         {
            trace("onFileSelected");
            exFile.addEventListener(Event.COMPLETE,onFileLoaded);
            exFile.load();
         };
         onFileLoaded = function(param1:Event):void
         {
            var _loc2_:FileReference = param1.target as FileReference;
            var _loc3_:ByteArray = _loc2_["data"];
            trace("File loaded");
            setSaveLocation(saveSpot);
            var _loc4_:SharedObject;
            (_loc4_ = SharedObject.getLocal(saveLocation,"/")).clear();
            UT.mergeObject(_loc4_.data,_loc3_.readObject());
            _loc4_.data.savedBefore = true;
            if(saveSlot == 4)
            {
               AGI.saveData(_loc4_.data);
            }
            _loc4_.flush();
            _loc4_.close();
            SH.playSound(S_ClickGo);
            _menu.Init();
         };
         saveSpot = _num;
         var fileFilter:FileFilter = new FileFilter("SFH2 Saves","*.sfh2");
         exFile = new FileReference();
         exFile.addEventListener(Event.SELECT,onFileSelected);
         exFile.browse([fileFilter]);
      }
      
      public static function loadNews(param1:MovieClip) : void
      {
         var myTextLoader:URLLoader = null;
         var onTxtLoaded:Function = null;
         var loadingTxtError:Function = null;
         var imageLoader:Loader = null;
         var onImgLoaded:Function = null;
         var loadingImgError:Function = null;
         var _mc:MovieClip = param1;
         onTxtLoaded = function(param1:Event):void
         {
            trace("Text loaded",param1.target.data);
            useLink = param1.target.data;
            _mc.buttonMode = true;
            myTextLoader.removeEventListener(Event.COMPLETE,onTxtLoaded);
         };
         loadingTxtError = function(param1:IOErrorEvent):void
         {
            trace("Text NOT loaded");
            useLink = "";
            _mc.buttonMode = false;
            myTextLoader.removeEventListener(IOErrorEvent.IO_ERROR,loadingTxtError);
         };
         onImgLoaded = function(param1:Event):void
         {
            trace("Image loaded",imageLoader);
            _mc.addChild(imageLoader);
            _mc.x = 800 - _mc.width - 20;
            _mc.y = 170;
            imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onImgLoaded);
         };
         loadingImgError = function(param1:IOErrorEvent):void
         {
            trace("Image NOT loaded");
            _mc.y = 1000;
            imageLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadingImgError);
         };
         myTextLoader = new URLLoader();
         myTextLoader.addEventListener(Event.COMPLETE,onTxtLoaded);
         myTextLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingTxtError);
         myTextLoader.load(new URLRequest(!Main.DEBUGMODE ? "http://www.sky9games.com/gamenews/sfh2/newslink.txt" : "newslink.txt"));
         imageLoader = new Loader();
         imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,onImgLoaded);
         imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadingImgError);
         imageLoader.load(new URLRequest(!Main.DEBUGMODE ? "http://www.sky9games.com/gamenews/sfh2/newsimg.png" : "newsimg.png"));
      }
      
      public static function urlNews() : void
      {
         if(useLink)
         {
            navigateToURL(new URLRequest(useLink),"_blank");
            return;
         }
      }
   }
}
