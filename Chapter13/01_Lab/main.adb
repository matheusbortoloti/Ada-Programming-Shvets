-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 13 - Exercise 01
-- Matheus Bortoloti Dias
-- 06.06.2021
-- Extends the 'Time' package including the
-- following functions:
--   * Multiply
--   * Divide
--   * Greater than operator  (overloading)
--   * Less than operator (overloading)
-- -------------------------------------------
with Ada.Text_IO;
with Time; use Time;

procedure Main is
   Current_Time : Time_Rec;
begin
   Ada.Text_IO.Put_Line (" --------------- Current Time --------------- ");
   Current_Time := Current_Time + 293;
   Put_Line (Current_Time);

   Ada.Text_IO.Put_Line (" ------------- Current Time * 2 ------------- ");
   Current_Time := Current_Time * 2;
   Put_Line (Current_Time);

   Ada.Text_IO.Put_Line (" ------------- Current Time / 4 ------------- ");
   Current_Time := Current_Time / 4;
   Put_Line (Current_Time);
end Main;
