-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 03 - Exercise 02
-- Matheus Bortoloti Dias
-- 21.05.2021
-- Generates random numbers between 1 and 100
-- and their respective range of tens
-- -------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Main is
    -- To generate the random number
   subtype Vals is Positive range 1 .. 100;
   package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

   Gen          : Random100.Generator;
   GeneratedNum : Vals := 1;

   -- Variables for the range of tens
   LoLim : Vals;
   UpLim : Vals;

   Finish : Boolean := False;
   UserIn : String := "Y";
begin

    while Finish = False loop
      -- Generate a random number in the range of 'Vals' subtype
      Random100.Reset (Gen => Gen);
      GeneratedNum := Random100.Random (Gen => Gen);

      -- Calculate its range of tens
      if ( GeneratedNum < Vals'Last )
      then
         LoLim := (GeneratedNum - (GeneratedNum mod 10)) + 1; -- remainder of divison by 10
         UpLim := LoLim + 9;
      else
         -- Not so nice, but otherwise we have a runtime exception :/
         LoLim := 91;
         UpLim := 100;
      end if;

      -- Print result
      Put_Line ("Dear user, the program generated the number" &
                  Vals'Image(GeneratedNum) &
                  ". Its range of ten is <" &
                  Vals'Image(LoLim) & ", "&
                  Vals'Image(UpLim) & " >");

      New_Line;
      Put_Line ("Dear user, would you like to continue? (Y/N):");
      Get (UserIn);

      -- Check the input data plausibility
      if (UserIn = "Y")
      then
         Finish := False;
      elsif (UserIn = "N")
      then
        Put_Line ("Very well, program will be closed!");
        Finish := True;
      else
        Put_Line ("Wrong input, program will be closed anyway!");
         Finish := True;
      end if;

   end loop;

end Main;
