-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 04 - Exercise 02
-- Matheus Bortoloti Dias
-- 21.05.2021
-- Function (non recursive) to check if a
-- given string is a palindrome or not
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is

   -- Function to check whether a given string is a palindrome or not
   function Check_Palindrome ( Input : in Unbounded_String ) return Boolean is
      Head          : Integer; -- Head of the string
      Tail          : Integer; -- Tail of the string
      Is_Palindrome : Boolean; -- Result of the the function
   begin
      -- Initialize head and tail
      Head := 0;
      Tail := Length (Input) + 1;

      loop
         -- Move across the string to check head and tail
         Head := Head + 1;
         Tail := Tail - 1;

         -- If one head is different from the tail is not a palindrome
         if ( Element (Input, Head) /= Element (Input, Tail) )
         then
            Is_Palindrome := False;
         else
            Is_Palindrome := True;
         end if;

         -- (Head >= Tail) means that all characters have already been compared
         exit when (Is_Palindrome = False) or (Head >= Tail);
      end loop;

      return Is_Palindrome;
   end Check_Palindrome;

   User_String : Unbounded_String;
   Result      : Boolean;


begin
   -- Inform the user what to do
   Put_Line ("Dear user, please insert a string to check if " &
               "it is a palindrome:" );

   -- Read user input
   User_String := To_Unbounded_String(Get_Line);

   -- Check if the string is a palindrome
   Result := Check_Palindrome (User_String);

   -- Output the answer for the user
   Put ("Dear user, the inserted string is " );

   if ( Result = False )
   then
      Put ("NOT");
   end if;

   Put_Line (" a palindrome.");

end Main;
