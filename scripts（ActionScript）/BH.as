package
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class BH extends MovieClip
   {
      
      private static var BitAr:Array;
      
      public static var BITS:Object;
       
      
      public var MC:MovieClip;
      
      public var complete:Boolean;
      
      private var main:Main;
      
      private var curFrame:uint;
      
      private var _rotAmt:uint;
      
      private var _rotDgr:Number;
      
      private var r:uint;
      
      private var newBit:BitmapData;
      
      public var rotate:int;
      
      public function BH(param1:Main)
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5,5,this.frame6,6,this.frame7,7,this.frame8,8,this.frame9,9,this.frame10,10,this.frame11,11,this.frame12,12,this.frame13,13,this.frame14,14,this.frame15,15,this.frame16,16,this.frame17,17,this.frame18,18,this.frame19,19,this.frame20,20,this.frame21,21,this.frame22,22,this.frame23,23,this.frame24,24,this.frame25,25,this.frame26,26,this.frame27,27,this.frame28,28,this.frame29,29,this.frame30,30,this.frame31,31,this.frame32,32,this.frame33,33,this.frame34,34,this.frame35,35,this.frame36,36,this.frame37,37,this.frame38,38,this.frame39,39,this.frame40,40,this.frame41,41,this.frame42,42,this.frame43,43,this.frame44,44,this.frame45,45,this.frame46,46,this.frame47,47,this.frame48,48,this.frame49,49,this.frame50,50,this.frame51,51,this.frame52,52,this.frame53,53,this.frame54,54,this.frame55,55,this.frame56,56,this.frame57,57,this.frame58,58,this.frame59,59,this.frame60,60,this.frame61,61,this.frame62,62,this.frame63,63,this.frame64,64,this.frame65,65,this.frame66,66,this.frame67,67,this.frame68,68,this.frame69,69,this.frame70,70,this.frame71,71,this.frame72);
         trace("THIS IS THE PROPPER BH");
         this.main = param1;
         BitAr = new Array();
         BITS = new Object();
         this.complete = false;
         this.curFrame = 1;
         this.r = 0;
      }
      
      public static function getBitAniStats(param1:String, param2:String) : Object
      {
         if(!BITS[param1] || !BITS[param1].sub[param2])
         {
            trace("Bit",param1,param2,"not found!");
         }
         return {
            "name":param1,
            "sub":param2,
            "width":BITS[param1].width,
            "height":BITS[param1].height,
            "frames":BITS[param1].sub[param2].frames,
            "pos":BITS[param1].sub[param2].pos,
            "rotAmt":BITS[param1].rotAmt
         };
      }
      
      public static function getBit(param1:String, param2:String = "", param3:uint = 1) : BitmapData
      {
         var name:String = param1;
         var sub:String = param2;
         var frame:uint = param3;
         try
         {
            if(sub)
            {
               return BitAr[BITS[name].sub[sub].pos + (frame - 1)];
            }
            return BitAr[BITS[name].pos];
         }
         catch(e:Error)
         {
            trace("Error: Could not find bit: " + name + ", " + sub + ", " + frame);
            return BitAr[BITS["error"].pos];
         }
      }
      
      public function setup() : *
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         if(!this.MC)
         {
            trace("ERROR: No MC at " + currentLabel);
         }
         else
         {
            this._rotAmt = this.rotate <= 0 ? this.rotate : this.rotate - 1;
            this._rotDgr = 360 / this._rotAmt;
            this.MC.rotation = this.r * this._rotDgr;
            _loc1_ = new Object();
            _loc2_ = "";
            _loc3_ = 1;
            while(_loc3_ <= this.MC.totalFrames)
            {
               this.MC.gotoAndStop(_loc3_);
               if(this.MC.currentLabel != _loc2_)
               {
                  _loc2_ = this.MC.currentLabel;
                  _loc1_[_loc2_] = {
                     "pos":BitAr.length,
                     "frames":0
                  };
               }
               ++_loc1_[_loc2_].frames;
               this.newBit = new BitmapData(width,height,true,0);
               this.newBit.draw(this);
               BitAr.push(this.newBit);
               _loc3_++;
            }
            BITS[currentLabel + "" + this.r] = {
               "sub":_loc1_,
               "width":width,
               "height":height,
               "rot":this.rotate,
               "rotAmt":this._rotAmt
            };
            trace("BH","Finished",currentLabel + "" + this.r);
            if(this.r >= this._rotAmt)
            {
               this.r = 0;
               if(this.curFrame != totalFrames)
               {
                  ++this.curFrame;
                  gotoAndStop(1);
                  gotoAndStop(this.curFrame);
               }
               else
               {
                  this.doComplete();
               }
            }
            else
            {
               ++this.r;
            }
         }
      }
      
      public function doComplete() : void
      {
         this.complete = true;
         this.main.renderDone();
      }
      
      function frame1() : *
      {
         this.rotate = 0;
      }
      
      function frame2() : *
      {
         this.rotate = 3;
      }
      
      function frame3() : *
      {
         this.rotate = 3;
      }
      
      function frame4() : *
      {
         this.rotate = 3;
      }
      
      function frame5() : *
      {
         this.rotate = 3;
      }
      
      function frame6() : *
      {
         this.rotate = 0;
      }
      
      function frame7() : *
      {
         this.rotate = 3;
      }
      
      function frame8() : *
      {
         this.rotate = 3;
      }
      
      function frame9() : *
      {
         this.rotate = 3;
      }
      
      function frame10() : *
      {
         this.rotate = 3;
      }
      
      function frame11() : *
      {
         this.rotate = 0;
      }
      
      function frame12() : *
      {
         this.rotate = 0;
      }
      
      function frame13() : *
      {
         this.rotate = 4;
      }
      
      function frame14() : *
      {
         this.rotate = 0;
      }
      
      function frame15() : *
      {
         this.rotate = 0;
      }
      
      function frame16() : *
      {
         this.rotate = 0;
      }
      
      function frame17() : *
      {
         this.rotate = 0;
      }
      
      function frame18() : *
      {
         this.rotate = 0;
      }
      
      function frame19() : *
      {
         this.rotate = 0;
      }
      
      function frame20() : *
      {
         this.rotate = 0;
      }
      
      function frame21() : *
      {
         this.rotate = 0;
      }
      
      function frame22() : *
      {
         this.rotate = 0;
      }
      
      function frame23() : *
      {
         this.rotate = 4;
      }
      
      function frame24() : *
      {
         this.rotate = 4;
      }
      
      function frame25() : *
      {
         this.rotate = 0;
      }
      
      function frame26() : *
      {
         this.rotate = 4;
      }
      
      function frame27() : *
      {
         this.rotate = 4;
      }
      
      function frame28() : *
      {
         this.rotate = 4;
      }
      
      function frame29() : *
      {
         this.rotate = 3;
      }
      
      function frame30() : *
      {
         this.rotate = 3;
      }
      
      function frame31() : *
      {
         this.rotate = 4;
      }
      
      function frame32() : *
      {
         this.rotate = 3;
      }
      
      function frame33() : *
      {
         this.rotate = 3;
      }
      
      function frame34() : *
      {
         this.rotate = 3;
      }
      
      function frame35() : *
      {
         this.rotate = 3;
      }
      
      function frame36() : *
      {
         this.rotate = 0;
      }
      
      function frame37() : *
      {
         this.rotate = 0;
      }
      
      function frame38() : *
      {
         this.rotate = 0;
      }
      
      function frame39() : *
      {
         this.rotate = 0;
      }
      
      function frame40() : *
      {
         this.rotate = 0;
      }
      
      function frame41() : *
      {
         this.rotate = 0;
      }
      
      function frame42() : *
      {
         this.rotate = 0;
      }
      
      function frame43() : *
      {
         this.rotate = 0;
      }
      
      function frame44() : *
      {
         this.rotate = 0;
      }
      
      function frame45() : *
      {
         this.rotate = 0;
      }
      
      function frame46() : *
      {
         this.rotate = 0;
      }
      
      function frame47() : *
      {
         this.rotate = 0;
      }
      
      function frame48() : *
      {
         this.rotate = 0;
      }
      
      function frame49() : *
      {
         this.rotate = 0;
      }
      
      function frame50() : *
      {
         this.rotate = 0;
      }
      
      function frame51() : *
      {
         this.rotate = 0;
      }
      
      function frame52() : *
      {
         this.rotate = 0;
      }
      
      function frame53() : *
      {
         this.rotate = 0;
      }
      
      function frame54() : *
      {
         this.rotate = 0;
      }
      
      function frame55() : *
      {
         this.rotate = 0;
      }
      
      function frame56() : *
      {
         this.rotate = 0;
      }
      
      function frame57() : *
      {
         this.rotate = 0;
      }
      
      function frame58() : *
      {
         this.rotate = 3;
      }
      
      function frame59() : *
      {
         this.rotate = 3;
      }
      
      function frame60() : *
      {
         this.rotate = 0;
      }
      
      function frame61() : *
      {
         this.rotate = 0;
      }
      
      function frame62() : *
      {
         this.rotate = 0;
      }
      
      function frame63() : *
      {
         this.rotate = 0;
      }
      
      function frame64() : *
      {
         this.rotate = 3;
      }
      
      function frame65() : *
      {
         this.rotate = 3;
      }
      
      function frame66() : *
      {
         this.rotate = 0;
      }
      
      function frame67() : *
      {
         this.rotate = 0;
      }
      
      function frame68() : *
      {
         this.rotate = 0;
      }
      
      function frame69() : *
      {
         this.rotate = 0;
      }
      
      function frame70() : *
      {
         this.rotate = 0;
      }
      
      function frame71() : *
      {
         this.rotate = 0;
      }
      
      function frame72() : *
      {
         this.rotate = 0;
      }
   }
}
