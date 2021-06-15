-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 05 - Exercise 01
-- Matheus Bortoloti Dias
-- 24.05.2021
-- Create an example record (data structure)
-- in order to simulate a company's employee
-- database
-- -------------------------------------------
with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Numerics.Discrete_Random;

procedure Main is

   -- Record with the employee data
   type Employee_Type is record
      FirstName  : Unbounded_String := To_Unbounded_String("Douglas");
      LastName   : Unbounded_String := To_Unbounded_String("Mueller");
      Title      : Unbounded_String := To_Unbounded_String("Engineer");
      Salary     : Float;
      VacHours   : Float;   -- Vacation hours per year
      SickHours  : Float;   -- Hours off for sick time
      YearsInCmp : Integer; -- Number of years in company
   end record;

   EmployeesArray : Array (1 .. 10) of Employee_Type;

   -- For the generation of random integers
   subtype Vals is Natural range 0 .. 40;
   package Random_Val is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);
   Gen : Random_Val.Generator;

   -- For the generation of random float
   Seed : Ada.Numerics.Float_Random.Generator;

   procedure Print_Employee_Data ( Data : in Employee_Type ) is
   begin
      Ada.Text_IO.Put ("First Name: ");
      Ada.Text_IO.Put_Line (To_String(Data.FirstName));

      Ada.Text_IO.Put ("Last Name: ");
      Ada.Text_IO.Put_Line (To_String(Data.LastName));

      Ada.Text_IO.Put ("Title:");
      Ada.Text_IO.Put_Line (To_String(Data.Title));

      Ada.Text_IO.Put ("Salary: $ ");
      Ada.Float_Text_IO.Put (Data.Salary, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Vaccation hours:");
      Ada.Float_Text_IO.Put (Data.VacHours, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Sick hours:");
      Ada.Float_Text_IO.Put (Data.SickHours, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Years in company:");
      Ada.Integer_Text_IO.Put (Data.YearsInCmp, Width => 3);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.New_Line;
   end Print_Employee_Data;

begin
   for Iter in EmployeesArray'Range loop
      -- Assign random values to the numeric variables
      EmployeesArray(Iter).Salary    := 500.0+5000.0*Random(Seed);
      EmployeesArray(Iter).VacHours  := 60.0*Random(Seed);
      EmployeesArray(Iter).SickHours := 30.0*Random(Seed);

      Random_Val.Reset(Gen => Gen);
      EmployeesArray(Iter).YearsInCmp := Random_Val.Random(Gen => Gen);

      -- Print the record's content
      Print_Employee_Data (EmployeesArray(Iter));
   end loop;

end Main;
