-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 08 - Exercise 01
-- Matheus Bortoloti Dias
-- 28.05.2021
-- The user inputs the name of a file to be
-- opened, a few statistics are calculated
-- for the text and a new file with this
-- information is saved.
-- -------------------------------------------
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Text_IO;


procedure Main is
   -- File name inserted by the user
   File_Name : Ada.Strings.Unbounded.Unbounded_String;

   -- Record containing the statistics from the a text file
   type Text_Statistics_Record is record
      Name               : Ada.Strings.Unbounded.Unbounded_String;
      Quantity_Of_Lines  : Natural := 0;
      Quantity_Of_Spaces : Natural := 0;
      Quantity_Of_A      : Natural := 0;
   end record;


   -- Function to calculate the file statistics
   function Calc_File_Stat ( File_Name : Ada.Strings.Unbounded.Unbounded_String )
                            return Text_Statistics_Record is
      File      : Ada.Text_IO.File_Type;
      File_Info : Text_Statistics_Record;
   begin
      -- Try to open the file. If it does not exist, the raised exception will
      -- be caught in the calling app
      Ada.Text_IO.Open (File => File,
                        Mode => Ada.Text_IO.In_File,
                        Name => Ada.Strings.Unbounded.To_String(File_Name));

      while not Ada.Text_IO.End_Of_File(File) loop
         declare
            Line : String := Ada.Text_IO.Get_Line (File);
         begin
            -- Count the number of lines
            File_Info.Quantity_Of_Lines := File_Info.Quantity_Of_Lines + 1;

            -- Count the number of spaces
            File_Info.Quantity_Of_Spaces := File_Info.Quantity_Of_Spaces +
              Ada.Strings.Fixed.Count(Line, " ");

            -- Count the number of 'A'
            File_Info.Quantity_Of_A := File_Info.Quantity_Of_A +
              Ada.Strings.Fixed.Count(Line, "A");

            -- Name of the file
            File_Info.Name := File_Name;

         end;
      end loop;

      Ada.Text_IO.Close (File);
      return File_Info;

   end Calc_File_Stat;

    -- Procedure to write a file with the input statistics
   procedure Write_File_Stat ( File_Info : Text_Statistics_Record ) is
      F_Type      : Ada.Text_IO.File_Type;
   begin
        -- Open the file that I want, if it does not exist, create it!
      declare
      begin
         Ada.Text_IO.Open (File => F_Type,
                           Mode => Ada.Text_IO.Out_File,
                           Name => "_STATISTICS_" & Ada.Strings.Unbounded.To_String(File_Info.Name));
      exception
         when Ada.Text_IO.Name_Error =>
            Ada.Text_IO.Create (File => F_Type,
                                Mode => Ada.Text_IO.Out_File,
                                Name => "_STATISTICS_" & Ada.Strings.Unbounded.To_String(File_Info.Name));
      end;

      -- Write to the file
      -- HEADER
      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "-------------------------------------------------------");

      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "                     TEXT STATISTICS                   ");

      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "-------------------------------------------------------");

      -- FILE NAME
      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "File Name: " & Ada.Strings.Unbounded.To_String(File_Info.Name));

      -- QUANTITY OF LINES
      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "Quantity of lines:" & Natural'Image(File_Info.Quantity_Of_Lines));

      -- QUANTITY OF SPACES
      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "Quantity of spaces:" & Natural'Image(File_Info.Quantity_Of_Spaces));

      -- QUANTITY OF 'A's
      Ada.Text_IO.Put_Line (File => F_Type,
                            Item => "Quantity of 'A's:" & Natural'Image(File_Info.Quantity_Of_A));

      -- Close the file
      Ada.Text_IO.Close (File => F_Type);

   end Write_File_Stat;

   File_Info : Text_Statistics_Record;


begin
   -- Print header
   Ada.Text_IO.Put_Line ("-------------------------------------------------------");
   Ada.Text_IO.Put_Line ("              CALCULATE TEXT STATISTICS                ");
   Ada.Text_IO.Put_Line ("-------------------------------------------------------");

   Ada.Text_IO.Put ("Dear user, please insert the name of the file:");

   -- Get user input
   Ada.Text_IO.Unbounded_IO.Get_Line (File_Name);

   -- Open file and calculate and its statistics
   File_Info := Calc_File_Stat (File_Name);

   -- Create a file with the statistics
   Write_File_Stat (File_Info);

exception
   when Ada.Text_IO.Name_Error =>
      Ada.Text_IO.Put_Line ("Dear user, the file you inserted does not exist." &
                              "Please restart the app and try again.");
 end Main;
