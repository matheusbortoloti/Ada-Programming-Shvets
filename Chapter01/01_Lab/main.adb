-- ---------------------------------------
-- Chapter 01 - Exercise 01
-- Matheus Bortoloti Dias
-- 13.05.2021
-- This program prints ADA in a styled way
-- ----------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   LINE_WIDHT   : constant := 60;
   LETTER_WIDHT : constant := 12;

   -- Print a whole line with '#"
   procedure Print_Header_Line is
   begin
      for I in 1 .. LINE_WIDHT loop
         Put ("#");
      end loop;
      New_Line;
   end Print_Header_Line;

   -- Print an empty line starting and ending with '##"
   procedure Print_Empty_Line is
   begin
      Put ("##");
      for I in 3 .. LINE_WIDHT-2 loop
         Put (" ");
      end loop;
      Put ("##");
      New_Line;
   end Print_Empty_Line;

   -- Print the upper pattern of 'ADA'
   procedure Print_Upper_Pattern is
   begin
      -- Start of line
      Put ("##");
      Put ("       ");

      -- Upper part of 'A'
      for I in 1 .. LETTER_WIDHT loop
         Put ("0");
      end loop;

      -- Space
      Put ("   ");

      -- Upper part of 'D'
      for I in 1 .. LETTER_WIDHT - 1 loop
         Put ("0");
      end loop;

      -- Space
      Put ("    ");

      -- Upper part of 'A'
      for I in 1 .. LETTER_WIDHT loop
         Put ("0");
      end loop;

      -- End of line

      Put ("       ");
      Put ("##");

      New_Line;
   end Print_Upper_Pattern;

   -- Print the middle-upper-lower pattern of 'ADA'
   procedure Print_Middle_Up_Low_Pattern is
   begin
      -- Start of line
      Put ("##");
      Put ("       ");

      -- Middle part of 'A'
      Put ("00");
      Put ("        ");
      Put ("00");

      -- Space
      Put ("   ");

      -- Middle part of 'D'
       Put ("00");
      for I in 1 .. LETTER_WIDHT - 4 loop
         Put (" ");
      end loop;
      Put ("00");

      -- Space
      Put ("   ");

      -- Middle part of 'A'
      Put ("00");
      Put ("        ");
      Put ("00");

      -- End of line
      Put ("       ");
      Put ("##");

      New_Line;
   end Print_Middle_Up_Low_Pattern;

-- Print the middle pattern of 'ADA'
   procedure Print_Middle_Pattern is
   begin
      -- Start of line
      Put ("##");
      Put ("       ");

      -- Middle part of 'A'
      for I in 1 .. LETTER_WIDHT loop
         Put ("0");
      end loop;

      -- Space
      Put ("   ");

      -- Middle part of 'D'
       Put ("00");
      for I in 1 .. LETTER_WIDHT - 4 loop
         Put (" ");
      end loop;
      Put ("00");

      -- Space
      Put ("   ");

      -- Middle part of 'A'
      for I in 1 .. LETTER_WIDHT loop
         Put ("0");
      end loop;

      -- End of line
      Put ("       ");
      Put ("##");

      New_Line;
   end Print_Middle_Pattern;

-- Print the lower pattern of 'ADA'
   procedure Print_Lower_Pattern is
   begin
      -- Start of line
      Put ("##");
      Put ("       ");

      -- Lower part of 'A'
      Put ("00");
      Put ("        ");
      Put ("00");

      -- Space
      Put ("   ");

      -- Lower part of 'D'
      for I in 1 .. LETTER_WIDHT - 1 loop
         Put ("0");
      end loop;

      -- Space
      Put ("    ");

      -- Lower part of 'A'
      Put ("00");
      Put ("        ");
      Put ("00");

      -- End of line
      Put ("       ");
      Put ("##");

      New_Line;
   end Print_Lower_Pattern;

begin
   Print_Header_Line;
   Print_Header_Line;
   Print_Empty_Line;

   Print_Upper_Pattern;

   Print_Middle_Up_Low_Pattern;
   Print_Middle_Up_Low_Pattern;
   Print_Middle_Pattern;
   Print_Middle_Up_Low_Pattern;
   Print_Middle_Up_Low_Pattern;

   Print_Lower_Pattern;

   Print_Empty_Line;
   Print_Header_Line;
   Print_Header_Line;
end Main;
