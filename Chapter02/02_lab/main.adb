-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 02 - Exercise 03
-- Matheus Bortoloti Dias
-- 21.05.2021
-- This program prints ADA in a styled way
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   FullLine   : String := "############################################################";
   EmptyLine  : String := "##                                                        ##";

   -- Print upper part of the header
   procedure PrintUpper is
   begin
      Put_Line (FullLine);
      Put_Line (FullLine);
      Put_Line (EmptyLine);
   end PrintUpper;

    -- Print ADA
   procedure PrintAda is
      FirstLine  : String := "##       000000000000   00000000000    000000000000       ##";
      HelperLine : String := "##       00        00   00        00   00        00       ##";
      MiddleLine : String := "##       000000000000   00        00   000000000000       ##";
      BottomLine : String := "##       00        00   00000000000    00        00       ##";
   begin
      Put_Line (FirstLine);

      Put_Line (HelperLine);
      Put_Line (HelperLine);

      Put_Line (MiddleLine);

      Put_Line (HelperLine);
      Put_Line (HelperLine);

      Put_Line (BottomLine);
   end PrintAda;

   -- Print lower part
   procedure PrintLower is
   begin
      Put_Line (EmptyLine);
      Put_Line (FullLine);
      Put_Line (FullLine);
   end PrintLower;

begin
   PrintUpper;
   PrintAda;
   PrintLower;
end Main;
