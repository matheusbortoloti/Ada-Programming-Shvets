
-- ---------------------------------------
-- Chapter 02 - Exercise 01
-- Matheus Bortoloti Dias
-- 13.05.2021
-- Print some text from different type 
-- variables
-- ----------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Main is
   nOilChangePrice    : Natural := 440;
   fWashingFluidPrice : Float   := 98.40;
   nAirFilterPrice    : Natural := 23;
   fFuelPrice1        : Float   := 900.40;
   fPizzaPrice        : Float   := 71.49;
   fFuelPrice2        : Float   := 90.01;

   fTotalPrice        : Float   := 0.0;
begin
   -- Calculates the total price
   fTotalPrice := Float(nOilChangePrice) + fWashingFluidPrice +
       Float(nAirFilterPrice) + fFuelPrice1 +
     fPizzaPrice + fFuelPrice2;

    Put_Line ("_________________________________");
   -- Prints the oil change price
   Put_Line (Natural'Image(nOilChangePrice)  & "      Oil Change");

   -- Prints the washing fluid price
   Put (" ");
   Ada.Float_Text_IO.Put ( fWashingFluidPrice, Exp => 0, Aft => 2);
   Put_Line ("    Washing Fluid");

   -- Prints the air filter price
   Put_Line (Natural'Image(nAirFilterPrice)  & "       Air filter");

   -- Prints the fuel price
   Put (" ");
   Ada.Float_Text_IO.Put ( fFuelPrice1, Exp => 0, Aft => 2);
   Put_Line ("   Fuel");

   -- Prints the pizza price
   Put (" ");
   Ada.Float_Text_IO.Put ( fPizzaPrice, Exp => 0, Aft => 2);
   Put_Line ("    Company pizza luncheon");

   -- Prints the fuel price
   Put (" ");
   Ada.Float_Text_IO.Put ( fFuelPrice2, Exp => 0, Aft => 2);
   Put_Line ("    Fuel");

   New_Line;

   -- Prints the total price
   Put (" ");
   Ada.Float_Text_IO.Put ( fTotalPrice, Exp => 0, Aft => 2);
   Put_Line ("  Total");
   Put_Line ("_________________________________");


end Main;
