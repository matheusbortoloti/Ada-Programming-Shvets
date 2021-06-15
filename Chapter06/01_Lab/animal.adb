package body animal is

   function Init ( Name          : in String;
                   Legs          : in Natural;
                   WeightInGrams : in Positive;
                   HeightInCm    : in Positive) return Creature is
      
      TempCreature : Creature;
      use Ada.Strings.Unbounded;
   begin      
      
      TempCreature.Name          := To_Unbounded_String (Name);
      TempCreature.Legs          := Legs;
      TempCreature.WeightInGrams := WeightInGrams;
      TempCreature.HeightInCm := HeightInCm;

      return TempCreature;
   end Init;
   
   function Init return Creature is
       TempCreature : Creature;
   begin
      return Init ( Name          => "dog",
                    Legs          => 4,
                    WeightInGrams => 3000,
                    HeightInCm    => 40);
   end Init;
   
   -- ##################################################################
   procedure Set_Legs ( Creat : in out Creature;
                        Legs  : in Natural ) is
   begin
      Creat.Legs := Legs;
   end Set_Legs;

   -- ##################################################################
   procedure Set_Weigth ( Creat         : in out Creature;
                          WeightInGrams : in Positive ) is
   begin
      Creat.WeightInGrams := WeightInGrams;
   end Set_Weigth;
   
   -- ##################################################################
   procedure Set_Height ( Creat      : in out Creature;
                          HeightInCm : in Positive ) is
   begin 
      Creat.HeightInCm := HeightInCm;
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
