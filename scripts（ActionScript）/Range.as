package
{
   public class Range
   {
       
      
      public var min:Number;
      
      public var max:Number;
      
      public var cur:Number;
      
      public var old:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public function Range(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.min = param1;
         this.max = param2;
         this.cur = param3;
      }
   }
}
