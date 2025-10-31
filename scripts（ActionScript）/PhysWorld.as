package
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2DebugDraw;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import flash.display.Sprite;
   
   public class PhysWorld extends Sprite
   {
       
      
      public var game:Game;
      
      public var m_world:b2World;
      
      public var m_velocityIterations:int = 10;
      
      public var m_positionIterations:int = 10;
      
      public var m_timeStep:Number = 0.03333333333333333;
      
      private var body:b2Body;
      
      private var bodyDef:b2BodyDef;
      
      private var boxShape:b2PolygonShape;
      
      private var fixtureDef:b2FixtureDef;
      
      public var actors:Array;
      
      public function PhysWorld(param1:Game)
      {
         super();
         this.game = param1;
         this.actors = [];
         this.m_world = new b2World(new b2Vec2(0,10),true);
         if(MatchSettings.useMap.phys == "space")
         {
            this.m_world.SetGravity(new b2Vec2(0,0));
         }
         var _loc2_:b2DebugDraw = new b2DebugDraw();
         _loc2_.SetSprite(this);
         _loc2_.SetDrawScale(30);
         _loc2_.SetFillAlpha(0.3);
         _loc2_.SetLineThickness(1);
         _loc2_.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
         this.m_world.SetDebugDraw(_loc2_);
      }
      
      public function generateWorld(param1:Array) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = Number(param1[_loc2_].rotation);
            param1[_loc2_].rotation = 0;
            this.bodyDef = new b2BodyDef();
            this.bodyDef.position.Set(Number(param1[_loc2_].x) / 30,Number(param1[_loc2_].y) / 30);
            this.boxShape = new b2PolygonShape();
            this.boxShape.SetAsBox(Number(param1[_loc2_].width) / 60,Number(param1[_loc2_].height) / 60);
            this.bodyDef.angle = _loc3_ / (180 / Math.PI);
            this.fixtureDef = new b2FixtureDef();
            this.fixtureDef.shape = this.boxShape;
            this.fixtureDef.friction = 0.3;
            this.fixtureDef.density = 0;
            this.body = this.m_world.CreateBody(this.bodyDef);
            this.body.CreateFixture(this.fixtureDef);
            param1[_loc2_].rotation = _loc3_;
            _loc2_++;
         }
      }
      
      public function createCorpse(param1:Unit, param2:Unit, param3:Stats_Guns, param4:*) : PhysActor
      {
         var _loc7_:Number = NaN;
         var _loc5_:PhysActor = new PhysActor(this,param1,param2,param3,param4);
         this.actors.push(_loc5_);
         _loc5_.impulseAll();
         _loc5_.impulseBody(new b2Vec2(param1.mov.xVel,param1.mov.yVel));
         var _loc6_:Number = param3.force;
         if(MatchSettings.useMod == "sky9")
         {
            if((_loc6_ += 40) > 80)
            {
               _loc6_ = 80;
            }
         }
         if(_loc6_)
         {
            if(!param3.splash)
            {
               if(param2.x == param1.x && param2.y == param1.y)
               {
                  param1.y -= 2;
               }
               _loc7_ = UT.getRotation(param2.x,param2.y,param1.x,param1.y);
            }
            else
            {
               if(param4.hitX == param1.x && param4.hitY == param1.y)
               {
                  ++param4.hitY;
               }
               _loc7_ = UT.getRotation(param4.hitX,param4.hitY,param1.x,param1.y - 40);
            }
            _loc5_.impulseBody(new b2Vec2(UT.xMoveToRot(_loc7_,_loc6_),UT.yMoveToRot(_loc7_,_loc6_)));
         }
         if(param4.headMult)
         {
            if(param2.x == param1.x && param2.y == param1.y - 10)
            {
               --param1.y;
            }
            _loc7_ = UT.getRotation(param2.x,param2.y,param1.x,param1.y - 10);
            _loc5_.impulseHead(new b2Vec2(UT.xMoveToRot(_loc7_,8),UT.yMoveToRot(_loc7_,8)));
         }
         return _loc5_;
      }
      
      public function hitCorpse(param1:PhysActor, param2:Unit, param3:Stats_Guns, param4:*) : void
      {
         var _loc6_:Number = NaN;
         param1.impulseAll(null,-0.5,0.5);
         var _loc5_:Number = param3.force;
         if(MatchSettings.useMod == "sky9")
         {
            _loc5_ *= 1.5;
         }
         if(_loc5_)
         {
            if(param3.splash)
            {
               if(param4.hitX == param1.rdBody.GetDefinition().userData.x && param4.hitY == param1.rdBody.GetDefinition().userData.y)
               {
                  ++param4.hitY;
               }
               _loc6_ = UT.getRotation(param4.hitX,param4.hitY,param1.rdBody.GetDefinition().userData.x,Number(param1.rdBody.GetDefinition().userData.y) - 40);
            }
            else
            {
               if(param2.x == param1.rdBody.GetDefinition().userData.x && param2.y == param1.rdBody.GetDefinition().userData.y)
               {
                  --param1.rdBody.GetDefinition().userData.y;
               }
               _loc6_ = UT.getRotation(param2.x,param2.y,param1.rdBody.GetDefinition().userData.x,param1.rdBody.GetDefinition().userData.y);
            }
            param1.impulseBody(new b2Vec2(UT.xMoveToRot(_loc6_,_loc5_),UT.yMoveToRot(_loc6_,_loc5_)));
         }
      }
      
      public function EnterFrame() : void
      {
         var _loc3_:Sprite = null;
         this.m_world.Step(this.m_timeStep,this.m_velocityIterations,this.m_positionIterations);
         var _loc1_:b2Body = this.m_world.GetBodyList();
         while(_loc1_)
         {
            if(_loc1_.GetUserData() is Sprite)
            {
               _loc3_ = _loc1_.GetUserData() as Sprite;
               _loc3_.x = _loc1_.GetPosition().x * 30;
               _loc3_.y = _loc1_.GetPosition().y * 30;
               _loc3_.rotation = _loc1_.GetAngle() * (180 / Math.PI);
            }
            _loc1_ = _loc1_.GetNext();
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.actors.length)
         {
            this.actors[_loc2_].EnterFrame();
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
      }
   }
}
