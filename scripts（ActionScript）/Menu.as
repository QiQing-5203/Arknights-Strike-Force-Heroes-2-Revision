package
{
   import fl.controls.CheckBox;
   import fl.controls.RadioButton;
   import fl.motion.AnimatorFactory3D;
   import fl.motion.MotionBase;
   import fl.motion.motion_internal;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filters.*;
   import flash.geom.Matrix3D;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class Menu extends MovieClip
   {
      
      public static var showedMenu:Boolean;
      
      public static var resetShops:Boolean;
       
      
      public var inv_armor2:MenuOtherBox;
      
      public var txt_abil_skillname:TextField;
      
      public var txt_abil_kills:TextField;
      
      public var abil_skill0:MovieClip;
      
      public var class_icon1:MovieClip;
      
      public var ach7:MovieClip;
      
      public var 开始游戏:MenuButton;
      
      public var slot_other:MenuOtherBox;
      
      public var inv_armor3:MenuOtherBox;
      
      public var abil_streak4:MovieClip;
      
      public var app_camo17:MovieClip;
      
      public var class_icon0:MovieClip;
      
      public var ach8:MovieClip;
      
      public var rd_qualM:RadioButton;
      
      public var inv_armor0:MenuOtherBox;
      
      public var inv_attach8:MenuOtherBox;
      
      public var inv_gun17:MenuGunBox;
      
      public var txt_abil_streakname:TextField;
      
      public var txt_app_camo:TextField;
      
      public var app_camo16:MovieClip;
      
      public var app_camo8:MovieClip;
      
      public var bar_aim2:MovieClip;
      
      public var class_icon3:MovieClip;
      
      public var txt_classname:TextField;
      
      public var mc_unit:UnitProfile;
      
      public var ach9:MovieClip;
      
      public var logo1:Logo_LogoBox;
      
      public var cb_voices:CheckBox;
      
      public var rd_bloodH:RadioButton;
      
      public var rd_qualL:RadioButton;
      
      public var left:MovieClip;
      
      public var 继续特种作战演习:MenuButton;
      
      public var 进入终端:MenuButton;
      
      public var bt_version:SimpleButton;
      
      public var 设置:MenuButton;
      
      public var gun_info:MovieClip;
      
      public var sellwindow:SellWindow;
      
      public var inv_armor1:MenuOtherBox;
      
      public var inv_attach9:MenuOtherBox;
      
      public var inv_gun16:MenuGunBox;
      
      public var abil_streak2:MovieClip;
      
      public var txt_app_body:TextField;
      
      public var app_camo15:MovieClip;
      
      public var app_camo9:MovieClip;
      
      public var class_icon2:MovieClip;
      
      public var logo2:Logo_LogoBox;
      
      public var inv_gun15:MenuGunBox;
      
      public var inv_gun8:MenuGunBox;
      
      public var abil_streak3:MovieClip;
      
      public var app_camo14:MovieClip;
      
      public var bar_hp2:MovieClip;
      
      public var rd_partM:RadioButton;
      
      public var 进入新手教程:MenuButton;
      
      public var save1:MovieClip;
      
      public var inv_gun14:MenuGunBox;
      
      public var inv_gun9:MenuGunBox;
      
      public var abil_streak0:MovieClip;
      
      public var app_camo13:MovieClip;
      
      public var app_camo6:MovieClip;
      
      public var txt_prof_playdesc:TextField;
      
      public var txt_prof_playstyle:TextField;
      
      public var class_icon4:MovieClip;
      
      public var ach10:MovieClip;
      
      public var cb_sound:CheckBox;
      
      public var rd_partL:RadioButton;
      
      public var sideBox:MenuSideBox;
      
      public var 继续演习模式:MenuButton;
      
      public var save2:MovieClip;
      
      public var inv_attach4:MenuOtherBox;
      
      public var inv_gun13:MenuGunBox;
      
      public var txt_abil_skilldesc:TextField;
      
      public var abil_streak1:MovieClip;
      
      public var app_camo12:MovieClip;
      
      public var app_camo7:MovieClip;
      
      public var bar_ammo:MovieClip;
      
      public var page_icon4:MovieClip;
      
      public var ach20:MovieClip;
      
      public var ach11:MovieClip;
      
      public var rd_qualH:RadioButton;
      
      public var right:MovieClip;
      
      public var save3:MovieClip;
      
      public var mc_blackfade:MovieClip;
      
      public var inv_attach5:MenuOtherBox;
      
      public var inv_gun12:MenuGunBox;
      
      public var inv_gun6:MenuGunBox;
      
      public var txt_app_head:TextField;
      
      public var app_camo11:MovieClip;
      
      public var app_camo4:MovieClip;
      
      public var txt_prof_title:TextField;
      
      public var txt_prof_stats:TextField;
      
      public var page_icon3:MovieClip;
      
      public var ach12:MovieClip;
      
      public var save4:MovieClip;
      
      public var shop_other5:MenuOtherBox;
      
      public var shop_gun5:MenuGunBox;
      
      public var misc_info:MovieClip;
      
      public var inv_attach6:MenuOtherBox;
      
      public var inv_gun11:MenuGunBox;
      
      public var inv_gun7:MenuGunBox;
      
      public var app_camo10:MovieClip;
      
      public var app_camo5:MovieClip;
      
      public var page_icon2:MovieClip;
      
      public var ach13:MovieClip;
      
      public var slotmachine:SlotMachine;
      
      public var shop_other4:MenuOtherBox;
      
      public var shop_gun4:MenuGunBox;
      
      public var inv_attach7:MenuOtherBox;
      
      public var inv_gun10:MenuGunBox;
      
      public var inv_gun4:MenuGunBox;
      
      public var app_camo2:MovieClip;
      
      public var bar_crit:MovieClip;
      
      public var page_icon1:MovieClip;
      
      public var ach14:MovieClip;
      
      public var rd_partH:RadioButton;
      
      public var bg:MovieClip;
      
      public var slotlid:MovieClip;
      
      public var shop_other3:MenuOtherBox;
      
      public var inv_attach0:MenuOtherBox;
      
      public var inv_gun5:MenuGunBox;
      
      public var app_head2:MovieClip;
      
      public var app_camo3:MovieClip;
      
      public var txt_name:TextField;
      
      public var page_icon0:MovieClip;
      
      public var ach15:MovieClip;
      
      public var ach0:MovieClip;
      
      public var rd_rightclick2:RadioButton;
      
      public var cb_light:CheckBox;
      
      public var mc_version:MovieClip;
      
      public var 上一版本:MenuButton;
      
      public var flash:MovieClip;
      
      public var 特种作战演习:MenuButton;
      
      public var shop_other2:MenuOtherBox;
      
      public var inv_attach1:MenuOtherBox;
      
      public var inv_gun2:MenuGunBox;
      
      public var app_head3:MovieClip;
      
      public var app_camo0:MovieClip;
      
      public var bar_crit2:MovieClip;
      
      public var bar_exp:MovieClip;
      
      public var ach16:MovieClip;
      
      public var ach1:MovieClip;
      
      public var 下一版本:MenuButton;
      
      public var 存档选择:MenuButton;
      
      public var logo1b:Logo_LogoBox;
      
      public var slot_gun:MenuGunBox;
      
      public var shop_other1:MenuOtherBox;
      
      public var shop_gun1:MenuGunBox;
      
      public var inv_attach2:MenuOtherBox;
      
      public var inv_gun3:MenuGunBox;
      
      public var app_camo1:MovieClip;
      
      public var app_head0:MovieClip;
      
      public var bar_hp:MovieClip;
      
      public var bar_ammo2:MovieClip;
      
      public var bar_aim:MovieClip;
      
      public var txt_title:TextField;
      
      public var ach17:MovieClip;
      
      public var ach2:MovieClip;
      
      public var rd_rightclick0:RadioButton;
      
      public var 光荣之路:MenuButton;
      
      public var shop_other0:MenuOtherBox;
      
      public var shop_gun0:MenuGunBox;
      
      public var inv_attach3:MenuOtherBox;
      
      public var inv_gun0:MenuGunBox;
      
      public var abil_skill4:MovieClip;
      
      public var app_body2:MovieClip;
      
      public var app_head1:MovieClip;
      
      public var txt_prof_desc:TextField;
      
      public var txt_funds:TextField;
      
      public var ach18:MovieClip;
      
      public var ach3:MovieClip;
      
      public var rd_rightclick1:RadioButton;
      
      public var cb_music:CheckBox;
      
      public var txt_version:TextField;
      
      public var §体验《战火英雄 1》§:MenuButton2;
      
      public var 演习模式:MenuButton;
      
      public var 终端:MenuButton;
      
      public var shop_gun3:MenuGunBox;
      
      public var inv_attach11:MenuOtherBox;
      
      public var inv_gun1:MenuGunBox;
      
      public var txt_abil_streakdesc:TextField;
      
      public var abil_skill3:MovieClip;
      
      public var txt_classlvl:TextField;
      
      public var ach19:MovieClip;
      
      public var ach4:MovieClip;
      
      public var saveLoad:MovieClip;
      
      public var logo2b:Logo_LogoBox;
      
      public var shop_gun2:MenuGunBox;
      
      public var inv_armor4:MenuOtherBox;
      
      public var inv_attach10:MenuOtherBox;
      
      public var abil_skill2:MovieClip;
      
      public var app_body0:MovieClip;
      
      public var app_camo19:MovieClip;
      
      public var ach5:MovieClip;
      
      public var cb_bloody:CheckBox;
      
      public var rd_bloodL:RadioButton;
      
      public var mc_login:MovieClip;
      
      public var inv_armor5:MenuOtherBox;
      
      public var abil_skill1:MovieClip;
      
      public var app_body1:MovieClip;
      
      public var app_camo18:MovieClip;
      
      public var §我们开始吧！§:MenuButton;
      
      public var ach6:MovieClip;
      
      public var cb_shake:CheckBox;
      
      public var rd_bloodM:RadioButton;
      
      public var 管理干员:MenuButton;
      
      public var newsbox:MovieClip;
      
      public var __setPropDict:Dictionary;
      
      public var __lastFrameProp:int = -1;
      
      public var __animFactory_leftaf1:AnimatorFactory3D;
      
      public var __animArray_leftaf1:Array;
      
      public var ____motion_leftaf1_mat3DVec__:Vector.<Number>;
      
      public var ____motion_leftaf1_matArray__:Array;
      
      public var __motion_leftaf1:MotionBase;
      
      public var __animFactory_rightaf1:AnimatorFactory3D;
      
      public var __animArray_rightaf1:Array;
      
      public var ____motion_rightaf1_mat3DVec__:Vector.<Number>;
      
      public var ____motion_rightaf1_matArray__:Array;
      
      public var __motion_rightaf1:MotionBase;
      
      private var main:Main;
      
      private var soldierPages:Array;
      
      private var leftMove:Range;
      
      private var rightMove:Range;
      
      private var curPage:String;
      
      private var curClassOb:Object;
      
      private var sideBoxReturn:String;
      
      private var tempAr:Array;
      
      private var tempOb:Object;
      
      private var tempOther;
      
      public var buyMode:Boolean;
      
      private var selMission:uint;
      
      private var inSoldierPage:Boolean;
      
      private var checkedQuests:Boolean;
      
      public var inv_gun18:MenuGunBox;
      
      public var inv_gun19:MenuGunBox;
      
      public var inv_gun20:MenuGunBox;
      
      public var inv_gun21:MenuGunBox;
      
      public var inv_gun22:MenuGunBox;
      
      public var inv_gun23:MenuGunBox;
      
      public function Menu(param1:Main, param2:Object)
      {
         this.__setPropDict = new Dictionary(true);
         super();
         addFrameScript(0,this.frame1);
         this.main = param1;
         this.soldierPages = ["profile","appearance","abilities","equipment","shop"];
         this.leftMove = new Range(UT.rand(0,360),UT.rand(0,360));
         this.rightMove = new Range(UT.rand(0,360),UT.rand(0,360));
         Main.STAGE.quality = UT.getEl(SD.graphQual,["medium","medium","high"]);
         this.curPage = "main";
         if(!showedMenu)
         {
            showedMenu = true;
            this.ClickButton("firstsaveslot",false);
         }
         if(SD.lastMenuScreen)
         {
            this.ClickButton(SD.lastMenuScreen,false);
            SD.lastMenuScreen = null;
         }
         SH.playMusic(M_Menu);
         this.mc_blackfade.buttonMode = false;
         this.mc_blackfade.mouseEnabled = false;
         UT.forceGarbageCollection();
         if(this.__animFactory_leftaf1 == null)
         {
            this.__animArray_leftaf1 = new Array();
            this.__motion_leftaf1 = new MotionBase();
            this.__motion_leftaf1.duration = 15;
            this.__motion_leftaf1.overrideTargetTransform();
            this.__motion_leftaf1.addPropertyArray("visible",[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]);
            this.__motion_leftaf1.addPropertyArray("cacheAsBitmap",[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
            this.__motion_leftaf1.addPropertyArray("blendMode",["normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal"]);
            this.__motion_leftaf1.addPropertyArray("opaqueBackground",[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],7,8);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],7,8);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],6,7);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],6,7);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],5,6);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],5,6);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],4,5);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],4,5);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],3,4);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],3,4);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],2,3);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],2,3);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],1,2);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],1,2);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],0,1);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],0,1);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],14,15);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],14,15);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],13,14);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],13,14);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],12,13);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],12,13);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],11,12);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],11,12);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],10,11);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],10,11);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],9,10);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],9,10);
            this.__motion_leftaf1.initFilters(["flash.filters.DropShadowFilter"],[0],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"alpha",[1],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"knockout",[false],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"strength",[0.8],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"angle",[45],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"hideObject",[false],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurX",[8],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"blurY",[8],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"inner",[false],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"distance",[4],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"color",[0],8,9);
            this.__motion_leftaf1.addFilterPropertyArray(0,"quality",[1],8,9);
            this.__motion_leftaf1.is3D = true;
            this.__motion_leftaf1.motion_internal::spanStart = 24;
            this.____motion_leftaf1_matArray__ = new Array();
            this.____motion_leftaf1_mat3DVec__ = new Vector.<Number>(16);
            this.____motion_leftaf1_mat3DVec__[0] = 0.992546;
            this.____motion_leftaf1_mat3DVec__[1] = 0;
            this.____motion_leftaf1_mat3DVec__[2] = 0.121869;
            this.____motion_leftaf1_mat3DVec__[3] = 0;
            this.____motion_leftaf1_mat3DVec__[4] = 0;
            this.____motion_leftaf1_mat3DVec__[5] = 1;
            this.____motion_leftaf1_mat3DVec__[6] = 0;
            this.____motion_leftaf1_mat3DVec__[7] = 0;
            this.____motion_leftaf1_mat3DVec__[8] = -0.121869;
            this.____motion_leftaf1_mat3DVec__[9] = 0;
            this.____motion_leftaf1_mat3DVec__[10] = 0.992546;
            this.____motion_leftaf1_mat3DVec__[11] = 0;
            this.____motion_leftaf1_mat3DVec__[12] = 58.295662;
            this.____motion_leftaf1_mat3DVec__[13] = 59;
            this.____motion_leftaf1_mat3DVec__[14] = -21.999113;
            this.____motion_leftaf1_mat3DVec__[15] = 1;
            this.____motion_leftaf1_matArray__.push(new Matrix3D(this.____motion_leftaf1_mat3DVec__));
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.____motion_leftaf1_matArray__.push(null);
            this.__motion_leftaf1.addPropertyArray("matrix3D",this.____motion_leftaf1_matArray__);
            this.__animArray_leftaf1.push(this.__motion_leftaf1);
            this.__animFactory_leftaf1 = new AnimatorFactory3D(null,this.__animArray_leftaf1);
            this.__animFactory_leftaf1.addTargetInfo(this,"left",0,true,0,true,null,-1);
         }
         if(this.__animFactory_rightaf1 == null)
         {
            this.__animArray_rightaf1 = new Array();
            this.__motion_rightaf1 = new MotionBase();
            this.__motion_rightaf1.duration = 15;
            this.__motion_rightaf1.overrideTargetTransform();
            this.__motion_rightaf1.addPropertyArray("visible",[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]);
            this.__motion_rightaf1.addPropertyArray("cacheAsBitmap",[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
            this.__motion_rightaf1.addPropertyArray("blendMode",["normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal"]);
            this.__motion_rightaf1.addPropertyArray("opaqueBackground",[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],7,8);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],7,8);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],6,7);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],6,7);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],5,6);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],5,6);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],4,5);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],4,5);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],3,4);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],3,4);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],2,3);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],2,3);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],1,2);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],1,2);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],0,1);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],0,1);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],14,15);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],14,15);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],13,14);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],13,14);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],12,13);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],12,13);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],11,12);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],11,12);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],10,11);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],10,11);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],9,10);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],9,10);
            this.__motion_rightaf1.initFilters(["flash.filters.DropShadowFilter"],[0],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"alpha",[1],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"knockout",[false],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"strength",[0.8],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"angle",[45],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"hideObject",[false],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurX",[8],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"blurY",[8],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"inner",[false],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"distance",[4],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"color",[0],8,9);
            this.__motion_rightaf1.addFilterPropertyArray(0,"quality",[1],8,9);
            this.__motion_rightaf1.is3D = true;
            this.__motion_rightaf1.motion_internal::spanStart = 24;
            this.____motion_rightaf1_matArray__ = new Array();
            this.____motion_rightaf1_mat3DVec__ = new Vector.<Number>(16);
            this.____motion_rightaf1_mat3DVec__[0] = 0.994522;
            this.____motion_rightaf1_mat3DVec__[1] = 0;
            this.____motion_rightaf1_mat3DVec__[2] = -0.104529;
            this.____motion_rightaf1_mat3DVec__[3] = 0;
            this.____motion_rightaf1_mat3DVec__[4] = 0;
            this.____motion_rightaf1_mat3DVec__[5] = 1;
            this.____motion_rightaf1_mat3DVec__[6] = 0;
            this.____motion_rightaf1_mat3DVec__[7] = 0;
            this.____motion_rightaf1_mat3DVec__[8] = 0.104529;
            this.____motion_rightaf1_mat3DVec__[9] = 0;
            this.____motion_rightaf1_mat3DVec__[10] = 0.994522;
            this.____motion_rightaf1_mat3DVec__[11] = 0;
            this.____motion_rightaf1_mat3DVec__[12] = 454.923431;
            this.____motion_rightaf1_mat3DVec__[13] = 74.900002;
            this.____motion_rightaf1_mat3DVec__[14] = 16.667109;
            this.____motion_rightaf1_mat3DVec__[15] = 1;
            this.____motion_rightaf1_matArray__.push(new Matrix3D(this.____motion_rightaf1_mat3DVec__));
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.____motion_rightaf1_matArray__.push(null);
            this.__motion_rightaf1.addPropertyArray("matrix3D",this.____motion_rightaf1_matArray__);
            this.__animArray_rightaf1.push(this.__motion_rightaf1);
            this.__animFactory_rightaf1 = new AnimatorFactory3D(null,this.__animArray_rightaf1);
            this.__animFactory_rightaf1.addTargetInfo(this,"right",0,true,0,true,null,-1);
         }
         addEventListener(Event.FRAME_CONSTRUCTED,this.__setProp_handler,false,0,true);
      }
      
      public function Init(param1:Boolean = false) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Object = null;
         var _loc4_:uint = 0;
         if(this.inSoldierPage)
         {
            this.curClassOb = Stats_Classes.getClass(SD.selClass,SD.getSelCass().level);
            this.txt_funds.text = "L" + UT.addNumCommas(SD.getSelCass().funds);
            this.tempOther = null;
            _loc2_ = 0;
            while(_loc2_ < this.soldierPages.length)
            {
               this["page_icon" + _loc2_].gotoAndStop(this.soldierPages[_loc2_]);
               this["page_icon" + _loc2_].alpha = this.soldierPages[_loc2_] != this.curPage ? 0.4 : 1;
               this["page_icon" + _loc2_].buttonMode = this.soldierPages[_loc2_] != this.curPage;
               _loc2_++;
            }
            this.txt_title.text = this.curPage.toUpperCase();
            _loc2_ = 0;
            while(_loc2_ < 5)
            {
               this["class_icon" + _loc2_].gotoAndStop(Stats_Classes.getClass(_loc2_ + 1).icon);
               this["class_icon" + _loc2_].alpha = SD.selClass != _loc2_ + 1 ? 0.4 : 1;
               this["class_icon" + _loc2_].buttonMode = SD.selClass != _loc2_ + 1;
               _loc2_++;
            }
            this.txt_classname.text = this.curClassOb.name.toUpperCase();
            this.txt_classlvl.text = "" + SD.getSelCass().level;
            this.bar_exp.width = SD.getSelCass().exp / Stats_Classes.getNextExp(SD.getSelCass().level) * 180;
            if(this.mc_unit)
            {
               if(this.curPage == "soldierFirst")
               {
                  this.mc_unit.soldierFirstSkin();
                  this.txt_title.text = "";
               }
               else
               {
                  this.mc_unit.loadSkin();
               }
               this.mc_unit.goto("idle" + Stats_Classes.getClass(SD.selClass).idleType);
            }
         }
         if(this.sideBox)
         {
            this.sideBox.setReturn(this.sideBoxReturn);
         }
         var _loc5_:* = this.curPage;
         loop22:
         switch("main" !== _loc5_ ? ("version" !== _loc5_ ? ("saveslot" === _loc5_ ? 2 : ("saveslot2" !== _loc5_ ? ("终端" === _loc5_ ? 4 : ("特种作战演习" !== _loc5_ ? ("演习模式" !== _loc5_ ? ("profile" !== _loc5_ ? ("appearance" === _loc5_ ? 8 : ("abilities" !== _loc5_ ? ("equipment" !== _loc5_ ? ("shop" === _loc5_ ? 11 : ("设置" !== _loc5_ ? ("光荣之路" === _loc5_ ? 13 : 14) : 12)) : 10) : 9)) : 7) : 6) : 5)) : 3)) : 1) : 0)
         {
            case 0:
               if(!this.checkedQuests && SD.saveSlot == 4)
               {
                  this.checkedQuests = true;
                  AGI.agiTrace("Checking quests");
                  if(SD.getSelCass(1).level >= 5 || SD.getSelCass(2).level >= 5 || SD.getSelCass(3).level >= 5 || SD.getSelCass(4).level >= 5 || SD.getSelCass(5).level >= 5)
                  {
                     AGI.submitQuest("reach_lvl_5");
                  }
                  if(SD.getSelCass(1).level >= 50 || SD.getSelCass(2).level >= 50 || SD.getSelCass(3).level >= 50 || SD.getSelCass(4).level >= 50 || SD.getSelCass(5).level >= 50)
                  {
                     AGI.submitQuest("reach_lvl_50");
                  }
                  if(SD.getSelCass(1).level >= 10 && SD.getSelCass(2).level >= 10 && SD.getSelCass(3).level >= 10 && SD.getSelCass(4).level >= 10 && SD.getSelCass(5).level >= 10)
                  {
                     AGI.submitQuest("lvl_10_all_soldiers");
                  }
               }
               this.txt_version.text = Main.VERSION;
               SD.loadNews(this.newsbox);
               break;
            case 1:
               this.下一版本.visible = this.mc_version.currentFrame != 1;
               this.上一版本.visible = this.mc_version.currentFrame != this.mc_version.totalFrames;
               break;
            case 2:
               if(!AGI.isLoggedIn())
               {
                  this.mc_login.gotoAndStop(2);
                  this.save4.y = 5000;
                  this.saveLoad.y = 5000;
               }
               else
               {
                  this.mc_login.gotoAndStop(1);
                  this.mc_login.txt_name.text = AGI.userData.username;
                  AGI.loadUserImage(this.mc_login.mc_image);
                  if(!param1)
                  {
                     AGI.loadData();
                  }
               }
            case 3:
               _loc2_ = 1;
               while(true)
               {
                  if(_loc2_ > 4)
                  {
                     break loop22;
                  }
                  _loc3_ = SD.getSaveSlot(_loc2_);
                  if(_loc3_ != null)
                  {
                     this["save" + _loc2_].gotoAndStop(1);
                     _loc4_ = 1;
                     while(_loc4_ <= 5)
                     {
                        this["save" + _loc2_]["mc_class" + _loc4_].gotoAndStop(Stats_Classes.getClass(_loc4_).icon);
                        this["save" + _loc2_]["mc_class" + _loc4_].alpha = 0.5;
                        this["save" + _loc2_]["txt_class" + _loc4_].alpha = 0.5;
                        this["save" + _loc2_]["txt_class" + _loc4_].text = _loc3_["class" + _loc4_];
                        _loc4_++;
                     }
                     this["save" + _loc2_].txt_name.text = _loc3_.name;
                     this["save" + _loc2_]["mc_class" + _loc3_.selClass].alpha = 1;
                     this["save" + _loc2_]["txt_class" + _loc3_.selClass].alpha = 1;
                  }
                  else
                  {
                     this["save" + _loc2_].gotoAndStop(3);
                  }
                  _loc2_++;
               }
               break;
            case 4:
               MatchSettings.caType = 0;
               this.setSideBoxes(param1);
               this.left.gotoAndStop(1);
               this.right.gotoAndStop(3);
               if(param1)
               {
                  this.selMission = SD.completeCamp.length - 1;
               }
               _loc2_ = 0;
               while(_loc2_ < 15)
               {
                  if(_loc2_ >= SD.completeCamp.length)
                  {
                     this.right["mission" + _loc2_].gotoAndStop(3);
                     this.right["mission" + _loc2_].buttonMode = false;
                     this.right["mission" + _loc2_].txt_num.text = _loc2_ + 1;
                     this.right["mission" + _loc2_].txt_num.mouseEnabled = false;
                     this.right["mission" + _loc2_].txt_title.mouseEnabled = false;
                     this.right["mission" + _loc2_].mc_shields.gotoAndStop(1);
                     this.right["mission" + _loc2_].txt_title.text = "前路未明";
                  }
                  else
                  {
                     Stats_Campaign.setMatch(_loc2_,true);
                     if(_loc2_ != this.selMission)
                     {
                        this.right["mission" + _loc2_].gotoAndStop(1);
                        this.right["mission" + _loc2_].buttonMode = true;
                     }
                     else
                     {
                        this.right["mission" + _loc2_].gotoAndStop(2);
                        this.right["mission" + _loc2_].buttonMode = false;
                     }
                     this.right["mission" + _loc2_].txt_num.text = _loc2_ + 1;
                     this.right["mission" + _loc2_].txt_num.mouseEnabled = false;
                     this.right["mission" + _loc2_].txt_title.mouseEnabled = false;
                     this.right["mission" + _loc2_].mc_shields.gotoAndStop(SD.completeCamp[_loc2_] + 1);
                     this.right["mission" + _loc2_].txt_title.text = MatchSettings.caName;
                  }
                  _loc2_++;
               }
               Stats_Campaign.setMatch(this.selMission,true);
               this.left.mc_map.gotoAndStop(MatchSettings.caMap);
               this.left.mc_map.txt_title.text = Stats_Maps.getMap(MatchSettings.caMap).name;
               this.left.mc_map.bt_prev.visible = this.left.mc_map.bt_next.visible = false;
               this.left.txt_desc.text = MatchSettings.caDesc;
               this.left.txt_mode.text = Stats_Misc.getGameMode(MatchSettings.caMode).name;
               this.left.txt_scoretype.text = Stats_Misc.getGameMode(MatchSettings.caMode).scoretype;
               this.left.txt_score.text = MatchSettings.caScore;
               this.left.txt_special.text = MatchSettings.caSpecial;
               this.left.mc_diff.txt_word.text = UT.getEl(MatchSettings.caDiffMode,["普通","突袭","绝境"]);
               this.left.txt_reclevel.text = "推荐干员等级：" + Stats_Classes.getReccLevel(MatchSettings.caDiff);
               if(this.selMission >= SD.completeCamp.length)
               {
                  this.left.mc_completed.gotoAndStop(1);
                  break;
               }
               this.left.mc_completed.gotoAndStop(SD.completeCamp[this.selMission] + 1);
               break;
            case 5:
               MatchSettings.caType = 1;
               this.setSideBoxes(param1);
               this.left.gotoAndStop(1);
               this.right.gotoAndStop(3);
               if(param1)
               {
                  this.selMission = SD.completeChal.length - 1;
               }
               _loc2_ = 0;
               while(_loc2_ < 15)
               {
                  if(_loc2_ >= SD.completeChal.length)
                  {
                     this.right["mission" + _loc2_].gotoAndStop(3);
                     this.right["mission" + _loc2_].buttonMode = false;
                     this.right["mission" + _loc2_].txt_num.text = _loc2_ + 1;
                     this.right["mission" + _loc2_].txt_num.mouseEnabled = false;
                     this.right["mission" + _loc2_].txt_title.mouseEnabled = false;
                     this.right["mission" + _loc2_].mc_shields.gotoAndStop(1);
                     this.right["mission" + _loc2_].txt_title.text = "前路未明";
                  }
                  else
                  {
                     Stats_Campaign.setMatch(_loc2_,true);
                     if(_loc2_ != this.selMission)
                     {
                        this.right["mission" + _loc2_].gotoAndStop(1);
                        this.right["mission" + _loc2_].buttonMode = true;
                     }
                     else
                     {
                        this.right["mission" + _loc2_].gotoAndStop(2);
                        this.right["mission" + _loc2_].buttonMode = false;
                     }
                     this.right["mission" + _loc2_].txt_num.text = _loc2_ + 1;
                     this.right["mission" + _loc2_].txt_num.mouseEnabled = false;
                     this.right["mission" + _loc2_].txt_title.mouseEnabled = false;
                     this.right["mission" + _loc2_].mc_shields.gotoAndStop(SD.completeChal[_loc2_] + 1);
                     this.right["mission" + _loc2_].txt_title.text = MatchSettings.caName;
                  }
                  _loc2_++;
               }
               Stats_Campaign.setMatch(this.selMission,true);
               this.left.mc_map.gotoAndStop(MatchSettings.caMap);
               this.left.mc_map.txt_title.text = Stats_Maps.getMap(MatchSettings.caMap).name;
               this.left.mc_map.bt_prev.visible = this.left.mc_map.bt_next.visible = false;
               this.left.txt_desc.text = MatchSettings.caDesc;
               this.left.txt_mode.text = Stats_Misc.getGameMode(MatchSettings.caMode).name;
               this.left.txt_scoretype.text = Stats_Misc.getGameMode(MatchSettings.caMode).scoretype;
               this.left.txt_score.text = MatchSettings.caScore;
               this.left.txt_special.text = MatchSettings.caSpecial;
               this.left.mc_diff.txt_word.text = UT.getEl(MatchSettings.caDiffMode,["普通","突袭","绝境"]);
               this.left.txt_reclevel.text = "推荐干员等级：" + Stats_Classes.getReccLevel(MatchSettings.caDiff);
               if(this.selMission >= SD.completeChal.length)
               {
                  this.left.mc_completed.gotoAndStop(1);
                  break;
               }
               this.left.mc_completed.gotoAndStop(SD.completeChal[this.selMission] + 1);
               break;
            case 6:
               this.setSideBoxes(param1);
               Stats_Misc.buildModList();
               this.left.gotoAndStop(2);
               this.left.mc_map.gotoAndStop(MatchSettings.qmMap);
               this.left.mc_map.txt_title.text = Stats_Maps.getMap(MatchSettings.qmMap).name;
               this.left.txt_mode.text = Stats_Misc.getGameMode(MatchSettings.qmMode).name;
               this.left.txt_modedesc.text = Stats_Misc.getGameMode(MatchSettings.qmMode).desc;
               this.left.txt_scoretype.text = Stats_Misc.getGameMode(MatchSettings.qmMode).scoretype;
               _loc2_ = 0;
               while(_loc2_ < 7)
               {
                  this.left["type" + _loc2_].gotoAndStop(Stats_Misc.gameModes[_loc2_]);
                  this.left["type" + _loc2_].alpha = Stats_Misc.gameModes[_loc2_] != MatchSettings.qmMode ? 0.5 : 1;
                  this.left["type" + _loc2_].buttonMode = Stats_Misc.gameModes[_loc2_] != MatchSettings.qmMode;
                  _loc2_++;
               }
               this.left.mc_score.txt_word.text = MatchSettings.qmScore;
               this.left.mc_soldiers.txt_word.text = UT.getEl(MatchSettings.qmClassOnly,["无","辅助干员","近卫干员","特种干员","狙击干员","重装干员"]);
               this.left.mc_skills.txt_word.text = !MatchSettings.qmSkills ? "禁用" : "可用";
               this.left.mc_streaks.txt_word.text = !MatchSettings.qmStreaks ? "禁用" : "可用";
               this.left.mc_armor.txt_word.text = !MatchSettings.qmArmor ? "禁用" : "可用";
               this.left.mc_mods.txt_word.text = Stats_Misc.getMod(MatchSettings.qmMod).name;
               this.left.txt_mod.text = Stats_Misc.getMod(MatchSettings.qmMod).desc;
               this.left.txt_exp.text = Stats_Misc.getMod(MatchSettings.qmMod).exp;
               this.left.mc_diff.txt_word.text = Stats_Misc.getDiffName(MatchSettings.qmDiff);
               this.left.txt_reclevel.text = "推荐干员等级：" + Stats_Classes.getReccLevel(MatchSettings.qmDiff);
               this.right.gotoAndStop(Stats_Misc.getGameMode(MatchSettings.qmMode).teams);
               _loc2_ = 0;
               while(_loc2_ < 12)
               {
                  this.right["mission" + _loc2_].visible = true;
                  this.right["mission" + _loc2_].txt_num.mouseEnabled = false;
                  this.right["mission" + _loc2_].txt_title.mouseEnabled = false;
                  this.right["mission" + _loc2_].txt_num.text = _loc2_ + 1;
                  this.right["mission" + _loc2_].mc_shields.visible = false;
                  this.right["mission" + _loc2_].gotoAndStop(1);
                  if(this.right["mission" + _loc2_].bt)
                  {
                     this.right["mission" + _loc2_].bt.enabled = false;
                  }
                  _loc2_++;
               }
               if(Stats_Misc.getGameMode(MatchSettings.qmMode).teams != 1)
               {
                  MatchSettings.qmTeams = true;
                  _loc2_ = 0;
                  while(_loc2_ < 6)
                  {
                     if(_loc2_ >= MatchSettings.qmBots1.length + 1)
                     {
                        this.right["mission" + _loc2_].visible = false;
                     }
                     else if(_loc2_ != 0)
                     {
                        this.right["mission" + _loc2_].txt_title.text = MatchSettings.qmBots1[_loc2_ - 1].name;
                     }
                     else
                     {
                        this.right["mission" + _loc2_].gotoAndStop(2);
                        this.right["mission" + _loc2_].txt_title.text = SD.name;
                     }
                     this.right.mc_players1.txt_word.text = 1 + MatchSettings.qmBots1.length;
                     _loc2_++;
                  }
                  _loc2_ = 0;
                  while(true)
                  {
                     if(_loc2_ >= 6)
                     {
                        break loop22;
                     }
                     if(_loc2_ >= MatchSettings.qmBots2.length)
                     {
                        this.right["mission" + (_loc2_ + 6)].visible = false;
                     }
                     else
                     {
                        this.right["mission" + (_loc2_ + 6)].txt_num.text = _loc2_ + 1;
                        this.right["mission" + (_loc2_ + 6)].txt_title.text = MatchSettings.qmBots2[_loc2_].name;
                     }
                     this.right.mc_players2.txt_word.text = MatchSettings.qmBots2.length;
                     _loc2_++;
                  }
               }
               else
               {
                  MatchSettings.qmTeams = false;
                  _loc2_ = 0;
                  while(true)
                  {
                     if(_loc2_ >= 12)
                     {
                        break loop22;
                     }
                     if(_loc2_ >= MatchSettings.qmBots0.length + 1)
                     {
                        this.right["mission" + _loc2_].visible = false;
                     }
                     else if(_loc2_ != 0)
                     {
                        this.right["mission" + _loc2_].txt_title.text = MatchSettings.qmBots0[_loc2_ - 1].name;
                     }
                     else
                     {
                        this.right["mission" + _loc2_].gotoAndStop(2);
                        this.right["mission" + _loc2_].txt_title.text = SD.name;
                     }
                     this.right.mc_players0.txt_word.text = 1 + MatchSettings.qmBots0.length;
                     _loc2_++;
                  }
               }
               break;
            case 7:
               this.txt_name.text = SD.name;
               this.txt_prof_title.text = this.curClassOb.title;
               this.txt_prof_desc.text = this.curClassOb.desc;
               this.txt_prof_playstyle.text = "档案：" + this.curClassOb.playstyle;
               this.txt_prof_playdesc.text = this.curClassOb.playdesc;
               this.tempOb = {};
               this.tempOb.hp = this.tempOb.aim = this.tempOb.crit = this.tempOb.ammo = 0;
               break;
            case 8:
               this.txt_app_head.text = Stats_Misc.getHeadName(SD.getSelCass().head,SD.selClass);
               _loc2_ = 0;
               while(_loc2_ < 4)
               {
                  if(SD.getSelCass().level >= Stats_Misc.getAppLvlReq("head",_loc2_))
                  {
                     this["app_head" + _loc2_].lock.visible = false;
                  }
                  else
                  {
                     this["app_head" + _loc2_].lock.visible = true;
                     this["app_head" + _loc2_].lock.txt_level.text = "LVL " + Stats_Misc.getAppLvlReq("head",_loc2_);
                  }
                  if(SD.getSelCass().head != _loc2_ + 1)
                  {
                     this["app_head" + _loc2_].gotoAndStop(1);
                     this["app_head" + _loc2_].buttonMode = true;
                  }
                  else
                  {
                     this["app_head" + _loc2_].gotoAndStop(2);
                     this["app_head" + _loc2_].buttonMode = false;
                  }
                  this["app_head" + _loc2_].head.gotoAndStop(_loc2_ + 1 + Stats_Classes.getClass(SD.selClass,1).startFrame);
                  this["app_head" + _loc2_].head.camo.stop();
                  this["app_head" + _loc2_].head.camo.visible = false;
                  _loc2_++;
               }
               this.txt_app_body.text = Stats_Misc.getBodyName(SD.getSelCass().body,SD.selClass);
               _loc2_ = 0;
               while(_loc2_ < 3)
               {
                  if(SD.getSelCass().level >= Stats_Misc.getAppLvlReq("body",_loc2_))
                  {
                     this["app_body" + _loc2_].lock.visible = false;
                  }
                  else
                  {
                     this["app_body" + _loc2_].lock.visible = true;
                     this["app_body" + _loc2_].lock.txt_level.text = "LVL " + Stats_Misc.getAppLvlReq("body",_loc2_);
                  }
                  if(SD.getSelCass().body != _loc2_ + 1)
                  {
                     this["app_body" + _loc2_].gotoAndStop(1);
                     this["app_body" + _loc2_].buttonMode = true;
                  }
                  else
                  {
                     this["app_body" + _loc2_].gotoAndStop(2);
                     this["app_body" + _loc2_].buttonMode = false;
                  }
                  this["app_body" + _loc2_].head.gotoAndStop(_loc2_ + 1 + Stats_Classes.getClass(SD.selClass,1).startFrame);
                  if(this["app_body" + _loc2_].head.camo)
                  {
                     this["app_body" + _loc2_].head.camo.stop();
                     this["app_body" + _loc2_].head.camo.visible = false;
                  }
                  this["app_body" + _loc2_].head.gunback.visible = false;
                  this["app_body" + _loc2_].head.gunside.visible = false;
                  _loc2_++;
               }
               this.txt_app_camo.text = Stats_Misc.getCamoName(SD.getSelCass().camo);
               _loc2_ = 0;
               while(true)
               {
                  if(_loc2_ >= 20)
                  {
                     break loop22;
                  }
                  if(_loc2_ + 1 <= SD.getSelCass().unlockCamo)
                  {
                     this["app_camo" + _loc2_].lock.visible = false;
                  }
                  else
                  {
                     this["app_camo" + _loc2_].lock.visible = true;
                  }
                  if(SD.getSelCass().camo != _loc2_ + 1)
                  {
                     this["app_camo" + _loc2_].gotoAndStop(1);
                     this["app_camo" + _loc2_].buttonMode = true;
                  }
                  else
                  {
                     this["app_camo" + _loc2_].gotoAndStop(2);
                     this["app_camo" + _loc2_].buttonMode = false;
                  }
                  this["app_camo" + _loc2_].camo.gotoAndStop(_loc2_ + 1);
                  _loc2_++;
               }
               break;
            case 9:
               _loc2_ = 0;
               while(_loc2_ < 5)
               {
                  if(SD.getSelCass().level >= Stats_Skills.classAr[SD.selClass][_loc2_].lvlReq)
                  {
                     this["abil_skill" + _loc2_].lock.visible = false;
                  }
                  else
                  {
                     this["abil_skill" + _loc2_].lock.visible = true;
                     this["abil_skill" + _loc2_].lock.txt_level.text = "LVL " + Stats_Skills.classAr[SD.selClass][_loc2_].lvlReq;
                  }
                  if(SD.getSelCass().skill != Stats_Skills.classAr[SD.selClass][_loc2_].id)
                  {
                     this["abil_skill" + _loc2_].gotoAndStop(1);
                     this["abil_skill" + _loc2_].buttonMode = true;
                  }
                  else
                  {
                     this["abil_skill" + _loc2_].gotoAndStop(2);
                     this["abil_skill" + _loc2_].buttonMode = false;
                  }
                  this["abil_skill" + _loc2_].icon.gotoAndStop(Stats_Skills.classAr[SD.selClass][_loc2_].sprite);
                  _loc2_++;
               }
               this.setAbility("skill",SD.getSelCass().skill);
               _loc2_ = 0;
               while(_loc2_ < 5)
               {
                  if(SD.getSelCass().level >= Stats_Streaks.classAr[SD.selClass][_loc2_].lvlReq)
                  {
                     this["abil_streak" + _loc2_].lock.visible = false;
                  }
                  else
                  {
                     this["abil_streak" + _loc2_].lock.visible = true;
                     this["abil_streak" + _loc2_].lock.txt_level.text = "LVL " + Stats_Streaks.classAr[SD.selClass][_loc2_].lvlReq;
                  }
                  if(SD.getSelCass().streak != Stats_Streaks.classAr[SD.selClass][_loc2_].id)
                  {
                     this["abil_streak" + _loc2_].gotoAndStop(1);
                     this["abil_streak" + _loc2_].buttonMode = true;
                  }
                  else
                  {
                     this["abil_streak" + _loc2_].gotoAndStop(2);
                     this["abil_streak" + _loc2_].buttonMode = false;
                  }
                  this["abil_streak" + _loc2_].icon.gotoAndStop(Stats_Streaks.classAr[SD.selClass][_loc2_].sprite);
                  _loc2_++;
               }
               this.setAbility("streak",SD.getSelCass().streak);
               break;
            case 10:
               _loc2_ = 0;
               while(_loc2_ < 24)
               {
                  if(_loc2_ >= SD.getSelCass().gunInv.length)
                  {
                     this["inv_gun" + _loc2_].setItem(null,this);
                  }
                  else
                  {
                     this["inv_gun" + _loc2_].setItem(SD.getSelCass().gunInv[_loc2_],this);
                     if(SD.getSelCass().primary != SD.getSelCass().gunInv[_loc2_])
                     {
                        if(SD.getSelCass().secondary == SD.getSelCass().gunInv[_loc2_])
                        {
                           this["inv_gun" + _loc2_].equip(3);
                        }
                     }
                     else
                     {
                        this["inv_gun" + _loc2_].equip(2);
                     }
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < 12)
               {
                  if(_loc2_ >= SD.getSelCass().attachInv.length)
                  {
                     this["inv_attach" + _loc2_].setItem(null,this);
                  }
                  else
                  {
                     this["inv_attach" + _loc2_].setItem(SD.getSelCass().attachInv[_loc2_],this);
                     if(SD.getSelCass().primaryAttach == SD.getSelCass().attachInv[_loc2_])
                     {
                        this["inv_attach" + _loc2_].equip(2);
                     }
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < 6)
               {
                  if(_loc2_ >= SD.getSelCass().armorInv.length)
                  {
                     this["inv_armor" + _loc2_].setItem(null,this);
                  }
                  else
                  {
                     this["inv_armor" + _loc2_].setItem(SD.getSelCass().armorInv[_loc2_],this);
                     if(SD.getSelCass().armor == SD.getSelCass().armorInv[_loc2_])
                     {
                        this["inv_armor" + _loc2_].equip(2);
                     }
                  }
                  _loc2_++;
               }
               this.highlightAttachments(Stats_Guns.itemOb[SD.getSelCass().primary.id].type);
               if(!(SD.getSelCass().armor.level >= 10 && SD.getSelCass().primary.level >= 10 && SD.getSelCass().secondary.level >= 10 && SD.getSelCass().primaryAttach && SD.getSelCass().primaryAttach.level >= 10))
               {
                  break;
               }
               AGI.submitQuest("lvl_10_equipment");
               break;
            case 11:
               this.slotmachine.setup(param1);
               _loc2_ = 0;
               while(_loc2_ < 6)
               {
                  this["shop_gun" + _loc2_].setItem(Shop.classGunShops[SD.selClass][_loc2_],this,true);
                  this["shop_gun" + _loc2_].mc_sell.visible = false;
                  _loc2_++;
               }
               _loc2_ = 0;
               while(true)
               {
                  if(_loc2_ >= 6)
                  {
                     break loop22;
                  }
                  this["shop_other" + _loc2_].setItem(Shop.classOtherShops[SD.selClass][_loc2_],this,true);
                  this["shop_other" + _loc2_].mc_sell.visible = false;
                  _loc2_++;
               }
               break;
            case 12:
               this.tempAr = [this.rd_qualL,this.rd_qualM,this.rd_qualH,this.rd_partL,this.rd_partM,this.rd_partH,this.cb_light,this.cb_music,this.cb_sound,this.cb_voices,this.cb_shake,this.cb_bloody,this.rd_bloodL,this.rd_bloodM,this.rd_bloodH,this.rd_rightclick0,this.rd_rightclick1,this.rd_rightclick2];
               if(SD.graphQual == 0)
               {
                  this.rd_qualL.selected = true;
               }
               if(SD.graphQual == 1)
               {
                  this.rd_qualM.selected = true;
               }
               if(SD.graphQual == 2)
               {
                  this.rd_qualH.selected = true;
               }
               if(SD.graphPart == 0)
               {
                  this.rd_partL.selected = true;
               }
               if(SD.graphPart == 1)
               {
                  this.rd_partM.selected = true;
               }
               if(SD.graphPart == 2)
               {
                  this.rd_partH.selected = true;
               }
               this.cb_light.selected = SD.graphLights;
               this.cb_music.selected = SD.music;
               this.cb_sound.selected = SD.sound;
               this.cb_voices.selected = SD.voices;
               this.cb_shake.selected = SD.screenShake;
               this.cb_bloody.selected = SD.screenBlood;
               if(SD.blood == 0)
               {
                  this.rd_bloodL.selected = true;
               }
               if(SD.blood == 1)
               {
                  this.rd_bloodM.selected = true;
               }
               if(SD.blood == 2)
               {
                  this.rd_bloodH.selected = true;
               }
               this["rd_rightclick" + SD.rightclick].selected = true;
               break;
            case 13:
               _loc2_ = 0;
               while(true)
               {
                  if(_loc2_ >= Stats_Achievements.achOrder.length)
                  {
                     break loop22;
                  }
                  this["ach" + _loc2_].icon.gotoAndStop(Stats_Achievements.getAchievementNum(_loc2_).sprite);
                  this["ach" + _loc2_].txt_name.text = Stats_Achievements.getAchievementNum(_loc2_).name;
                  this["ach" + _loc2_].txt_desc.text = Stats_Achievements.getAchievementNum(_loc2_).desc;
                  if(!Stats_Achievements.getAchievementNum(_loc2_).unlock)
                  {
                     this["ach" + _loc2_].txt_unlock.text = "";
                  }
                  else
                  {
                     this["ach" + _loc2_].txt_unlock.text = "已解锁 " + Stats_Achievements.getAchievementNum(_loc2_).unlock + " 合约";
                  }
                  if(SD.achievements.indexOf(_loc2_) == -1)
                  {
                     this["ach" + _loc2_].gotoAndStop(2);
                     if(Stats_Achievements.getAchievementNum(_loc2_).unlock)
                     {
                        this["ach" + _loc2_].txt_desc.text = "加密奖章";
                     }
                     if(Stats_Achievements.getAchievementNum(_loc2_).progress)
                     {
                        trace(Stats_Achievements.achOrder[_loc2_],SD.achOb[Stats_Achievements.achOrder[_loc2_]]);
                        this["ach" + _loc2_].txt_unlock.text = UT.replaceString(Stats_Achievements.getAchievementNum(_loc2_).progress,"@",UT.addNumCommas(SD.achOb[Stats_Achievements.achOrder[_loc2_]]));
                     }
                  }
                  else
                  {
                     this["ach" + _loc2_].gotoAndStop(1);
                  }
                  _loc2_++;
               }
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:uint = 0;
         if(!this.buyMode)
         {
            if(this.inSoldierPage && this.curPage != "soldierFirst")
            {
               _loc1_ = false;
               _loc2_ = 0;
               while(_loc2_ < this.soldierPages.length)
               {
                  if(!this["page_icon" + _loc2_].hitTestPoint(mouseX,mouseY,false))
                  {
                     if(this.curPage != this.soldierPages[_loc2_])
                     {
                        this["page_icon" + _loc2_].alpha = 0.4;
                     }
                  }
                  else
                  {
                     this["page_icon" + _loc2_].alpha = 1;
                     this.txt_title.text = this.soldierPages[_loc2_].toUpperCase();
                     _loc1_ = true;
                  }
                  _loc2_++;
               }
               if(!_loc1_)
               {
                  this.txt_title.text = this.curPage.toUpperCase();
               }
               _loc2_ = 0;
               while(_loc2_ < 5)
               {
                  if(!this["class_icon" + _loc2_].hitTestPoint(mouseX,mouseY,false))
                  {
                     if(SD.selClass != _loc2_ + 1)
                     {
                        this["class_icon" + _loc2_].alpha = 0.4;
                     }
                  }
                  else
                  {
                     this["class_icon" + _loc2_].alpha = 1;
                  }
                  _loc2_++;
               }
            }
            var _loc3_:* = this.curPage;
            loop10:
            switch("saveslot" !== _loc3_ ? ("终端" !== _loc3_ ? ("特种作战演习" !== _loc3_ ? ("演习模式" === _loc3_ ? 3 : ("profile" !== _loc3_ ? ("abilities" === _loc3_ ? 5 : ("equipment" !== _loc3_ ? ("shop" === _loc3_ ? 7 : 8) : 6)) : 4)) : 2) : 1) : 0)
            {
               case 0:
                  if(!(Boolean(this.mc_login) && Boolean(this.mc_login.mc_image)))
                  {
                     break;
                  }
                  this.mc_login.mc_image.width = this.mc_login.mc_image.height = 40;
                  break;
               case 1:
               case 2:
                  this.moveSideBoxes();
                  break;
               case 3:
                  this.moveSideBoxes();
                  _loc2_ = 0;
                  while(true)
                  {
                     if(_loc2_ >= 7)
                     {
                        break loop10;
                     }
                     this.left["type" + _loc2_].alpha = !(Stats_Misc.gameModes[_loc2_] == MatchSettings.qmMode || Boolean(this.left["type" + _loc2_].hitTestPoint(mouseX,mouseY,false))) ? 0.5 : 1;
                     _loc2_++;
                  }
                  break;
               case 4:
                  SD.name = this.txt_name.text;
                  this.tempOb.hp += (Number(this.curClassOb.hp.cur) - Number(this.tempOb.hp)) * 0.3;
                  this.tempOb.crit += (Number(this.curClassOb.crit.cur) - Number(this.tempOb.crit)) * 0.3;
                  this.tempOb.aim += (Number(this.curClassOb.aim.cur) - Number(this.tempOb.aim)) * 0.3;
                  this.tempOb.ammo += (Number(this.curClassOb.ammo.cur) - Number(this.tempOb.ammo)) * 0.3;
                  this.txt_prof_stats.text = Math.ceil(this.tempOb.hp) + "\n" + Math.ceil(this.tempOb.crit) + "%\n" + Math.ceil(this.tempOb.aim) + "%\n" + Math.ceil(this.tempOb.ammo) + "%";
                  this.bar_hp.width += (Number(this.curClassOb.hp.cur) / 300 * 210 - this.bar_hp.width) * 0.3;
                  this.bar_crit.width += (Number(this.curClassOb.crit.cur) / 50 * 210 - this.bar_crit.width) * 0.3;
                  this.bar_aim.width += (Number(this.curClassOb.aim.cur) / 130 * 210 - this.bar_aim.width) * 0.3;
                  this.bar_ammo.width += (Number(this.curClassOb.ammo.cur) / 300 * 210 - this.bar_ammo.width) * 0.3;
                  this.bar_hp2.width += (Number(this.curClassOb.hp.max) / 300 * 210 - this.bar_hp2.width) * 0.3;
                  this.bar_crit2.width += (Number(this.curClassOb.crit.max) / 50 * 210 - this.bar_crit2.width) * 0.3;
                  this.bar_aim2.width += (Number(this.curClassOb.aim.max) / 130 * 210 - this.bar_aim2.width) * 0.3;
                  this.bar_ammo2.width += (Number(this.curClassOb.ammo.max) / 300 * 210 - this.bar_ammo2.width) * 0.3;
                  break;
               case 5:
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < 5)
                  {
                     if(this.ht(this["abil_skill" + _loc2_]))
                     {
                        _loc1_ = true;
                        this.setAbility("skill",Stats_Skills.classAr[SD.selClass][_loc2_].id);
                     }
                     _loc2_++;
                  }
                  if(!_loc1_)
                  {
                     this.setAbility("skill",SD.getSelCass().skill);
                  }
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < 5)
                  {
                     if(this.ht(this["abil_streak" + _loc2_]))
                     {
                        _loc1_ = true;
                        this.setAbility("streak",Stats_Streaks.classAr[SD.selClass][_loc2_].id);
                     }
                     _loc2_++;
                  }
                  if(!_loc1_)
                  {
                     this.setAbility("streak",SD.getSelCass().streak);
                     break;
                  }
                  break;
               case 6:
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < SD.getSelCass().gunInv.length)
                  {
                     if(!this.ht(this["inv_gun" + _loc2_],true))
                     {
                        this["inv_gun" + _loc2_].mc_sell.visible = false;
                     }
                     else
                     {
                        _loc1_ = true;
                        if(this.tempOther != SD.getSelCass().gunInv[_loc2_])
                        {
                           this.tempOther = SD.getSelCass().gunInv[_loc2_];
                           this["inv_gun" + _loc2_].showInfo();
                        }
                        if(SD.getSelCass().primary != SD.getSelCass().gunInv[_loc2_] && SD.getSelCass().secondary != SD.getSelCass().gunInv[_loc2_])
                        {
                           this["inv_gun" + _loc2_].mc_sell.visible = true;
                           this["inv_gun" + _loc2_].mc_sell.alpha = !this.htRaw(this["inv_gun" + _loc2_].mc_sell) ? 0.5 : 1;
                        }
                     }
                     _loc2_++;
                  }
                  this.gun_info.visible = _loc1_;
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < SD.getSelCass().attachInv.length)
                  {
                     if(!this.ht(this["inv_attach" + _loc2_],true))
                     {
                        this["inv_attach" + _loc2_].mc_sell.visible = false;
                     }
                     else
                     {
                        _loc1_ = true;
                        if(this.tempOther != SD.getSelCass().attachInv[_loc2_])
                        {
                           this.tempOther = SD.getSelCass().attachInv[_loc2_];
                           this["inv_attach" + _loc2_].showInfo();
                        }
                        if(SD.getSelCass().primaryAttach != SD.getSelCass().attachInv[_loc2_])
                        {
                           this["inv_attach" + _loc2_].mc_sell.visible = true;
                           this["inv_attach" + _loc2_].mc_sell.alpha = !this.htRaw(this["inv_attach" + _loc2_].mc_sell) ? 0.5 : 1;
                        }
                     }
                     _loc2_++;
                  }
                  _loc2_ = 0;
                  while(_loc2_ < SD.getSelCass().armorInv.length)
                  {
                     if(!this.ht(this["inv_armor" + _loc2_],true))
                     {
                        this["inv_armor" + _loc2_].mc_sell.visible = false;
                     }
                     else
                     {
                        _loc1_ = true;
                        if(this.tempOther != SD.getSelCass().armorInv[_loc2_])
                        {
                           this.tempOther = SD.getSelCass().armorInv[_loc2_];
                           this["inv_armor" + _loc2_].showInfo();
                        }
                        if(SD.getSelCass().armor != SD.getSelCass().armorInv[_loc2_])
                        {
                           this["inv_armor" + _loc2_].mc_sell.visible = true;
                           this["inv_armor" + _loc2_].mc_sell.alpha = !this.htRaw(this["inv_armor" + _loc2_].mc_sell) ? 0.5 : 1;
                        }
                     }
                     _loc2_++;
                  }
                  this.misc_info.visible = _loc1_;
                  break;
               case 7:
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < 6)
                  {
                     if(this.ht(this["shop_gun" + _loc2_]))
                     {
                        _loc1_ = true;
                        if(this.tempOther != Shop.classGunShops[SD.selClass][_loc2_])
                        {
                           this.tempOther = Shop.classGunShops[SD.selClass][_loc2_];
                           this["shop_gun" + _loc2_].showInfo();
                        }
                     }
                     _loc2_++;
                  }
                  if(this.ht(this.slot_gun))
                  {
                     _loc1_ = true;
                     if(this.tempOther != this.slot_gun.inv)
                     {
                        this.tempOther = this.slot_gun.inv;
                        this.slot_gun.showInfo();
                     }
                  }
                  this.gun_info.visible = _loc1_;
                  _loc1_ = false;
                  _loc2_ = 0;
                  while(_loc2_ < 6)
                  {
                     if(this.ht(this["shop_other" + _loc2_]))
                     {
                        _loc1_ = true;
                        if(this.tempOther != Shop.classOtherShops[SD.selClass][_loc2_])
                        {
                           this.tempOther = Shop.classOtherShops[SD.selClass][_loc2_];
                           this["shop_other" + _loc2_].showInfo();
                        }
                     }
                     _loc2_++;
                  }
                  if(this.ht(this.slot_other))
                  {
                     _loc1_ = true;
                     if(this.tempOther != this.slot_other.inv)
                     {
                        this.tempOther = this.slot_other.inv;
                        this.slot_other.showInfo();
                     }
                  }
                  this.misc_info.visible = _loc1_;
            }
            return;
         }
         if(this.slotmachine)
         {
            this.slotmachine.EnterFrame();
         }
         this.sellwindow.EnterFrame();
      }
      
      public function MouseDown() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Inventory_Gun = null;
         var _loc3_:Inventory_Attachment = null;
         var _loc4_:Inventory_Armor = null;
         if(!this.buyMode)
         {
            if(this.inSoldierPage && this.curPage != "soldierFirst")
            {
               _loc1_ = 0;
               while(_loc1_ < this.soldierPages.length)
               {
                  if(Boolean(this["page_icon" + _loc1_].buttonMode) && Boolean(this["page_icon" + _loc1_].hitTestPoint(mouseX,mouseY,false)))
                  {
                     this.ClickButton(this.soldierPages[_loc1_]);
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < 5)
               {
                  if(Boolean(this["class_icon" + _loc1_].buttonMode) && Boolean(this["class_icon" + _loc1_].hitTestPoint(mouseX,mouseY,false)))
                  {
                     SD.selClass = _loc1_ + 1;
                     this.playClassSound();
                     this.flash.gotoAndPlay("soldierflash");
                     this.Init(true);
                  }
                  _loc1_++;
               }
            }
            var _loc5_:* = this.curPage;
            loop16:
            switch("main" !== _loc5_ ? ("saveslot" !== _loc5_ ? ("saveslot2" !== _loc5_ ? ("终端" === _loc5_ ? 3 : ("特种作战演习" !== _loc5_ ? ("演习模式" === _loc5_ ? 5 : ("appearance" !== _loc5_ ? ("abilities" === _loc5_ ? 7 : ("equipment" !== _loc5_ ? ("shop" !== _loc5_ ? ("设置" === _loc5_ ? 10 : 11) : 9) : 8)) : 6)) : 4)) : 2) : 1) : 0)
            {
               case 0:
                  if(this.htRaw(this.bt_version))
                  {
                     this.ClickButton("version");
                  }
                  if(!this.htRaw(this.newsbox))
                  {
                     break;
                  }
                  SD.urlNews();
                  break;
               case 1:
                  if(!AGI.isVisible())
                  {
                     if(this.htRaw(this.mc_login.bt_login))
                     {
                        AGI.showLogin();
                     }
                  }
                  break;
               case 2:
                  _loc1_ = 1;
                  while(true)
                  {
                     if(_loc1_ > 4)
                     {
                        break loop16;
                     }
                     if(!this.htRaw(this["save" + _loc1_].bt_yes))
                     {
                        if(!this.htRaw(this["save" + _loc1_].bt_no))
                        {
                           if(!this.htRaw(this["save" + _loc1_].mc_export))
                           {
                              if(!this.htRaw(this["save" + _loc1_].mc_import))
                              {
                                 if(!this.htRaw(this["save" + _loc1_].mc_delete))
                                 {
                                    if(this.ht(this["save" + _loc1_],true))
                                    {
                                       if(!resetShops)
                                       {
                                          resetShops = true;
                                          Shop.resetShops();
                                       }
                                       SH.playSound(S_Equip);
                                       SD.getSaveSlot(_loc1_);
                                       SD.loadGame();
                                       this.ClickButton("main");
                                    }
                                 }
                                 else
                                 {
                                    SH.playSound(S_Click);
                                    this["save" + _loc1_].gotoAndStop(2);
                                 }
                              }
                              else
                              {
                                 SH.playSound(S_Click);
                                 SD.importSave(_loc1_,this);
                              }
                           }
                           else
                           {
                              SD.exportSave(_loc1_);
                           }
                        }
                        else
                        {
                           SH.playSound(S_Click);
                           this.Init();
                        }
                     }
                     else
                     {
                        SH.playSound(S_rocketExplode);
                        SD.setSaveLocation(_loc1_);
                        SD.eraseGame();
                        this.Init();
                     }
                     _loc1_++;
                  }
                  break;
               case 3:
               case 4:
                  _loc1_ = 0;
                  while(_loc1_ < 15)
                  {
                     if(Boolean(this.right["mission" + _loc1_].buttonMode) && Boolean(this.right["mission" + _loc1_].hitTestPoint(mouseX,mouseY,false)))
                     {
                        this.selMission = _loc1_;
                        SH.playSound(S_Click);
                        this.Init();
                     }
                     _loc1_++;
                  }
                  if(this.htRaw(this.left.mc_diff.bt_up))
                  {
                     ++MatchSettings.caDiffMode;
                     if(MatchSettings.caDiffMode > 2)
                     {
                        MatchSettings.caDiffMode = 0;
                     }
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(!this.htRaw(this.left.mc_diff.bt_down))
                  {
                     break;
                  }
                  --MatchSettings.caDiffMode;
                  if(MatchSettings.caDiffMode < 0)
                  {
                     MatchSettings.caDiffMode = 2;
                  }
                  this.Init();
                  SH.playSound(S_Click);
                  break;
               case 5:
                  _loc1_ = 0;
                  while(_loc1_ < 7)
                  {
                     if(this.htRaw(this.left["type" + _loc1_]))
                     {
                        MatchSettings.qmMode = Stats_Misc.gameModes[_loc1_];
                        MatchSettings.qmScore = Stats_Misc.getGameMode(MatchSettings.qmMode).startscore;
                        SH.playSound(S_Click);
                        this.Init();
                     }
                     _loc1_++;
                  }
                  if(this.htRaw(this.left.mc_map.bt_prev))
                  {
                     MatchSettings.qmMap = UT.getNextEl(MatchSettings.qmMap,false,Stats_Maps.mapOrder);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_map.bt_next))
                  {
                     MatchSettings.qmMap = UT.getNextEl(MatchSettings.qmMap,true,Stats_Maps.mapOrder);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_score.bt_up))
                  {
                     MatchSettings.qmScore = UT.getNextEl(MatchSettings.qmScore,true,Stats_Misc.getGameMode(MatchSettings.qmMode).scorelist);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_score.bt_down))
                  {
                     MatchSettings.qmScore = UT.getNextEl(MatchSettings.qmScore,false,Stats_Misc.getGameMode(MatchSettings.qmMode).scorelist);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_soldiers.bt_up))
                  {
                     MatchSettings.qmClassOnly = UT.loopAround(MatchSettings.qmClassOnly + 1,0,5);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_soldiers.bt_down))
                  {
                     MatchSettings.qmClassOnly = UT.loopAround(MatchSettings.qmClassOnly - 1,0,5);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_skills.bt_up) || this.htRaw(this.left.mc_skills.bt_down))
                  {
                     MatchSettings.qmSkills = !MatchSettings.qmSkills;
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_streaks.bt_up) || this.htRaw(this.left.mc_streaks.bt_down))
                  {
                     MatchSettings.qmStreaks = !MatchSettings.qmStreaks;
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_armor.bt_up) || this.htRaw(this.left.mc_armor.bt_down))
                  {
                     MatchSettings.qmArmor = !MatchSettings.qmArmor;
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_mods.bt_up))
                  {
                     MatchSettings.qmMod = UT.getNextEl(MatchSettings.qmMod,true,Stats_Misc.mods);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_mods.bt_down))
                  {
                     MatchSettings.qmMod = UT.getNextEl(MatchSettings.qmMod,false,Stats_Misc.mods);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_diff.bt_up))
                  {
                     MatchSettings.qmDiff += 2;
                     if(MatchSettings.qmDiff > 15)
                     {
                        MatchSettings.qmDiff = 1;
                     }
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(this.htRaw(this.left.mc_diff.bt_down))
                  {
                     MatchSettings.qmDiff -= 2;
                     if(MatchSettings.qmDiff < 0)
                     {
                        MatchSettings.qmDiff = 15;
                     }
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(Boolean(this.right.mc_players0) && this.htRaw(this.right.mc_players0.bt_up))
                  {
                     MatchSettings.addBot(0);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(Boolean(this.right.mc_players0) && this.htRaw(this.right.mc_players0.bt_down))
                  {
                     MatchSettings.removeBot(0);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(Boolean(this.right.mc_players1) && this.htRaw(this.right.mc_players1.bt_up))
                  {
                     MatchSettings.addBot(1);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(Boolean(this.right.mc_players1) && this.htRaw(this.right.mc_players1.bt_down))
                  {
                     MatchSettings.removeBot(1);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(Boolean(this.right.mc_players2) && this.htRaw(this.right.mc_players2.bt_up))
                  {
                     MatchSettings.addBot(2);
                     this.Init();
                     SH.playSound(S_Click);
                  }
                  if(!(Boolean(this.right.mc_players2) && this.htRaw(this.right.mc_players2.bt_down)))
                  {
                     break;
                  }
                  MatchSettings.removeBot(2);
                  this.Init();
                  SH.playSound(S_Click);
                  break;
               case 6:
                  _loc1_ = 0;
                  while(_loc1_ < 4)
                  {
                     if(!this["app_head" + _loc1_].lock.visible && this.ht(this["app_head" + _loc1_]))
                     {
                        SD.getSelCass().head = _loc1_ + 1;
                        this.Init();
                        SH.playSound(S_Equip);
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(_loc1_ < 3)
                  {
                     if(!this["app_body" + _loc1_].lock.visible && this.ht(this["app_body" + _loc1_]))
                     {
                        SD.getSelCass().body = _loc1_ + 1;
                        this.Init();
                        SH.playSound(S_Equip);
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= 20)
                     {
                        break loop16;
                     }
                     if(!this["app_camo" + _loc1_].lock.visible && this.ht(this["app_camo" + _loc1_]))
                     {
                        SD.getSelCass().camo = _loc1_ + 1;
                        this.Init();
                        SH.playSound(S_Equip);
                     }
                     _loc1_++;
                  }
                  break;
               case 7:
                  _loc1_ = 0;
                  while(_loc1_ < 5)
                  {
                     if(!this["abil_skill" + _loc1_].lock.visible && this.ht(this["abil_skill" + _loc1_]))
                     {
                        SD.getSelCass().skill = Stats_Skills.classAr[SD.selClass][_loc1_].id;
                        this.Init();
                        SH.playSound(S_Equip);
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= 5)
                     {
                        break loop16;
                     }
                     if(!this["abil_streak" + _loc1_].lock.visible && this.ht(this["abil_streak" + _loc1_]))
                     {
                        SD.getSelCass().streak = Stats_Streaks.classAr[SD.selClass][_loc1_].id;
                        this.Init();
                        SH.playSound(S_Equip);
                     }
                     _loc1_++;
                  }
                  break;
               case 8:
                  _loc1_ = 0;
                  while(_loc1_ < SD.getSelCass().gunInv.length)
                  {
                     if(!(Boolean(this["inv_gun" + _loc1_].buttonMode) && Boolean(this["inv_gun" + _loc1_].mc_sell.hitTestPoint(mouseX,mouseY,false))))
                     {
                        if(this.ht(this["inv_gun" + _loc1_]) && !this["inv_gun" + _loc1_].lowLevel)
                        {
                           _loc2_ = SD.getSelCass().gunInv[_loc1_];
                           if(Stats_Guns.itemOb[_loc2_.id].type != 0)
                           {
                              SD.getSelCass().primary = _loc2_;
                              SD.getSelCass().primaryAttach = null;
                           }
                           else
                           {
                              SD.getSelCass().secondary = _loc2_;
                           }
                           this.Init();
                           SH.playSound(S_Equip);
                        }
                     }
                     else
                     {
                        this.sellwindow.setWindow(SD.getSelCass().gunInv[_loc1_],"sell");
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(_loc1_ < SD.getSelCass().attachInv.length)
                  {
                     if(!(Boolean(this["inv_attach" + _loc1_].mc_sell.visible) && Boolean(this["inv_attach" + _loc1_].mc_sell.hitTestPoint(mouseX,mouseY,false))))
                     {
                        if(this.ht(this["inv_attach" + _loc1_]) && !this["inv_attach" + _loc1_].lowLevel)
                        {
                           _loc3_ = SD.getSelCass().attachInv[_loc1_];
                           if(SD.getSelCass().primaryAttach != _loc3_)
                           {
                              SD.getSelCass().primaryAttach = _loc3_;
                           }
                           else
                           {
                              SD.getSelCass().primaryAttach = null;
                           }
                           this.Init();
                           SH.playSound(S_Equip);
                        }
                     }
                     else
                     {
                        this.sellwindow.setWindow(SD.getSelCass().attachInv[_loc1_],"sell");
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= SD.getSelCass().armorInv.length)
                     {
                        break loop16;
                     }
                     if(!(Boolean(this["inv_armor" + _loc1_].buttonMode) && Boolean(this["inv_armor" + _loc1_].mc_sell.hitTestPoint(mouseX,mouseY,false))))
                     {
                        if(this.ht(this["inv_armor" + _loc1_]) && !this["inv_armor" + _loc1_].lowLevel)
                        {
                           _loc4_ = SD.getSelCass().armorInv[_loc1_];
                           SD.getSelCass().armor = _loc4_;
                           this.Init();
                           SH.playSound(S_Equip);
                        }
                     }
                     else
                     {
                        this.sellwindow.setWindow(SD.getSelCass().armorInv[_loc1_],"sell");
                     }
                     _loc1_++;
                  }
                  break;
               case 9:
                  this.slotmachine.MouseDown();
                  _loc1_ = 0;
                  while(_loc1_ < 6)
                  {
                     if(this.ht(this["shop_gun" + _loc1_]))
                     {
                        this.sellwindow.setWindow(Shop.classGunShops[SD.selClass][_loc1_],"buy");
                     }
                     _loc1_++;
                  }
                  if(this.ht(this.slot_gun))
                  {
                     this.sellwindow.setWindow(this.slot_gun.inv,"takeslot");
                  }
                  _loc1_ = 0;
                  while(_loc1_ < 6)
                  {
                     if(this.ht(this["shop_other" + _loc1_]))
                     {
                        this.sellwindow.setWindow(Shop.classOtherShops[SD.selClass][_loc1_],"buy");
                     }
                     _loc1_++;
                  }
                  if(this.ht(this.slot_other))
                  {
                     if(!this.slot_other.shit)
                     {
                        this.sellwindow.setWindow(this.slot_other.inv,"takeslot");
                        break;
                     }
                     this.sellwindow.setWindow(this.slot_other.inv,"sellslot");
                     break;
                  }
                  break;
               case 10:
                  _loc1_ = 0;
                  while(true)
                  {
                     if(_loc1_ >= this.tempAr.length)
                     {
                        break loop16;
                     }
                     if(!this.tempAr[_loc1_].hitTestPoint(mouseX,mouseY,false))
                     {
                        continue;
                     }
                     SH.playSound(S_Click);
                     if(this.tempAr[_loc1_].name.charAt(0) != "r")
                     {
                        this.tempAr[_loc1_].enabled = false;
                        this.tempAr[_loc1_].selected = !this.tempAr[_loc1_].selected;
                     }
                     else
                     {
                        this.tempAr[_loc1_].selected = true;
                     }
                     _loc5_ = this.tempAr[_loc1_].name;
                     switch("rd_qualL" !== _loc5_ ? ("rd_qualM" !== _loc5_ ? ("rd_qualH" === _loc5_ ? 2 : ("rd_partL" !== _loc5_ ? ("rd_partM" !== _loc5_ ? ("rd_partH" === _loc5_ ? 5 : ("cb_light" !== _loc5_ ? ("cb_music" !== _loc5_ ? ("cb_sound" === _loc5_ ? 8 : ("cb_voices" !== _loc5_ ? ("cb_shake" !== _loc5_ ? ("cb_bloody" === _loc5_ ? 11 : ("rd_bloodL" !== _loc5_ ? ("rd_bloodM" === _loc5_ ? 13 : ("rd_bloodH" !== _loc5_ ? ("rd_rightclick0" !== _loc5_ ? ("rd_rightclick1" === _loc5_ ? 16 : ("rd_rightclick2" !== _loc5_ ? 18 : 17)) : 15) : 14)) : 12)) : 10) : 9)) : 7) : 6)) : 4) : 3)) : 1) : 0)
                     {
                        case 0:
                           SD.graphQual = 0;
                           Main.STAGE.quality = "medium";
                           break;
                        case 1:
                           SD.graphQual = 1;
                           Main.STAGE.quality = "medium";
                           break;
                        case 2:
                           SD.graphQual = 2;
                           Main.STAGE.quality = "high";
                           break;
                        case 3:
                           SD.graphPart = 0;
                           break;
                        case 4:
                           SD.graphPart = 1;
                           break;
                        case 5:
                           SD.graphPart = 2;
                           break;
                        case 6:
                           SD.graphLights = this.cb_light.selected;
                           break;
                        case 7:
                           SD.music = this.cb_music.selected;
                           break;
                        case 8:
                           SD.sound = this.cb_sound.selected;
                           break;
                        case 9:
                           SD.voices = this.cb_voices.selected;
                           break;
                        case 10:
                           SD.screenShake = this.cb_shake.selected;
                           break;
                        case 11:
                           SD.screenBlood = this.cb_bloody.selected;
                           break;
                        case 12:
                           SD.blood = 0;
                           break;
                        case 13:
                           SD.blood = 1;
                           break;
                        case 14:
                           SD.blood = 2;
                           break;
                        case 15:
                           SD.rightclick = 0;
                           break;
                        case 16:
                           SD.rightclick = 1;
                           break;
                        case 17:
                           SD.rightclick = 2;
                           break;
                     }
                  }
            }
            return;
         }
         this.sellwindow.MouseDown();
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
      
      public function MouseWheel(param1:MouseEvent) : void
      {
         var _loc2_:Number = 0;
         while(_loc2_ < 24)
         {
            this["inv_gun" + _loc2_].y += param1.delta <= 0 ? 10 : -10;
            if(this["inv_gun" + _loc2_].y < -50)
            {
               break;
            }
            _loc2_++;
         }
      }
      
      private function setSideBoxes(param1:Boolean) : void
      {
         if(param1)
         {
            this.leftMove.x = 56;
            this.leftMove.y = 60;
            this.rightMove.x = 454;
            this.rightMove.y = 75;
            return;
         }
      }
      
      private function moveSideBoxes() : void
      {
         this.leftMove.min += 1;
         this.leftMove.max += 0.5;
         this.rightMove.min += 1;
         this.rightMove.max += 0.5;
         this.left.x = this.leftMove.x + UT.xMoveToRot(this.leftMove.min,5);
         this.left.y = this.leftMove.y + UT.yMoveToRot(this.leftMove.max,2.5);
         this.right.x = this.rightMove.x + UT.xMoveToRot(this.rightMove.min,5);
         this.right.y = this.rightMove.y + UT.yMoveToRot(this.rightMove.max,2.5);
      }
      
      private function highlightAttachments(param1:*) : void
      {
         var _loc2_:uint = 0;
         if(param1 != -1)
         {
            _loc2_ = 0;
            while(_loc2_ < 12)
            {
               if(_loc2_ >= SD.getSelCass().attachInv.length)
               {
                  this["inv_attach" + _loc2_].alpha = 1;
               }
               else if(Stats_Attachments.itemOb[SD.getSelCass().attachInv[_loc2_].id].type != param1)
               {
                  this["inv_attach" + _loc2_].alpha = 0.4;
                  this["inv_attach" + _loc2_].buttonMode = false;
               }
               else
               {
                  this["inv_attach" + _loc2_].alpha = 1;
                  this["inv_attach" + _loc2_].buttonMode = true;
               }
               _loc2_++;
            }
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < 12)
         {
            this["inv_attach" + _loc2_].alpha = 1;
            _loc2_++;
         }
      }
      
      public function getCost(param1:*, param2:Boolean = false) : uint
      {
         return int(Number(param1.cost) * (!param2 ? 0.3 : 1));
      }
      
      public function setCompareArrow(param1:MovieClip, param2:Number, param3:Number, param4:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         if(param4)
         {
            _loc5_ = param2;
            param2 = param3;
            param3 = _loc5_;
         }
         if(param2 <= param3)
         {
            if(param2 < param3)
            {
               param1.gotoAndStop(2);
            }
            else
            {
               param1.gotoAndStop(3);
            }
         }
         else
         {
            param1.gotoAndStop(1);
         }
      }
      
      public function MouseUp() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = this.curPage;
         loop1:
         switch("设置" !== _loc2_ ? 1 : 0)
         {
            case 0:
               _loc1_ = 0;
               while(true)
               {
                  if(_loc1_ >= this.tempAr.length)
                  {
                     break loop1;
                  }
                  this.tempAr[_loc1_].enabled = true;
                  _loc1_++;
               }
         }
      }
      
      public function RightMouseDown() : void
      {
      }
      
      public function RightMouseUp() : void
      {
      }
      
      public function KeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function ClickButton(param1:String, param2:Boolean = true) : void
      {
         if(this.inSoldierPage || this.curPage == "menu")
         {
            SD.saveGame();
         }
         if(param2)
         {
            SH.playSound(S_ClickGo);
         }
         var _loc3_:* = param1;
         switch("管理干员" !== _loc3_ ? ("特种作战演习" === _loc3_ ? 1 : ("演习模式" !== _loc3_ ? ("进入新手教程" === _loc3_ ? 3 : ("进入终端" !== _loc3_ ? ("继续演习模式" === _loc3_ ? 5 : ("继续特种作战演习" !== _loc3_ ? ("我们开始吧！" === _loc3_ ? 7 : 8) : 6)) : 4)) : 2)) : 0)
         {
            case 0:
               this.sideBoxReturn = this.curPage;
               if(!SD.soldierFirst)
               {
                  param1 = SD.lastSoldierScreen;
                  break;
               }
               param1 = "soldierFirst";
               SD.soldierFirst = false;
               break;
            case 1:
               if(SD.completeCamp.length <= 1 && SD.warnChallenges)
               {
                  SD.warnChallenges = false;
                  param1 = "warnChal";
                  break;
               }
               break;
            case 2:
               if(!(SD.completeCamp.length <= 1 && SD.warnCustom))
               {
                  break;
               }
               SD.warnCustom = false;
               param1 = "warnCustom";
               break;
            case 3:
            case 4:
               param1 = "终端";
               break;
            case 5:
               param1 = "演习模式";
               break;
            case 6:
               param1 = "特种作战演习";
               break;
            case 7:
               param1 = "profile";
         }
         _loc3_ = param1;
         switch("soldierFirst" !== _loc3_ ? ("profile" !== _loc3_ ? ("appearance" === _loc3_ ? 2 : ("equipment" !== _loc3_ ? ("abilities" !== _loc3_ ? ("inventory" !== _loc3_ ? ("shop" === _loc3_ ? 6 : ("开始游戏" !== _loc3_ ? ("play strike force heroes 1" === _loc3_ ? 8 : ("unlock levels" !== _loc3_ ? ("max soldiers" === _loc3_ ? 10 : ("max money" !== _loc3_ ? ("delete save" !== _loc3_ ? ("firstsaveslot" === _loc3_ ? 13 : ("存档选择" !== _loc3_ ? ("下一版本" === _loc3_ ? 15 : ("上一版本" !== _loc3_ ? 17 : 16)) : 14)) : 12) : 11)) : 9)) : 7)) : 5) : 4) : 3)) : 1) : 0)
         {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
               this.curPage = param1;
               SD.lastSoldierScreen = param1;
               if(!this.inSoldierPage)
               {
                  this.flash.gotoAndPlay("flash");
               }
               else
               {
                  this.flash.gotoAndPlay("soldierflash");
               }
               this.inSoldierPage = true;
               this.goto(this.curPage);
               break;
            case 7:
               SD.lastMenuScreen = this.curPage;
               if(this.curPage != "终端")
               {
                  if(this.curPage != "特种作战演习")
                  {
                     if(this.curPage == "演习模式")
                     {
                        trace("Preparing custom game");
                        MatchSettings.startQuickmatch();
                     }
                  }
                  else
                  {
                     trace("Preparing challenges");
                     Stats_Campaign.setMatch(this.selMission);
                     MatchSettings.startCampaign();
                  }
               }
               else
               {
                  trace("Preparing campaign");
                  Stats_Campaign.setMatch(this.selMission);
                  MatchSettings.startCampaign();
               }
               if(!MatchSettings.preCutFrames)
               {
                  this.main.startClass(Game);
                  break;
               }
               trace("Preparing cutscenes");
               this.main.startClass(Cutscene,{"type":"pre"});
               break;
            case 8:
               SD.playSFH1();
               break;
            case 9:
               if(Main.DEBUGMODE)
               {
                  SD.completeCamp = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                  SD.completeChal = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                  SD.achievements = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
                  this.flash.gotoAndPlay("flash");
                  break;
               }
               break;
            case 10:
               if(Main.DEBUGMODE)
               {
                  SD.classSaves[1].level = SD.classSaves[2].level = SD.classSaves[3].level = SD.classSaves[4].level = SD.classSaves[5].level = 50;
                  SD.classSaves[1].unlockCamo = SD.classSaves[2].unlockCamo = SD.classSaves[3].unlockCamo = SD.classSaves[4].unlockCamo = SD.classSaves[5].unlockCamo = 20;
                  Shop.resetShops();
                  this.flash.gotoAndPlay("flash");
                  break;
               }
               break;
            case 11:
               if(Main.DEBUGMODE)
               {
                  SD.classSaves[1].funds = SD.classSaves[2].funds = SD.classSaves[3].funds = SD.classSaves[4].funds = SD.classSaves[5].funds = 99999999;
                  this.flash.gotoAndPlay("flash");
                  break;
               }
               break;
            case 12:
               if(Main.DEBUGMODE)
               {
                  SD.eraseGame();
                  SD.Init();
                  SD.saveGame();
                  this.flash.gotoAndPlay("flash");
                  break;
               }
               break;
            case 13:
            case 14:
               this.curPage = param1 = "saveslot" + (Main.SPONSORSITE && Main.ARMORFIRST ? "" : "2");
               this.sideBoxReturn = "main";
               this.inSoldierPage = false;
               this.goto(this.curPage,false);
               break;
            case 15:
               this.mc_version.prevFrame();
               this.Init();
               break;
            case 16:
               this.mc_version.nextFrame();
               this.Init();
               break;
            default:
               this.curPage = param1;
               this.sideBoxReturn = "main";
               this.inSoldierPage = false;
               this.flash.gotoAndPlay("flash");
               this.goto(this.curPage);
         }
         trace("NextPage:",this.curPage);
      }
      
      private function setAbility(param1:String, param2:String) : void
      {
         if(param1 == "skill")
         {
            this.txt_abil_skillname.text = Stats_Skills.itemOb[param2].name;
            if(!Stats_Skills.itemOb[param2].desc)
            {
               this.txt_abil_skilldesc.text = "技能未选择";
            }
            else
            {
               this.txt_abil_skilldesc.text = Stats_Skills.itemOb[param2].desc + "\n\n" + "· " + Stats_Skills.itemOb[param2].special;
            }
         }
         if(param1 == "streak")
         {
            this.txt_abil_streakname.text = Stats_Streaks.itemOb[param2].name;
            this.txt_abil_streakdesc.text = Stats_Streaks.itemOb[param2].desc;
            if(!Stats_Streaks.itemOb[param2].kills)
            {
               this.txt_abil_kills.text = "";
            }
            else
            {
               this.txt_abil_kills.text = "需要 " + Stats_Streaks.itemOb[param2].kills + " 点充能数，按下 E 或 Ctrl 键使用";
            }
         }
      }
      
      private function goto(param1:String, param2:Boolean = true) : void
      {
         gotoAndStop(param1);
         this.curPage = param1;
         this.Init(param2);
      }
      
      private function playClassSound() : void
      {
         var _loc1_:* = SD.selClass;
         switch(1 !== _loc1_ ? (2 === _loc1_ ? 1 : (3 !== _loc1_ ? (4 === _loc1_ ? 3 : (5 !== _loc1_ ? 5 : 4)) : 2)) : 0)
         {
            case 0:
               SH.playVoice(UT.randEl([C_1_1,C_1_2]));
               break;
            case 1:
               SH.playVoice(UT.randEl([C_2_1,C_2_2]));
               break;
            case 2:
               SH.playVoice(UT.randEl([C_3_1,C_3_2]));
               break;
            case 3:
               SH.playVoice(UT.randEl([C_4_1,C_4_2]));
               break;
            case 4:
               SH.playVoice(UT.randEl([C_5_1,C_5_2]));
         }
      }
      
      public function ht(param1:*, param2:Boolean = false) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param1)
         {
            if((param2 || param1.buttonMode) && Boolean(param1.hitbox.hitTestPoint(mouseX,mouseY,false)))
            {
               _loc3_ = true;
            }
            return _loc3_;
         }
         return false;
      }
      
      private function htRaw(param1:*) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1)
         {
            if(param1.hitTestPoint(mouseX,mouseY,false))
            {
               _loc2_ = true;
            }
            return _loc2_;
         }
         return false;
      }
      
      function __setProp_rd_qualL_(param1:int) : *
      {
         if(this.rd_qualL != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_qualL] == undefined || !(int(this.__setPropDict[this.rd_qualL]) >= 40 && int(this.__setPropDict[this.rd_qualL]) <= 44)))
         {
            this.__setPropDict[this.rd_qualL] = param1;
            try
            {
               this.rd_qualL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualL.enabled = true;
            this.rd_qualL.groupName = "qualGroup";
            this.rd_qualL.label = "";
            this.rd_qualL.labelPlacement = "left";
            this.rd_qualL.selected = false;
            this.rd_qualL.value = "";
            this.rd_qualL.visible = true;
            try
            {
               this.rd_qualL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_qualH_(param1:int) : *
      {
         if(this.rd_qualH != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_qualH] == undefined || !(int(this.__setPropDict[this.rd_qualH]) >= 40 && int(this.__setPropDict[this.rd_qualH]) <= 44)))
         {
            this.__setPropDict[this.rd_qualH] = param1;
            try
            {
               this.rd_qualH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualH.enabled = true;
            this.rd_qualH.groupName = "qualGroup";
            this.rd_qualH.label = "";
            this.rd_qualH.labelPlacement = "left";
            this.rd_qualH.selected = false;
            this.rd_qualH.value = "";
            this.rd_qualH.visible = true;
            try
            {
               this.rd_qualH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_qualM_(param1:int) : *
      {
         if(this.rd_qualM != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_qualM] == undefined || !(int(this.__setPropDict[this.rd_qualM]) >= 40 && int(this.__setPropDict[this.rd_qualM]) <= 44)))
         {
            this.__setPropDict[this.rd_qualM] = param1;
            try
            {
               this.rd_qualM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_qualM.enabled = true;
            this.rd_qualM.groupName = "qualGroup";
            this.rd_qualM.label = "";
            this.rd_qualM.labelPlacement = "left";
            this.rd_qualM.selected = false;
            this.rd_qualM.value = "";
            this.rd_qualM.visible = true;
            try
            {
               this.rd_qualM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partL_(param1:int) : *
      {
         if(this.rd_partL != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_partL] == undefined || !(int(this.__setPropDict[this.rd_partL]) >= 40 && int(this.__setPropDict[this.rd_partL]) <= 44)))
         {
            this.__setPropDict[this.rd_partL] = param1;
            try
            {
               this.rd_partL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partL.enabled = true;
            this.rd_partL.groupName = "partGroup";
            this.rd_partL.label = "";
            this.rd_partL.labelPlacement = "left";
            this.rd_partL.selected = false;
            this.rd_partL.value = "";
            this.rd_partL.visible = true;
            try
            {
               this.rd_partL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partH_(param1:int) : *
      {
         if(this.rd_partH != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_partH] == undefined || !(int(this.__setPropDict[this.rd_partH]) >= 40 && int(this.__setPropDict[this.rd_partH]) <= 44)))
         {
            this.__setPropDict[this.rd_partH] = param1;
            try
            {
               this.rd_partH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partH.enabled = true;
            this.rd_partH.groupName = "partGroup";
            this.rd_partH.label = "";
            this.rd_partH.labelPlacement = "left";
            this.rd_partH.selected = false;
            this.rd_partH.value = "";
            this.rd_partH.visible = true;
            try
            {
               this.rd_partH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_partM_(param1:int) : *
      {
         if(this.rd_partM != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_partM] == undefined || !(int(this.__setPropDict[this.rd_partM]) >= 40 && int(this.__setPropDict[this.rd_partM]) <= 44)))
         {
            this.__setPropDict[this.rd_partM] = param1;
            try
            {
               this.rd_partM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_partM.enabled = true;
            this.rd_partM.groupName = "partGroup";
            this.rd_partM.label = "";
            this.rd_partM.labelPlacement = "left";
            this.rd_partM.selected = false;
            this.rd_partM.value = "";
            this.rd_partM.visible = true;
            try
            {
               this.rd_partM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_light_(param1:int) : *
      {
         if(this.cb_light != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_light] == undefined || !(int(this.__setPropDict[this.cb_light]) >= 40 && int(this.__setPropDict[this.cb_light]) <= 44)))
         {
            this.__setPropDict[this.cb_light] = param1;
            try
            {
               this.cb_light["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_light.enabled = true;
            this.cb_light.label = "";
            this.cb_light.labelPlacement = "left";
            this.cb_light.selected = false;
            this.cb_light.visible = true;
            try
            {
               this.cb_light["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodH_(param1:int) : *
      {
         if(this.rd_bloodH != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_bloodH] == undefined || !(int(this.__setPropDict[this.rd_bloodH]) >= 40 && int(this.__setPropDict[this.rd_bloodH]) <= 44)))
         {
            this.__setPropDict[this.rd_bloodH] = param1;
            try
            {
               this.rd_bloodH["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodH.enabled = true;
            this.rd_bloodH.groupName = "bloodGroup";
            this.rd_bloodH.label = "";
            this.rd_bloodH.labelPlacement = "left";
            this.rd_bloodH.selected = false;
            this.rd_bloodH.value = "";
            this.rd_bloodH.visible = true;
            try
            {
               this.rd_bloodH["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodM_(param1:int) : *
      {
         if(this.rd_bloodM != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_bloodM] == undefined || !(int(this.__setPropDict[this.rd_bloodM]) >= 40 && int(this.__setPropDict[this.rd_bloodM]) <= 44)))
         {
            this.__setPropDict[this.rd_bloodM] = param1;
            try
            {
               this.rd_bloodM["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodM.enabled = true;
            this.rd_bloodM.groupName = "bloodGroup";
            this.rd_bloodM.label = "";
            this.rd_bloodM.labelPlacement = "left";
            this.rd_bloodM.selected = false;
            this.rd_bloodM.value = "";
            this.rd_bloodM.visible = true;
            try
            {
               this.rd_bloodM["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_bloodL_(param1:int) : *
      {
         if(this.rd_bloodL != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_bloodL] == undefined || !(int(this.__setPropDict[this.rd_bloodL]) >= 40 && int(this.__setPropDict[this.rd_bloodL]) <= 44)))
         {
            this.__setPropDict[this.rd_bloodL] = param1;
            try
            {
               this.rd_bloodL["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_bloodL.enabled = true;
            this.rd_bloodL.groupName = "bloodGroup";
            this.rd_bloodL.label = "";
            this.rd_bloodL.labelPlacement = "left";
            this.rd_bloodL.selected = false;
            this.rd_bloodL.value = "";
            this.rd_bloodL.visible = true;
            try
            {
               this.rd_bloodL["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_shake_(param1:int) : *
      {
         if(this.cb_shake != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_shake] == undefined || !(int(this.__setPropDict[this.cb_shake]) >= 40 && int(this.__setPropDict[this.cb_shake]) <= 44)))
         {
            this.__setPropDict[this.cb_shake] = param1;
            try
            {
               this.cb_shake["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_shake.enabled = true;
            this.cb_shake.label = "";
            this.cb_shake.labelPlacement = "left";
            this.cb_shake.selected = false;
            this.cb_shake.visible = true;
            try
            {
               this.cb_shake["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_bloody_(param1:int) : *
      {
         if(this.cb_bloody != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_bloody] == undefined || !(int(this.__setPropDict[this.cb_bloody]) >= 40 && int(this.__setPropDict[this.cb_bloody]) <= 44)))
         {
            this.__setPropDict[this.cb_bloody] = param1;
            try
            {
               this.cb_bloody["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_bloody.enabled = true;
            this.cb_bloody.label = "";
            this.cb_bloody.labelPlacement = "left";
            this.cb_bloody.selected = false;
            this.cb_bloody.visible = true;
            try
            {
               this.cb_bloody["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_music_(param1:int) : *
      {
         if(this.cb_music != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_music] == undefined || !(int(this.__setPropDict[this.cb_music]) >= 40 && int(this.__setPropDict[this.cb_music]) <= 44)))
         {
            this.__setPropDict[this.cb_music] = param1;
            try
            {
               this.cb_music["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_music.enabled = true;
            this.cb_music.label = "";
            this.cb_music.labelPlacement = "left";
            this.cb_music.selected = false;
            this.cb_music.visible = true;
            try
            {
               this.cb_music["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_sound_(param1:int) : *
      {
         if(this.cb_sound != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_sound] == undefined || !(int(this.__setPropDict[this.cb_sound]) >= 40 && int(this.__setPropDict[this.cb_sound]) <= 44)))
         {
            this.__setPropDict[this.cb_sound] = param1;
            try
            {
               this.cb_sound["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_sound.enabled = true;
            this.cb_sound.label = "";
            this.cb_sound.labelPlacement = "left";
            this.cb_sound.selected = false;
            this.cb_sound.visible = true;
            try
            {
               this.cb_sound["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_cb_voices_(param1:int) : *
      {
         if(this.cb_voices != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.cb_voices] == undefined || !(int(this.__setPropDict[this.cb_voices]) >= 40 && int(this.__setPropDict[this.cb_voices]) <= 44)))
         {
            this.__setPropDict[this.cb_voices] = param1;
            try
            {
               this.cb_voices["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.cb_voices.enabled = true;
            this.cb_voices.label = "";
            this.cb_voices.labelPlacement = "left";
            this.cb_voices.selected = false;
            this.cb_voices.visible = true;
            try
            {
               this.cb_voices["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick0_(param1:int) : *
      {
         if(this.rd_rightclick0 != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_rightclick0] == undefined || !(int(this.__setPropDict[this.rd_rightclick0]) >= 40 && int(this.__setPropDict[this.rd_rightclick0]) <= 44)))
         {
            this.__setPropDict[this.rd_rightclick0] = param1;
            try
            {
               this.rd_rightclick0["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick0.enabled = true;
            this.rd_rightclick0.groupName = "rightGroup";
            this.rd_rightclick0.label = "";
            this.rd_rightclick0.labelPlacement = "left";
            this.rd_rightclick0.selected = false;
            this.rd_rightclick0.value = "";
            this.rd_rightclick0.visible = true;
            try
            {
               this.rd_rightclick0["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick1_(param1:int) : *
      {
         if(this.rd_rightclick1 != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_rightclick1] == undefined || !(int(this.__setPropDict[this.rd_rightclick1]) >= 40 && int(this.__setPropDict[this.rd_rightclick1]) <= 44)))
         {
            this.__setPropDict[this.rd_rightclick1] = param1;
            try
            {
               this.rd_rightclick1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick1.enabled = true;
            this.rd_rightclick1.groupName = "rightGroup";
            this.rd_rightclick1.label = "";
            this.rd_rightclick1.labelPlacement = "left";
            this.rd_rightclick1.selected = false;
            this.rd_rightclick1.value = "";
            this.rd_rightclick1.visible = true;
            try
            {
               this.rd_rightclick1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_rd_rightclick2_(param1:int) : *
      {
         if(this.rd_rightclick2 != null && param1 >= 40 && param1 <= 44 && (this.__setPropDict[this.rd_rightclick2] == undefined || !(int(this.__setPropDict[this.rd_rightclick2]) >= 40 && int(this.__setPropDict[this.rd_rightclick2]) <= 44)))
         {
            this.__setPropDict[this.rd_rightclick2] = param1;
            try
            {
               this.rd_rightclick2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.rd_rightclick2.enabled = true;
            this.rd_rightclick2.groupName = "rightGroup";
            this.rd_rightclick2.label = "";
            this.rd_rightclick2.labelPlacement = "left";
            this.rd_rightclick2.selected = false;
            this.rd_rightclick2.value = "";
            this.rd_rightclick2.visible = true;
            try
            {
               this.rd_rightclick2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      function __setProp_handler(param1:Object) : *
      {
         var _loc2_:int = currentFrame;
         if(this.__lastFrameProp != _loc2_)
         {
            this.__lastFrameProp = _loc2_;
            this.__setProp_rd_qualL_(_loc2_);
            this.__setProp_rd_qualH_(_loc2_);
            this.__setProp_rd_qualM_(_loc2_);
            this.__setProp_rd_partL_(_loc2_);
            this.__setProp_rd_partH_(_loc2_);
            this.__setProp_rd_partM_(_loc2_);
            this.__setProp_cb_light_(_loc2_);
            this.__setProp_rd_bloodH_(_loc2_);
            this.__setProp_rd_bloodM_(_loc2_);
            this.__setProp_rd_bloodL_(_loc2_);
            this.__setProp_cb_shake_(_loc2_);
            this.__setProp_cb_bloody_(_loc2_);
            this.__setProp_cb_music_(_loc2_);
            this.__setProp_cb_sound_(_loc2_);
            this.__setProp_cb_voices_(_loc2_);
            this.__setProp_rd_rightclick0_(_loc2_);
            this.__setProp_rd_rightclick1_(_loc2_);
            this.__setProp_rd_rightclick2_(_loc2_);
            return;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
