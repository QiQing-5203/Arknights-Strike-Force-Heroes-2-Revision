package
{
   import flash.display.*;
   import flash.external.*;
   import flash.system.*;
   import flash.utils.*;
   
   public final class Debug
   {
      
      private static var _allowTrace:Boolean;
      
      private static var _allowJavascriptConsole:Boolean;
      
      private static var _allowConsole:Boolean;
      
      private static var _outputCallback:Function;
      
      private static var _isDebugPermitted:Boolean;
      
      private static var packageNameOn:Boolean;
      
      private static var classNameOn:Boolean;
      
      private static var methodNameOn:Boolean;
      
      private static var lineNumberOn:Boolean;
      
      private static var classFilters:Vector.<String>;
      
      private static var omitFilters:Vector.<String>;
      
      private static var _tracker:DebugTracker = new DebugTracker();
      
      private static var _console:DebugConsole = new DebugConsole();
      
      private static var _initialized:Boolean;
      
      public static var COLOR_DEBUG:uint = 16777215;
      
      public static var COLOR_WARN:uint = 16777045;
      
      public static var COLOR_ERROR:uint = 16733525;
      
      public static var COLOR_FATAL:uint = 16733525;
      
      public static const LEVEL_NONE:uint = 0;
      
      public static const LEVEL_FATAL:uint = 1;
      
      public static const LEVEL_ERROR:uint = 2;
      
      public static const LEVEL_WARN:uint = 3;
      
      public static const LEVEL_DEBUG:uint = 4;
      
      public static const LEVEL_ALL:uint = 5;
      
      private static var outputLevel:uint = LEVEL_ALL;
      
      private static var _developerMode:Boolean;
      
      private static var _perfTestTime:int;
      
      public static var openConsoleOnError:Boolean = true;
      
      {
         _init();
      }
      
      public function Debug()
      {
         super();
      }
      
      private static function _init() : void
      {
         var _loc1_:Error = new Error();
         var _loc2_:String = _loc1_.getStackTrace();
         _isDebugPermitted = !Boolean(!_loc2_ || _loc2_.indexOf("[") == -1);
         _initialized = false;
      }
      
      public static function init(param1:Stage, param2:Boolean = true) : void
      {
         if(!_initialized)
         {
            _developerMode = param2;
            _allowTrace = true;
            _allowConsole = true;
            _allowJavascriptConsole = _developerMode;
            _tracker = new DebugTracker(param1,_developerMode);
            _console = new DebugConsole(param1,_developerMode);
            if(!_developerMode)
            {
               outputLevel = LEVEL_ERROR;
            }
            else
            {
               outputLevel = LEVEL_ALL;
            }
            packageNameOn = true;
            classNameOn = true;
            methodNameOn = true;
            lineNumberOn = true;
            _console.addCommand("omit",omitCommand,{
               "description":"Omits debug statements from outputting (INFO, DEBUG, etc.).",
               "params":[{
                  "type":"String Array",
                  "description":"A list of statements to omit.",
                  "optional":true
               }]
            });
            _console.addCommand("filter",filterCommand,{
               "description":"Filters output to come only from the classnames provided (Requires debug mode).",
               "params":[{
                  "type":"String Array",
                  "description":"A list of classnames to filter out.",
                  "optional":true
               }]
            });
            if(!_isDebugPermitted)
            {
               output("",["[Debug] Debug mode is off for your application. All traces will output without formatting."],LEVEL_ALL,false,COLOR_WARN);
            }
            _initialized = true;
            return;
         }
      }
      
      private static function omitCommand(... rest) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < rest.length)
         {
            _loc3_ = String(rest[_loc4_]);
            addOmitFilter(_loc3_);
            _loc2_.push(_loc3_.toUpperCase());
            _loc4_++;
         }
         out("Omitted statements: " + _loc2_);
      }
      
      private static function filterCommand(... rest) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < rest.length)
         {
            _loc3_ = String(rest[_loc4_]);
            addClassFilter(_loc3_);
            _loc2_.push(_loc3_.toUpperCase());
            _loc4_++;
         }
         out("Filtered classnames: " + _loc2_);
      }
      
      public static function get console() : DebugConsole
      {
         return _console;
      }
      
      public static function get tracker() : DebugTracker
      {
         return _tracker;
      }
      
      public static function beginTest() : void
      {
         _perfTestTime = getTimer();
      }
      
      public static function endTest(param1:String = null) : void
      {
         output(!param1 ? "TEST:\n\t" : param1.toUpperCase() + ": ",[getTimer() - _perfTestTime + "ms"],LEVEL_DEBUG);
      }
      
      public static function out(... rest) : void
      {
         output("",rest,LEVEL_ALL);
      }
      
      public static function debug(... rest) : void
      {
         output("DEBUG: ",rest,LEVEL_DEBUG,false,COLOR_DEBUG);
      }
      
      public static function warn(... rest) : void
      {
         output("WARNING: ",rest,LEVEL_WARN,false,COLOR_WARN);
      }
      
      public static function error(... rest) : void
      {
         output("ERROR:\n\t",rest,LEVEL_ERROR,openConsoleOnError,COLOR_ERROR);
      }
      
      public static function fatal(... rest) : void
      {
         output("FATAL ERROR:\n\t",rest,LEVEL_FATAL,openConsoleOnError,COLOR_FATAL);
      }
      
      public static function outEx(param1:String, param2:uint, param3:uint, param4:Boolean, ... rest) : void
      {
         output(param1,rest,param2,param4,param3);
      }
      
      public static function addClassFilter(param1:String) : void
      {
         if(param1 != "")
         {
            if(!classFilters)
            {
               classFilters = new Vector.<String>();
            }
            if(classFilters.indexOf(param1) == -1)
            {
               classFilters.push(param1);
            }
            return;
         }
      }
      
      public static function removeClassFilter(param1:String) : void
      {
         if(classFilters)
         {
            var _loc2_:int = classFilters.indexOf(param1);
            if(_loc2_ >= 0)
            {
               classFilters.splice(_loc2_,1);
               if(classFilters.length == 0)
               {
                  classFilters = null;
               }
               return;
            }
            return;
         }
      }
      
      public static function removeAllClassFilters() : void
      {
         classFilters = null;
      }
      
      public static function addOmitFilter(param1:String) : void
      {
         if(!omitFilters)
         {
            omitFilters = new Vector.<String>();
         }
         var _loc2_:String = param1.toUpperCase();
         if(omitFilters.indexOf(_loc2_) == -1)
         {
            omitFilters.push(_loc2_);
         }
      }
      
      public static function removeOmitFilter(param1:String) : void
      {
         if(omitFilters)
         {
            var _loc2_:String = param1.toUpperCase();
            var _loc3_:int = omitFilters.indexOf(_loc2_);
            if(_loc3_ >= 0)
            {
               omitFilters.splice(_loc3_,1);
               if(omitFilters.length == 0)
               {
                  omitFilters = null;
               }
               return;
            }
            return;
         }
      }
      
      public static function removeAllOmitFilters() : void
      {
         omitFilters = null;
      }
      
      public static function setOutputLevel(param1:uint) : void
      {
         outputLevel = param1;
      }
      
      public static function getOutputLevel() : uint
      {
         return outputLevel;
      }
      
      public static function setOutputCallback(param1:Function) : void
      {
         _outputCallback = param1;
      }
      
      public static function formatOutput(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true) : void
      {
         packageNameOn = param1;
         classNameOn = param2;
         methodNameOn = param3;
         lineNumberOn = param4;
      }
      
      public static function get isDebugPermitted() : Boolean
      {
         return _isDebugPermitted;
      }
      
      public static function get developerMode() : Boolean
      {
         return _developerMode;
      }
      
      public static function get allowTrace() : Boolean
      {
         return _allowTrace;
      }
      
      public static function set allowTrace(param1:Boolean) : void
      {
         _allowTrace = param1;
      }
      
      public static function get allowJavascriptConsole() : Boolean
      {
         return _allowJavascriptConsole;
      }
      
      public static function set allowJavascriptConsole(param1:Boolean) : void
      {
         _allowJavascriptConsole = param1;
      }
      
      public static function get allowConsole() : Boolean
      {
         return _allowConsole;
      }
      
      public static function set allowConsole(param1:Boolean) : void
      {
         _allowConsole = param1;
      }
      
      private static function output(param1:String, param2:Array, param3:uint, param4:Boolean = false, param5:Object = null) : void
      {
         var i:int;
         var l:uint;
         var t:String;
         var str:String = null;
         var exists:Boolean = false;
         var msg:String = param1;
         var args:Array = param2;
         var level:uint = param3;
         var openConsole:Boolean = param4;
         var consoleColor:Object = param5;
         if(level <= outputLevel)
         {
            i = 0;
            l = args.length;
            i = 0;
            while(i < l)
            {
               if(args[i] != null)
               {
                  msg += args[i].toString();
               }
               else
               {
                  msg += "null";
               }
               if(!(args[i] is String))
               {
                  if(i <= l - 1)
                  {
                     msg += " ";
                  }
               }
               else if(args[i].charAt(args[i].length - 1) != "\n")
               {
                  msg += " ";
               }
               i++;
            }
            t = "";
            if(!_isDebugPermitted)
            {
               t = msg;
            }
            else
            {
               str = getDebugInfo(4);
               if(classFilters)
               {
                  l = classFilters.length;
                  exists = false;
                  i = 0;
                  while(i < l)
                  {
                     if(str.indexOf(classFilters[i]) != -1)
                     {
                        exists = true;
                        break;
                     }
                     i++;
                  }
                  if(!exists)
                  {
                     return;
                  }
               }
               if(str == "")
               {
                  t = msg;
               }
               else
               {
                  t = str + " " + msg;
               }
            }
            if(omitFilters)
            {
               l = omitFilters.length;
               i = 0;
               while(i < l)
               {
                  if(t.indexOf(omitFilters[i]) != -1)
                  {
                     return;
                  }
                  i++;
               }
            }
            if(_allowTrace)
            {
               trace(t);
            }
            if(_outputCallback != null)
            {
               _outputCallback(msg);
            }
            if(_allowConsole)
            {
               console.output(t,consoleColor);
               if(openConsole)
               {
                  console.open();
               }
            }
            if(_allowJavascriptConsole && Capabilities.playerType != "StandAlone")
            {
               try
               {
                  if(ExternalInterface.available)
                  {
                     ExternalInterface.call("console.log",t);
                  }
               }
               catch(e:Error)
               {
                  _allowJavascriptConsole = false;
                  output("",["[Debug] Javascript Console is unavailable. Swf must be embedded with \'allowScriptAccess=true\'."],LEVEL_ALL,false,COLOR_WARN);
               }
            }
            return;
         }
      }
      
      private static function getDebugInfo(param1:uint) : String
      {
         var _loc12_:Array = null;
         var _loc14_:Array = null;
         var _loc2_:Error = new Error();
         var _loc3_:String = _loc2_.getStackTrace();
         if(!(!_loc3_ || _loc3_.indexOf("[") == -1))
         {
            var _loc4_:Array = _loc3_.split("\n");
            if(param1 < _loc4_.length)
            {
               var _loc5_:Array = _loc4_[param1].split("[");
               var _loc6_:String = "";
               if(_loc5_[1] != null)
               {
                  _loc14_ = _loc5_[1].split(":");
                  _loc6_ = _loc14_[_loc14_.length - 1].substr(0,_loc14_[_loc14_.length - 1].length - 1);
               }
               var _loc7_:String;
               var _loc8_:Array = (_loc7_ = _loc5_[0].substring(4)).split("::");
               var _loc9_:String = "";
               var _loc10_:String = "";
               var _loc11_:String = "";
               if(_loc8_.length <= 1)
               {
                  _loc10_ = (_loc12_ = _loc8_[0].split("/"))[0];
                  _loc11_ = _loc12_[1];
               }
               else
               {
                  _loc9_ = _loc8_[0];
                  _loc10_ = (_loc12_ = _loc8_[1].split("/"))[0];
                  _loc11_ = _loc12_[1];
               }
               var _loc13_:String = "[";
               if(packageNameOn && _loc9_ != "")
               {
                  _loc13_ += _loc9_;
               }
               if(classNameOn)
               {
                  _loc13_ += (!(packageNameOn && _loc9_ != "") ? "" : "::") + _loc10_;
               }
               if(methodNameOn && _loc11_ != null)
               {
                  _loc13_ += (!(classNameOn || packageNameOn) ? "" : "/") + _loc11_;
               }
               if(lineNumberOn && _loc6_ != "")
               {
                  _loc13_ += (!(classNameOn || packageNameOn || methodNameOn) ? "" : ":") + _loc6_;
               }
               return _loc13_ + "]";
            }
            return "";
         }
         return "";
      }
   }
}
