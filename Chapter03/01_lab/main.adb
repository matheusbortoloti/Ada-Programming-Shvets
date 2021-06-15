-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 03 - Exercise 01
-- Matheus Bortoloti Dias
-- 21.05.2021
-- The user needs to guess the random number
-- generated
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Main is
   -- Variables to read the user data
   TmpString : String (1 .. 3);
   Last      : Natural := 0;
   Value     : Integer := 0;

   -- To generate the random number
   subtype Vals is Positive range 1 .. 10;
   package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

   Gen          : Random100.Generator;
   GeneratedNum : Vals := 1;

begin
   -- Read the user input until it is in the correct range
   loop
      -- Read user input
      Put ("Please guess the random number generated between"
           & Vals'Image(Vals'First) & " and" & Vals'Image(Vals'Last) & ":");
      Get_Line (TmpString, Last);
      Value := Integer'Value (TmpString (1 .. Last));

      -- Check if input is in range
      exit when ((Value > Vals'First) and (Value < Vals'Last));

      -- Not in range: inform user
      Put_Line ("Dear user, your input is out of bounds!" &
                  "Please try again :D");
   end loop;

   -- Generate a random number in the range of 'Vals' subtype
   Random100.Reset (Gen => Gen);
   GeneratedNum := Random100.Random (Gen => Gen);

   -- Print output to the user
   Put ("Dear user, your input was" & Vals'Image(Value) &
          " and the number generated was" & Vals'Image(GeneratedNum) &
          ". Therefore, your answer is ");

   if (Value = GeneratedNum)
   then
      Put ("RIGHT!");
   else
      Put ("WRONG!");
   end if;


end Main;
