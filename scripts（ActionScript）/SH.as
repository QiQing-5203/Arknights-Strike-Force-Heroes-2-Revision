package
{
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class SH
   {
      
      public static var chan:SoundChannel;
      
      public static var sound;
      
      public static var replayAt:Number;
      
      private static var voiceChan:SoundChannel;
      
      private static var soundChan:SoundChannel;
      
      private static var soundVolLow:SoundTransform;
      
      private static var soundVol:SoundTransform;
      
      private static var soundVolLoud:SoundTransform;
      
      private static var noVol:SoundTransform;
      
      private static var musicClass;
      
      private static var musicChan:SoundChannel;
      
      private static var musicVol:SoundTransform;
      
      private static var fadeClass;
      
      private static var fadeChan:SoundChannel;
      
      private static var fadeVol:SoundTransform;
      
      public static var songList:Array;
      
      public static var songNames:Array;
      
      private static const maxVolume:Number = 0.8;
      
      private static var useLowVol:Boolean;
       
      
      public function SH()
      {
         super();
      }
      
      public static function Init() : void
      {
         soundVolLow = new SoundTransform();
         soundVolLow.volume = 0.15;
         soundVol = new SoundTransform();
         soundVol.volume = 0.4;
         soundVolLoud = new SoundTransform();
         soundVolLoud.volume = 0.9;
         noVol = new SoundTransform();
         noVol.volume = 0;
         musicVol = new SoundTransform();
         musicVol.volume = maxVolume;
         fadeVol = new SoundTransform();
         fadeVol.volume = 0;
         songList = [M_Robot,M_Rocket,M_Meeting,M_Epic,M_Machine,M_Dawn,M_Menu,M_Mute];
         songNames = ["Wrathful Cerulean Flame","Control\'s Wishes（孤星OST）","切尔诺伯格急行军（游击队的小曲）","塔露拉·雅特利亚斯（黑蛇的小曲）","Absolute Zero（霜星上岛的小曲）","龙门作战-凌云（龙门市区的小曲）","Endspore（水月你带我走吧）","37℃（主线第六章剧情背景音乐）"];
      }
      
      public static function playSound(param1:*, param2:Boolean = false) : void
      {
         if(SD.sound)
         {
            soundChan = new param1().play();
            if(!useLowVol)
            {
               soundChan.soundTransform = !param2 ? soundVol : soundVolLoud;
            }
            else
            {
               soundChan.soundTransform = !param2 ? soundVolLow : soundVol;
            }
            return;
         }
      }
      
      public static function playVoice(param1:*) : Number
      {
         if(SD.voices)
         {
            if(voiceChan)
            {
               voiceChan.stop();
            }
            var _loc2_:* = new param1();
            voiceChan = _loc2_.play();
            voiceChan.soundTransform = soundVolLoud;
            return Number(_loc2_.length) / 1000;
         }
         return 0;
      }
      
      public static function playMusic(param1:*, param2:Boolean = false) : void
      {
         if(musicClass != param1)
         {
            if(musicClass)
            {
               if(fadeClass)
               {
                  fadeChan.stop();
               }
               fadeVol.volume = !SD.music || param2 ? 0 : maxVolume;
               fadeClass = musicClass;
               fadeChan = musicChan;
               fadeChan.soundTransform = fadeVol;
            }
            else
            {
               param2 = true;
            }
            musicVol.volume = !(param2 && SD.music) ? 0 : maxVolume;
            musicClass = param1;
            musicChan = new musicClass().play(0,1000);
            musicChan.soundTransform = musicVol;
            return;
         }
      }
      
      public static function EnterFrame() : void
      {
         var _loc1_:Number = NaN;
         useLowVol = false;
         if(fadeClass)
         {
            if(fadeVol.volume <= 0)
            {
               fadeClass = null;
               fadeChan.stop();
            }
            else
            {
               fadeVol.volume -= 0.025;
               fadeChan.soundTransform = fadeVol;
            }
         }
         if(musicClass)
         {
            if(SD.music)
            {
               _loc1_ = maxVolume;
               if(Main.curClass is Game && MatchSettings.isCampaign && MatchSettings.caType == 0 && Main.curClass.hud.msgTimer && SD.voices)
               {
                  useLowVol = true;
               }
               if(useLowVol)
               {
                  _loc1_ = 0.4;
               }
               if(musicVol.volume < _loc1_ + 0.05)
               {
                  musicVol.volume += 0.05;
               }
               if(musicVol.volume > _loc1_ - 0.025)
               {
                  musicVol.volume -= 0.025;
               }
            }
            else if(musicVol.volume > 0)
            {
               musicVol.volume -= 0.025;
            }
         }
         if(musicChan)
         {
            musicChan.soundTransform = musicVol;
         }
      }
      
      public static function updateMusicVolume() : void
      {
         if(!SD.music)
         {
            fadeVol.volume = 0;
            musicVol.volume = maxVolume;
         }
         else
         {
            fadeVol.volume = 0;
            musicVol.volume = 0;
         }
      }
   }
}
