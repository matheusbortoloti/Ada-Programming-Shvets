-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 04 - Exercise 04
-- Matheus Bortoloti Dias
-- 23.05.2021
-- This code is only to show how a 'declare'
-- statement could be replaced with a
-- procedure.
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is

   procedure Replace_Declare is
      Num : Positive := 10;
   begin
      Put_Line ("Dear user, this message was displayed inside" &
                  " a procedure that replaces a 'declare block." &
                  " Number is" & Positive'Image(Num));
   end Replace_Declare;

begin

   -- Here we could use 'declare'
   -- declare
   --	 Num : Positive := 10;
   -- begin
   -- Put_Line ("Dear user, this message was displayed inside" &
   --             " a 'declare' block." &
   --             " Number is" & Positive'Image(Num));
   -- end;

   Replace_Declare;

end Main;
