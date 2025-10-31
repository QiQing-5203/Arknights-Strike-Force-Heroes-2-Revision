package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.system.*;
   import flash.text.*;
   import flash.utils.*;
   
   public final class DebugTracker
   {
       
      
      private var _parent:Stage;
      
      private var _developerMode:Boolean = false;
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _fpsCntr:int = 0;
      
      private var _fps:int = 0;
      
      private var _fpsLastTime:int = 0;
      
      private var _fpsTime:int = 0;
      
      private var _lastTime:int = 0;
      
      private var _curTime:int = 0;
      
      private var _dt:int;
      
      private var _interval:uint = 1000;
      
      private var _maximized:Boolean;
      
      private var _container:Sprite;
      
      private var _render:Boolean = false;
      
      private var _invalidated:Boolean = false;
      
      private var _openKeyCode:uint;
      
      private var _list:Vector.<Property>;
      
      public function DebugTracker(param1:Stage = null, param2:Boolean = true)
      {
         super();
         if(param1)
         {
            this._developerMode = param2;
            this._openKeyCode = 68;
            this._container = new Sprite();
            this._container.addEventListener(Event.ADDED_TO_STAGE,this.handleAddedToStage);
            this._container.tabChildren = false;
            this._container.tabEnabled = false;
            this._list = new Vector.<Property>();
            this._parent = param1;
            this._parent.addEventListener(Event.ADDED_TO_STAGE,this.handleParentOnStage);
            this._parent.addEventListener(Event.ADDED,this.handleParentChildAdded);
            this._parent.addEventListener(Event.ENTER_FRAME,this.handleParentEnterFrame);
            this._parent.addEventListener(KeyboardEvent.KEY_UP,this.handleKeyUp,false,0,true);
            if(this._developerMode)
            {
               this._parent.addChild(this._container);
            }
            this._x = 0;
            this._y = 0;
            this._width = 50;
            this._height = 50;
            this._maximized = true;
            this.minimize();
            return;
         }
      }
      
      private function handleParentChildAdded(param1:Event) : void
      {
         if(param1.currentTarget != this._container && !(param1.currentTarget is DebugConsole) && this._developerMode)
         {
            this._parent.addChild(this._container);
         }
      }
      
      private function handleParentOnStage(param1:Event) : void
      {
         this._container.removeEventListener(Event.ADDED_TO_STAGE,this.handleParentOnStage);
         if(this._developerMode)
         {
            this._parent.addChild(this._container);
         }
      }
      
      private function handleAddedToStage(param1:Event) : void
      {
         this._container.addEventListener(MouseEvent.CLICK,this.handleClick,false,0,true);
         this._container.buttonMode = true;
         this.track(this,"fps",{
            "chart":true,
            "prettyName":"FPS",
            "interval":1,
            "min":this._container.stage.frameRate * 0.5,
            "color":16776960
         });
         this.track(this,"mem",{
            "chart":true,
            "decimals":2,
            "prettyName":"MEM",
            "suffix":"MB",
            "interval":0.5,
            "color":65535
         });
      }
      
      private function handleKeyUp(param1:KeyboardEvent) : void
      {
         if(this._parent)
         {
            if(param1.keyCode == this._openKeyCode && param1.ctrlKey && param1.shiftKey)
            {
               if(this._developerMode)
               {
                  if(this._maximized)
                  {
                     this.minimize();
                  }
                  else
                  {
                     this.maximize();
                  }
               }
            }
            return;
         }
      }
      
      private function handleClick(param1:MouseEvent) : void
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
      
      public function minimize() : void
      {
         var _loc2_:Property = null;
         if(!(!this._parent || !this._maximized))
         {
            this._container.graphics.clear();
            this._container.graphics.beginFill(0,0.8);
            this._container.graphics.drawRect(this._x,this._y,10,10);
            this._container.graphics.endFill();
            var _loc1_:uint = this._list.length;
            var _loc3_:int = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = this._list[_loc3_];
               if(_loc2_.text)
               {
                  if(this._container.contains(_loc2_.text))
                  {
                     this._container.removeChild(_loc2_.text);
                  }
               }
               if(_loc2_.bmp)
               {
                  if(this._container.contains(_loc2_.bmp))
                  {
                     this._container.removeChild(_loc2_.bmp);
                  }
               }
               _loc3_++;
            }
            this._maximized = false;
            this._render = true;
            return;
         }
      }
      
      public function maximize() : void
      {
         if(!(!this._parent || this._maximized))
         {
            this._maximized = true;
            this._render = true;
            this._invalidated = true;
            return;
         }
      }
      
      public function get maximized() : Boolean
      {
         if(!(!this._parent || !this._developerMode))
         {
            return Boolean(this._maximized);
         }
         return false;
      }
      
      public function track(param1:*, param2:String, param3:Object = null) : void
      {
         if(this._parent)
         {
            if(param1.hasOwnProperty(param2))
            {
               var _loc4_:Property;
               (_loc4_ = new Property()).obj = param1;
               _loc4_.name = param2;
               _loc4_.prettyName = param2;
               _loc4_.suffix = "";
               _loc4_.color = 16777215;
               _loc4_.samples = new Vector.<Number>();
               if(param3)
               {
                  if(param3.hasOwnProperty("prettyName"))
                  {
                     _loc4_.prettyName = param3.prettyName;
                  }
                  if(param3.hasOwnProperty("min"))
                  {
                     _loc4_.min = param3.min;
                  }
                  if(param3.hasOwnProperty("max"))
                  {
                     _loc4_.max = param3.max;
                  }
                  if(param3.hasOwnProperty("suffix"))
                  {
                     _loc4_.suffix = param3.suffix;
                  }
                  if(param3.hasOwnProperty("chart") && param1[param2] is Number)
                  {
                     _loc4_.bmp = new Bitmap(new BitmapData(50,25,true,3422552064),"auto",false);
                  }
                  if(param3.hasOwnProperty("color"))
                  {
                     _loc4_.color = param3.color;
                  }
                  if(param3.hasOwnProperty("interval"))
                  {
                     _loc4_.interval = param3.interval;
                  }
                  if(param3.hasOwnProperty("decimals") && param1[param2] is Number)
                  {
                     _loc4_.decimals = param3.decimals;
                  }
               }
               _loc4_.text = new TextField();
               _loc4_.text.defaultTextFormat = new TextFormat("Courier New",12);
               _loc4_.text.x = this._x;
               _loc4_.text.y = this._y;
               _loc4_.text.multiline = true;
               _loc4_.text.textColor = _loc4_.color;
               _loc4_.text.mouseEnabled = false;
               _loc4_.text.height = 20;
               _loc4_.text.embedFonts = false;
               _loc4_.text.autoSize = TextFieldAutoSize.LEFT;
               this._list.push(_loc4_);
               this._render = true;
               return;
            }
            throw new Error("Property \'" + param2 + "\' does not exist on object " + param1 + ".");
         }
      }
      
      public function stopTracking(param1:*, param2:String) : void
      {
         var _loc3_:Property = null;
         if(!this._parent || param1 == this)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this._list.length)
         {
            _loc3_ = this._list[_loc4_];
            if(_loc3_.obj == param1 && _loc3_.name == param2)
            {
               if(_loc3_.text)
               {
                  if(this._container.contains(_loc3_.text))
                  {
                     this._container.removeChild(_loc3_.text);
                  }
                  _loc3_.text = null;
               }
               if(_loc3_.bmp)
               {
                  if(this._container.contains(_loc3_.bmp))
                  {
                     this._container.removeChild(_loc3_.bmp);
                  }
                  _loc3_.bmp.bitmapData.dispose();
                  _loc3_.bmp = null;
               }
               _loc3_.samples = null;
               this._list.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
         this._render = true;
      }
      
      public function stopAllTracking() : void
      {
         var _loc1_:Property = null;
         if(this._parent)
         {
            var _loc2_:int = 0;
            while(_loc2_ < this._list.length)
            {
               _loc1_ = this._list[_loc2_];
               if(_loc1_.obj != this)
               {
                  if(_loc1_.text)
                  {
                     if(this._container.contains(_loc1_.text))
                     {
                        this._container.removeChild(_loc1_.text);
                     }
                     _loc1_.text = null;
                  }
                  if(_loc1_.bmp)
                  {
                     if(this._container.contains(_loc1_.bmp))
                     {
                        this._container.removeChild(_loc1_.bmp);
                     }
                     _loc1_.bmp.bitmapData.dispose();
                     _loc1_.bmp = null;
                  }
                  _loc1_.samples = null;
                  this._list.splice(_loc2_,1);
                  _loc2_--;
               }
               _loc2_++;
            }
            this._render = true;
            return;
         }
      }
      
      public function get fps() : int
      {
         return this._fps;
      }
      
      public function get mem() : Number
      {
         return System.totalMemory / 1048576;
      }
      
      public function get updateInterval() : uint
      {
         return this._interval;
      }
      
      public function get developerMode() : Boolean
      {
         return this._developerMode;
      }
      
      public function set developerMode(param1:Boolean) : void
      {
         this._developerMode = param1;
         if(this._parent)
         {
            if(this._developerMode)
            {
               this._parent.addChild(this._container);
            }
            else if(this._parent.contains(this._container))
            {
               this._parent.removeChild(this._container);
            }
         }
      }
      
      public function setUpdateInterval(param1:uint) : void
      {
         this._interval = param1;
      }
      
      private function toHex(param1:uint) : String
      {
         var _loc2_:String = "";
         var _loc3_:uint = 0;
         var _loc4_:uint = param1;
         while(_loc4_ > 0)
         {
            _loc3_ = _loc4_ % 16;
            _loc4_ /= 16;
            var _loc5_:* = _loc3_;
            switch(10 !== _loc5_ ? (11 === _loc5_ ? 1 : (12 !== _loc5_ ? (13 === _loc5_ ? 3 : (14 !== _loc5_ ? (15 !== _loc5_ ? 6 : 5) : 4)) : 2)) : 0)
            {
               case 0:
                  _loc2_ = "A" + _loc2_;
                  break;
               case 1:
                  _loc2_ = "B" + _loc2_;
                  break;
               case 2:
                  _loc2_ = "C" + _loc2_;
                  break;
               case 3:
                  _loc2_ = "D" + _loc2_;
                  break;
               case 4:
                  _loc2_ = "E" + _loc2_;
                  break;
               case 5:
                  _loc2_ = "F" + _loc2_;
                  break;
               default:
                  _loc2_ = _loc3_ + _loc2_;
                  break;
            }
         }
         return _loc2_;
      }
      
      private function handleParentEnterFrame(param1:Event) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:Property = null;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         if(this._parent)
         {
            var _loc2_:uint = getTimer();
            this._dt = _loc2_ - this._lastTime;
            this._lastTime = _loc2_;
            this._fpsTime = _loc2_ - this._fpsLastTime;
            ++this._fpsCntr;
            if(this._fpsTime >= 1000)
            {
               this._fpsLastTime = _loc2_;
               this._fps = this._fpsCntr;
               this._fpsCntr = 0;
            }
            var _loc6_:uint = this._list.length;
            var _loc13_:Boolean = false;
            if(this._render && this._maximized)
            {
               _loc14_ = this._x;
               _loc15_ = this._y;
               _loc16_ = 0;
               _loc17_ = 0;
               _loc3_ = 0;
               while(_loc3_ < _loc6_)
               {
                  if((_loc7_ = this._list[_loc3_]).text)
                  {
                     if(!this._container.contains(_loc7_.text))
                     {
                        this._container.addChild(_loc7_.text);
                     }
                     _loc7_.text.x = _loc14_;
                     _loc7_.text.y = _loc15_;
                     _loc15_ += _loc7_.text.height;
                     if(_loc7_.text.width > _loc16_)
                     {
                        _loc16_ = _loc7_.text.width;
                     }
                  }
                  _loc3_++;
               }
               this._width = _loc16_;
               _loc17_ = _loc15_;
               _loc3_ = 0;
               while(_loc3_ < _loc6_)
               {
                  if((_loc7_ = this._list[_loc3_]).bmp)
                  {
                     if(!this._container.contains(_loc7_.bmp))
                     {
                        this._container.addChild(_loc7_.bmp);
                     }
                     _loc7_.bmp.x = _loc14_;
                     _loc7_.bmp.y = _loc15_;
                     if(this._width != _loc7_.bmp.bitmapData.width && this._width > 0)
                     {
                        _loc7_.bmp.bitmapData.dispose();
                        _loc7_.bmp.bitmapData = new BitmapData(this._width,25,true,3422552064);
                        this._invalidated = true;
                     }
                     _loc15_ += _loc7_.bmp.height;
                  }
                  _loc3_++;
               }
               this._height = _loc15_;
               this._container.graphics.clear();
               this._container.graphics.beginFill(0,0.8);
               this._container.graphics.drawRect(this._x,this._y,_loc16_,_loc17_);
               this._container.graphics.endFill();
               this._render = false;
            }
            _loc3_ = 0;
            loop2:
            for(; _loc3_ < _loc6_; _loc3_++)
            {
               _loc7_ = this._list[_loc3_];
               _loc7_.curTime += this._dt;
               if(!(_loc7_.curTime >= _loc7_.interval * 1000 || this._invalidated))
               {
                  continue;
               }
               _loc7_.curTime = 0;
               if((_loc8_ = _loc7_.obj[_loc7_.name]) != _loc7_.value || this._invalidated)
               {
                  _loc7_.value = _loc8_;
                  if(Boolean(_loc7_.text) && this._maximized)
                  {
                     if(_loc7_.value != null)
                     {
                        if(!(_loc7_.value is Number))
                        {
                           _loc11_ = _loc7_.value.toString();
                        }
                        else if(_loc7_.isHex)
                        {
                           _loc11_ = this.toHex(_loc7_.value);
                        }
                        else if(_loc7_.decimals <= 0)
                        {
                           _loc11_ = int(_loc7_.value).toString();
                        }
                        else
                        {
                           _loc11_ = _loc7_.value.toFixed(_loc7_.decimals);
                        }
                     }
                     else
                     {
                        _loc11_ = "null";
                     }
                     _loc10_ = _loc7_.text.width;
                     _loc7_.text.text = _loc7_.prettyName + " " + _loc11_ + (!_loc7_.suffix ? "" : _loc7_.suffix);
                     if(_loc10_ != _loc7_.text.width)
                     {
                        this._render = true;
                     }
                  }
               }
               if(!_loc7_.bmp)
               {
                  continue;
               }
               _loc9_ = _loc7_.value as Number;
               _loc7_.samples.unshift(_loc9_);
               if(_loc7_.samples.length > _loc7_.bmp.bitmapData.width)
               {
                  _loc7_.samples.pop();
               }
               if(!this._maximized)
               {
                  continue;
               }
               _loc13_ = false;
               if(this._width == _loc7_.bmp.bitmapData.width)
               {
               }
               if(_loc9_ > _loc7_.max)
               {
                  _loc7_.max = _loc9_;
                  _loc13_ = true;
               }
               if(_loc9_ < _loc7_.min)
               {
                  _loc7_.min = _loc9_;
                  _loc13_ = true;
               }
               if(_loc13_ || this._invalidated)
               {
                  _loc7_.bmp.bitmapData.fillRect(_loc7_.bmp.bitmapData.rect,3422552064);
                  _loc4_ = 0;
                  while(_loc4_ < _loc7_.samples.length)
                  {
                     _loc9_ = _loc7_.samples[_loc4_];
                     _loc5_ = _loc12_ = Math.abs(1 - (_loc9_ - _loc7_.min) / (_loc7_.max - _loc7_.min)) * (_loc7_.bmp.bitmapData.height - 1);
                     while(_loc5_ < _loc7_.bmp.bitmapData.height - 1)
                     {
                        _loc7_.bmp.bitmapData.setPixel(_loc7_.bmp.bitmapData.width - 2 - _loc4_,_loc5_,_loc7_.color);
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  continue;
               }
               _loc7_.bmp.bitmapData.scroll(-1,0);
               _loc5_ = _loc12_ = Math.abs(1 - (_loc9_ - _loc7_.min) / (_loc7_.max - _loc7_.min)) * (_loc7_.bmp.bitmapData.height - 1);
               while(true)
               {
                  if(_loc5_ < _loc7_.bmp.bitmapData.height - 1)
                  {
                     _loc7_.bmp.bitmapData.setPixel(_loc7_.bmp.bitmapData.width - 2,_loc5_,_loc7_.color);
                     _loc5_++;
                     continue;
                  }
                  continue loop2;
               }
            }
            this._invalidated = false;
            return;
         }
      }
   }
}

import flash.display.Bitmap;
import flash.text.TextField;

class Property
{
    
   
   public var obj;
   
   public var name:String;
   
   public var prettyName:String;
   
   public var suffix:String;
   
   public var min:Number = 0;
   
   public var max:Number = 0;
   
   public var decimals:uint = 0;
   
   public var samples:Vector.<Number>;
   
   public var isHex:Boolean = false;
   
   public var color:uint;
   
   public var text:TextField;
   
   public var bmp:Bitmap;
   
   public var interval:Number = 0.5;
   
   public var curTime:uint = 0;
   
   public var value;
   
   function Property()
   {
      super();
   }
}
