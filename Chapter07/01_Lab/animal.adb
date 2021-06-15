package body animal is


   function Init ( Name          : in String;
                   Legs          : in Natural;
                   WeightInGrams : in Positive;
                   HeightInCm    : in Positive) return Creature is
      
      TempCreature : Creature;
      use Ada.Strings.Unbounded;
   begin     
      TempCreature.Name  := To_Unbounded_String (Name);
      
      -- Use the setter methods in order to benefit from the plausibility check
      Set_Legs   (Creat => TempCreature,
                  Legs  => Legs);
      
      Set_Weigth (Creat         => TempCreature,
                  WeightInGrams => WeightInGrams);
      
      Set_Height (Creat      => TempCreature,
                  HeightInCm => HeightInCm);    

      return TempCreature;
   exception
      when Animal.Input_Over_Range =>
         Ada.Text_IO.Put_Line ("EXCEPTION RAISED: INPUT OVER RANGE!");         
   end Init;
   
   function Init return Creature is
       TempCreature : Creature;
   begin
      return Init ( Name          => "dog",
                    Legs          => 10 ** 5,
                    WeightInGrams => 3000,
                    HeightInCm    => 40);
   end Init;
   
   -- ##################################################################
   procedure Set_Legs ( Creat : in out Creature;
                        Legs  : in Natural ) is
   begin
      if ( Legs > 10 ** 3)
      then
         -- Input is out of range: raise the exception!
         raise Input_Over_Range;
      else         
         Creat.Legs := Legs;
      end if;
   end Set_Legs;

   -- ##################################################################
   procedure Set_Weigth ( Creat         : in out Creature;
                          WeightInGrams : in Positive ) is
   begin       
      if ( WeightInGrams > 10 ** 5 )
      then
         -- Input is out of range: raise the exception!
         raise Input_Over_Range;
      else
         Creat.WeightInGrams := WeightInGrams;
      end if;              
   end Set_Weigth;
   
   -- ##################################################################
   procedure Set_Height ( Creat      : in out Creature;
                          HeightInCm : in Positive ) is
   begin 
      if ( HeightInCm > 10 ** 3)
      then
         -- Input is out of range: raise the exception!
         raise Input_Over_Range;
      else        
         Creat.HeightInCm := HeightInCm;
      end if;      
   end Set_Height;   
   
   -- ##################################################################
   function Get_Legs ( Creat : in out Creature ) return Natural is
   begin 
      return Creat.Legs;
   end Get_Legs;
   
   -- ##################################################################
   function Get_Weight ( Creat : in out Creature ) return Positive is
   begin
      return Creat.WeightInGrams;
   end Get_Weight;   
   
   -- ##################################################################
   function Get_Height ( Creat : in out Creature ) return Positive is
   begin
      return Creat.HeightInCm;
   end Get_Height;  
   
   -- ##################################################################
   overriding procedure Finalize ( Creat : in out Creature ) is 
      use Ada.Strings.Unbounded;
   begin     
      Ada.Text_IO.Put_Line ("Resetting values of Creat to defaults.");      
      
      Creat.Name          :=  Null_Unbounded_String;
      Creat.Legs          := 0;
      Creat.WeightInGrams := 1;
      Creat.HeightInCm := 1;
   end Finalize;
   
   -- ##################################################################
   procedure Print_Record (Creat : in out Creature) is 
   begin
      Private_Print_Record (Creat);
   end Print_Record;
   
   -- ##################################################################
   procedure Private_Print_Record (Creat : in out Creature) is 
      use Ada.Text_IO;
   begin
      Put_Line (" The animal:");
      Put_Line ("  The name:         " &
                  Ada.Strings.Unbounded.To_String(Creat.Name));
      Put_Line ("  Number of legs:  " & Natural'Image(Creat.Legs));
      Put_Line ("  Weight in grams: " & Positive'Image(Creat.WeightInGrams));
      Put_Line ("  Height in cm:    " & Positive'Image(Creat.HeightInCm));
   end Private_Print_Record;
   
   

end animal;
