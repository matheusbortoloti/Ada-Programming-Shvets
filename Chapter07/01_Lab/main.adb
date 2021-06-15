-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 07 - Exercise 01
-- Matheus Bortoloti Dias
-- 27.05.2021
-- Raise an exception when unplausible input
-- data is given through the setter methods
-- -------------------------------------------

with Ada.Text_IO;
with Animal;

procedure Main is
   Var1 : Animal.Creature := Animal.Init;
   Var2 : Animal.Creature := Animal.Init ( Name          => "Elephant",
                                           Legs          => 4,
                                           WeightInGrams => 4000000,
                                           HeightInCm    => 500 );

begin
   Animal.Print_Record(Var1);
   Animal.Print_Record(Var2);
exception
   when Animal.Input_Over_Range =>
      Ada.Text_IO.Put_Line ("EXCEPTION RAISED: INPUT OVER RANGE!");
end Main;
