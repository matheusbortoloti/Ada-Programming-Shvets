-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 13 - Exercise 02
-- Matheus Bortoloti Dias
-- 06.06.2021
-- Create a generic package to implement a
-- queue by means of an array
-- -------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Custom_Queue;

procedure Main is
   package Queue is new Custom_Queue (Custom_Type => Integer);

   Element : Integer;
   QUEUE_MAX_SIZE : constant := 30;
begin
   -- Just to test if the boundary check is working correctly
   Queue.Pop (Element);

   Element := 2;
   Put_Line ("Insert a new element: " & Element'Img );
   Queue.Push(Element);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   Element := 10;
   Put_Line ("Insert a new element: " & Element'Img );
   Queue.Push(Element);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   Element := 120;
   Put_Line ("Insert a new element: " & Element'Img );
   Queue.Push(Element);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   Put_Line ("Pop element");
   Queue.Pop(Element);
   Put_Line ("Element received: " & Element'Img);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   Put_Line ("Pop element");
   Queue.Pop(Element);
   Put_Line ("Element received: " & Element'Img);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   Put_Line ("Pop element");
   Queue.Pop(Element);
   Put_Line ("Element received: " & Element'Img);
   Put_Line ("Queue actual length: " & Queue.Length'Img);
   New_Line;

   -- Now we try the fill up the queue in order to test the upper limit check
   for Iter in 1 .. QUEUE_MAX_SIZE + 1 loop
      Queue.Push(40);
   end loop;

end Main;
