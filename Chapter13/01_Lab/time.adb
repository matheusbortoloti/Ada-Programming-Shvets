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
package body Time is

   -- Print procedures
   procedure Put (TR : in Time_Rec) is
   begin
      Ada.Text_IO.Put ("Hours: " & Natural'Image(TR.Hours) &
                         "   Minutes: " & Natural'Image(TR.Minutes));
   end Put;
   
   procedure Put_Line (TR : in Time_Rec) is
   begin      
      Put (TR);
      Ada.Text_IO.New_Line;
   end Put_Line;
   
   
   -- Addition operator
   function "+" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Get_Minutes(Val_1) + Get_Minutes(Val_2);
      
      Temp.Hours := Total_Minutes / 60;
      Temp.Minutes := Total_Minutes rem 60;
      
      return Temp;
   end "+";
   
   function "+" (Val_Minutes : in Natural; Val_2 : in Time_Rec) return Time_Rec is
      Temp : Time_Rec;
   begin
      Temp.Hours := Val_2.Hours + ((Val_2.Minutes + Val_Minutes) / 60);
      Temp.Minutes := (Val_2.Minutes + Val_Minutes) rem 60;
      
      return Temp;
   end "+";
   
   function "+" (Val_1 : in Time_Rec; Val_Minutes : in Natural) return Time_Rec is
   begin
      return Val_Minutes + Val_1;
   end "+";
        
   -- Subtraction operator
   function "-" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Time_Rec is
      Temp   : Time_Rec := Val_1;
      Result : Natural  := 0;
   begin
      if (Get_Minutes(Val_1) > Get_Minutes(Val_2))
      then
         Result := Get_Minutes(Val_1) - Get_Minutes(Val_2);
         
         Temp.Hours   := Result / 60;
         Temp.Minutes := Result rem 60;
      else
         Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "ERROR: The number " &
                                 "of minutes is not enough!");
      end if;
      
      return Temp;
   end "-";      
                                 
                              
   function "-" (Val_Minutes : in Natural; Val_2 : in Time_Rec) return Time_Rec is
      Temp   : Time_Rec := Val_2;
      Result : Natural  := 0;
   begin
      if (Val_Minutes > Get_Minutes(Val_2))
      then
         Result := Val_Minutes - Get_Minutes(Val_2);
         
         Temp.Hours   := Result / 60;
         Temp.Minutes := Result rem 60;
      else
         Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "ERROR: The number " &
                                 "of minutes is not enough!");
      end if;
      
      return Temp;
   end "-";     
         
   function "-" (Val_1 : in Time_Rec; Val_Minutes : in Natural) return Time_Rec is
      Temp   : Time_Rec := Val_1;
      Result : Natural  := 0;
   begin
      if (Get_Minutes(Val_1) > Val_Minutes)
      then
         Result := Get_Minutes(Val_1) - Val_Minutes;
         
         Temp.Hours   := Result / 60;
         Temp.Minutes := Result rem 60;
      else
         Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "ERROR: The number " &
                                 "of minutes is not enough!");
      end if;
      
      return Temp;
   end "-";
   
   -- Equality operator
   function "=" (Val_1 : in Time_Rec; Val_2 : in Time_Rec) return Boolean is
   begin
      if (Get_Minutes(Val_1) = Get_Minutes(Val_2))
      then
         return True;
      else 
         return False;
      end if;      
   end "=";
   
   -- Helper function
   function Get_Minutes (Val : in Time_Rec) return Natural is
   begin
      return Val.Hours * 60 + Val.Minutes;
   end Get_Minutes;   
   
   
   -- Exercise 01: Multiply time by a scalar
   function "*" (TR : in Time_Rec; Multiplier : in Natural) return Time_Rec is
      Temp : Time_Rec;
   begin
      
      Temp.Hours   := (Get_Minutes(TR) * Multiplier) / 60;
      Temp.Minutes := (Get_Minutes(TR) * Multiplier) rem 60;
      
      return Temp;
   end "*";
   
   function "*" (Multiplier : in Natural; TR : in Time_Rec) return Time_Rec is
   begin
      return TR * Multiplier;
   end "*";
   
   -- Exercise 01: Divide time by a scalar
   function "/" (TR : in Time_Rec; Divider : in Positive) return Time_Rec is
      Temp : Time_Rec;
      Add  : Time_Rec;     
   begin
      Temp.Hours   := (Get_Minutes(TR) / Divider) / 60;
      Temp.Minutes := (Get_Minutes(TR) / Divider) rem 60;     
      
      return Temp;
   end "/";     

end Time;
