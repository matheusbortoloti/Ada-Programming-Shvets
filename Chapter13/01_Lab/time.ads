-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 13 - Exercise 01
-- Matheus Bortoloti Dias
-- 06.06.2021
-- Extends the 'Time' package including the 
-- following functions:
--   * Multiply
--   * Divide
--   * Greater than operator  (overloading)
--   * Less than operator (overloading)
-- -------------------------------------------
with Ada.Text_IO;

package Time is
   
   -- --------------------------------------------------------------------------
   -- PACKAGE: PUBLIC AREA
   -- --------------------------------------------------------------------------
   type Time_Rec is private;
   
   -- Print procedures
   procedure Put (TR : in Time_Rec);
   procedure Put_Line (TR : in Time_Rec);
   
   -- Addition operator
   function "+" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Time_Rec;
   function "+" (Val_Minutes : in Natural; Val_2 : in Time_Rec) return Time_Rec;
   function "+" (Val_1 : in Time_Rec; Val_Minutes : in Natural) return Time_Rec;
   
   -- Subtraction operator
   function "-" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Time_Rec;
   function "-" (Val_Minutes : in Natural; Val_2 : in Time_Rec) return Time_Rec;
   function "-" (Val_1 : in Time_Rec; Val_Minutes : in Natural) return Time_Rec;
   
   -- Equality operator
   function "=" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Boolean;
   
   -- Exercise 01: Add a function to multiply time
   -- Since it does not make any physical sense to multiply time by time, 
   -- I assume that the required function should multipy the time by a scalar
   function "*" (TR : in Time_Rec; Multiplier : in Natural) return Time_Rec;
   function "*" (Multiplier : in Natural; TR : in Time_Rec) return Time_Rec;
   
   -- Exercise 01: Add a function to divide time
   -- Since it does not make any physical sense to divide time by time, 
   -- I assume that the required function should divide the time by a scalar
   function "/" (TR : in Time_Rec; Divider : in Positive) return Time_Rec;
   
   -- This does not make any sense at all. That's why it has not been implemented
   -- function "/" (Divider : in Natural; TR : in Time_Rec) return Time_Rec;
   
   
   -- --------------------------------------------------------------------------
   -- PACKAGE: PRIVATE AREA
   -- --------------------------------------------------------------------------
private
   -- Record body
   type Time_Rec is record
      Hours   : Natural := 0;
      Minutes : Natural range 0 .. 60 := 0;
   end record;
   
   -- Helper function
   function Get_Minutes (Val : in Time_Rec) return Natural;
   
end Time;
