-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 11 - Exercise 01
-- Matheus Bortoloti Dias
-- 02.06.2021
-- Implements the setter and getter methods
-- for the 'Animal' package
-- -------------------------------------------

with Ada.Text_IO;use Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Main is

   -- Record: rectangular coordinates
   type Rect_Coord is record
      X : Float;
      Y : Float;
      Z : Float;
   end record;

   -- Record: Robot information
   type Robot_Position is record
      Pos : Rect_Coord;
   end record;

   -- The goal is to avoid reading/writing at the same time with different taks
   protected type Protected_Robot_Record is
      entry Move_To_Pos(Position  : in Robot_Position);
      entry Read_Act_Pos(Position : out Robot_Position);
   private
      Robot_State : Robot_Position;
      Moving      : Boolean := False;
   end Protected_Robot_Record;


   protected body Protected_Robot_Record is
      entry Move_To_Pos(Position : in Robot_Position)
        when not Moving is
      begin
         Moving      := True;
         Robot_State := Position;
      end Move_To_Pos;

      entry Read_Act_Pos(Position : out Robot_Position)
        when Moving is
      begin
         Position := Robot_State;
         Moving   := False;
      end Read_Act_Pos;
   end Protected_Robot_Record;

   Protected_01: Protected_Robot_Record;

   task type Access_Protected (Identifier : Natural) is
      entry Start(Position : in Robot_Position);
      entry Quit;
   end Access_Protected;

   task body Access_Protected is
      Go_Loop   : Boolean := True;
      Live_Data : Robot_Position;
      User_Data : Robot_Position;
   begin
      accept Start(Position : in Robot_Position) do
         Put_Line ("Robot" & Identifier'Img & " initializing...");
         User_Data := Position;
      end Start;

      while Go_Loop loop
         select
            accept Quit do
               Put_Line ("Task is asked to exit!");
               Go_Loop := False;
            end Quit;

         else
            select
               Protected_01.Move_To_Pos(User_Data);
               delay 0.3;
               Protected_01.Read_Act_Pos(Live_Data);
               Put_Line (" ---------- Robot " & Identifier'Img & " ---------- ");
               Put ("Actual coordinates: (");
               Ada.Float_Text_IO.Put (Item => Live_Data.Pos.X,
                                      Aft  => 2,
                                      Exp  => 0);
               Put (", ");
               Ada.Float_Text_IO.Put (Item => Live_Data.Pos.Y,
                                      Aft  => 2,
                                      Exp  => 0);
               Put (", ");
               Ada.Float_Text_IO.Put (Item => Live_Data.Pos.Z,
                                      Aft  => 2,
                                      Exp  => 0);
               Put_Line (")");


            or
               delay 1.0;
               Put_Line (" <=> ERROR! Did not acquire resource!");
            end select;
         end select;
      end loop;
   end Access_Protected;

   Task_01 : Access_Protected(Identifier => 1);
   Task_02 : Access_Protected(Identifier => 2);
   Task_03 : Access_Protected(Identifier => 3);
   Task_04 : Access_Protected(Identifier => 4);
   Task_05 : Access_Protected(Identifier => 5);

   -- Crate an array with 05 robots connected to the same controller
   -- That's why we can only read/write one robot at a time
   type Index is range 1 .. 5;
   type Robot_Array is array (Index) of Robot_Position;
   Robot : Robot_Array;

   Idx : Float := 1.0;

begin
   for Iter in Robot_Array'Range loop
      -- Assign positions
      Robot(Iter).Pos.X := Idx*10.0;
      Robot(Iter).Pos.Y := Idx*20.0;
      Robot(Iter).Pos.Z := Idx*30.0;

      Idx := Idx + 1.0;
   end loop;

   Task_01.Start(Robot(1));
   Task_02.Start(Robot(2));
   Task_03.Start(Robot(3));
   Task_04.Start(Robot(4));
   Task_05.Start(Robot(5));

   delay 6.0;

   Task_01.Quit;
   Task_02.Quit;
   Task_03.Quit;
   Task_04.Quit;
   Task_05.Quit;

end Main;

