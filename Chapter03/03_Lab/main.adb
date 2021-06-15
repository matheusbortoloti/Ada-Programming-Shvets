-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 03 - Exercise 03
-- Matheus Bortoloti Dias
-- 21.05.2021
-- Iterates from 1 to 10 0000 and prints only
-- the values that are divisable by 3, 13
-- and 23
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   subtype User_Positive is Positive range 1 .. 10 ** 4;

begin
   for I in User_Positive'First .. User_Positive'Last loop
      if (I mod 3 = 0) and (I mod 13 = 0) and (I mod 23 = 0)
      then
         Put_Line (User_Positive'Image(I));
      end if;
   end loop;

end Main;
