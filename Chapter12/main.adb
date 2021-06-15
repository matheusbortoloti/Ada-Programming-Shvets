-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 12 - Exercise 01
-- Matheus Bortoloti Dias
-- 04.06.2021
-- Create an example record (data structure)
-- in order to simulate a company's employee
-- database. Custom data types are created in
-- order to enforce strong typing and increase
-- reliability
-- -------------------------------------------

with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Numerics.Discrete_Random;

procedure Main is
   -- New custom types
   type Salary_Float is delta 0.01 range 0.0 .. 100000.00;
   type VacHours_Float is delta 1.0 range 0.0 .. 300.00;
   type SicHours_Float is delta 1.0 range 0.0 .. 50.0;
   type YearsInCmp_Integer is range 0 .. 50;

   -- Record with the employee data
   type Employee_Type is record
      FirstName  : Unbounded_String := To_Unbounded_String("Douglas");
      LastName   : Unbounded_String := To_Unbounded_String("Mueller");
      Title      : Unbounded_String := To_Unbounded_String("Engineer");
      Salary     : Salary_Float;
      VacHours   : VacHours_Float;     -- Vacation hours per year
      SickHours  : SicHours_Float;     -- Hours off for sick time
      YearsInCmp : YearsInCmp_Integer; -- Number of years in company
   end record;

   EmployeesArray : Array (1 .. 10) of Employee_Type;

   -- For the generation of random integers
   package Random_YearsInCmp is new Ada.Numerics.Discrete_Random(Result_Subtype => YearsInCmp_Integer);
   Gen : Random_YearsInCmp.Generator;

   -- For the generation of random float
   Seed : Ada.Numerics.Float_Random.Generator;
   Temp : Float := 0.0;

   procedure Print_Employee_Data ( Data : in Employee_Type ) is
   begin
      Ada.Text_IO.Put ("First Name: ");
      Ada.Text_IO.Put_Line (To_String(Data.FirstName));

      Ada.Text_IO.Put ("Last Name: ");
      Ada.Text_IO.Put_Line (To_String(Data.LastName));

      Ada.Text_IO.Put ("Title:");
      Ada.Text_IO.Put_Line (To_String(Data.Title));

      Ada.Text_IO.Put ("Salary: $ ");
      Ada.Float_Text_IO.Put (Float(Data.Salary), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Vaccation hours:");
      Ada.Float_Text_IO.Put (Float(Data.VacHours), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Sick hours:");
      Ada.Float_Text_IO.Put (Float(Data.SickHours), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Years in company:");
      Ada.Integer_Text_IO.Put (Integer(Data.YearsInCmp), Width => 3);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.New_Line;
   end Print_Employee_Data;

begin
   for Iter in EmployeesArray'Range loop
      -- Assign random values to the numeric variables
      Reset (Seed);
      EmployeesArray(Iter).Salary    := Salary_Float(500.0+5000.0*Random(Seed));
      EmployeesArray(Iter).VacHours  := VacHours_Float(60.0*Random(Seed));
      EmployeesArray(Iter).SickHours := SicHours_Float(30.0*Random(Seed));

      Random_YearsInCmp.Reset(Gen => Gen);
      EmployeesArray(Iter).YearsInCmp := Random_YearsInCmp.Random(Gen => Gen);

      -- Print the record's content
      Print_Employee_Data (EmployeesArray(Iter));
   end loop;

end Main;
