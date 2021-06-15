-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 10 - Exercise 01
-- Matheus Bortoloti Dias
-- 01.06.2021
-- Extends the hash map example from the book.
-- Instead of a hash map of strings, we create
-- a custom record
-- -------------------------------------------

with Ada.Containers.Hashed_Maps;
with Ada.Text_IO.Unbounded_IO;
With Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;
with Ada.IO_Exceptions;
with Ada.Strings.Hash;
with Ada.Text_IO;


procedure Main is
   use type Ada.Strings.Unbounded.Unbounded_String;

   -- Custom record to store specific data from weeding guests
   type Wedding_Guest_Type is record
      Name             : Unbounded_String;
      Vegetarian       : Boolean;
      Quantity_Of_Kids : Natural := 0;
      Drinks_Alcohol    : Boolean;
      Needs_Hotel      : Boolean;
   end record;


   -- Function required by Ada.Containers.Hashed_Maps
   -- Creates an equivalence relation for the custom keys
   function Equivalent_Keys ( Left  : in Unbounded_String;
                              Right : in Unbounded_String)
                             return Boolean is
   begin
      return Left = Right;
   end Equivalent_Keys;

   -- Function required by Ada.Containers.Hashed_Maps
   function Hash_Func (Key : in Unbounded_String) return Ada.Containers.Hash_Type is
   begin
      return Ada.Strings.Hash (Key => To_String(Key));
   end Hash_Func;

   function U_To_Lower (Key : in Unbounded_String) return Unbounded_String is
   begin
      return To_Unbounded_String(Ada.Characters.Handling.To_Lower(To_String(Key)));
   end U_To_Lower;

   package Attendance_Tracker is new Ada.Containers.Hashed_Maps (Key_Type        => Unbounded_String,
                                                                 Element_Type    => Wedding_Guest_Type,
                                                                 Hash            => Hash_Func,
                                                                 Equivalent_Keys => Equivalent_Keys);

   Wedding_Attendance : Attendance_Tracker.Map;
   User_Input         : Natural := 0;
   String_Input       : Unbounded_String := Null_Unbounded_String;
   Confirmation       : Unbounded_String := Null_Unbounded_String;
   Wedding_Guest      : Wedding_Guest_Type;

   procedure Populate_Hash_Map is
   begin
      Wedding_Guest.Name             := To_Unbounded_String("Aunt Annie");
      Wedding_Guest.Vegetarian       := True;
      Wedding_Guest.Quantity_Of_Kids := 0;
      Wedding_Guest.Drinks_Alcohol   := True;
      Wedding_Guest.Needs_Hotel      := True;

      Wedding_Attendance.Insert (Key      => Wedding_Guest.Name,
                                 New_Item => Wedding_Guest);

      Wedding_Guest.Name             := To_Unbounded_String("Quagmine");
      Wedding_Guest.Vegetarian       := False;
      Wedding_Guest.Quantity_Of_Kids := 5;
      Wedding_Guest.Drinks_Alcohol   := True;
      Wedding_Guest.Needs_Hotel      := False;

      Wedding_Attendance.Insert (Key      => Wedding_Guest.Name,
                                 New_Item => Wedding_Guest);
   end Populate_Hash_Map;

   procedure Print_Hash_Map (Position : Attendance_Tracker.Cursor) is
      Wedding_Guest : Wedding_Guest_Type;
   begin
      Wedding_Guest := Attendance_Tracker.Element(Position);

      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line (" -------------------------------------------------- ");
      Ada.Text_IO.Put_Line ("The key: " & To_String(Attendance_Tracker.Key(Position)));
      Ada.Text_IO.Put_Line (" *Name: " & To_String(Wedding_Guest.Name));
      Ada.Text_IO.Put_Line (" *Vegetarian: " & Boolean'Image(Wedding_Guest.Vegetarian));
      Ada.Text_IO.Put_Line (" *Quantity of kids: " & Natural'Image(Wedding_Guest.Quantity_Of_Kids));
      Ada.Text_IO.Put_Line (" *Drinks Alcohol: " & Boolean'Image(Wedding_Guest.Drinks_Alcohol));
      Ada.Text_IO.Put_Line (" *Needs Hotel: " & Boolean'Image(Wedding_Guest.Needs_Hotel));
      Ada.Text_IO.Put_Line (" -------------------------------------------------- ");
      Ada.Text_IO.New_Line;

   end Print_Hash_Map;

   function Process_User_Input_Bool (Input : in Unbounded_String ) return Boolean is
      Result : Boolean;
   begin
      -- Process the confirmation
      if (U_To_Lower(Confirmation) = To_Unbounded_String("no")) or
        (U_To_Lower(Confirmation) = To_Unbounded_String("n"))
      then
         Result := False;
      elsif (U_To_Lower(Confirmation) = To_Unbounded_String("yes")) or
        (U_To_Lower(Confirmation) = To_Unbounded_String("y"))
      then
         Result := True;
      else
         Ada.Text_IO.Put_Line ("WARNING: The confirmation that you entered is not recognized.");
         raise Ada.IO_Exceptions.Data_Error;
      end if;

      return Result;
   end Process_User_Input_Bool;


begin
   -- add people to the list
   Populate_Hash_Map;

   -- make an inifinity loop for the further data entry
   loop
      -- print menu
      Ada.Text_IO.Put_Line (" - Menu - ");
      Ada.Text_IO.Put_Line (" - 1 - Enter new value");
      Ada.Text_IO.Put_Line (" - 2 - Delete existing value");
      Ada.Text_IO.Put_Line (" - 3 - Print entire hashmap");
      Ada.Text_IO.Put_Line (" - 4 - Exit application");
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put (" -> ");


      -- wait for the user to enter input
      declare
      begin
         Ada.Integer_Text_IO.Get(User_Input);
      exception
         when Ada.Text_IO.Data_Error =>
            Ada.Text_IO.Put_Line ("ERROR: The entered value is not an integer, please try again!");

            -- Set this to 0, that way the if-statements right below this will
            -- not process it and the above menu will be printed out again
            User_Input := 0;
         when others =>
            Ada.Text_IO.Put_Line ("ERROR: Another error has been discovered!");

            -- Set this to 0, that way the if-statements right below this will
            -- not process it and the above menu will be printed out again
            User_Input := 0;
      end;

      Ada.Text_IO.Skip_Line;
      Ada.Text_IO.New_Line;

      if User_Input = 1
      then
         declare
         begin
            Ada.Text_IO.Put_Line ("Enter a new guest");
            Ada.Text_IO.Put (" Name -> ");
            Wedding_Guest.Name := Ada.Text_IO.Unbounded_IO.Get_Line;
            Ada.Text_IO.New_Line;

            Ada.Text_IO.Put_Line (" Vegetarian? (yes/y/no/n) -> ");
            Confirmation := Ada.Text_IO.Unbounded_IO.Get_Line;
            Ada.Text_IO.New_Line;
            Wedding_Guest.Vegetarian := Process_User_Input_Bool(Confirmation);

            Ada.Text_IO.Put_Line (" Does she/he drink alcohol? (yes/y/no/n) -> ");
            Confirmation := Ada.Text_IO.Unbounded_IO.Get_Line;
            Ada.Text_IO.New_Line;
            Wedding_Guest.Drinks_Alcohol := Process_User_Input_Bool(Confirmation);

            Ada.Text_IO.Put_Line (" Does she/he need a hotel? (yes/y/no/n) -> ");
            Confirmation := Ada.Text_IO.Unbounded_IO.Get_Line;
            Ada.Text_IO.New_Line;
            Wedding_Guest.Drinks_Alcohol := Process_User_Input_Bool(Confirmation);

            Ada.Text_IO.Put_Line (" Quantity of kids -> ");
            Ada.Integer_Text_IO.Get(Wedding_Guest.Quantity_Of_Kids);
            Ada.Text_IO.New_Line;

            Wedding_Attendance.Insert (Key      => Wedding_Guest.Name,
                                       New_Item => Wedding_Guest);
         exception
            when Ada.IO_Exceptions.Data_Error =>
               Ada.Text_IO.Put_Line ("Something went wrong. Try it again");

         end;


      elsif User_Input = 2
      then
         Ada.Text_IO.Put_Line ("Delete a value -> ");
         String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
         Ada.Text_IO.New_Line;

         declare
         begin
            Attendance_Tracker.Delete (Container => Wedding_Attendance,
                                       Key       => String_Input);
         exception
            when Constraint_Error =>
               Ada.Text_IO.Put_Line ("The name: '" & To_String(String_Input) &
                                       "'  is not found.");
            when others =>
               Ada.Text_IO.Put_Line ("ERROR:  Another error has been discovered!");
         end;

      elsif User_Input = 3
      then
         Wedding_Attendance.Iterate (Print_Hash_Map'Access);
         Ada.Text_IO.New_Line;

      elsif User_Input = 4
      then
         exit;
      end if;
   end loop;

end Main;
