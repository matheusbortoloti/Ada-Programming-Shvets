-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 06 - Exercise 01
-- Matheus Bortoloti Dias
-- 26.05.2021
-- Implements the setter and getter methods
-- for the 'Animal' package
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
end Main;
