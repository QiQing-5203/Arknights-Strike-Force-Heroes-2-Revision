package
{
   import flash.display.*;
   import flash.events.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public final class DebugConsole
   {
       
      
      private var _parent:Stage;
      
      private var _developerMode:Boolean;
      
      private const gap:String = "  ";
      
      private var _reservedCommands:Vector.<String>;
      
      private var _messages:Vector.<TextField>;
      
      private var _maxMessages:uint;
      
      private var _history:String;
      
      private var _navRect:Rectangle;
      
      private var _outputRect:Rectangle;
      
      private var _inputRect:Rectangle;
      
      private var _container:Sprite;
      
      private var _inputText:TextField;
      
      private var _messageContainer:Sprite;
      
      private var _messageContainerMask:Sprite;
      
      private var _vertThumb:Sprite;
      
      private var _horiThumb:Sprite;
      
      private var _closeBtn:Sprite;
      
      private var _maximizeBtn:Sprite;
      
      private var _copyBtn:Sprite;
      
      private var _vertThumbDown:Boolean;
      
      private var _horiThumbDown:Boolean;
      
      private var _touchedThumbs:Boolean;
      
      private var _commands:Dictionary;
      
      private var _enteredCommands:Vector.<String>;
      
      private var _indexCommand:int;
      
      private var _backgroundColor:uint;
      
      private var _backgroundAlpha:Number;
      
      private var _textFormat:TextFormat;
      
      private var _defaultTextColor:uint;
      
      private var _fontSize:Number;
      
      private var _wordWrap:Boolean;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _minHeight:Number;
      
      private var _buffer:Number;
      
      private var _buffer2:Number;
      
      private var _thumbLineThickness:Number;
      
      private var _openKeyCode:uint;
      
      private var _scriptLoader:URLLoader;
      
      private var _open:Boolean;
      
      private var _maximized:Boolean;
      
      public var onOpen:Function;
      
      public var onClose:Function;
      
      public function DebugConsole(param1:Stage = null, param2:Boolean = true)
      {
         super();
         if(param1)
         {
            this._developerMode = param2;
            this._openKeyCode = 192;
            this._backgroundColor = 0;
            this._backgroundAlpha = 0.8;
            this._width = param1.stageWidth;
            this._minHeight = param1.stageHeight * 0.4;
            this._height = param1.stageHeight >= this._minHeight ? this._minHeight : param1.stageHeight;
            this._buffer = 2;
            this._buffer2 = this._buffer * 2;
            this._thumbLineThickness = 5;
            this._defaultTextColor = 16777215;
            this._fontSize = 12;
            this._wordWrap = true;
            this._maxMessages = 256;
            this._navRect = new Rectangle(this._buffer,this._buffer,this._width - this._buffer2,12);
            this._outputRect = new Rectangle(this._buffer,this._navRect.bottom + this._buffer,this._width - this._buffer2 - this._thumbLineThickness,0);
            this._inputRect = new Rectangle(this._buffer,0,this._width - this._buffer2,20);
            this.width = param1.stageWidth;
            this.height = this._minHeight;
            this._history = "";
            this._container = new Sprite();
            this._container.tabChildren = this._container.tabEnabled = false;
            this._container.addEventListener(Event.ADDED_TO_STAGE,this.handleAddedToStage,false,0,true);
            this._container.addEventListener(MouseEvent.CLICK,this.handleClick,false,0,true);
            this._commands = new Dictionary(true);
            this._enteredCommands = new Vector.<String>();
            this._messages = new Vector.<TextField>();
            this._indexCommand = 0;
            this._parent = param1;
            this._parent.addEventListener(Event.ADDED_TO_STAGE,this.handleParentOnStage,false,0,true);
            this._parent.addEventListener(Event.ADDED,this.handleParentHasChild,false,0,true);
            this._parent.addEventListener(KeyboardEvent.KEY_UP,this.handleKeyUp,false,0,true);
            this._parent.addChild(this._container);
            this._messageContainer = new Sprite();
            this._messageContainer.mouseChildren = this._messageContainer.mouseEnabled = false;
            this._messageContainerMask = new Sprite();
            this._textFormat = new TextFormat("Courier New",this._fontSize);
            this._inputText = new TextField();
            this._inputText.defaultTextFormat = this._textFormat;
            this._inputText.type = TextFieldType.INPUT;
            this._inputText.restrict = "^`\n";
            this._inputText.multiline = false;
            this._inputText.textColor = this._defaultTextColor;
            this._vertThumb = new Sprite();
            this._vertThumb.addEventListener(MouseEvent.MOUSE_DOWN,this.handleVertThumbMouseDown,false,0,true);
            this._vertThumb.buttonMode = true;
            this._horiThumb = new Sprite();
            this._horiThumb.addEventListener(MouseEvent.MOUSE_DOWN,this.handleHoriThumbMouseDown,false,0,true);
            this._horiThumb.buttonMode = true;
            this._parent.addEventListener(MouseEvent.MOUSE_UP,this.handleParentMouseUp,false,0,true);
            this._parent.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel,false,0,true);
            this._parent.addEventListener(Event.RESIZE,this.handleStageResize,false,0,true);
            this._touchedThumbs = false;
            this._closeBtn = new Sprite();
            this._closeBtn.graphics.lineStyle(1,16777215);
            this._closeBtn.graphics.beginFill(0,0);
            this._closeBtn.graphics.drawRect(0,0,12,12);
            this._closeBtn.graphics.endFill();
            this._closeBtn.graphics.lineStyle(2,16777215);
            this._closeBtn.graphics.moveTo(3,3);
            this._closeBtn.graphics.lineTo(10,10);
            this._closeBtn.graphics.moveTo(10,3);
            this._closeBtn.graphics.lineTo(3,10);
            this._closeBtn.buttonMode = true;
            this._closeBtn.addEventListener(MouseEvent.CLICK,this.handleCloseBtnClick,false,0,true);
            this._maximizeBtn = new Sprite();
            this._maximizeBtn.graphics.lineStyle(1,16777215);
            this._maximizeBtn.graphics.beginFill(0,0);
            this._maximizeBtn.graphics.drawRect(0,0,12,12);
            this._maximizeBtn.graphics.endFill();
            this._maximizeBtn.graphics.drawRect(0,0,12,3);
            this._maximizeBtn.buttonMode = true;
            this._maximizeBtn.addEventListener(MouseEvent.CLICK,this.handleMaximizeBtnClick,false,0,true);
            this._copyBtn = new Sprite();
            this._copyBtn.graphics.beginFill(0,0);
            this._copyBtn.graphics.drawRect(0,0,12,12);
            this._copyBtn.graphics.endFill();
            this._copyBtn.graphics.lineStyle(1,16777215);
            this._copyBtn.graphics.drawRect(0,0,6,7);
            this._copyBtn.graphics.drawRect(4,5,6,7);
            this._copyBtn.buttonMode = true;
            this._copyBtn.addEventListener(MouseEvent.CLICK,this.handleCopyBtnClick,false,0,true);
            this._reservedCommands = Vector.<String>(["help","close","clear","copy","tostring"]);
            this.createCommand("help",this.executeHelp,{
               "description":"Provides helpful info for commands.",
               "params":[{
                  "type":"command",
                  "description":"Displays help info on that command.",
                  "optional":true
               }]
            });
            this.createCommand("exit",this.close,{"description":"Closes the console window."});
            this.createCommand("clear",this.clear,{
               "description":"Clears the console screen.",
               "params":[{
                  "type":"Boolean",
                  "description":"Pass true to clear all history, not just what\'s in the console.",
                  "optional":true
               }]
            });
            this.createCommand("copy",this.copyToClipboard,{"description":"Copies all output to clipboard."});
            this.createCommand("min",this.minimize,{"description":"Minimizes the console window."});
            this.createCommand("max",this.maximize,{"description":"Maximizes the console window."});
            this.createCommand("run",this.runScript,{
               "description":"Runs a series of commands delimited by a semicolon (;).",
               "params":[{
                  "type":"script",
                  "description":"The script to execute."
               }]
            });
            this.createCommand("load",this.loadScript,{
               "description":"Loads a text file and executes commands within.",
               "params":[{
                  "type":"url",
                  "description":"URL of the script file."
               }]
            });
            this._open = false;
            this._maximized = false;
            return;
         }
      }
      
      private function handleAddedToStage(param1:Event) : void
      {
         if(this._parent)
         {
            if(this._open)
            {
               this.open();
            }
            return;
         }
      }
      
      public function open() : void
      {
         if(this._parent)
         {
            this._container.graphics.clear();
            this._container.graphics.lineStyle();
            this._container.graphics.beginFill(this._backgroundColor,this._backgroundAlpha);
            this._container.graphics.drawRect(0,0,this._width,this._height);
            this._container.graphics.endFill();
            if(this._developerMode)
            {
               this._container.graphics.lineStyle();
               this._container.graphics.beginFill(this._backgroundColor);
               this._container.graphics.drawRect(this._inputRect.x,this._inputRect.y,this._inputRect.width,this._inputRect.height);
               this._container.graphics.endFill();
               this._container.addChild(this._inputText);
               this._inputText.x = this._inputRect.x;
               this._inputText.y = this._inputRect.y;
               this._inputText.width = this._inputRect.width;
               this._inputText.height = this._inputRect.height;
               this._parent.focus = this._inputText;
            }
            this._container.addChild(this._messageContainer);
            this._messageContainer.x = this._outputRect.x;
            if(this._messageContainer.height <= this._outputRect.height)
            {
               this._messageContainer.y = this._navRect.bottom + this._buffer;
            }
            else
            {
               this._messageContainer.y = this._navRect.bottom + this._buffer - (this._messageContainer.height - this._outputRect.height);
            }
            this._messageContainerMask.x = this._outputRect.x;
            this._messageContainerMask.y = this._outputRect.y;
            this._messageContainerMask.graphics.clear();
            this._messageContainerMask.graphics.beginFill(65280);
            this._messageContainerMask.graphics.drawRect(0,0,this._outputRect.width,this._outputRect.height);
            this._messageContainerMask.graphics.endFill();
            this._container.addChild(this._messageContainerMask);
            this._messageContainer.mask = this._messageContainerMask;
            this._closeBtn.x = this._navRect.right - this._closeBtn.width;
            this._closeBtn.y = this._navRect.y;
            this._container.addChild(this._closeBtn);
            this._maximizeBtn.x = this._navRect.right - this._closeBtn.width - this._maximizeBtn.width - this._buffer;
            this._maximizeBtn.y = this._navRect.y;
            this._container.addChild(this._maximizeBtn);
            this._copyBtn.x = this._navRect.right - this._closeBtn.width - this._maximizeBtn.width - this._copyBtn.width - this._buffer2;
            this._copyBtn.y = this._navRect.y;
            this._container.addChild(this._copyBtn);
            this._inputText.text = "";
            this._container.x = 0;
            this._container.y = this._parent.stageHeight - this._height;
            this._open = true;
            this._touchedThumbs = false;
            this.updateScrollBars();
            if(this.onOpen != null)
            {
               this.onOpen();
            }
            return;
         }
      }
      
      public function close() : void
      {
         if(this._parent)
         {
            this._container.graphics.clear();
            if(this._container.contains(this._messageContainer))
            {
               this._container.removeChild(this._messageContainer);
            }
            if(this._container.contains(this._messageContainerMask))
            {
               this._container.removeChild(this._messageContainerMask);
            }
            if(this._container.contains(this._inputText))
            {
               this._container.removeChild(this._inputText);
            }
            if(this._container.contains(this._vertThumb))
            {
               this._container.removeChild(this._vertThumb);
            }
            if(this._container.contains(this._horiThumb))
            {
               this._container.removeChild(this._horiThumb);
            }
            if(this._container.contains(this._closeBtn))
            {
               this._container.removeChild(this._closeBtn);
            }
            if(this._container.contains(this._maximizeBtn))
            {
               this._container.removeChild(this._maximizeBtn);
            }
            if(this._container.contains(this._copyBtn))
            {
               this._container.removeChild(this._copyBtn);
            }
            if(this._parent)
            {
               this._parent.focus = this._parent;
            }
            this._open = false;
            this.updateScrollBars();
            if(this.onClose != null)
            {
               this.onClose();
            }
            return;
         }
      }
      
      public function maximize() : void
      {
         if(this._parent)
         {
            this._maximized = true;
            this.height = this._parent.stageHeight;
            if(this._open)
            {
               this.open();
            }
            return;
         }
      }
      
      public function minimize() : void
      {
         if(this._parent)
         {
            this._maximized = false;
            this.height = this._minHeight;
            if(this._open)
            {
               this.open();
            }
            return;
         }
      }
      
      public function addCommand(param1:String, param2:Function, param3:Object = null) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:Boolean = false;
         var _loc7_:XML = null;
         var _loc8_:XML = null;
         if(this._parent)
         {
            var _loc4_:String = param1.toLowerCase();
            if(this._reservedCommands.indexOf(_loc4_) == -1)
            {
               if(!this._commands[_loc4_])
               {
                  if(param3)
                  {
                     if(param3.hasOwnProperty("parent"))
                     {
                        _loc5_ = param3.parent;
                        _loc6_ = false;
                        _loc7_ = describeType(_loc5_);
                        for each(_loc8_ in _loc7_.method)
                        {
                           if(_loc5_[_loc8_.@name] == param2)
                           {
                              param3.methodXML = _loc8_;
                              _loc6_ = true;
                              break;
                           }
                        }
                        if(!_loc6_)
                        {
                           this.output("ERROR => Parameters for the \'" + _loc4_ + "\' command cannot be found.\nPlease make sure the method passed is PUBLIC to the \'parent\' paramter.",Debug.COLOR_ERROR);
                        }
                     }
                  }
                  this.createCommand(param1,param2,param3);
                  return;
               }
               this.output("ERROR => \'" + _loc4_ + "\' is already a predefined command and cannot be added.",Debug.COLOR_ERROR);
               return;
            }
            this.output("ERROR => \'" + _loc4_ + "\' is an internal command and cannot be added.",Debug.COLOR_ERROR);
            return;
         }
      }
      
      public function hasCommand(param1:String) : Boolean
      {
         return Boolean(this._commands[param1.toLowerCase()]);
      }
      
      public function removeCommand(param1:String) : void
      {
         if(this._parent)
         {
            var _loc2_:String = param1.toLowerCase();
            if(!(!this._commands[_loc2_] || this._reservedCommands.indexOf(_loc2_) != -1))
            {
               this._commands[_loc2_] = null;
               delete this._commands[_loc2_];
               return;
            }
            return;
         }
      }
      
      public function removeAllCommands() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this._commands)
         {
            this.removeCommand(_loc1_);
         }
      }
      
      public function runScript(param1:String) : void
      {
         this.output(this.gap + "-- Running script...");
         this.parseScript(param1,";");
         this.output(this.gap + "-- Finished running script.");
      }
      
      public function loadScript(param1:String) : void
      {
         if(!this._scriptLoader)
         {
            this.output(this.gap + "Loading script from url: " + param1);
            this._scriptLoader = new URLLoader(new URLRequest(param1));
            this._scriptLoader.addEventListener(Event.COMPLETE,this.handleScriptLoaded,false,0,true);
            this._scriptLoader.addEventListener(IOErrorEvent.IO_ERROR,this.handleScriptLoadFailed,false,0,true);
            this._scriptLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleScriptLoadFailed,false,0,true);
            return;
         }
      }
      
      public function output(param1:String, param2:Object = null) : void
      {
         var _loc4_:TextField = null;
         if(this._parent)
         {
            var _loc3_:TextField = new TextField();
            _loc3_.defaultTextFormat = this._textFormat;
            _loc3_.textColor = param2 == null ? this._defaultTextColor : uint(param2);
            _loc3_.mouseEnabled = false;
            _loc3_.multiline = true;
            _loc3_.maxChars = 65536;
            _loc3_.y = this._messageContainer.height;
            _loc3_.text = param1;
            _loc3_.wordWrap = this._wordWrap;
            if(!this._wordWrap)
            {
               _loc3_.autoSize = TextFieldAutoSize.LEFT;
               _loc3_.height = 10;
            }
            else
            {
               _loc3_.width = this._outputRect.width;
               _loc3_.autoSize = TextFieldAutoSize.NONE;
               _loc3_.height = _loc3_.textHeight + 4;
            }
            this._messages.push(_loc3_);
            if(this._messages.length > this._maxMessages)
            {
               if(_loc4_ = this._messages.shift())
               {
                  if(this._messageContainer.contains(_loc4_))
                  {
                     this._messageContainer.removeChild(_loc4_);
                  }
                  this.renderMessages();
               }
            }
            this._messageContainer.addChild(_loc3_);
            if(!this._touchedThumbs && this._open)
            {
               if(this._messageContainer.height <= this._outputRect.height)
               {
                  this._messageContainer.y = this._navRect.bottom + this._buffer;
               }
               else
               {
                  this._messageContainer.y = this._navRect.bottom + this._buffer - (this._messageContainer.height - this._outputRect.height);
               }
            }
            this._history += param1 + "\n";
            this.updateScrollBars();
            return;
         }
      }
      
      private function renderMessages() : void
      {
         var _loc1_:TextField = null;
         while(this._messageContainer.numChildren > 0)
         {
            this._messageContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._messages.length)
         {
            _loc1_ = this._messages[_loc2_];
            _loc1_.y = this._messageContainer.height;
            this._messageContainer.addChild(_loc1_);
            _loc2_++;
         }
      }
      
      public function clear(param1:Boolean = false) : void
      {
         if(this._parent)
         {
            while(this._messageContainer.numChildren > 0)
            {
               this._messageContainer.removeChildAt(0);
            }
            while(this._messages.length > 0)
            {
               this._messages.shift();
            }
            if(param1)
            {
               this._history = "";
            }
            this.updateScrollBars();
            return;
         }
      }
      
      public function copyToClipboard() : void
      {
         if(this._parent)
         {
            System.setClipboard(this.getHistory());
            this.output("Output copied to clipboard.");
            return;
         }
      }
      
      public function getHistory() : String
      {
         return this._history;
      }
      
      public function getOutput() : String
      {
         var _loc1_:String = null;
         if(this._parent)
         {
            var _loc2_:int = 0;
            while(_loc2_ < this._messages.length)
            {
               _loc1_ += this._messages[_loc2_].text;
               _loc2_++;
            }
            return _loc1_;
         }
         return "";
      }
      
      public function get isOpen() : Boolean
      {
         return this._open;
      }
      
      public function get maximized() : Boolean
      {
         return this._maximized;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         this._width = param1;
         this._navRect.width = this._outputRect.width = this._inputRect.width = this._width - this._buffer2;
         this._outputRect.width -= this._thumbLineThickness;
         if(this._open)
         {
            this.open();
         }
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         this._height = param1;
         if(this._height < this._minHeight)
         {
            this._height = this._minHeight;
         }
         var _loc2_:Number = !this._developerMode ? this._buffer : this._inputRect.height + this._buffer * 4;
         this._outputRect.height = this._height - this._navRect.height - _loc2_ - this._thumbLineThickness;
         this._inputRect.y = this._outputRect.bottom + this._buffer + this._thumbLineThickness;
         if(this._open)
         {
            this.open();
         }
      }
      
      public function get backgroundColor() : uint
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         this._backgroundColor = param1;
         if(this._open)
         {
            this.open();
         }
      }
      
      public function get backgroundAlpha() : Number
      {
         return this._backgroundAlpha;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
         this._backgroundAlpha = param1;
         if(this._open)
         {
            this.open();
         }
      }
      
      public function get defaultTextColor() : uint
      {
         return this._defaultTextColor;
      }
      
      public function set defaultTextColor(param1:uint) : void
      {
         var _loc2_:TextField = null;
         var _loc3_:int = 0;
         this._defaultTextColor = param1;
         if(this._inputText)
         {
            this._inputText.textColor = this._defaultTextColor;
         }
         if(this._messages)
         {
            _loc3_ = 0;
            while(_loc3_ < this._messages.length)
            {
               _loc2_ = this._messages[_loc3_];
               _loc2_.textColor = this._defaultTextColor;
               _loc3_++;
            }
         }
      }
      
      public function get wordWrap() : Boolean
      {
         return this._wordWrap;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         var _loc2_:TextField = null;
         var _loc3_:int = 0;
         this._wordWrap = param1;
         if(this._messages)
         {
            _loc3_ = 0;
            while(_loc3_ < this._messages.length)
            {
               _loc2_ = this._messages[_loc3_];
               _loc2_.wordWrap = this._wordWrap;
               if(!this._wordWrap)
               {
                  _loc2_.autoSize = TextFieldAutoSize.LEFT;
                  _loc2_.height = 10;
               }
               else
               {
                  _loc2_.width = this._outputRect.width;
                  _loc2_.autoSize = TextFieldAutoSize.NONE;
                  _loc2_.height = _loc2_.textHeight + 4;
               }
               _loc3_++;
            }
         }
      }
      
      public function get fontSize() : Number
      {
         return this._fontSize;
      }
      
      public function set fontSize(param1:Number) : void
      {
         var _loc2_:TextField = null;
         var _loc3_:int = 0;
         this._fontSize = param1;
         this._textFormat = new TextFormat("Courier New",this._fontSize);
         if(this._inputText)
         {
            this._inputText.defaultTextFormat = this._textFormat;
         }
         if(this._messages)
         {
            _loc3_ = 0;
            while(_loc3_ < this._messages.length)
            {
               _loc2_ = this._messages[_loc3_];
               _loc2_.defaultTextFormat = this._textFormat;
               _loc3_++;
            }
         }
      }
      
      public function get keyCode() : uint
      {
         return this._openKeyCode;
      }
      
      public function set keyCode(param1:uint) : void
      {
         this._openKeyCode = param1;
      }
      
      public function get developerMode() : Boolean
      {
         return this._developerMode;
      }
      
      public function set developerMode(param1:Boolean) : void
      {
         this._developerMode = param1;
      }
      
      public function get maxMessages() : uint
      {
         return this._maxMessages;
      }
      
      public function set maxMessages(param1:uint) : void
      {
         this._maxMessages = param1;
      }
      
      private function createCommand(param1:String, param2:Function, param3:Object = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:XML = null;
         var _loc8_:XML = null;
         var _loc9_:Object = null;
         var _loc4_:Command;
         (_loc4_ = new Command()).command = param1;
         _loc4_.method = param2;
         this._commands[param1.toLowerCase()] = _loc4_;
         if(param3)
         {
            if(param3.hasOwnProperty("autoClose"))
            {
               _loc4_.autoClose = Boolean(param3.autoClose);
            }
            if(param3.hasOwnProperty("outputReturnValue"))
            {
               _loc4_.outputReturnValue = Boolean(param3.outputReturnValue);
            }
            if(param3.hasOwnProperty("description"))
            {
               _loc4_.description = String(param3.description);
            }
            if(param3.hasOwnProperty("methodXML") && param3.methodXML is XML)
            {
               _loc7_ = param3.methodXML;
               for each(_loc8_ in _loc7_.parameter)
               {
                  (_loc6_ = new Object()).type = String(_loc8_.@type);
                  _loc6_.optional = Boolean(_loc8_.@optional == "true");
                  _loc6_.description = "No description available.";
                  _loc4_.params.push(_loc6_);
               }
            }
            if(param3.hasOwnProperty("params") && param3.params is Array)
            {
               _loc5_ = 0;
               while(_loc5_ < param3.params.length)
               {
                  _loc9_ = param3.params[_loc5_];
                  if(_loc4_.params.length <= _loc5_)
                  {
                     _loc6_ = new Object();
                     if(_loc9_.hasOwnProperty("type"))
                     {
                        _loc6_.type = String(_loc9_.type);
                     }
                     if(_loc9_.hasOwnProperty("optional"))
                     {
                        _loc6_.optional = Boolean(_loc9_.optional);
                     }
                     if(_loc9_.hasOwnProperty("description"))
                     {
                        _loc6_.description = String(_loc9_.description);
                     }
                     _loc4_.params.push(_loc6_);
                  }
                  else
                  {
                     _loc6_ = _loc4_.params[_loc5_];
                     if(_loc9_.hasOwnProperty("type"))
                     {
                        _loc6_.type = String(_loc9_.type);
                     }
                     if(_loc9_.hasOwnProperty("optional"))
                     {
                        _loc6_.optional = Boolean(_loc9_.optional);
                     }
                     if(_loc9_.hasOwnProperty("description"))
                     {
                        _loc6_.description = String(_loc9_.description);
                     }
                  }
                  _loc5_++;
               }
            }
            return;
         }
      }
      
      private function tokenize(param1:String) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         if(!(param1.indexOf("\"") != -1 || Boolean(param1.indexOf("\'"))))
         {
            _loc2_ = param1.split(/[ \t\r\n\v\f,();]+/);
         }
         else
         {
            _loc3_ = param1.match(/"([^"]*)"|'([^']*)'/g);
            _loc2_ = (_loc4_ = param1.replace(/"([^"]*)"|'([^']*)'/g,"!@#$%^&*")).split(/[ \t\r\n\v\f,();]+/);
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if(_loc2_[_loc5_] === "!@#$%^&*")
               {
                  if(_loc3_[0].charAt(0) == "\"" || _loc3_[0].charAt(0) == "\'")
                  {
                     _loc3_[0] = _loc3_[0].substring(1,_loc3_[0].length);
                  }
                  if(_loc3_[0].charAt(_loc3_[0].length - 1) == "\"" || _loc3_[0].charAt(_loc3_[0].length - 1) == "\'")
                  {
                     _loc3_[0] = _loc3_[0].substring(0,_loc3_[0].length - 1);
                  }
                  _loc2_[_loc5_] = _loc3_[0];
                  _loc3_.shift();
               }
               if(_loc2_[_loc5_] == "" || _loc2_[_loc5_] == null)
               {
                  _loc2_.slice(1,_loc5_);
               }
               _loc5_++;
            }
         }
         return _loc2_;
      }
      
      private function parseInput(param1:String) : void
      {
         if(!(param1.length == 0 || !this._developerMode))
         {
            this.output("=> " + param1);
            this._enteredCommands.unshift(param1);
            this._indexCommand = 0;
            var _loc2_:Array = this.tokenize(param1);
            var _loc3_:String = _loc2_.shift();
            var _loc4_:Command;
            if(_loc4_ = this._commands[_loc3_.toLowerCase()])
            {
               var _loc5_:Array = new Array();
               var _loc6_:String = "";
               var _loc7_:int = 0;
               while(_loc7_ < _loc2_.length)
               {
                  if((_loc6_ = _loc2_[_loc7_]) != "")
                  {
                     if(!(_loc6_.search(/-?[0-9]+([.][0-9]*)?/) != -1 && _loc6_.search(/[A-Za-z_-]/) == -1))
                     {
                        if(_loc6_.search(/[A-Za-z_-]+/) != -1)
                        {
                           if(_loc6_.toLowerCase() == "true" || _loc6_.toLowerCase() == "false")
                           {
                              _loc5_.push(Boolean(_loc6_.toLowerCase() == "true"));
                           }
                           else
                           {
                              _loc5_.push(_loc6_);
                           }
                        }
                     }
                     else
                     {
                        _loc5_.push(Number(_loc6_));
                     }
                  }
                  _loc7_++;
               }
               this.executeCommand(_loc4_,_loc5_);
               this._inputText.text = "";
               return;
            }
            this.output("ERROR => \'" + _loc3_ + "\' is not a recognized command.",Debug.COLOR_ERROR);
            this._inputText.text = "";
            return;
         }
      }
      
      private function executeCommand(param1:Command, param2:Array) : void
      {
         var worked:Boolean;
         var val:* = undefined;
         var command:Command = param1;
         var params:Array = param2;
         if(this._developerMode)
         {
            if(params.length > 0)
            {
               if(command.command == "help")
               {
                  if(params[0] == "-a")
                  {
                     this.executeHelpAll();
                     return;
                  }
                  if(this.hasCommand(params[0]))
                  {
                     this.executeHelpForCommand(this._commands[params[0].toLowerCase()]);
                     return;
                  }
               }
               if(params[0] == "-h")
               {
                  this.executeHelpForCommand(command);
                  return;
               }
            }
            worked = true;
            try
            {
               if(command.method != null)
               {
                  val = command.method.apply(this._container,params);
               }
            }
            catch(e:Error)
            {
               if(e.errorID != 1063)
               {
                  if(!isDebugOn())
                  {
                     output("ERROR => Failed to execute command.\n" + e.message,Debug.COLOR_ERROR);
                  }
                  else
                  {
                     output("ERROR => Failed to execute command.\n" + e.getStackTrace(),Debug.COLOR_ERROR);
                  }
               }
               else
               {
                  output("ERROR => Failed to execute command. Incorrect number of arguments.\n" + e.message,Debug.COLOR_ERROR);
               }
               worked = false;
            }
            if(worked && command.outputReturnValue)
            {
               this.output("OUTPUT => " + val);
            }
            if(command.autoClose && worked)
            {
               this.close();
            }
            return;
         }
      }
      
      private function isDebugOn() : Boolean
      {
         var _loc1_:Error = new Error();
         var _loc2_:String = _loc1_.getStackTrace();
         return !Boolean(!_loc2_ || _loc2_.indexOf("[") == -1);
      }
      
      private function getSimilarCommand(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc5_:* = null;
         var _loc3_:uint = 0;
         if(param1.length >= 2)
         {
            var _loc4_:String = param1.toLowerCase();
            for(_loc5_ in this._commands)
            {
               if(_loc5_.indexOf(_loc4_) != -1)
               {
                  _loc3_++;
                  _loc2_ = this._commands[_loc5_].command;
               }
            }
            if(!(_loc3_ == 1 && !this._commands[_loc4_]))
            {
               return null;
            }
            return _loc2_;
         }
         return null;
      }
      
      private function executeHelpForCommand(param1:Command) : void
      {
         if(this._developerMode)
         {
            var _loc2_:* = this.gap + param1.description + "\n";
            _loc2_ += this.gap + param1.command.toUpperCase() + " " + param1.getParamsAsList() + "\n";
            var _loc3_:int = 0;
            while(_loc3_ < param1.params.length)
            {
               if(!param1.params[_loc3_].optional)
               {
                  _loc2_ += this.gap + this.gap + param1.params[_loc3_].type + " - " + param1.params[_loc3_].description + "\n";
               }
               else
               {
                  _loc2_ += this.gap + this.gap + param1.params[_loc3_].type + " - " + " (Optional) " + param1.params[_loc3_].description + "\n";
               }
               _loc3_++;
            }
            this.output(_loc2_);
            return;
         }
      }
      
      private function executeHelp() : void
      {
         var _loc2_:Command = null;
         var _loc5_:int = 0;
         var _loc1_:* = this.gap + "Enter \'help [command]\' to get a more info about that command.\n";
         _loc1_ += this.gap + "Alternately, add \'-h\' after any command to get the same info.\n";
         _loc1_ += this.gap + "Use \'-a\' after the \'help\' command to get more info.\n";
         var _loc3_:Vector.<Command> = new Vector.<Command>();
         var _loc4_:uint = 0;
         for each(_loc2_ in this._commands)
         {
            if(!_loc2_.hidden)
            {
               _loc3_.push(_loc2_);
               if(_loc2_.command.length > _loc4_)
               {
                  _loc4_ = _loc2_.command.length;
               }
            }
         }
         _loc3_.sort(this.handleCommandSort);
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc5_];
            _loc1_ += this.gap + this.getFormattedString(_loc2_.command.toUpperCase(),_loc4_) + this.gap + _loc2_.description + "\n";
            _loc5_++;
         }
         this.output(_loc1_);
      }
      
      private function executeHelpAll() : void
      {
         var _loc2_:Command = null;
         var _loc7_:int = 0;
         var _loc1_:* = this.gap + "Enter \'help [command]\' to get a more info about that command.\n";
         _loc1_ += this.gap + "Alternately, add \'-h\' after any command to get the same info.\n";
         var _loc3_:Vector.<Command> = new Vector.<Command>();
         var _loc4_:uint = uint(String(" Commands ").length);
         var _loc5_:uint = uint(String(" Parameters ").length);
         var _loc6_:uint = uint(String(" Descriptions ").length);
         for each(_loc2_ in this._commands)
         {
            if(!_loc2_.hidden)
            {
               _loc3_.push(_loc2_);
               if(_loc2_.command.length + 2 > _loc4_)
               {
                  _loc4_ = _loc2_.command.length + 2;
               }
               if(_loc2_.getParamsAsList().length + 2 > _loc5_)
               {
                  _loc5_ = _loc2_.getParamsAsList().length + 2;
               }
               if(_loc2_.description.length + 2 > _loc6_)
               {
                  _loc6_ = _loc2_.description.length + 2;
               }
            }
         }
         _loc3_.sort(this.handleCommandSort);
         _loc1_ += "+" + this.getFormattedString("",_loc4_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc5_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc6_,"-") + "+\n";
         _loc1_ += "|" + this.getFormattedString(" Commands ",_loc4_);
         _loc1_ += "|" + this.getFormattedString(" Parameters ",_loc5_);
         _loc1_ += "|" + this.getFormattedString(" Descriptions ",_loc6_) + "|\n";
         _loc1_ += "+" + this.getFormattedString("",_loc4_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc5_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc6_,"-") + "+\n";
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc7_];
            _loc1_ += "|" + this.getFormattedString(" " + _loc2_.command.toUpperCase() + " ",_loc4_);
            _loc1_ += "|" + this.getFormattedString(" " + _loc2_.getParamsAsList() + " ",_loc5_);
            _loc1_ += "|" + this.getFormattedString(" " + _loc2_.description + " ",_loc6_) + "|\n";
            _loc7_++;
         }
         _loc1_ += "+" + this.getFormattedString("",_loc4_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc5_,"-");
         _loc1_ += "+" + this.getFormattedString("",_loc6_,"-") + "+\n";
         this.output(_loc1_);
      }
      
      private function getFormattedString(param1:String, param2:uint, param3:String = " ") : String
      {
         var _loc4_:String;
         var _loc5_:int = (_loc4_ = param1).length;
         while(_loc5_ < param2)
         {
            _loc4_ += param3.charAt(0);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function handleCommandSort(param1:Command, param2:Command) : int
      {
         var _loc3_:uint = 0;
         while(param1.command.charCodeAt(_loc3_) == param2.command.charCodeAt(_loc3_) && Boolean(_loc3_ < param1.command.length || _loc3_ < param2.command.length))
         {
            _loc3_++;
         }
         var _loc4_:uint = param1.command.charCodeAt(_loc3_);
         var _loc5_:uint = param2.command.charCodeAt(_loc3_);
         if(_loc4_ >= _loc5_)
         {
            if(_loc4_ > _loc5_)
            {
               return 1;
            }
            return 0;
         }
         return -1;
      }
      
      protected function handleScriptLoaded(param1:Event) : void
      {
         if(this._scriptLoader)
         {
            this.output(this.gap + "Script successfully loaded.");
            this.parseScript(this._scriptLoader.data,"\n");
            this._scriptLoader = null;
            return;
         }
      }
      
      protected function handleScriptLoadFailed(param1:Event) : void
      {
         this.output("ERROR => Script failed to load.",Debug.COLOR_ERROR);
         this._scriptLoader = null;
      }
      
      private function parseScript(param1:String, param2:String) : void
      {
         var _loc3_:Array = param1.split(param2);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            this.parseInput(_loc3_[_loc4_]);
            _loc4_++;
         }
      }
      
      private function updateScrollBars() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = this._messageContainer.height - this._outputRect.height;
         var _loc2_:Number = this._messageContainer.width - this._outputRect.width;
         if(!(this._messageContainer.height > this._outputRect.height && this._open))
         {
            if(this._container.contains(this._vertThumb))
            {
               this._container.removeChild(this._vertThumb);
            }
         }
         else
         {
            _loc3_ = this._outputRect.height / this._messageContainer.height;
            this._vertThumb.graphics.clear();
            this._vertThumb.graphics.beginFill(16777215);
            this._vertThumb.graphics.drawRect(0,0,this._thumbLineThickness,this._outputRect.height * _loc3_);
            this._vertThumb.graphics.endFill();
            _loc3_ = Math.max(0,Math.min(1,this._messageContainer.y / (this._outputRect.y - _loc1_)));
            this._vertThumb.x = this._outputRect.right;
            this._vertThumb.y = this._outputRect.y + (this._outputRect.height - this._vertThumb.height) * _loc3_;
            if(!this._container.contains(this._vertThumb))
            {
               this._container.addChild(this._vertThumb);
            }
         }
         if(this._messageContainer.width > this._outputRect.width && this._open)
         {
            _loc3_ = this._outputRect.width / this._messageContainer.width;
            this._horiThumb.graphics.clear();
            this._horiThumb.graphics.beginFill(16777215);
            this._horiThumb.graphics.drawRect(0,0,this._outputRect.width * _loc3_,this._thumbLineThickness);
            this._horiThumb.graphics.endFill();
            _loc3_ = Math.max(0,Math.min(1,this._messageContainer.x / (this._outputRect.x - _loc2_)));
            this._horiThumb.x = this._outputRect.x + (this._outputRect.width - this._horiThumb.width) * _loc3_;
            this._horiThumb.y = this._outputRect.bottom;
            if(!this._container.contains(this._horiThumb))
            {
               this._container.addChild(this._horiThumb);
            }
         }
         else if(this._container.contains(this._horiThumb))
         {
            this._container.removeChild(this._horiThumb);
         }
      }
      
      private function handleClick(param1:MouseEvent) : void
      {
         if(this._open)
         {
            if(Boolean(this._parent) && this._developerMode)
            {
               this._parent.focus = this._inputText;
            }
            this.updateScrollBars();
            return;
         }
      }
      
      private function handleParentHasChild(param1:Event) : void
      {
         if(param1.currentTarget != this._container)
         {
            this._parent.addChild(this._container);
         }
      }
      
      private function handleParentOnStage(param1:Event) : void
      {
         this._parent.removeEventListener(Event.ADDED_TO_STAGE,this.handleParentOnStage);
         this._parent.addChild(this._container);
      }
      
      protected function handleStageResize(param1:Event) : void
      {
         if(this._parent)
         {
            this.width = this._parent.stageWidth;
            this.height = !this._maximized ? this._minHeight : this._parent.stageHeight;
            return;
         }
      }
      
      protected function handleCloseBtnClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      protected function handleCopyBtnClick(param1:MouseEvent) : void
      {
         this.copyToClipboard();
      }
      
      protected function handleMaximizeBtnClick(param1:MouseEvent) : void
      {
         if(!this.maximized)
         {
            this.maximize();
         }
         else
         {
            this.minimize();
         }
      }
      
      private function handleVertThumbMouseDown(param1:MouseEvent) : void
      {
         this._vertThumbDown = true;
         this._vertThumb.startDrag(false,new Rectangle(this._outputRect.right,this._outputRect.y,0,this._outputRect.height - this._vertThumb.height));
         this._parent.addEventListener(Event.ENTER_FRAME,this.handleEnterFrame,false,0,true);
      }
      
      private function handleHoriThumbMouseDown(param1:MouseEvent) : void
      {
         this._horiThumbDown = true;
         this._horiThumb.startDrag(false,new Rectangle(this._outputRect.x,this._outputRect.bottom,this._outputRect.width - this._horiThumb.width,0));
         this._parent.addEventListener(Event.ENTER_FRAME,this.handleEnterFrame,false,0,true);
      }
      
      private function handleParentMouseUp(param1:MouseEvent) : void
      {
         this._vertThumbDown = false;
         this._vertThumb.stopDrag();
         this._horiThumbDown = false;
         this._horiThumb.stopDrag();
         this.updateScrollBars();
         this._parent.removeEventListener(Event.ENTER_FRAME,this.handleEnterFrame);
      }
      
      private function handleMouseWheel(param1:MouseEvent) : void
      {
         this._messageContainer.y += param1.delta * 4;
         if(this._messageContainer.y > this._outputRect.y)
         {
            this._messageContainer.y = this._outputRect.y;
         }
         if(this._messageContainer.y < this._outputRect.y - (this._messageContainer.height - this._outputRect.height))
         {
            this._messageContainer.y = this._outputRect.y - (this._messageContainer.height - this._outputRect.height);
         }
         this.updateScrollBars();
      }
      
      private function handleEnterFrame(param1:Event) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:Number = this._messageContainer.height - this._outputRect.height;
         var _loc3_:Number = this._messageContainer.width - this._outputRect.width;
         if(!this._vertThumbDown)
         {
            if(this._horiThumbDown)
            {
               _loc4_ = (this._horiThumb.x - this._outputRect.x) / (this._outputRect.width - this._horiThumb.width);
               this._messageContainer.x = this._outputRect.x - _loc3_ * _loc4_;
            }
         }
         else
         {
            _loc4_ = (this._vertThumb.y - this._outputRect.y) / (this._outputRect.height - this._vertThumb.height);
            this._messageContainer.y = this._outputRect.y - _loc2_ * _loc4_;
            this._touchedThumbs = Boolean(this._messageContainer.y + this._buffer <= this._outputRect.y - _loc2_);
         }
      }
      
      private function handleKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         if(this._parent)
         {
            if(param1.keyCode == this._openKeyCode)
            {
               if(!this._developerMode)
               {
                  if(this._open)
                  {
                     this.close();
                  }
                  else if(param1.ctrlKey && param1.shiftKey)
                  {
                     this.open();
                  }
               }
               else if(!this._open)
               {
                  this.open();
               }
               else
               {
                  this.close();
               }
            }
            if(!(!this._open || !this._developerMode))
            {
               var _loc3_:String = this._inputText.text;
               if(param1.keyCode == Keyboard.TAB)
               {
                  _loc2_ = this.getSimilarCommand(_loc3_);
                  if(_loc2_)
                  {
                     this._inputText.text = _loc2_;
                     this._inputText.setSelection(this._inputText.length,this._inputText.length);
                  }
               }
               if(param1.keyCode == Keyboard.ENTER)
               {
                  _loc2_ = this.getSimilarCommand(_loc3_);
                  if(!_loc2_)
                  {
                     this.parseInput(this._inputText.text);
                     this._parent.focus = this._inputText;
                  }
                  else
                  {
                     this._inputText.text = _loc2_;
                     this._inputText.setSelection(this._inputText.length,this._inputText.length);
                  }
               }
               if(!(param1.keyCode == Keyboard.UP && this._enteredCommands.length > 0))
               {
                  if(param1.keyCode == Keyboard.DOWN && this._enteredCommands.length > 0)
                  {
                     --this._indexCommand;
                     if(this._indexCommand >= 0)
                     {
                        this._inputText.text = this._enteredCommands[this._indexCommand];
                     }
                     else
                     {
                        this._inputText.text = "";
                        this._indexCommand = 0;
                     }
                     this._inputText.setSelection(this._inputText.length,this._inputText.length);
                  }
               }
               else
               {
                  this._inputText.text = this._enteredCommands[this._indexCommand];
                  ++this._indexCommand;
                  if(this._indexCommand >= this._enteredCommands.length)
                  {
                     this._indexCommand = this._enteredCommands.length - 1;
                  }
                  this._inputText.setSelection(this._inputText.length,this._inputText.length);
               }
               return;
            }
            return;
         }
      }
   }
}

class Command
{
    
   
   public var command:String;
   
   public var method:Function;
   
   public var params:Array;
   
   public var description:String;
   
   public var autoClose:Boolean;
   
   public var outputReturnValue:Boolean;
   
   public var hidden:Boolean;
   
   function Command()
   {
      super();
      this.command = "";
      this.method = null;
      this.params = new Array();
      this.description = "No description available.";
      this.autoClose = false;
      this.outputReturnValue = false;
      this.hidden = false;
   }
   
   public function getParamsAsList() : String
   {
      if(this.params.length != 0)
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.params.length)
         {
            if(!this.params[_loc2_].optional)
            {
               _loc1_ += this.params[_loc2_].type + ", ";
            }
            else
            {
               _loc1_ += "[" + this.params[_loc2_].type + "], ";
            }
            _loc2_++;
         }
         return _loc1_.substring(0,_loc1_.length - 2);
      }
      return "";
   }
}
