-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 09 - Exercise 02
-- Matheus Bortoloti Dias
-- 30.05.2021
-- The user provides a string and a sub-string.
-- The function Quantity_Pattern_String
-- returns the total number of occurences of a
-- sub-string in a larger string
-- -------------------------------------------
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure Main is

   -- Returns the total number of occurrences of the sub-string inside
   -- the main string
   function Quantity_Pattern_String (Main_String : in Unbounded_String;
                                     Sub_String  : in Unbounded_String)
                                     return Natural is
      Place_Holder      : Natural := 0;
      Temp_String       : Unbounded_String;
      Pattern_Length    : Natural;
      Counter           : Natural := 0;

   begin
      -- Makes a copy of the original string to avoid changing it
      Temp_String := Main_String;

      -- Length of the pattern to be searched and deleted
      Pattern_Length := Length(Sub_String);

      loop
         Place_Holder := Index (Source  => Temp_String,
                                Pattern => To_String(Sub_String));
         -- i.e. the pattern does not exist anymore inside the main string
         exit when Place_Holder = 0;

         -- Counts the occurrences of the sub-string inside the string
         Counter := Counter + 1;

         -- Delete the sub-string inside the string
         Temp_String  := Delete (Source  => Temp_String,
                                 From    => Place_Holder,
                                 Through => Place_Holder + Pattern_Length - 1);
      end loop;

      return Counter;

   end Quantity_Pattern_String;

   -- Test variables
   -- String to be found and deleted from the main string
   Sub_String  : String := "[*tHiS pAtTeRn*]";

   -- Main string with the whole text
   Main_String : String := "This is a simple example to find and eliminate" &
     Sub_String & ". It should work, but let's test it. I will include it " &
     "one more time here " & Sub_String & " and also here" & Sub_String;

   Counter : Natural;
begin
   -- Print strings before calling the function
   Ada.Text_IO.Put_Line ("Original Main String: " & Main_String);
   Ada.Text_IO.Put_Line ("Original Sub-string: " & Sub_String);
   Ada.Text_IO.Put_Line (" -------- Function Call: counts occurrences -------- ");

   Counter := Quantity_Pattern_String (Main_String => To_Unbounded_String(Main_String),
                                       Sub_String  => To_Unbounded_String(Sub_String));

   -- Print string after calling the function
   Ada.Text_IO.Put_Line ("The sub-string: '" & Sub_String &
                           "' appears" & Counter'Img & " times inside the" &
                           " main string '" & Main_String & "'.");
end Main;
