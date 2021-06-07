with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Input_01 : Boolean := False;
   Input_02 : Boolean := False;

   Output   : Boolean;

begin
   -- XOR
   Output := (Input_01 and not(Input_02)) or (not(Input_01) and Input_02);

   -- Print inputs
   Put_Line ("Input 01: " & Boolean'Image(Input_01));
   Put_Line ("Input 02: " & Boolean'Image(Input_02));

   -- Print outputs
   Put_Line ("Output:   " & Boolean'Image(Output));

end Main;
