package
{
   import Playtomic.GameVars;
   import Playtomic.Log;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.ContextMenu;
   
   public class Main extends MovieClip
   {
      
      public static var STAGE;
      
      public static var ARMORFIRST:Boolean;
      
      public static var SPONSORSITE:Boolean;
      
      public static var DEBUGMODE:Boolean;
      
      public static var NOPLAY:Boolean;
      
      public static var WIDTH:uint;
      
      public static var HEIGHT:uint;
      
      public static var VERSION:String;
      
      public static var NEWS:String;
      
      public static var curClass;
       
      
      private var added:Boolean;
      
      public var bitHandler:BH;
      
      private var achievement:Stats_Achievements;
      
      private var agiCont:Sprite;
      
      public function Main()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,24,this.frame25);
         addEventListener(Event.ADDED_TO_STAGE,this.Init,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
      }
      
      public function __setPerspectiveProjection_(param1:Event) : void
      {
         root.transform.perspectiveProjection.fieldOfView = 72;
         root.transform.perspectiveProjection.projectionCenter = new Point(400,300);
      }
      
      private function Init(param1:Event) : void
      {
         var _loc2_:ContextMenu = null;
         Debug.init(stage,DEBUGMODE);
         if(!Main.DEBUGMODE)
         {
            _loc2_ = new ContextMenu();
            _loc2_.builtInItems.forwardAndBack = false;
            _loc2_.builtInItems.loop = false;
            _loc2_.builtInItems.play = false;
            _loc2_.builtInItems.print = false;
            _loc2_.builtInItems.quality = false;
            _loc2_.builtInItems.rewind = false;
            _loc2_.builtInItems.save = false;
            _loc2_.builtInItems.zoom = false;
            contextMenu = _loc2_;
         }
         if(!this.added)
         {
            this.added = true;
            Main.STAGE = stage;
            Main.WIDTH = 800;
            Main.HEIGHT = 600;
            Main.VERSION = "Arknights：SFH2";
            stage.addEventListener(Event.ENTER_FRAME,this.EnterFrame);
            stage.addEventListener(Event.ACTIVATE,this.flashActivate);
            stage.addEventListener(Event.DEACTIVATE,this.flashDeactivate);
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this.KeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP,this.KeyUp);
            stage.addEventListener(MouseEvent.MOUSE_DOWN,this.MouseDown);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.MouseUp);
            stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheel);
            stage.addEventListener(MouseEvent.RIGHT_CLICK,this.DoNothing);
            stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.RightMouseDown);
            if(!DEBUGMODE)
            {
               SPONSORSITE = this.checkUrl(["https://ak.hypergryph.com/","https://space.bilibili.com/621988978?spm_id_from=333.1007.0.0"]);
               if(!SPONSORSITE)
               {
                  ARMORFIRST = true;
               }
               else
               {
                  ARMORFIRST = !this.checkUrl(["https://space.bilibili.com/621988978?spm_id_from=333.1007.0.0"]);
                  if(ARMORFIRST)
                  {
                     this.agiCont = new Sprite();
                     addChild(this.agiCont);
                     AGI.Init(this.agiCont);
                  }
               }
               this.startClass(LoaderScreen);
            }
            else
            {
               ARMORFIRST = true;
               SPONSORSITE = true;
               this.startClass(LoaderScreen);
               this.agiCont = new Sprite();
               addChild(this.agiCont);
            }
            MochiBot.track(this,"859b489f");
            GameVars.Load(this.GameVarsLoaded);
            return;
         }
      }
      
      private function GameVarsLoaded(param1:Object, param2:Object) : void
      {
         if(param2.Success)
         {
            if(Boolean(param1.News) && param1.News.length > 2)
            {
               Main.NEWS = param1.News;
            }
         }
      }
      
      public function loadDone() : void
      {
         gotoAndStop("start");
         trace("STARTING BH NOW");
         this.bitHandler = new BH(this);
      }
      
      public function renderDone() : void
      {
         Stats_Classes.Init();
         Stats_Guns.Init();
         Stats_Attachments.Init();
         Stats_Armor.Init();
         Stats_Maps.Init();
         Stats_Skills.Init();
         Stats_Streaks.Init();
         Stats_Misc.Init();
         MatchSettings.Init();
         Stats_Achievements.Init();
         SD.Init();
         SH.Init();
         if(!ARMORFIRST)
         {
            this.startClass(Logo_NotDoppler);
         }
         else
         {
            this.startClass(Logo_Armor);
         }
         this.achievement = new Stats_Achievements();
         addChild(this.achievement);
         Log.Play();
      }
      
      public function logoArmorDone() : void
      {
         if(!ARMORFIRST)
         {
            this.startClass(Logo_Sky9Games);
         }
         else
         {
            this.startClass(Logo_NotDoppler);
         }
      }
      
      public function logoDopplerDone() : void
      {
         if(!ARMORFIRST)
         {
            this.startClass(Logo_Armor);
         }
         else
         {
            this.startClass(Logo_Sky9Games);
         }
      }
      
      public function logoSky9Done() : void
      {
         this.startClass(Menu);
      }
      
      private function EnterFrame(param1:Event) : void
      {
         if(!(Boolean(this.bitHandler) && !this.bitHandler.complete))
         {
            curClass.EnterFrame();
            SH.EnterFrame();
         }
         else
         {
            curClass.showRender();
            this.bitHandler.setup();
         }
      }
      
      private function MouseDown(param1:MouseEvent) : void
      {
         if(curClass)
         {
            curClass.MouseDown();
         }
      }
      
      private function DoNothing(param1:MouseEvent) : void
      {
      }
      
      private function RightMouseDown(param1:MouseEvent) : void
      {
         if(curClass)
         {
            curClass.RightMouseDown();
         }
      }
      
      private function MouseUp(param1:MouseEvent) : void
      {
         if(curClass)
         {
            curClass.MouseUp();
         }
      }
      
      private function KeyDown(param1:KeyboardEvent) : void
      {
         if(curClass)
         {
            curClass.KeyDown(param1);
         }
      }
      
      private function KeyUp(param1:KeyboardEvent) : void
      {
         if(curClass)
         {
            curClass.KeyUp(param1);
         }
      }
      
      private function flashActivate(param1:Event) : void
      {
         trace("Flash Active");
         if(curClass)
         {
            curClass.flashActivate();
         }
      }
      
      private function flashDeactivate(param1:Event) : void
      {
         trace("Flash Deactive");
         if(curClass)
         {
            curClass.flashDeactivate();
         }
      }
      
      private function MouseWheel(param1:MouseEvent) : void
      {
         if(curClass)
         {
            curClass.MouseWheel(param1);
         }
      }
      
      public function startClass(param1:*, param2:Object = null) : void
      {
         if(curClass)
         {
            removeChild(curClass);
            curClass = null;
         }
         trace("new class:",param1);
         curClass = new param1(this,!param2 ? {} : param2);
         addChild(curClass);
         if(this.achievement)
         {
            setChildIndex(this.achievement,numChildren - 1);
         }
         if(this.agiCont)
         {
            setChildIndex(this.agiCont,numChildren - 1);
         }
         stage.focus = stage;
      }
      
      public function checkUrl(param1:Array) : Boolean
      {
         var _loc2_:String = loaderInfo.url;
         var _loc3_:Boolean = false;
         var _loc4_:uint = 0;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_] == _loc2_.substring(_loc2_.indexOf(".") + 1,_loc2_.indexOf("/",7)))
            {
               _loc3_ = true;
            }
            if(param1[_loc4_] == _loc2_.substring(_loc2_.indexOf("//") + 2,_loc2_.indexOf("/",7)))
            {
               _loc3_ = true;
            }
            if(param1[_loc4_] == _loc2_.substring(0,_loc2_.indexOf("/",7)))
            {
               _loc3_ = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         prevFrame();
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}
