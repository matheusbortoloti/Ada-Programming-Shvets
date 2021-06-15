
-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 04 - Exercise 03
-- Matheus Bortoloti Dias
-- 23.05.2021
-- Function (recursive) to check if a
-- given string is a palindrome or not
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is

   procedure Remove_Tail_Head ( Input : in out Unbounded_String ) is
   begin
      -- Trim the string: remove head
       Ada.Strings.Unbounded.Delete ( Source  => Input,
                                      From    => 1,
                                      Through => 1 );

       -- Trim the string: remove tail
       Ada.Strings.Unbounded.Delete ( Source  => Input,
                         From    => Length(Input),
                         Through => Length(Input) );
   end Remove_Tail_Head;


   -- Function to check whether a given string is a palindrome or not
   function Check_Palindrome ( Input : in Unbounded_String ) return Boolean is

      Head          : Integer;          -- Head of the string
      Tail          : Integer;          -- Tail of the string
      Is_Palindrome : Boolean;          -- Result of the the function
      Aux_String    : Unbounded_String; -- Auxiliary string

   begin
      Head := 1;
      Tail := Length(Input);


      if ( Element (Input, Head) = Element (Input, Tail) ) and ( Tail > 2)
      then
         -- Head and tail are the same, so proceed with the check
         Aux_String := Input;
         Remove_Tail_Head ( Aux_String );

         Is_Palindrome := Check_Palindrome (Aux_String);
     else
       if (Head >= Tail) or ( Element (Input, Head) = Element (Input, Tail) )
       then
         Is_Palindrome := True;
       else
         Is_Palindrome := False;
       end if;
     end if;

     return Is_Palindrome;
   end Check_Palindrome;

   User_String : Unbounded_String;
   Result      : Boolean;
begin
   declare
      Test : Integer := Length ( To_Unbounded_String("a"));
   begin
      null;
   end;

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
