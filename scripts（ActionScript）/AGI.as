package
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class AGI
   {
      
      public static var agi;
      
      public static var questAgi;
      
      public static var AGI_URL:String = "http://agi.armorgames.com/assets/agi/AGI.swf";
      
      public static var AGI_QUEST_URL:String = "http://agi.armorgames.com/assets/agi/AchievementsAPI.swf";
      
      public static var userData:Object;
      
      public static var container;
      
      public static var gotQuests;
       
      
      public function AGI()
      {
         super();
      }
      
      public static function Init(param1:*) : void
      {
         var loader:Loader;
         var questLoader:Loader;
         var loadComplete:Function = null;
         var QuestLoadComplete:Function = null;
         var _container:* = param1;
         loadComplete = function(param1:Event):void
         {
            agi = param1.currentTarget.content;
            container.addChild(agi);
            agi.init("8305de24f40bccbf25b991ca6d443334","strike-force-heroes-2",null,true);
            agi.initAGUI({"onClose":agiClosed});
            agiTrace("-- AGI load complete: " + agi);
         };
         var onError:Function = function(param1:Event):void
         {
            agiTrace("Error");
         };
         QuestLoadComplete = function(param1:Event):void
         {
            questAgi = param1.currentTarget.content;
            questAgi.init({
               "apiKey":"08CC813A-932F-4F11-A28E-48E4862135BA",
               "stage":Main.STAGE,
               "debug":true,
               "console":true
            });
            agiTrace("-- AGI Quest load complete: " + questAgi);
         };
         container = _container;
         agiTrace("AGI Init");
         Security.allowDomain(AGI_URL);
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
         loader.load(new URLRequest(AGI_URL));
         Security.allowDomain(AGI_QUEST_URL);
         questLoader = new Loader();
         questLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,QuestLoadComplete);
         questLoader.load(new URLRequest(AGI_QUEST_URL));
         gotQuests = {};
      }
      
      public static function isLoggedIn() : Boolean
      {
         if(agi)
         {
            agiTrace("AGI.isLoggedIn " + agi.isLoggedIn());
            if(!agi.isLoggedIn())
            {
               userData = null;
            }
            else
            {
               userData = agi.getUserData();
            }
            return agi.isLoggedIn();
         }
         agiTrace("AGI.isLoggedIn Not Loaded");
         return false;
      }
      
      public static function loadUserImage(param1:*) : void
      {
         agiTrace("Load user image " + userData.avatar_url);
         var _loc2_:Loader = new Loader();
         var _loc3_:URLRequest = new URLRequest(userData.avatar_url);
         _loc2_.load(_loc3_);
         param1.addChild(_loc2_);
      }
      
      public static function getUserName() : String
      {
         return agi.getUserName();
      }
      
      public static function showLogin() : void
      {
         var callback:Function = null;
         callback = function(param1:Object):void
         {
            if(!param1.success)
            {
               agiTrace(param1.error);
            }
            else if(param1.loggedIn)
            {
               agiTrace("Clicked Continue after logging in");
            }
            else
            {
               agiTrace("Clicked Logout");
            }
         };
         agi.showLogin(callback);
      }
      
      public static function isVisible() : Boolean
      {
         if(agi)
         {
            agiTrace("AGI.isVisible " + agi.isAGUIVisible());
            return agi.isAGUIVisible();
         }
         agiTrace("AGI.isVisible Not Loaded");
         return false;
      }
      
      public static function agiClosed(param1:Boolean = true) : void
      {
         isLoggedIn();
         Main.curClass.Init();
      }
      
      public static function loadData() : void
      {
         var callback:Function = null;
         callback = function(param1:Object):void
         {
            var _loc2_:Object = null;
            if(!param1.success)
            {
               agiTrace(param1.error);
            }
            else
            {
               agiTrace("AGI.loadData Successful");
               if(!(Boolean(param1.data.savedata1) && Boolean(param1.data.savedata1.savedBefore)))
               {
                  if(param1.data.savedBefore)
                  {
                     agiTrace("Load from old Save");
                     _loc2_ = param1.data;
                  }
               }
               else
               {
                  agiTrace("Load from new Save");
                  _loc2_ = param1.data.savedata1;
               }
               if(_loc2_)
               {
                  agiTrace(_loc2_);
                  agiTrace(_loc2_.name);
                  agiTrace(_loc2_.savedBefore);
                  SD.setSaveLocation(4);
                  SD.loadGame(_loc2_);
               }
               else
               {
                  agiTrace("No save found!");
                  SD.setSaveLocation(4);
                  SD.newGame();
                  SD.eraseGame(true);
               }
               Main.curClass.Init(true);
               Main.curClass.save4.y = 405;
               Main.curClass.saveLoad.y = 5000;
            }
         };
         agi.retrieveUserData(callback);
      }
      
      public static function saveData(param1:Object) : void
      {
         var callback:Function = null;
         var _ob:Object = param1;
         callback = function(param1:Object):void
         {
            if(!param1.success)
            {
               agiTrace(param1.error);
            }
            else
            {
               agiTrace("AGI.saveData Successful");
            }
         };
         agi.submitUserData("savedata1",_ob,callback);
      }
      
      public static function deleteData() : void
      {
         var callback:Function = null;
         var callbackOld:Function = null;
         callback = function(param1:Object):void
         {
            if(!param1.success)
            {
               agiTrace(param1.error);
            }
            else
            {
               agiTrace("AGI.deleteData Successful");
            }
         };
         callbackOld = function(param1:Object):void
         {
            if(!param1.success)
            {
               agiTrace(param1.error);
            }
            else
            {
               agiTrace("AGI.deleteOldData Successful");
            }
         };
         agi.submitUserData("savedata1",{"savedBefore":false},callback);
         agi.submitUserDataObject({"savedBefore":false},callbackOld);
      }
      
      public static function submitQuest(param1:String) : void
      {
         agiTrace("AGI.attemptQuest " + param1);
         if(!(!agi || !questAgi || !isLoggedIn() || Boolean(gotQuests[param1])))
         {
            agiTrace("AGI.submitQuest " + param1);
            gotQuests[param1] = true;
            questAgi.achievements.submit({"key":param1});
            return;
         }
      }
      
      public static function agiTrace(param1:*) : void
      {
         trace(param1);
         Debug.out(param1);
      }
   }
}
