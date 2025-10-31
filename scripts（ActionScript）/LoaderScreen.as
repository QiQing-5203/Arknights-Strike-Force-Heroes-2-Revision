package
{
   import flash.display.MovieClip;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   
   public class LoaderScreen extends MovieClip
   {
       
      
      public var txt_size:TextField;
      
      public var logo1:Logo_LogoBox;
      
      public var logo2:Logo_LogoBox;
      
      public var txt_loading:TextField;
      
      public var char1:MovieClip;
      
      public var char2:MovieClip;
      
      public var mc_bar:MovieClip;
      
      public var char3:MovieClip;
      
      public var char4:MovieClip;
      
      public var char5:MovieClip;
      
      public var txt_version:TextField;
      
      public var txt_play:TextField;
      
      private var main:Main;
      
      private var otxtHeight:Number;
      
      private var helpNum:uint;
      
      private var helpAr:Array;
      
      private var showedChar:uint = 0;
      
      private var percent:Number;
      
      public function LoaderScreen(param1:Main = null, param2:Object = null)
      {
         super();
         if(param1)
         {
            this.main = param1;
            this.otxtHeight = this.txt_play.y;
            this.txt_play.y = 2000;
            this.txt_play.htmlText = "<a href=\'event:null\'>开始唤醒</a>";
            this.txt_version.text = Main.VERSION;
            return;
         }
      }
      
      public function MouseDown() : void
      {
         if(this.txt_play.hitTestPoint(mouseX,mouseY,false))
         {
            this.main.loadDone();
            this.txt_play.y = 2000;
            this.txt_loading.text = "";
            this.txt_size.text = "";
         }
      }
      
      public function showRender() : void
      {
         this.txt_loading.text = "正在尝试与Rhodes Island™取得神经连接" + Math.ceil(this.main.bitHandler.currentFrame / this.main.bitHandler.totalFrames * 100) + "%\n正在释放神经递质";
      }
      
      public function MouseUp() : void
      {
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function KeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function flashActivate() : void
      {
      }
      
      public function flashDeactivate() : void
      {
      }
      
      public function EnterFrame() : void
      {
         this.percent = this.main.loaderInfo.bytesLoaded / this.main.loaderInfo.bytesTotal;
         if(this.main.loaderInfo.bytesLoaded < this.main.loaderInfo.bytesTotal)
         {
            this.txt_loading.text = "正在验证文件完整性\n" + Math.ceil(this.percent * 100) + "%";
            this.txt_size.text = Math.round(this.main.loaderInfo.bytesLoaded / 1024 / 1024 * 10) / 10 + "mb / " + Math.round(this.main.loaderInfo.bytesTotal / 1024 / 1024 * 10) / 10 + "mb";
         }
         else
         {
            this.txt_play.y = this.otxtHeight;
            this.txt_loading.text = "";
            this.txt_size.text = "";
         }
         if(this.percent >= 0.1 && this.showedChar < 1)
         {
            this.char1.play();
            this.showedChar = 1;
         }
         if(this.percent >= 0.3 && this.showedChar < 2)
         {
            this.char2.play();
            this.showedChar = 2;
         }
         if(this.percent >= 0.5 && this.showedChar < 3)
         {
            this.char3.play();
            this.showedChar = 3;
         }
         if(this.percent >= 0.7 && this.showedChar < 4)
         {
            this.char4.play();
            this.showedChar = 4;
         }
         if(this.percent >= 0.9 && this.showedChar < 5)
         {
            this.char5.play();
            this.showedChar = 5;
         }
         this.mc_bar.width = this.percent * 800;
         if(!this.txt_play.hitTestPoint(mouseX,mouseY,false))
         {
            this.txt_play.textColor = 12303291;
         }
         else
         {
            this.txt_play.textColor = 16777215;
         }
      }
   }
}
